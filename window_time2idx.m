function window_idx = window_time2idx(window_time, countParam)
tAxisPSTH = countParam(1):countParam(3):countParam(2);
window_idx = round(interp1(tAxisPSTH,1:numel(tAxisPSTH),window_time));