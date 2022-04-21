function dFR_nbootxt = PSTH_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, bsln_time, nboot)
% hierarchical bootstrap: randomly select (session index -> trial index) to generate resampled dataset
% calculate mean for each resampled dataset, concatenate the result, repeat nboot times
% for each trial, neuron averaging (or kinda CD projection) is performed for "total activity" calculation

FR_S_bxtxN = align_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, 0);
bsln = window_time2idx(bsln_time, countParam);

for idx_sess = 1:numel(FR_S_bxtxN)
    
    rate_bxtxn = FR_S_bxtxN{idx_sess};
    
    rate_bxnxt = permute(rate_bxtxn, [1,3,2]);  % hadling the case of n=1
    delta_rate_bxnxt = rate_bxnxt - mean(rate_bxnxt(:,:,bsln(1):bsln(2)),3);  % subtraction by baseline activity
    delta_rate_bx1xt = mean(delta_rate_bxnxt,2);  % neuron averaging (or total activity calculation)
    delta_rate_bxt = permute(delta_rate_bx1xt, [1,3,2]);  % hadling the case of n=1, avoiding to use squeeze
        
    dFR_S_bxt{idx_sess} = delta_rate_bxt;
    
end

dFR_nbootxt = []; num_sess = numel(dFR_S_bxt);
for idx_boot = 1:nboot
    temp = [];  % bootstrap dataset
    rand_sess = randsample(num_sess,num_sess,true);
    for idx_sess = 1:num_sess
        dFR_bxt = dFR_S_bxt{rand_sess(idx_sess)};
        num_trial = size(dFR_bxt,1);
        rand_trial = randsample(num_trial,num_trial,true);
        temp = [temp; dFR_bxt(rand_trial,:)];
    end
    dFR_nbootxt = [dFR_nbootxt; mean(temp,1)];  % calculate statistics of interest
end
    