function idx = region_acr2idx(acr)

global atlas

idx_row = find(strcmp(atlas.st{:,5}, acr));
idx = atlas.st{idx_row,2};