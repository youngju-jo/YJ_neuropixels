function rcmap = cmap_allen_ccf(acr)

global atlas

idx_row = find(strcmp(atlas.st{:,5}, acr));
rcmap = atlas.cmap(idx_row,:);