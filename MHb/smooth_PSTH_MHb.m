function [dFR_mean, dFR_sem] = smooth_PSTH_MHb(dFR_nbootxt, g_std, bsln_idx)
% causal half-gaussian smoothing after (typically 10 ms) binning
dFR_nbootxt_smooth = smooth_half_gaussian(dFR_nbootxt, g_std); dFR_nbootxt_smooth = dFR_nbootxt_smooth(:,bsln_idx(1):end);
dFR_mean = mean(dFR_nbootxt_smooth,1);
dFR_sem = std(dFR_nbootxt_smooth,1)*1; % SEM = SD of bootstrap means