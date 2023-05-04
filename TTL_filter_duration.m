function [TTLon_filtered, TTLoff_filtered] = TTL_filter_duration(TTLon, TTLoff, minDur)
% filter TTL on/off values using minimum duration
% should run TTL_filter first

TTLdur = TTLoff - TTLon;
keep_idx = (TTLdur > minDur);

TTLon_filtered = TTLon(keep_idx);
TTLoff_filtered = TTLoff(keep_idx);

end