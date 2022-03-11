function session_data = load_ephys_session(baseDir)

baseDir_split = split(baseDir,'\'); baseDir_stem = baseDir_split{end}(7:end);
myKsDir = strcat(baseDir, '\', baseDir_stem, '_imec0\imec0_ks2');


%% Atlas-registered channel coordinates and brain regions

if isfile(strcat(myKsDir, '\registered_coord.npy'))
    
    registered_coord = readNPY(strcat(myKsDir, '\registered_coord.npy'));
    session_data.registered_coord = registered_coord;
    
    registered_region = readNPY(strcat(myKsDir, '\registered_region.npy'));
    session_data.registered_region = registered_region;
    
elseif isfile(strcat(myKsDir, '\registered_coord_shank0.npy'))

    registered_coord_shank0 = readNPY(strcat(myKsDir, '\registered_coord_shank0.npy'));
    registered_coord_shank1 = readNPY(strcat(myKsDir, '\registered_coord_shank1.npy'));
    registered_coord_shank2 = readNPY(strcat(myKsDir, '\registered_coord_shank2.npy'));
    registered_coord_shank3 = readNPY(strcat(myKsDir, '\registered_coord_shank3.npy'));
    session_data.registered_coord_shank0 = registered_coord_shank0;
    session_data.registered_coord_shank1 = registered_coord_shank1;
    session_data.registered_coord_shank2 = registered_coord_shank2;
    session_data.registered_coord_shank3 = registered_coord_shank3;
    
    registered_region_shank0 = readNPY(strcat(myKsDir, '\registered_region_shank0.npy'));
    registered_region_shank1 = readNPY(strcat(myKsDir, '\registered_region_shank1.npy'));
    registered_region_shank2 = readNPY(strcat(myKsDir, '\registered_region_shank2.npy'));
    registered_region_shank3 = readNPY(strcat(myKsDir, '\registered_region_shank3.npy'));
    session_data.registered_region_shank0 = registered_region_shank0;
    session_data.registered_region_shank1 = registered_region_shank1;
    session_data.registered_region_shank2 = registered_region_shank2;
    session_data.registered_region_shank3 = registered_region_shank3;
    
end

session_data.channel_positions = readNPY(strcat(myKsDir, '\channel_positions.npy'));


%% load metrics and waveforms

if isfile(strcat(myKsDir,'\mean_waveforms.npy'))
    
    metrics = readtable(strcat(myKsDir,'\metrics.csv'));
    
    idClu = metrics{:,2};
    metrics = metrics(ismember(metrics{:,2}, idClu),:);
    session_data.metrics = metrics;
    
    wf = readNPY(strcat(myKsDir,'\mean_waveforms.npy'));
    session_data.wf = wf(idClu+1,:,:);
    
elseif isfile(strcat(myKsDir,'\mean_waveforms_0.npy'))
    
    metrics = readtable(strcat(myKsDir,'\metrics.csv'));
    metrics_stim = readtable(strcat(myKsDir,'\metrics_1.csv'));
    
    idClu = intersect(metrics{:,2},metrics_stim{:,2});
    metrics = metrics(ismember(metrics{:,2}, idClu),:);
    metrics_stim = metrics_stim(ismember(metrics_stim{:,2}, idClu),:);
    session_data.metrics = metrics;
    session_data.metrics_stim = metrics_stim;
    
    wf = readNPY(strcat(myKsDir,'\mean_waveforms_0.npy'));
    wf_stim = readNPY(strcat(myKsDir,'\mean_waveforms_1.npy'));
    session_data.wf = wf(idClu+1,:,:);
    session_data.wf_stim = wf_stim(idClu+1,:,:);
    
%else
    
    %error("First calculate the QC metrics and waveforms!");
    
end

%proper_idx = find(ismember(idClu, idClu));


%% classify and quantify spikes

spikeClu = readNPY(strcat(myKsDir, '\spike_clusters.npy'));
spikeTimesSec = readNPY(strcat(myKsDir, '\spike_times_sec.npy'));

% spike assignment
if ~exist('idClu','var')  % for before QC metric calculation
    idClu = unique(spikeClu);
end
numClu = numel(idClu);
sp_all = {}; sites_all = [];
for uidx = 1:numClu
    tidx_sp = (spikeClu == idClu(uidx));
    sp_all{uidx} = spikeTimesSec(tidx_sp);
end

session_data.spike_su = sp_all; %sp_su;
session_data.list_su = idClu; %su_list';
%session_data.idClu = idClu;

if exist('metrics','var')
    sites_all = metrics{:,17};
    session_data.sites_su = sites_all; %sites_su;
end


%% load events

% MHb head-fixed task
if isfile(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_0.adj.txt'))
    
    TTL_bhvrOn = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_0.adj.txt'));
    TTL_bhvrOff = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.iXD_1_1_0.adj.txt'));
    TTL_reward = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_2_0.adj.txt'));
    TTL_lick = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_4_0.adj.txt'));
    
    session_data.TTL_bhvrOn = TTL_bhvrOn;
    session_data.TTL_bhvrOff = TTL_bhvrOff;
    session_data.TTL_lick = TTL_lick;
    session_data.TTL_reward = TTL_reward;
    
end

% Optotagging
if isfile(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XA_0_0.adj.txt'))
    
    TTL_stim = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XA_0_0.adj.txt'));
    TTL_stimblock = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_1000.adj.txt'));
    
    session_data.TTL_stim = TTL_stim;
    session_data.TTL_stimblock = TTL_stimblock;
    
end


%%

% load spike parameters

% sp = loadKSdir(myKsDir);
% [spikeTimes, spikeAmps, spikeDepths, spikeSites] = ksDriftmap(myKsDir);
% figure; plotDriftmap(spikeTimes, spikeAmps, spikeDepths);
% [spikeAmps, spikeDepths, templateYpos, tempAmps, tempsUnW, tempDur, tempPeakWF] = ...
%    templatePositionsAmplitudes(sp.temps, sp.winv, sp.ycoords, sp.spikeTemplates, sp.tempScalingAmps);

%sp_all{uidx} = sp.st(sp.clu == idClu(uidx));

%sites_all(uidx) = spikeSites(find(tidx_sp,1));

%tic;
%[~, spikeAmps, spikeDepths, spikeSites] = ksDriftmap(myKsDir); % alternatively, one can use metrics.csv ...
%toc;
%spikeSites = spikeSites-1;

%spikeTimesOri = readNPY(strcat(myKsDir, '\spike_times.npy'));

%spikeClu = readNPY(strcat(myKsDir, '\spike_clusters.npy'));
%idClu = unique(spikeClu);  % cluster IDs

%count spikes throughtout the session
%count_all = zeros(numClu,1);
%for uidx = 1:numClu
%    count_all(uidx) = numel(sp_all{uidx});
%end

% load global timestamps
% timestamps = readNPY(strcat(baseDir,'\continuous\Rhythm_FPGA-100.0\timestamps.npy'));
%timestamps = readNPY(strcat(baseDir,'\continuous\Rhythm_FPGA-108.0\timestamps.npy'));

% rate_all = count_all / (double(timestamps(end)-timestamps(1))/30000);
% figure, hist(count_all(su_list))

%{
% select single units (note that the labels were Kilosort-generated)
ksTable = tdfread(strcat(myKsDir, '\cluster_KSLabel.tsv')); ksIdx = ksTable.cluster_id; ksLabel = ksTable.KSLabel;
phyTable = tdfread(strcat(myKsDir, '\cluster_group.tsv')); phyIdx = phyTable.cluster_id; phyLabel = phyTable.group;
sp_su = {}; sites_su = []; su_list = []; sidx = 1;
for uidx = 1:numClu
    %if ismember(idClu(uidx),phyIdx)
    %    if phyLabel(idClu(uidx)==phyIdx,1)=='g'
    %        is_su = 1;
    %    end
    %elseif ksLabel(idClu(uidx)==ksIdx,1)=='g'
    %    is_su = 1;
    %else
    %    is_su = 0;
    %end
    if ismember(idClu(uidx),phyIdx)
        if phyLabel(idClu(uidx)==phyIdx,1)=='g' && ksLabel(idClu(uidx)==ksIdx,1)=='g'
        %if ksLabel(idClu(uidx)==ksIdx,1)=='g'
            is_su = 1;
        else
            is_su = 0;
        end
    else
        is_su = 0;
    end
    
    if is_su == 1
        sp_su{sidx} = sp_all{uidx};
        sites_su(sidx) = sites_all(uidx);
        su_list = [su_list idClu(uidx)]; sidx = sidx + 1;
    end
end
%}

% classify putative excitotory vs inhibitory units // should estimate waveform duration after manual sorting
%isFast = tempDur < 10.5; isFast = isFast(idClu(1:numClu)+1);
%isPyr = tempDur > 13.5; isPyr = isPyr(idClu(1:numClu)+1);
%template_duration = tempDur(idClu(1:numClu)+1)/30;
% figure, plot(tempPeakWF(68,:))



%{
TTL_bhvr = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.iXA_0_0.adj.txt'));
TTL_reward = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.iXA_1_0.adj.txt'));
TTL_lick = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XA_3_0.adj.txt'));
%}

%events=load_open_ephys_binary(strcat(baseDir,'\structure.oebin'), 'events', 1);
%eventTimesAll = double(events.Timestamps - timestamps(1))/30000;
%eventTimes = eventTimesAll(events.Data==-4);

% TO DO: event cutoff i/f
% t_cutoff = 2400;
% eventTimes = eventTimes(eventTimes<t_cutoff);


% save in a single structure

%session_data.count = count_all;
%session_data.spike = sp_all;
%session_data.sites = sites_all;
%session_data.rate = rate_all;
%session_data.isPyr = isPyr;
%session_data.isFast = isFast;
%session_data.eventLabel = events.Data;
%session_data.eventTimesAll = eventTimesAll;
%session_data.durTemplate = template_duration;
%session_data.wf_corr = wf_corr;



end