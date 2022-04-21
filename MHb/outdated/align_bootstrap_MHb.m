function dFR_Bxt = align_bootstrap_MHb(cohort, list_sess, list_unit, trialType, do_zscore, num_sample)
% NOTE: this implementation in WRONG!
% hierarchical bootstrap: randomly select (session index -> trial index) to generate resampled dataset
% for each trial, neuron averaging (or kinda CD projection) is performed for "total activity" calculation 
% -7 to +7 s, 10 ms bins, subtracted by -3 to 0 s activity
% [spikes per sec] or [z-score]

dFR_Bxt = []; sess_all = unique(list_sess);  % consider filtering with number of simultaneously recorded neurons?
for idx_sample = 1:num_sample
    
    % sample session
    sess = randsample(sess_all,1);
    list_unit_sess = list_unit(list_sess == sess);
    
    TTL_trial = cohort{sess}.TTL_trial; trialMatrix = cohort{sess}.trialMatrix;
    %mid_trial = round(numel(TTL_trial)/2); 
    %TTL_trial = TTL_trial(1:mid_trial); trialMatrix = trialMatrix(1:mid_trial);  % last half trials only
    %TTL_trial = TTL_trial(mid_trial:end); trialMatrix = trialMatrix(mid_trial:end);  % last half trials only
    if trialType == -1
        TTL_of_interest = TTL_trial;
    elseif trialType == -2
        TTL_stimblock = cohort{sess}.TTL_stimblock;
        idxTrial = ((cohort{sess}.trial_width==0.010).*(cohort{sess}.trial_freq==10).*(cohort{sess}.trial_power==5))==1;
        %idxTrial = ((cohort{sess}.trial_width==0.010).*(cohort{sess}.trial_freq==40).*(cohort{sess}.trial_power==5))==1;
        TTL_of_interest = TTL_stimblock(idxTrial);
    else
        TTL_of_interest = TTL_trial(trialMatrix==trialType);
    end
    
    % sample trial
    TTL_1 = randsample(TTL_of_interest,1);
    idx_TTL = find(TTL_trial==TTL_1);
    if TTL_trial(idx_TTL+1) - TTL_trial(idx_TTL) <8
        continue;
    end
    
    % align
    spike_1xtxn = bin_spikes(TTL_1, [-7 9 0.010 1], cohort{sess}.spike_su(list_unit_sess));  
    
    % normalization
    if do_zscore == 1
        unit_mean = cohort{sess}.unit_mean(list_unit_sess);
        unit_std = cohort{sess}.unit_std(list_unit_sess);
        rate_1xtxn = (spike_1xtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
    else
        rate_1xtxn = spike_1xtxn / 0.01;  % spikes per sec
    end
    
    % baseline subtraction
    rate_1xnxt = permute(rate_1xtxn, [1,3,2]);  % hadling the case of n=1
    delta_rate_1xnxt = rate_1xnxt - mean(rate_1xnxt(:,:,601:700),3);  % subtraction by -1 ~ 0 s from cue
    delta_rate_1x1xt = mean(delta_rate_1xnxt,2);  % neuron averaging (or total activity calculation)
    delta_rate_1xt = permute(delta_rate_1x1xt,[1,3,2]);  % hadling the case of n=1, avoiding to use squeeze
    
    dFR_Bxt = [dFR_Bxt; delta_rate_1xt];
    
end
