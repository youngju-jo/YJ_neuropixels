function [tau_N, class_on, class_off] = stim_tau_MHb(cohort, list_sess, list_unit, countParam, bsln_time, tbin_size)

bsln = window_time2idx(bsln_time, countParam);
ibin_size = window_time2idx([bsln_time(2), tbin_size], countParam); ibin_size = ibin_size(2) - ibin_size(1);
FR_S_bxtxn = align_MHb(cohort, list_sess, list_unit, 0, 0, countParam, 0);

% stat tests for segmented temporal windows
p_TT = []; sign_TT = [];
for idx_sess = 1:numel(FR_S_bxtxn)
    
    rate_bxtxn = FR_S_bxtxn{idx_sess};
    rate_bxnxt = permute(rate_bxtxn, [1,3,2]);  % hadling the case of n=1
    dFR_bxnxt = rate_bxnxt - mean(rate_bxnxt(:,:,bsln(1):bsln(2)),3);  % subtraction by baseline activity
    
    nbin = (size(rate_bxtxn,2) - bsln(2)) / ibin_size;
    for idx_n = 1:size(dFR_bxnxt,2)
        dFR_bxt = squeeze(dFR_bxnxt(:,idx_n,:));
        p_tt = nan(1,nbin); sign_tt = nan(1,nbin);
        for idx_bin = 1:nbin
            test_b = mean(dFR_bxt(:,bsln(2)+(idx_bin-1)*ibin_size:bsln(2)+idx_bin*ibin_size),2);
            [p,~,stats] = signrank(test_b);
            p_tt(idx_bin) = p; 
            try
                sign_tt(idx_bin) = sign(stats.zval);
            catch
                disp('no z');
            end
        end
        p_TT = [p_TT; p_tt]; sign_TT = [sign_TT; sign_tt];
    end
end

% FDR correction
adj_p_thres = 0.01;
[h_TT, ~, ~, adj_p_TT] = fdr_bh(p_TT,adj_p_thres,'pdep','no');

% tau estimation
conti_crit = 3;  % criterion for "recovery"
tau_N = nan(size(p_TT,1),1);
for idx_neuron = 1:size(tau_N,1)
    for idx_bin = 1:(nbin-conti_crit+1)
        if isequal(h_TT(idx_neuron, idx_bin:idx_bin+conti_crit-1), zeros(1,conti_crit))
            tau_N(idx_neuron) = idx_bin * tbin_size;
            break;
        end
    end
end

% classification of response during/after stim (note: hardcoded for 0.5 s window/stim)
class_on = sign_TT(:,1);
class_off = sign_TT(:,2);
    
    
    
    