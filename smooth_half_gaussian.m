function smooth_rate_Nxt = smooth_half_gaussian(rate_Nxt, g_std)
% typically, g_std = 20 (200 ms std, causal half-gaussian smoothing -- after 10 ms binning in earlier processing)
% post-filtering cutting of initial segments should be performed separately

half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 

smooth_rate_Nxt = zeros(size(rate_Nxt));
for idx_N = 1:size(rate_Nxt,1)
    smooth_rate_Nxt(idx_N, :) = conv(rate_Nxt(idx_N, :), half_gaussian, 'same'); 
end