function [delta_rate_rw_Nxt, delta_rate_nr_Nxt, delta_rate_ms_Nxt, p_Nx12] = align_cue_modulation_MHb(cohort, list_sess, list_unit, do_zscore)
% calculate delta FRs for rewarded, unrewarded, and miss trials, 
% and also run statistical tests for task modulatedness
% -4 to +6 s, 10 ms bins, subtracted by -2 to 0 s activity
% [spikes per sec] or [z-score]

delta_rate_rw_Nxt = []; delta_rate_nr_Nxt = []; delta_rate_ms_Nxt = []; p_Nx12 = [];
for idx_sess = 1:numel(cohort)
    if ismember(idx_sess,list_sess)
        TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
        
        list_unit_sess = list_unit(list_sess == idx_sess);
        spike_bxtxn = bin_spikes(TTL_trial, [-4 7 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));
  
        if do_zscore == 1
            unit_mean = cohort{idx_sess}.unit_mean(list_unit_sess);
            unit_std = cohort{idx_sess}.unit_std(list_unit_sess);
            rate_bxtxn = (spike_bxtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
        else
            rate_bxtxn = spike_bxtxn / 0.01;  % spikes per sec
        end
        
        rate_bxnxt = permute(rate_bxtxn, [1,3,2]);  % hadling the case of n=1
        delta_rate_bxnxt = rate_bxnxt - mean(rate_bxnxt(:,:,201:400),3);  % subtraction by -2 ~ 0 s from cue
        
        delta_rate_rw_1xnxt = mean(delta_rate_bxnxt(trialMatrix==1,:,:),1);  % trial averaging
        delta_rate_nr_1xnxt = mean(delta_rate_bxnxt(trialMatrix==2,:,:),1);
        delta_rate_ms_1xnxt = mean(delta_rate_bxnxt(trialMatrix==3,:,:),1);
        delta_rate_rw_nxt = permute(delta_rate_rw_1xnxt, [2,3,1]);  % hadling the case of n=1, avoiding to use squeeze
        delta_rate_nr_nxt = permute(delta_rate_nr_1xnxt, [2,3,1]);
        delta_rate_ms_nxt = permute(delta_rate_ms_1xnxt, [2,3,1]);
        delta_rate_rw_Nxt = [delta_rate_rw_Nxt; delta_rate_rw_nxt];
        delta_rate_nr_Nxt = [delta_rate_nr_Nxt; delta_rate_nr_nxt];
        delta_rate_ms_Nxt = [delta_rate_ms_Nxt; delta_rate_ms_nxt];
        
        % testing task-modulatedness, signed-rank test (in each trial, baseline and post-cue are paired)
        p_nx12 = [];
        for idx_n = 1:size(spike_bxtxn,3)
            
            spike_baseline = sum(spike_bxtxn(:,301:400,idx_n),2);
            spike_epoch1 = sum(spike_bxtxn(:,401:500,idx_n),2);
            spike_epoch2 = sum(spike_bxtxn(:,501:600,idx_n),2);
            spike_epoch3 = sum(spike_bxtxn(:,601:700,idx_n),2);
            spike_epoch4 = sum(spike_bxtxn(:,701:800,idx_n),2);
            
            p_rw_1 = signrank(spike_epoch1(trialMatrix==1), spike_baseline(trialMatrix==1));
            p_rw_2 = signrank(spike_epoch2(trialMatrix==1), spike_baseline(trialMatrix==1));
            p_rw_3 = signrank(spike_epoch3(trialMatrix==1), spike_baseline(trialMatrix==1));
            p_rw_4 = signrank(spike_epoch4(trialMatrix==1), spike_baseline(trialMatrix==1));
            
            p_nr_1 = signrank(spike_epoch1(trialMatrix==2), spike_baseline(trialMatrix==2));
            p_nr_2 = signrank(spike_epoch2(trialMatrix==2), spike_baseline(trialMatrix==2));
            p_nr_3 = signrank(spike_epoch3(trialMatrix==2), spike_baseline(trialMatrix==2));
            p_nr_4 = signrank(spike_epoch4(trialMatrix==2), spike_baseline(trialMatrix==2));
            
            p_ms_1 = signrank(spike_epoch1(trialMatrix==3), spike_baseline(trialMatrix==3));
            p_ms_2 = signrank(spike_epoch2(trialMatrix==3), spike_baseline(trialMatrix==3));
            p_ms_3 = signrank(spike_epoch3(trialMatrix==3), spike_baseline(trialMatrix==3));
            p_ms_4 = signrank(spike_epoch4(trialMatrix==3), spike_baseline(trialMatrix==3));
            
            p_nx12 = [p_nx12; p_rw_1 p_rw_2 p_rw_3 p_rw_4 p_nr_1 p_nr_2 p_nr_3 p_nr_4 p_ms_1 p_ms_2 p_ms_3 p_ms_4];
        end
        p_Nx12 = [p_Nx12; p_nx12];
          
    end
end

end
