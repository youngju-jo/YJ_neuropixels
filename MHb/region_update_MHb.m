function cohort_flat = region_update_MHb(cohort_flat)

% region groups for MHb project
% {'MH', 'LH', 'LAT', 'MED', 'MTN', 'ILM', 'DORsm', 'MB', 'HIP', 'MSC', 'TRS', 'LSX', 'STR', 'BST', 'HY'}
% unanlyzed: 'VS' (73), 'fiber tracts' (1009), 'NA' (997/root)

global atlas

regions = cohort_flat.region;
for idx_unit = 1:numel(regions)
    acr = region_idx2acr(regions(idx_unit));
    
    % ventricles (not to analyze)
    if isAreaOrContains(acr, 'VS', atlas.st)
        acr_new = 'VS';
    % fiber tracts (not to analyze)
    elseif isAreaOrContains(acr, 'fiber tracts', atlas.st)
        acr_new = 'fiber tracts';
    % habenula
    elseif isAreaOrContains(acr, 'MH', atlas.st)
        acr_new = 'MH';
    elseif isAreaOrContains(acr, 'LH', atlas.st)
        acr_new = 'LH';
    % thalamus
    elseif isAreaOrContains(acr, 'LAT', atlas.st)
        acr_new = 'LAT';
    elseif isAreaOrContains(acr, 'MED', atlas.st)
        acr_new = 'MED';
    elseif isAreaOrContains(acr, 'MTN', atlas.st)
        acr_new = 'MTN';
    elseif isAreaOrContains(acr, 'ILM', atlas.st)
        acr_new = 'ILM';
    elseif isAreaOrContains(acr, 'DORsm', atlas.st)
        acr_new = 'DORsm';
    % midbrain
    elseif isAreaOrContains(acr, 'MB', atlas.st)
        acr_new = 'MB';
    % hippocampus
    elseif isAreaOrContains(acr, 'HIP', atlas.st)
        acr_new = 'HIP';
    % medial septum complex
    elseif isAreaOrContains(acr, 'MSC', atlas.st)
        acr_new = 'MSC';
    % TRS
    elseif isAreaOrContains(acr, 'TRS', atlas.st)
        acr_new = 'TRS';
    % lateral septum  complex & (remaining) striatum
    elseif isAreaOrContains(acr, 'STR', atlas.st)
        if isAreaOrContains(acr, 'LSX', atlas.st)
            acr_new = 'LSX';
        else
            acr_new = 'STR';
        end
    % BNST
    elseif isAreaOrContains(acr, 'BST', atlas.st)
        acr_new = 'BST';
    % hypothalamus
    elseif isAreaOrContains(acr, 'HY', atlas.st)
        acr_new = 'HY';
    % remainder
    else
        acr_new = 'NA';
    end
    
    try
        cohort_flat.group(idx_unit) = region_acr2idx(acr_new);
    catch
        cohort_flat.group(idx_unit) = 997;  % treat NA as root
    end
    
end

%LAT: lp
%MED: imd, md, pr
%MTN: PVT
%ILM: CL, pf

% sum(cohort_flat.group==997) / numel(cohort_flat.group)
% unique(cohort_flat.region(cohort_flat.group==997))
% region_idx2acr(549)
% sum(cohort_flat.group==region_acr2idx('HIP'))
% sum(cohort_flat.group==73)  % VS
% sum(cohort_flat.group==1009)  % fiber tracts
