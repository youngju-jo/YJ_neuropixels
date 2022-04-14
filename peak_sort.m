function [sorted_rate_nxt,psort] = peak_sort(rate_nxt)

[~,idx] = max(rate_nxt, [], 2); [~,psort] = sort(idx);
sorted_rate_nxt = rate_nxt(psort,:);