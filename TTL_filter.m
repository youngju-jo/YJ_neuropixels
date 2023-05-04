function [TTLon_filtered, TTLoff_filtered] = TTL_filter(TTLon, TTLoff)
% filter TTL on/off values so that they correspond to each other 1:!

TTLall = sort([TTLon; TTLoff]);

alternating_10 = ismember(TTLall, TTLon);
error_idx = find(alternating_10(1:end-1) - alternating_10(2:end) == 0);
on_idx = error_idx(alternating_10(error_idx) == 1);
off_idx = error_idx(alternating_10(error_idx) == 0);
throw_idx = [on_idx; off_idx+1];
TTLall(throw_idx) = [];

TTLon_filtered = TTLall(1:2:end);
TTLoff_filtered = TTLall(2:2:end);

end