function logical_vector = is_dorsal_MHb(coord, dorsal_fraction)
% determine if given unit coordinates are in doral MHb defined by "dorsal fraction"

global atlas

av_mask = (atlas.av==713);
av_mask_proj = squeeze(max(av_mask, [], 2));

[MHb_AP,MHb_ML] = ind2sub(size(av_mask_proj), find(av_mask_proj));
MHb_DV_bdry = nan(numel(MHb_AP),1);
for idx = 1:numel(MHb_AP)
    DV_column = av_mask(MHb_AP(idx),:,MHb_ML(idx));
    DV_column_Hb = find(DV_column);
    lim_dorsal = min(DV_column_Hb); lim_ventral = max(DV_column_Hb);
    DV_bdry = lim_dorsal + (lim_ventral-lim_dorsal) * dorsal_fraction;
    MHb_DV_bdry(idx) = DV_bdry;
end

logical_vector = (coord(:,3)/10 < MHb_DV_bdry(dsearchn([MHb_ML MHb_AP],coord(:,1:2)/10)));

end
