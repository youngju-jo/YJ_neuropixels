function dFR_nbootxt = PSTH2_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, bsln_time, nboot)
% hierarchical bootstrap: randomly select (session index -> neuron index -> trial index) to generate resampled dataset
% calculate mean for each resampled dataset, concatenate the result, repeat nboot times

FR_S_bxtxn = align_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, 0);
bsln = window_time2idx(bsln_time, countParam);

for idx_sess = 1:numel(FR_S_bxtxn)
    
    rate_bxtxn = FR_S_bxtxn{idx_sess};
    
    rate_bxnxt = permute(rate_bxtxn, [1,3,2]);  % hadling the case of n=1
    delta_rate_bxnxt = rate_bxnxt - mean(rate_bxnxt(:,:,bsln(1):bsln(2)),3);  % subtraction by baseline activity

    dFR_S_bxnxt{idx_sess} = delta_rate_bxnxt;
    
end

dFR_nbootxt = []; 
for idx_boot = 1:nboot
    temp = [];  % bootstrap dataset
    
    num_sess = numel(dFR_S_bxnxt);
    rand_sess = randsample(num_sess,num_sess,true);
    for idx_sess = 1:num_sess
        dFR_bxnxt = dFR_S_bxnxt{rand_sess(idx_sess)};
        num_neuron = size(dFR_bxnxt,2);
        rand_neuron = randsample(num_neuron,num_neuron,true);
        for idx_neuron = 1:num_neuron
            dFR_bxt = squeeze(dFR_bxnxt(:,rand_neuron(idx_neuron),:));
            num_trial = size(dFR_bxnxt,1);
            rand_trial = randsample(num_trial,num_trial,true);
            
            temp = [temp; dFR_bxt(rand_trial,:)];
        end
    end
    dFR_nbootxt = [dFR_nbootxt; mean(temp,1)];  % calculate statistics of interest
    disp(idx_boot);
end
    