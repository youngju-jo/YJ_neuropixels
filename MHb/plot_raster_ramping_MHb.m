function plot_raster_ramping_MHb(cohort, list_sess, list_unit, list_ID)

figure('Position', [500 500 760 420]); set(gcf,'color','w');

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


    %% cue-aligned activity

    spikeTimes = cohort{idx_sess}.spike_su{idx_unit};
    TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
    eventTimes = TTL_trial(trialMatrix==1);
    
    % temporal parameters
    preCueDur = -2; postCueDur = +4; binSize = 0.010; 
    %tAxisPSTH = preCueDur:binSize:postCueDur;

    % raster
    [spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(eventTimes, spikeTimes, preCueDur, postCueDur);

    % rate across trials
    rate_bxt = bin_spikes(eventTimes, [preCueDur, postCueDur, binSize, 1], {spikeTimes}) * 1/binSize;
    rate_b = mean(rate_bxt(:,1:200),2);
    
    % plot raster
    subplot(121);
    plot(spikeTimesOfTrials, trialIndexOfTrials, '.k');
    set(gca, 'YDir','reverse'); ylim([0-3, max(trialIndexOfTrials)+3]); ylabel('Trials'); %set(gca,'YTickLabel',[]); 
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from cue onset (s)'); 
    title(strcat('Session:', {' '}, num2str(idx_sess), ' / Unit ID:', {' '}, num2str(ID_unit)));
    uniformFigureProps();
    
    % plot across-trial rates - baseline
    subplot(122);
    %tAxisTrial = -1*numel(rate_b)+1:0;
    plot(1:numel(rate_b), rate_b, '-k');
    xlabel('Rewarded trials from session end'); xlim([0,numel(rate_b)+1]);
    ylabel('Firing rate (Hz)');
    uniformFigureProps();
    
    
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

