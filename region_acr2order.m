function gorder = region_acr2order(acr)

global atlas

idx_row = find(strcmp(atlas.st{:,5}, acr));
gorder = atlas.st{idx_row,13};