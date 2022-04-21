function rate_S_bxtxn = align_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, split_half)
% align spikes to a specific event

sess_all = unique(list_sess);
for idx_sess = 1:numel(sess_all)
    sess = sess_all(idx_sess);
    list_unit_sess = list_unit(list_sess == sess);
    % checking unit IDs: below should be zero
    % sum(list_ID(list_sess == idx_sess) ~= cohort{idx_sess}.list_su(list_unit(list_sess == idx_sess)))
    
    TTL_trial = cohort{sess}.TTL_trial; trialMatrix = cohort{sess}.trialMatrix;
    
    % split trials into half, if specified
    mid_trial = round(numel(TTL_trial)/2);
    if split_half == 1
        TTL_trial = TTL_trial(1:mid_trial); trialMatrix = trialMatrix(1:mid_trial);  % last half trials only
    elseif split_half == 2
        TTL_trial = TTL_trial(mid_trial:end); trialMatrix = trialMatrix(mid_trial:end);  % last half trials only
    end
    
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
    
    % temp: gating by ITI for longer plot
    %{
    TTL_index = find(ismember(TTL_trial, TTL_of_interest));
    if TTL_index(end) == numel(TTL_trial)
        TTL_index = TTL_index(1:end-1);
    end
    TTL_of_interest = TTL_of_interest(TTL_trial(TTL_index+1) - TTL_trial(TTL_index) > 8);
    %}
    
    % align
    spike_bxtxn = bin_spikes(TTL_of_interest, countParam, cohort{sess}.spike_su(list_unit_sess));
    
    % normalization
    if do_zscore == 1
        unit_mean = cohort{sess}.unit_mean(list_unit_sess);
        unit_std = cohort{sess}.unit_std(list_unit_sess);
        rate_bxtxn = (spike_bxtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
    else
        rate_bxtxn = spike_bxtxn / 0.01;  % spikes per sec
    end
    
    rate_S_bxtxn{idx_sess} = rate_bxtxn;
    
end
    
    