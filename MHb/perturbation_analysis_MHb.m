function perturbation_analysis_MHb(cohort, list_sess, list_unit, do_zscore, countParam, bsln_time, nboot)

FR_S_bxtxn_1 = align_MHb(cohort, list_sess, list_unit, 0, do_zscore, countParam, 1);
FR_S_bxtxn_2 = align_MHb(cohort, list_sess, list_unit, 0, do_zscore, countParam, 2);

% no baseline subtraction
for idx_sess = 1:numel(FR_S_bxtxn_1)
    FR_S_bxnxt_1{idx_sess} = permute(FR_S_bxtxn_1{idx_sess}, [1,3,2]);
    FR_S_bxnxt_2{idx_sess} = permute(FR_S_bxtxn_2{idx_sess}, [1,3,2]);
end

FR_nbootxt_1 = [];
for idx_boot = 1:nboot
    temp = [];  % bootstrap dataset
    
    num_sess = numel(FR_S_bxnxt_1);
    rand_sess = randsample(num_sess,num_sess,true);
    for idx_sess = 1:num_sess
        dFR_bxnxt = FR_S_bxnxt_1{rand_sess(idx_sess)};
        num_neuron = size(dFR_bxnxt,2);
        rand_neuron = randsample(num_neuron,num_neuron,true);
        for idx_neuron = 1:num_neuron
            dFR_bxt = squeeze(dFR_bxnxt(:,rand_neuron(idx_neuron),:));
            num_trial = size(dFR_bxnxt,1);
            rand_trial = randsample(num_trial,num_trial,true);
            
            temp = [temp; dFR_bxt(rand_trial,:)];
        end
    end
    FR_nbootxt_1 = [FR_nbootxt_1; mean(temp,1)];  % calculate statistics of interest
    disp(idx_boot);
end

FR_nbootxt_2 = [];
for idx_boot = 1:nboot
    temp = [];  % bootstrap dataset
    
    num_sess = numel(FR_S_bxnxt_2);
    rand_sess = randsample(num_sess,num_sess,true);
    for idx_sess = 1:num_sess
        dFR_bxnxt = FR_S_bxnxt_2{rand_sess(idx_sess)};
        num_neuron = size(dFR_bxnxt,2);
        rand_neuron = randsample(num_neuron,num_neuron,true);
        for idx_neuron = 1:num_neuron
            dFR_bxt = squeeze(dFR_bxnxt(:,rand_neuron(idx_neuron),:));
            num_trial = size(dFR_bxnxt,1);
            rand_trial = randsample(num_trial,num_trial,true);
            
            temp = [temp; dFR_bxt(rand_trial,:)];
        end
    end
    FR_nbootxt_2 = [FR_nbootxt_2; mean(temp,1)];  % calculate statistics of interest
    disp(idx_boot);
end

bsln_idx = window_time2idx(bsln_time, countParam);
analysis_idx = window_time2idx(bsln_time+countParam(2), countParam);

pre_1 = mean(FR_nbootxt_1(:,bsln_idx(1):bsln_idx(2)), 2);
pre_2 = mean(FR_nbootxt_2(:,bsln_idx(1):bsln_idx(2)), 2);
post_1 = mean(FR_nbootxt_1(:,analysis_idx(1):analysis_idx(2)), 2);
post_2 = mean(FR_nbootxt_2(:,analysis_idx(1):analysis_idx(2)), 2);

mean_pre_1 = mean(pre_1);
mean_pre_2 = mean(pre_2);
mean_post_1 = mean(post_1);
mean_post_2 = mean(post_2);

sem_pre_1 = std(pre_1);
sem_pre_2 = std(pre_2);
sem_post_1 = std(post_1);
sem_post_2 = std(post_2);

% p values
disp(sum(pre_1<post_1)/nboot);
disp(sum(pre_2<post_2)/nboot);

% plot
figure, 
errorbar(1:2,[mean_pre_1 mean_post_1], [sem_pre_1 sem_post_1], '-o'); hold on;
errorbar(3:4,[mean_pre_2 mean_post_2], [sem_pre_2 sem_post_2], '-o'); hold off;
xlim([0 5]); xt = 1:4; xtlbl = {'Early-pre', 'Early-post', 'Late-pre', 'Late-post'}; set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
ylim([-0.3 0.4]);
if do_zscore
    ylabel('Total activity (z-score)');
else
    ylabel('Total activity (spikes/s)'); 
end
uniformFigureProps();
