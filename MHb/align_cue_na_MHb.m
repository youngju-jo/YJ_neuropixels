function delta_rate_Bxt = align_cue_na_MHb(cohort, list_sess, list_unit, trialType, do_zscore)
% neuron averaging within each session -> concat trials across sessions
% -5 to +7 s, 10 ms bins, subtracted by -3 to 0 s activity
% [spikes per sec] or [z-score]

delta_rate_Bxt = [];
for idx_sess = 1:numel(cohort)
    if ismember(idx_sess,list_sess)
        % checking unit IDs: below should be zero
        % sum(list_ID(list_sess == idx_sess) ~= cohort{idx_sess}.list_su(list_unit(list_sess == idx_sess)))
        TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
        
        %mid_trial = round(numel(TTL_trial)/2); 
        %TTL_trial = TTL_trial(1:mid_trial); trialMatrix = trialMatrix(1:mid_trial);  % last half trials only
        %TTL_trial = TTL_trial(mid_trial:end); trialMatrix = trialMatrix(mid_trial:end);  % last half trials only
        
        list_unit_sess = list_unit(list_sess == idx_sess);
        
        if trialType == -1
            TTL_of_interest = TTL_trial;
        elseif trialType == -2
            TTL_stimblock = cohort{idx_sess}.TTL_stimblock;
            idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
            %idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==40).*(cohort{idx_sess}.trial_power==5))==1;
            TTL_of_interest = TTL_stimblock(idxTrial);
        else
            TTL_of_interest = TTL_trial(trialMatrix==trialType);
        end
        
        spike_bxtxn = bin_spikes(TTL_of_interest, [-5 7 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));  
  
        if do_zscore == 1
            unit_mean = cohort{idx_sess}.unit_mean(list_unit_sess);
            unit_std = cohort{idx_sess}.unit_std(list_unit_sess);
            rate_bxtxn = (spike_bxtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
        else
            rate_bxtxn = spike_bxtxn / 0.01;  % spikes per sec
        end
        
        rate_bxnxt = permute(rate_bxtxn, [1,3,2]);  % hadling the case of n=1
        delta_rate_bxnxt = rate_bxnxt - mean(rate_bxnxt(:,:,201:500),3);  % subtraction by -3 ~ 0 s from cue
        
        delta_rate_bx1xt = mean(delta_rate_bxnxt,2);  % neuron averaging (or total activity calculation)
        delta_rate_bxt = permute(delta_rate_bx1xt, [1,3,2]);  % hadling the case of n=1, avoiding to use squeeze
        delta_rate_Bxt = [delta_rate_Bxt; delta_rate_bxt];
    end
end

end

