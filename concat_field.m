function data_flat = concat_field(cohort, varName)

data_flat = [];
for idx_sess = 1:numel(cohort)
    data_flat = [data_flat; cohort{idx_sess}.(varName)];
end

end