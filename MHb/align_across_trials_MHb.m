function rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, trialType, do_zscore, do_smoothing)
% generate ragged data cubes, [spikes per sec] or [z-score]
% trial dimension: 500, all trials aligned by the last trials
% time dimension: -4 to +6 s, 10 ms bins

rate_BxtxN = nan(500, 1001, numel(list_sess));  % tt=1001: [-4 6 0.010 1]

for idx_sess = 1:numel(cohort)
    if ismember(idx_sess,list_sess)
        TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
        list_unit_sess = list_unit(list_sess == idx_sess);
        
        if trialType == -1
            TTL_of_interest = TTL_trial;
        else
            TTL_of_interest = TTL_trial(trialMatrix==trialType);
        end
        
        spike_bxtxn = bin_spikes(TTL_of_interest, [-4 6 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));
        
        if do_zscore == 1
            unit_mean = cohort{idx_sess}.unit_mean(list_unit_sess);
            unit_std = cohort{idx_sess}.unit_std(list_unit_sess);
            rate_bxtxn = (spike_bxtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
        else
            rate_bxtxn = spike_bxtxn / 0.01;  % spikes per sec
        end
        
        [bb,~,nn] = size(rate_bxtxn);
        
        if do_smoothing == 1  % smoothing
            g_std = 20;  % 200 ms std, causal half-gaussian smoothing after 10 ms binning
            half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 
            for idx_b = 1:bb
                for idx_n = 1:nn
                    rate_bxtxn(idx_b,:,idx_n) = conv(rate_bxtxn(idx_b,:,idx_n), half_gaussian, 'same');
                end
            end
        end
        
        rate_BxtxN(end-bb+1:end, :, list_sess==idx_sess) = rate_bxtxn;
    end
end



