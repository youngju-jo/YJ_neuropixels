function s = process_session_MHb(session_info, cohort_type)

tic;

%% load data

s = load_npx_spikes(session_info.baseDir);  % spikes
s_e = load_events_MHb(session_info.baseDir);  % events (specific to MHb task)

mergestructs = @(x,y) cell2struct([struct2cell(x);struct2cell(y)],[fieldnames(x);fieldnames(y)]);
s = mergestructs(s, s_e);


%% pre-analysis quality control

QC_fr = (s.metrics{:,3} > 0.2);
%QC_isiviolation = (s.metrics{:,5} < 0.01);
%QC_amplitudecutoff = (s.metrics{:,6} <= 0.1);
%QC_presenceratio = (s.metrics{:,4} > 0.8);

QC_passed = logical(QC_fr);
%QC_passed = logical(QC_isiviolation);
%QC_passed = logical(QC_isiviolation .* QC_amplitudecutoff);
%QC_passed = logical(QC_isiviolation .* QC_amplitudecutoff .* QC_presenceratio);

s.list_su = s.list_su(QC_passed);
s.spike_su = s.spike_su(QC_passed);
s.sites_su = s.sites_su(QC_passed);

s.metrics = s.metrics(QC_passed,:);
s.wf = s.wf(QC_passed,:,:);

if isfield(s, 'wf_stim')
    s.metrics_stim = s.metrics_stim(QC_passed,:);
    s.wf_stim = s.wf_stim(QC_passed,:,:);
end

numUnit = numel(s.spike_su);


%% coordinate/region for individual units
    
if isfield(s, 'registered_coord_shank0')
    
    load('C:\Users\YoungJu Jo\Dropbox\Ephys\YJ_ephys_npx\hStripe0.mat');
    shankind_ = shankind(connected==1);
    % hardcoded: e.g., 171_0926 has channel 112 (matlab indexing) automatically disabled due to noise level
    if session_info.info == '171_20210926'
        shankind_(112) = [];
    elseif session_info.info == '178_20211115'
        shankind_(174) = [];
    elseif session_info.info == '178_20211116'
        shankind_([150, 210]) = [];
    end

    s.channel_coord = zeros(size(s.channel_positions,1),3);
    s.channel_coord(shankind_==0,:) = s.registered_coord_shank0;
    s.channel_coord(shankind_==1,:) = s.registered_coord_shank1;
    s.channel_coord(shankind_==2,:) = s.registered_coord_shank2;
    s.channel_coord(shankind_==3,:) = s.registered_coord_shank3;

    s.channel_region = zeros(numel(s.channel_positions,1),1);
    s.channel_region(shankind_==0,:) = s.registered_region_shank0;
    s.channel_region(shankind_==1,:) = s.registered_region_shank1;
    s.channel_region(shankind_==2,:) = s.registered_region_shank2;
    s.channel_region(shankind_==3,:) = s.registered_region_shank3;

    s.unit_coord = s.channel_coord(s.sites_su+1,:);
    s.unit_region = s.channel_region(s.sites_su+1,:);

elseif isfield(s, 'registered_coord')

    s.channel_coord = s.registered_coord;
    s.channel_region = s.registered_region;

    s.unit_coord = s.channel_coord(s.sites_su+1,:);
    s.unit_region = s.channel_region(s.sites_su+1,:);

end


%% behavior

% bpod

trialIdx = find(session_info.d_bhvr.SessionData.TrialTypes~=2);  % exclude premature trials
nTrials = length(trialIdx);
trialTypes = session_info.d_bhvr.SessionData.TrialTypes(trialIdx);
% sum(d.SessionData.TrialTypes~=0)/numel(d.SessionData.TrialTypes)

trialMatrix = nan(nTrials,1);   % 1: lick-reward, 2: lick-noreward, 3: nolick / 0: perturbation
reactionTime = nan(nTrials,1);
ts_TTL = nan(nTrials,1);

for t=1:nTrials
    
    x = session_info.d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.States;
    y = session_info.d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.Events;

    if ~isnan(x.Reward(1))  % reward delivery
        trialMatrix(t) = 1;
        reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
    elseif ~isnan(x.NoReward(1))  % reward omission
        trialMatrix(t) = 2;
        reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
    elseif cohort_type == 3
        if ~isnan(x.OptoStim(1))  % stim trial
            trialMatrix(t) = 0;
        end
    else  % miss
        trialMatrix(t) = 3;
    end

    ts_TTL(t) = session_info.d_bhvr.SessionData.TrialStartTimestamp(trialIdx(t)) + x.TTL(2);  % TTL offset (= cue onset) from bpod

end

s.trialMatrix = trialMatrix;
s.reactionTime = reactionTime;  % based on bpod state changes
%s.ts_TTL = ts_TTL;

% NI board TTLs

% ensure bpod-NI TTL alignment
% figure, plot(s.TTL_bhvrOff(1:nTrials), ts_TTL);
% disp(corr(s.TTL_bhvrOff(1:nTrials), ts_TTL)>0.99999);
f1 = fitlm(ts_TTL,s.TTL_bhvrOff(1:nTrials));
Rsquared = f1.Rsquared.Ordinary;
if Rsquared < 0.99999
    error('Check trial alignment!');
end

TTL_trial = s.TTL_bhvrOff(1:numel(trialMatrix));
s.TTL_trial = TTL_trial;


%% smooth firing rate, and its mean and std for z-scoring

binned_spike = bin_spikes([0], [0 s.TTL_trial(end)+10 0.010 20], s.spike_su);  % 10 ms binning, 200 ms smoothing

s.unit_mean = squeeze(mean(squeeze(binned_spike),1));
s.unit_std = squeeze(std(squeeze(binned_spike),1));


%% optotagging
    
if isfield(s, 'wf_stim') || (cohort_type == 3)

    % stim conditions

    trial_width = session_info.d_stim.SessionData.TrialInfo.trial_width;
    trial_freq = session_info.d_stim.SessionData.TrialInfo.trial_freq;
    trial_power = session_info.d_stim.SessionData.TrialInfo.trial_power;
    s.trial_width = trial_width; s.trial_freq = trial_freq; s.trial_power = trial_power;

    list_width = session_info.d_stim.SessionData.TrialInfo.list_width;
    list_freq = session_info.d_stim.SessionData.TrialInfo.list_freq;
    list_power = session_info.d_stim.SessionData.TrialInfo.list_power;
    s.list_width = list_width; s.list_freq = list_freq; s.list_power = list_power;

    pulse_width = zeros(length(s.TTL_stim),1);
    pulse_freq = zeros(length(s.TTL_stim),1);
    pulse_power = zeros(length(s.TTL_stim),1);
    len_pulse = zeros(length(s.TTL_stimblock),1);
    stimDuration = 1.0;  % sec
    for idx_bhvr = 1:length(s.TTL_stimblock)
        idx_pulse = find((s.TTL_stim > s.TTL_stimblock(idx_bhvr)) .* (s.TTL_stim < s.TTL_stimblock(idx_bhvr)+stimDuration));
        len_pulse(idx_bhvr) = length(idx_pulse);
        pulse_width(idx_pulse) = trial_width(idx_bhvr);
        pulse_freq(idx_pulse) = trial_freq(idx_bhvr);
        pulse_power(idx_pulse) = trial_power(idx_bhvr);
        % latency correction
        if ~isempty(idx_pulse)
            s.TTL_stimblock(idx_bhvr) = s.TTL_stim(idx_pulse(1));
        end
    end
    len_pulse(len_pulse==0) = -1;
    s.pulse_width = pulse_width; s.pulse_freq = pulse_freq; s.pulse_power = pulse_power; s.len_pulse = len_pulse;

    % spike-associated latency test (SALT)
    %{
    idxPulse = ((pulse_width==0.010).*(pulse_freq==10).*(pulse_power==5))==1;  % stim condition for optotagging --- *** maybe pulse is right, but the analysis window should include only first one or two pulses in each train to exclude slow network recruitment? ***
    salt_p_all = zeros(length(s.spike_su),1); salt_I_all = zeros(length(s.spike_su),1);
    for idx_su = 1:length(s.spike_su)
        count_baseline = bin_spikes(s.TTL_stimblock-0.9, [0 0.8-0.001 0.001 1], s.spike_su(idx_su));  % perhaps do -1 trials?
        count_test = bin_spikes(s.TTL_stim(idxPulse), [0 0.025 0.001 1], s.spike_su(idx_su));  % mean(sum(count_test,2))  % hardcoded 25 ms window
        [salt_p, salt_I] = salt(count_baseline,count_test,0.001,0.020);  % 20 ms window - can be filtered by latency later
        salt_p_all(idx_su) = salt_p; salt_I_all(idx_su) = salt_I;
    end
    s.salt_p = salt_p_all; s.salt_I = salt_I_all;
    %}
    idxTrial = ((trial_width==0.010).*(trial_power==5))==1;  % stim condition for optotagging --- *** maybe pulse is right, but the analysis window should include only first one or two pulses in each train to exclude slow network recruitment? ***
    salt_p_all = zeros(length(s.spike_su),1); salt_I_all = zeros(length(s.spike_su),1); fr_change_all = zeros(length(s.spike_su),1);
    for idx_su = 1:length(s.spike_su)
        count_baseline = bin_spikes(s.TTL_stimblock(idxTrial)-0.3, [0 0.3-0.001 0.001 1], s.spike_su(idx_su));  % perhaps do -1 trials?
        count_test = bin_spikes(s.TTL_stimblock(idxTrial), [0 0.015 0.001 1], s.spike_su(idx_su));  % mean(sum(count_test,2))  % hardcoded 15 ms window
        [salt_p, salt_I, nhlsi] = salt(count_baseline,count_test,0.001,0.015);  % 15 ms window - can be filtered by latency later
        
        fr_baseline = sum(count_baseline(:))/numel(count_baseline) * 1000; 
        fr_test = sum(count_test(:))/numel(count_test) * 1000;
        fr_change = (fr_test-fr_baseline)/fr_baseline;
     
        %cl_baseline = cumsum(mean(nhlsi(2:end,1:end-1),2)); cl_baseline = cl_baseline/cl_baseline(end); cl_baseline(:,2) = 0; 
        %cl_test = cumsum(nhlsi(2:end,end)); cl_test = cl_test/cl_test(end); cl_test(:,2) = 0;        
        %logrank(cl_baseline, cl_test)
        
        salt_p_all(idx_su) = salt_p; salt_I_all(idx_su) = salt_I; fr_change_all(idx_su) = fr_change;
    end
    s.salt_p = salt_p_all; s.salt_I = salt_I_all; s.fr_change = fr_change_all;
    
    
    % spike probability, latency, and jitter
    s.spike_probability = NaN(numUnit,1); s.spike_latency = NaN(numUnit,1); s.spike_jitter = NaN(numUnit,1);
    for idx_unit = 1:numUnit
        x = s.spike_su{idx_unit};
        if length(x) < 2
            continue;
        end
        %ind = interp1(x,1:length(x),s.TTL_stim(idxPulse),'next');
        ind = interp1(x,1:length(x),s.TTL_stimblock(idxTrial),'next');
        ind(isnan(ind)) = numel(x); % in case of no spike after a timestamp
        %timestamp_to_spike = x(ind) - s.TTL_stim(idxPulse);
        timestamp_to_spike = x(ind) - s.TTL_stimblock(idxTrial);
        is_spike_in_window = logical((timestamp_to_spike > 0) .* (timestamp_to_spike < 0.015));  % hardcoded 15 ms window / note that this parameter gates input data to calculate latency
        if sum(is_spike_in_window) == 0
            continue;
        else
            %s.spike_probability(idx_unit) = sum(is_spike_in_window) / sum(idxPulse);
            s.spike_probability(idx_unit) = sum(is_spike_in_window) / sum(idxTrial);
            latency_data = timestamp_to_spike(is_spike_in_window);
            s.spike_latency(idx_unit) = mean(latency_data);
            s.spike_jitter(idx_unit) = std(latency_data);
        end
    end
    
    % waveform correlation
    if cohort_type == 3
        s.wf_corr = NaN(numUnit,1);
    else
        s.wf_corr = diag(corr(reshape(s.wf,numel(s.list_su),[])', reshape(s.wf_stim,numel(s.list_su),[])'));
    end
    
else

    s.salt_p = NaN(numUnit,1);
    s.salt_I = NaN(numUnit,1);
    s.fr_change = NaN(numUnit,1);
    s.spike_probability = NaN(numUnit,1);
    s.spike_latency = NaN(numUnit,1);
    s.spike_jitter = NaN(numUnit,1);
    s.wf_corr = NaN(numUnit,1);

end

toc;

end
