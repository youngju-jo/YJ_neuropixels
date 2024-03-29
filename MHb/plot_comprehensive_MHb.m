function plot_comprehensive_MHb(cohort, list_sess, list_unit, list_ID)

global atlas
load('C:\Users\YoungJu Jo\Dropbox\Ephys\YJ_neuropixels\hStripe0.mat');

figure('units','normalized','outerposition',[0 0 1 1]); set(gcf,'color','w');

unitNum = 1;
while true
    
    % circular unit indexing for browsing
    if unitNum == 0
        unitNum = numel(list_unit);
    elseif unitNum == numel(list_unit)+1
        unitNum = 1;
    end
    
    idx_sess = list_sess(unitNum);
    idx_unit = list_unit(unitNum);
    ID_unit = list_ID(unitNum);


    %% atlas visualization
    subplot(241);

    % AP start/end
    APi = 100; APf = APi + 160; 

    % visualization offsets
    offset_ML_1 = 20; offset_ML_2 = 460; %460/410
    offset_DV_1 = 230; offset_DV_2 = 350; %350/100

    % convert coordinates
    APc = linspace(APi,APf,5); APthickness = APc(2)-APc(1); APt = APc - APthickness/2;
    coord_display = cohort{idx_sess}.unit_coord(idx_unit,:)/10;

    % reflection by the midline
    for idx = 1:size(coord_display,1)
        if coord_display(idx,1) < 570
            coord_display(idx,1) = 1140 - coord_display(idx,1);
        end
    end

    % apply offsets
    coord_display(:,1) = coord_display(:,1) - 570 + offset_ML_1;
    coord_display(:,3) = coord_display(:,3) - 230;

    imagesc(squeeze(atlas.tv(round(coord_display(:,2)),offset_DV_1+1:end-offset_DV_2,570-offset_ML_1+1:end-offset_ML_2)), [0 300]); axis image; axis off; colormap gray; hold on;
    scatter(coord_display(:,1),coord_display(:,3), '+', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',1); hold off;
    title(strcat('Session:', {' '}, num2str(idx_sess), ' / Unit ID:', {' '}, num2str(ID_unit), ' / Region:', {' '}, atlas.st{atlas.st{:,2}==cohort{idx_sess}.unit_region(idx_unit),4}));
    

    %% stim response raster
    if isfield(cohort{idx_sess}, 'wf_stim')
        subplot(245);

        TTL_stimblock = cohort{idx_sess}.TTL_stimblock;
        idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
        TTL_of_interest = TTL_stimblock(idxTrial);

        [spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(TTL_of_interest, cohort{idx_sess}.spike_su{idx_unit}, -0.5, +1.5);
        
        if isempty(spikeTimesOfTrials)
            cla;
        else
            plot(spikeTimesOfTrials, trialIndexOfTrials, '.k');
            ylim([0-3, max(trialIndexOfTrials)+3]); set(gca, 'YDir','reverse'); ylabel('Trials');
            xlim([-0.5 +1.5]); xlabel('Time from stim onset (s)');
        end
        title(strcat('I=', num2str(cohort{idx_sess}.salt_I(idx_unit), '%.3f'), ' / latency=', num2str(cohort{idx_sess}.spike_latency(idx_unit)*1000, '%.1f'), 'ms / jitter=', num2str(cohort{idx_sess}.spike_jitter(idx_unit)*1000, '%.1f'), 'ms / Psp=', num2str(cohort{idx_sess}.spike_probability(idx_unit), '%.3f')));
        for lidx = 1:10
            xline((lidx-1)*0.1, '-r');
        end

    end


    %% cue-aligned activity

    spikeTimes = cohort{idx_sess}.spike_su{idx_unit};

    list_trialType = [1, 2];
    TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;

    % temporal parameters
    preCueDur = -2; postCueDur = +4; binSize = 0.010; 
    tAxisPSTH = preCueDur:binSize:postCueDur;

    % causal half-gaussian filter for smoothing
    g_std = 20;  % 10 ms bin, 200 ms smoothing
    half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 

    rateAll = {}; spikeTimesOfTrialsAll = {}; trialIndexOfTrialsAll = {};
    for idx_trialType = 1:numel(list_trialType)

        eventTimes = TTL_trial(trialMatrix==list_trialType(idx_trialType));

        % rate
        rate_bxt = bin_spikes(eventTimes, [preCueDur-binSize*g_std*5, postCueDur, binSize, 1], {spikeTimes}) * 1/binSize;
        if idx_trialType == 1
            rate_bxt_rw = rate_bxt;
        end
        delta_rate_bxt = rate_bxt - mean(rate_bxt(:,101:300),2);
        rate_visualization = mean(delta_rate_bxt,1);  % trial averaging
        rate_visualization = conv(rate_visualization, half_gaussian, 'same');  % smoothing
        rate_visualization = rate_visualization(g_std*5+1:end);  % cropping in time to remove smoothing artifact
        rateAll{idx_trialType} = rate_visualization;

        % raster
        [spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(eventTimes, spikeTimes, preCueDur, postCueDur);
        if idx_trialType > 1
            for idx_power_prev = 1:idx_trialType-1
                trialIndexOfTrials = trialIndexOfTrials + numel(unique(trialIndexOfTrialsAll{idx_power_prev}));
            end
        end
        spikeTimesOfTrialsAll{idx_trialType} = spikeTimesOfTrials; trialIndexOfTrialsAll{idx_trialType} = trialIndexOfTrials;

    end

    % raster
    subplot(242);
    plot(spikeTimesOfTrialsAll{1}, trialIndexOfTrialsAll{1}, '.', 'Color', [0 0.5 0]); hold on;
    plot(spikeTimesOfTrialsAll{2}, trialIndexOfTrialsAll{2}, '.', 'Color', [0.2 0.2 0.2]); 
    plot(cohort{idx_sess}.reactionTime(trialMatrix==list_trialType(1)), 1:sum(trialMatrix==list_trialType(1)), '.', 'Color', [1 0 0]);
    plot(cohort{idx_sess}.reactionTime(trialMatrix==list_trialType(2)), (sum(trialMatrix==list_trialType(1))+1):(sum(trialMatrix==list_trialType(1))+sum(trialMatrix==list_trialType(2))), '.', 'Color', [1 0 0]); hold off;
    set(gca, 'YDir','reverse'); set(gca,'YTickLabel',[]); ylim([0-3, max(trialIndexOfTrialsAll{numel(list_trialType)})+3]); ylabel('Trials'); 
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from cue onset (s)'); 
    
    % within-trial rates
    subplot(246);
    plot(tAxisPSTH, rateAll{1}, 'Color', [0 0.5 0]); hold on;
    plot(tAxisPSTH, rateAll{2}, 'Color', [0.2 0.2 0.2]); hold off;
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from cue onset (s)');
    ylabel('delta(firing rate) (spikes/s)');
    title(strcat('Mean firing rate: ', {' '}, num2str(cohort{idx_sess}.metrics{idx_unit,3}, '%.1f'), ' Hz'));

    % across-trial rates - baseline
    subplot(243);
    rate_baseline = mean(rate_bxt_rw(:,101:300), 2);
    ramping_1 = fit_ramping_MHb(rate_baseline);
    tAxisTrial = -1*numel(rate_baseline)+1:0;
    plot(tAxisTrial, rate_baseline, '.', 'Color', [0 0.5 0]); hold on;
    lsline; hold off;
    xlabel('Rewarded trials from session end');
    ylabel('Baseline firing rate (spikes/s)');
    title(strcat('Class: ', {' '}, num2str(ramping_1.class), ' / Slope: ', {' '}, num2str(ramping_1.param(1), '%.2f'), ' spikes/s per trial / R-sq: ', {' '}, num2str(ramping_1.Rsq, '%.2f')));

    % across-trial rates - reward period
    subplot(247);
    rate_reward = mean(rate_bxt_rw(:,301:500), 2);
    ramping_1 = fit_ramping_MHb(rate_reward);
    tAxisTrial = -1*numel(rate_reward)+1:0;
    plot(tAxisTrial, rate_reward, '.', 'Color', [0 0.5 0]); hold on;
    lsline; hold off;
    xlabel('Rewarded trials from session end');
    ylabel('Reward-period firing rate (spikes/s)');
    title(strcat('Class: ', {' '}, num2str(ramping_1.class), ' / Slope: ', {' '}, num2str(ramping_1.param(1), '%.2f'), ' spikes/s per trial / R-sq: ', {' '}, num2str(ramping_1.Rsq, '%.2f')));

    
    %% lick-aligned activity
    
    % filter out duplicate lick timestamps
    lick_min_dur = 0.050;  % 50 ms
    TTL_lick_recorded = cohort{idx_sess}.TTL_lick;
    TTL_lick = TTL_lick_recorded(1);
    for t = 2:numel(TTL_lick_recorded)
        if TTL_lick_recorded(t) - TTL_lick(end) > lick_min_dur
            TTL_lick = [TTL_lick TTL_lick_recorded(t)];
        end
    end
    
    % filter out lick timestamps during trials
    TTL_trial = cohort{idx_sess}.TTL_trial;
    preCueDur = -2; postCueDur = +4;
    inWindow = zeros(size(TTL_lick));
    for i = 1:numel(TTL_trial)
        inWindow = inWindow + logical((TTL_lick > TTL_trial(i)+preCueDur).*(TTL_lick < TTL_trial(i)+postCueDur));
    end
    TTL_lick = TTL_lick(~inWindow);
    

    % temporal parameters
    preCueDur = -2; postCueDur = +4; binSize = 0.010; 
    tAxisPSTH = preCueDur:binSize:postCueDur;

    % causal half-gaussian filter for smoothing
    g_std = 20;  % 10 ms bin, 200 ms smoothing
    half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 

    % rate
    rate_bxt = bin_spikes(TTL_lick, [preCueDur-binSize*g_std*5, postCueDur, binSize, 1], {spikeTimes}) * 1/binSize;
    delta_rate_bxt = rate_bxt - mean(rate_bxt(:,101:300),2);
    rate_visualization = mean(delta_rate_bxt,1);  % trial averaging
    rate_visualization = conv(rate_visualization, half_gaussian, 'same');  % smoothing
    rate_visualization = rate_visualization(g_std*5+1:end);  % cropping in time to remove smoothing artifact

    % raster
    [spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(TTL_lick, spikeTimes, preCueDur, postCueDur);

    % raster visualization
    subplot(244);
    plot(spikeTimesOfTrials, trialIndexOfTrials, '.', 'Color', [0 0 0.5]);
    set(gca, 'YDir','reverse'); set(gca,'YTickLabel',[]); ylim([0-3, max(trialIndexOfTrials)+3]); ylabel('Trials'); 
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from lick onset (s)'); 
    title('Lick-aligned activity outside trials');

    % within-trial rate visualization
    subplot(248);
    plot(tAxisPSTH, rate_visualization, 'Color', [0 0 0.5]);
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from lick onset (s)');
    ylabel('delta(firing rate) (spikes/s)');
 
    

    %% waveform
    %{
    wf_sess = cohort{idx_sess}.wf(:,:,1:60); %wf_sess_stim = cohort{idx_sess}.wf_stim(:,:,1:60);
    wf_sess(:,385,:) = []; %wf_sess_stim(:,385,:) = [];

    wf_sess(:,connected==0,:) = []; %wf_sess_stim(:,connected==0,:) = [];
    % hardcoded: e.g., 171_0926 has channel 112 (matlab indexing) automatically disabled due to noise level
    if cohort{idx_sess}.info == '171_20210926'
        wf_sess(:,112,:) = []; %wf_sess_stim(:,112,:) = [];
    elseif cohort{idx_sess}.info == '178_20211115'
        wf_sess(:,174,:) = []; %wf_sess_stim(:,174,:) = [];
    elseif cohort{idx_sess}.info == '178_20211116'
        wf_sess(:,[150, 210],:) = []; %wf_sess_stim(:,[150, 210],:) = [];
    end

    % second cohort sessions have weird issue in waveform calculation (baseline not subtracted)
    % so don't believe some waveform features e.g., PT ratio for these sessions 

    wf_sess_baseline = squeeze(mean(wf_sess, [1,3]))'; wf_sess = permute(permute(wf_sess, [2,1,3]) - wf_sess_baseline, [2,1,3]);
    %wf_sess_stim_baseline = squeeze(mean(wf_sess_stim, [1,3]))'; wf_sess_stim = permute(permute(wf_sess_stim, [2,1,3]) - wf_sess_stim_baseline, [2,1,3]);

    wf_unit = squeeze(wf_sess(idx_unit,:,:))/3; %wf_unit_stim = squeeze(wf_sess_stim(idx_unit,:,:))/3;
    wf_taxis = (1:60)/3;
    channel_positions_sess = cohort{idx_sess}.channel_positions;

    wf_vis_x = []; wf_vis_y = []; %wf_vis_x_stim = []; wf_vis_y_stim = [];
    for cidx = 1:size(wf_unit,1)
        wf_vis_x = [wf_vis_x; wf_taxis+channel_positions_sess(cidx,1)];
        wf_vis_y = [wf_vis_y; wf_unit(cidx,:)+channel_positions_sess(cidx,2)];
        %wf_vis_x_stim = [wf_vis_x_stim; wf_taxis+channel_positions_sess(cidx,1)];
        %wf_vis_y_stim = [wf_vis_y_stim; wf_unit_stim(cidx,:)+channel_positions_sess(cidx,2)];
    end

    subplot(236)
    for cidx = 1:size(wf_unit,1)
        plot(wf_vis_x(cidx,:),wf_vis_y(cidx,:), 'Color', [0 0 0 0.7], 'LineWidth', 2); hold on;
        %plot(wf_vis_x_stim(cidx,:),wf_vis_y_stim(cidx,:), 'Color', [0.8 0 0 0.7], 'LineWidth', 2); hold on;
    end
    hold off;
    unit_center = channel_positions_sess(cohort{idx_sess}.sites_su(idx_unit),:);
    xlim([unit_center(1)-40 unit_center(1)+60]); set(gca,'xtick',[]);
    ylim([unit_center(2)-80 unit_center(2)+80]); set(gca,'ytick',[]);
    %title(strcat('spike duration: ', {' '}, num2str(cohort{idx_sess}.metrics{idx_unit,19}), ' ms'));
    % even spike duration seems to be unreliable -- should dig into the source code later
    %}
    
    %% browsing: 28 leftarrow / 29 rightarrow / 30 uparrow / 31 downarrow
    
    waitforbuttonpress;
    arrow = double(get(gcf,'CurrentCharacter'));
    if arrow==28
        unitNum = unitNum - 1;
    elseif arrow==29
        unitNum = unitNum + 1;
    else
        break;
    end
    
end

