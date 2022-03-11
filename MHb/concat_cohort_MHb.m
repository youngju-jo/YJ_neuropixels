function cohort_flat = concat_cohort_MHb(cohort, cohort_type)

% unit identity
cohort_flat.sess = [];
cohort_flat.id = concat_field(cohort, 'list_su');

% anatomy
cohort_flat.coord = concat_field(cohort, 'unit_coord');
cohort_flat.region = concat_field(cohort, 'unit_region');

% spike metrics
cohort_flat.fr = [];
cohort_flat.duration = [];
cohort_flat.PTratio = [];
cohort_flat.acutoff = [];
cohort_flat.isiviolation = [];
cohort_flat.presenceratio = [];

% optotagging
cohort_flat.salt_I = concat_field(cohort, 'salt_I');
cohort_flat.salt_p = concat_field(cohort, 'salt_p');
cohort_flat.fr_changep = concat_field(cohort, 'fr_change');
cohort_flat.spike_probability = concat_field(cohort, 'spike_probability');
cohort_flat.spike_latency = concat_field(cohort, 'spike_latency');
cohort_flat.spike_jitter = concat_field(cohort, 'spike_jitter');
if cohort_type == 1
    cohort_flat.wf_corr = concat_field(cohort, 'wf_corr');
end

% waveform
cohort_flat.wf_features = [];

for idx_sess = 1:numel(cohort)
    
    cohort_flat.sess = [cohort_flat.sess; idx_sess*ones(numel(cohort{idx_sess}.list_su),1)];
    
    % spike metrics
    cohort_flat.fr = [cohort_flat.fr; cohort{idx_sess}.metrics{:,3}];
    cohort_flat.duration = [cohort_flat.duration; cohort{idx_sess}.metrics{:,19}];
    cohort_flat.PTratio = [cohort_flat.PTratio; cohort{idx_sess}.metrics{:,21}];
    cohort_flat.acutoff = [cohort_flat.acutoff; cohort{idx_sess}.metrics{:,6}];
    cohort_flat.isiviolation = [cohort_flat.isiviolation; cohort{idx_sess}.metrics{:,5}];
    cohort_flat.presenceratio = [cohort_flat.presenceratio; cohort{idx_sess}.metrics{:,4}];
    % 3: firing rate, 19: duration, 21: PT ratio, 25: spread, 4: presence ratio
    
    cohort_flat.wf_features = [cohort_flat.wf_features; cohort{idx_sess}.metrics{:,19:27}];
    
end

end