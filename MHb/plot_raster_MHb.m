function plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, countParam)
% eventTimes, countParam, sp, idClu)
% cohort, list_sess, list_unit, list_ID, trialType

% causal half-gaussian filter for smoothing
g_std = countParam(4);
half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 

% spike binning parameters (no smoothing)
countParam1 = countParam; countParam1(4) = 1; countParam1(1) = countParam(1) - countParam(3)*g_std*5;

% define time axis
preCueDur = countParam(1); postCueDur = countParam(2);
tAxisPSTH = preCueDur:countParam(3):postCueDur;

unitNum = 1;  % indexing the unit of interest

figure; set(gcf,'color','w');
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
    
    TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
    if trialType == -1
        TTL_of_interest = TTL_trial;
    elseif trialType == -2
        TTL_stimblock = cohort{idx_sess}.TTL_stimblock;
        idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
        TTL_of_interest = TTL_stimblock(idxTrial);
    else
        TTL_of_interest = TTL_trial(trialMatrix==trialType);
    end
    
    % firing rate
    rate_bxt = bin_spikes(TTL_of_interest, countParam1, cohort{idx_sess}.spike_su(idx_unit)) * 1/countParam(3);
    rate_visualization = mean(rate_bxt,1);  % trial averaging
    rate_visualization = conv(rate_visualization, half_gaussian, 'same');  % smoothing
    rate_visualization = rate_visualization(countParam(4)*5+1:end);  % cropping in time to remove smoothing artifact
    subplot(211);
    plot(tAxisPSTH, rate_visualization, 'k');
    title(strcat('Session:', {' '}, num2str(idx_sess), ' / Unit ID:', {' '}, num2str(ID_unit)));  % sanity check: cohort{idx_sess}.list_su(idx_unit) should be equal to ID_unit
    xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); 
    
    % spike raster
    subplot(212);
    generate_raster(TTL_of_interest, countParam, cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
    if trialType == -2
        title(strcat('I=', num2str(cohort{idx_sess}.salt_I(idx_unit), '%.3f'), ' / fr=', num2str(cohort{idx_sess}.metrics{idx_unit,3}, '%.1f'), 'Hz / latency=', num2str(cohort{idx_sess}.spike_latency(idx_unit)*1000, '%.1f'), 'ms / jitter=', num2str(cohort{idx_sess}.spike_jitter(idx_unit)*1000, '%.1f'), 'ms / Psp=', num2str(cohort{idx_sess}.spike_probability(idx_unit), '%.3f'), ' / frc=', num2str(cohort{idx_sess}.fr_change(idx_unit))));
        for lidx = 1:10
            xline((lidx-1)*0.1, '-r');
        end
    end
    hold off;
        
    %title('Spike raster');
    
    % browsing: 28 leftarrow / 29 rightarrow / 30 uparrow / 31 downarrow
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

end
