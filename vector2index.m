function [list_sess, list_unit, list_ID] = vector2index(cohort, cohort_flat, logical_vector)

list_sess = cohort_flat.sess(logical_vector);
list_ID = cohort_flat.id(logical_vector);

list_unit = [];
for idx  = 1:sum(logical_vector)
    list_unit = [list_unit; find(cohort{list_sess(idx)}.list_su==list_ID(idx))];
end
    
end

