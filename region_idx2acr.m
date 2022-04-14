function acr = region_idx2acr(idx)

global atlas

idx_row = (atlas.st{:,2}==idx);
acr = atlas.st{idx_row,5}; acr = acr{1};
%tree = atlas.st{idx_row,14}; tree = tree{1};