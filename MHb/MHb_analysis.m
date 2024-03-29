
% Neuropixels 2.0 data analysis for the medial habenula project
% YoungJu Jo (yjjo@stanford.edu)


%% Load mouse brain atlas

global atlas
atlas.tv = readNPY('template_volume_10um.npy'); % grey-scale "background signal intensity"
% atlas.tv = max(atlas.tv(:)) - atlas.tv; % for color inversion
atlas.av = readNPY('annotation_volume_10um_by_index.npy'); % the number at each pixel labels the area, see note below
atlas.st = loadStructureTree('structure_tree_safe_2017.csv'); % a table of what all the labels mean
load('allen_ccf_colormap_2017.mat','cmap'); % colormap defining unique color for each region
atlas.cmap = cmap;

% region groups for MHb project
groups_of_interest = {'MH', 'LH', 'LAT', 'MED', 'MTN', 'ILM', 'DORsm', 'MB', 'HIP', 'MSC', 'TRS', 'LSX', 'STR', 'BST', 'HY'};

% atlas volumes: AP/DV/ML
% registered coordinates: ML/AP/DV


%% Load and process data (note: to skip local processing, load the saved .mat files below)

cohort_type = 1;  % 1: Tac1, 2: septum, 3: perturbation

%{
cohort = cohort_MHb(cohort_type);
mergestructs = @(x,y) cell2struct([struct2cell(x);struct2cell(y)],[fieldnames(x);fieldnames(y)]);
for idx_sess = 1:numel(cohort)
    cohort{idx_sess} = mergestructs(cohort{idx_sess}, process_session_MHb(cohort{idx_sess}, cohort_type));
end
%}
% save('cohort_Tac1.mat', 'cohort', '-v7.3');  % load('cohort_Tac1.mat');
% save('cohort_septum.mat', 'cohort', '-v7.3');  % load('cohort_septum.mat');
% save('cohort_perturbation.mat', 'cohort', '-v7.3'); % load('cohort_perturbation.mat');

%{
% for peak-sorted activity plots
load('cohort_Tac1.mat'); cohort_MHb = cohort;
load('cohort_septum.mat'); cohort_septum = cohort;
cohort = [cohort_MHb cohort_septum];
clear cohort_MHb cohort_septum

% for PSTH plots
load('cohort_Tac1.mat'); cohort_MHb = cohort;
load('cohort_perturbation.mat'); cohort_perturbation = cohort;
cohort = [cohort_MHb cohort_perturbation];
clear cohort_MHb cohort_perturbation
%}

% concat_field: extract certain fields (e.g., concat_field(cohort, 'unit_region'))


%% Concatenate unit info and filter by QC metrics

% concat units
cohort_flat = concat_cohort_MHb(cohort, cohort_type);

% QC conditions
cond1 = cohort_flat.isiviolation < 0.5;
cond2 = cohort_flat.fr > 0.2;
cond3 = 1;
cond4 = 1;
cond5 = 1;
cond = logical(cond1.*cond2.*cond3.*cond4.*cond5); disp(sum(cond));

% filtering
cohort_flat_fields = fieldnames(cohort_flat);
for idx_field = 1:numel(cohort_flat_fields)
    field_values = cohort_flat.(cohort_flat_fields{idx_field});
    cohort_flat.(cohort_flat_fields{idx_field}) = field_values(cond, :);
end

% add 'group' field for grouping brain regions
tic; cohort_flat = region_update_MHb(cohort_flat); toc;

% specifying optotagged units
if cohort_type == 1
    optotagged = logical((cohort_flat.salt_p < 0.01) .* (cohort_flat.spike_probability > 0.2)); %.* (cohort_flat.wf_corr > 0.8));  % waveform calculation had glitch due to absence of high-pass filtering (can get waveform by high-pass filtering, but the waveform metrics should be recalculated)
elseif cohort_type == 3
    optotagged = logical((cohort_flat.salt_p < 0.01) .* (cohort_flat.spike_probability > 0.2));
end

% atlas visualization
plot_optotagged = 1;
atlas_MHb(cohort_flat, plot_optotagged, optotagged);
% h = findobj('Type','figure'); save_fig_MHb(h, 'panel_atlas_MHb');

% atlas_septum(cohort_flat);
% h = findobj('Type','figure'); save_fig_MHb(h, 'panel_atlas_septum');

%{
% print all brain regions with any units recorded
unit_region_all = cohort_flat.region; 
regions = unique(unit_region);
for idx = 1:numel(regions)
    disp(region_idx2acr(regions(idx)));
    disp(sum(unit_region==regions(idx)));
end

% brain region viewer
% important note: the stems (i.e., non-leaves, e.g., STR, MB) are "remainders" in the annotation volume
vol_of_interest = atlas.av==(region_acr2order('AM')+1);  % recheck the correspondence between graph order and av label!
figure, imagesc(squeeze(vol_of_interest(600,:,:)));
% figure, imagesc(squeeze(atlas.av(700,:,:)));

%}


% example: from concatenated logical vector to session index, unit index, and unit ID
% [list_sess, list_unit, list_ID] = vector2index(cohort, cohort_flat, optotagged);

% figure, hist(idx_sess); 
% idx = 20; disp(cohort{idx_sess(idx)}.spike_latency(idx_unit(idx),:)); 
% figure, hist(cohort{12}.spike_latency);
% figure, plot(cohort_flat.spike_latency, cohort_flat.fr, '.'); -- interesting, let's go through the optotagging metrics code again


%% "cond": specify target units from cohort_flat

% always, target neurons should be set first for the downstream population analyses

%cohort_flat.region==186; %cohort_flat.group'==904;
cond1 = cohort_flat.region==186; % 483: MHb / 186: LHb / 149: PVT // 904: MSC / 581: TRS
cond2 = optotagged;
cond3 = 1; %is_dorsal_MHb(cohort_flat.coord, 0.2); %cohort_flat.coord(:,3) < 2900;
cond4 = 1; %cohort_flat.sess == 3;
cond5 = 1; %cohort_flat.id == 210;
cond = logical(cond1.*cond2.*cond3.*cond4.*cond5.*ones(numel(cohort_flat.id),1)); 
[list_sess, list_unit, list_ID] = vector2index(cohort, cohort_flat, cond);
disp(sum(cond));

% sess 4, 5, (10), *12* / all: 4, 5, 10, 12, 15, 18
% for LHb: try gating the LHb signal based on ML coordinates?

% atlas visualization
%atlas_MHb_specified(cohort_flat, cond);

% "neuron card"
plot_comprehensive_MHb(cohort, list_sess, list_unit, list_ID);
% save_comprehensive_MHb(cohort, list_sess, list_unit, list_ID, 'C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\NeuronCards\all\TRS');

% simpler raster/ramping viusalization
plot_raster_ramping_MHb(cohort, list_sess, list_unit, list_ID);
% h = findobj('Type','figure'); save_fig_MHb(h, 'panel_unit_2');

%% Browser: single-unit spike raster and smoothed rate

% Note: trialType
% 1: lick-reward, 2: lick-noreward, 3: nolick / 0: perturbation
% -1: all trials, -2: optotagging trials

trialType = 0;
%plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-2.0 4.0 0.010 20]);
plot_raster2_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-2.0 4.0 0.010 20], [-2, 0]);  % baseline-subtracted
% h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_raster_stim_4');


%plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-0 0.033 0.010 20]);
%trialType = -2; plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-0.5 1.5 0.010 2]);

% generic within-session browser
% idx_sess = 12; plot_raster2(cohort{idx_sess}.TTL_trial(cohort{idx_sess}.trialMatrix==1), [-2.0 4.0 0.010 20], cohort{idx_sess}.spike_su(cohort{idx_sess}.unit_region==483), cohort{idx_sess}.list_su(cohort{idx_sess}.unit_region==483), 1);




%% Activity across trials -- try including unrewarded trials but excluding miss trials?

% across-trial processing
% (1) spike_bxtxn -> reshape individual data cubes to 500xtxn (ragged structure)
% (2) concat along n dimension (500xtxN)?
% (3) (optional) do smoothing for heatmap generation
% (4) nanmean/sem calculation along the neuron dimension

trialType = 1;
do_zscore = 1;

% check number of existing trials across sessions
% figure, plot(mean(isnan(rate_BxtxN), [2,3]));  
num_last_trials = 70;  % 70 for regular sessions, ~200 for stim sessions? // 40 for perturbation session 3, 20 for perturbation session 4

% cue aligned rate in rewarded trials
% ***for heatmap: with smoothing***
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, trialType, do_zscore, 1);  % trialType, do_zscore, do_smoothing

% visualize heatmap (add time axis)
rate_Bxt = nanmean(rate_BxtxN, 3);

figure; set(gcf,'color','w');
imagesc(rate_Bxt(500-num_last_trials:end,200:end)); colormap inferno;
xlabel('Time from cue (s)'); %xlabel('Time from stim (s)'); 
xline(201,'-w'); xt = 1:100:900+1; xtlbl = -2:1:7; set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
ylabel('Rewarded trials from session end'); %ylabel('Stim trials from session end');
yt = 1:10:num_last_trials+1; ytlbl = -1*num_last_trials:10:0;
set(gca, 'YTick', yt, 'YTickLabel', ytlbl);
cb=colorbar; 
if do_zscore
    ylabel(cb, 'Firing rate (z-score)', 'Rotation', 90);
else
    ylabel(cb, 'Firing rate (spikes/s)','Rotation', 90); 
end
uniformFigureProps();
% caxis([-0.5, 1]); h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_perturbation_heatmap');
% caxis([-0.4, 0.6]); h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_rewarded_heatmap');


% ***for curve: without smoothing***
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, trialType, do_zscore, 0);  % trialType, do_zscore, do_smoothing

% mean/sem calculation (time window: baseline 2 s)
rate_BxN = squeeze(nanmean(rate_BxtxN(500-num_last_trials:end, 200:400,:), 2));  % also try 400:600 reward period
rate_B_mean = nanmean(rate_BxN, 2);
%rate_B_sem = nanstd(rate_BxN, 0, 2)/sqrt(size(rate_BxN,2));

% plot baseline ramping
figure; set(gcf,'color','w');
tAxisTrial = -1*num_last_trials:0;
f1 = fit(tAxisTrial', rate_B_mean, 'poly1'); cfitv = confint(f1); 
sd = (cfitv(2,1) - cfitv(1,1))/(2*1.96); z = abs(0-f1.p1)/sd; p = exp(-0.717*z-0.416*z^2);
% alternative p-value calculation using correlation
% [r,p] = corrcoef(tAxisTrial', rate_B_mean); vpa(r(1,2)); vpa(p(1,2));
%shadedErrorBar(tAxisTrial,rate_B_mean,rate_B_sem, {'Color', [0.5 0 0]}, 0.8); hold on;
%scatter(tAxisTrial, rate_B_mean, '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',0.5); hold on;
%plot(tAxisTrial, f1(tAxisTrial), '-', 'Color', [0.8,0,0,1]); hold off;
scatter(tAxisTrial, rate_B_mean, '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',0.5); hold on;
plot(tAxisTrial, f1(tAxisTrial), '-', 'Color', [0,0.8,0,1]); hold off;
xlabel('Rewarded trials from session end');  % ylim([10,20]);
%xlabel('Stim trials from session end');
if do_zscore
    ylabel('Firing rate (z-score)');
else
    ylabel('Firing rate (spikes/s)');
end
title(strcat('p=',num2str(p))); uniformFigureProps();
xlim([tAxisTrial(1),tAxisTrial(end)]); ylim([-0.3,0.31]);
% h = findobj('Type','figure'); h.Position = [100 100 400 420]; save_fig_MHb(h, 'panel_ramping_MHb');
% h = findobj('Type','figure'); h.Position = [100 100 400 420]; save_fig_MHb(h, 'panel_ramping_LHb');


% single-unit ramping quantification
ramping_N = fit_ramping_MHb(rate_BxN);  % linear fit for individual units

ramping_count = [sum(ramping_N.class==1) sum(ramping_N.class==-1) sum(ramping_N.class==0)];
ramping_fraction = ramping_count / sum(ramping_count);
ramping_fraction = [ramping_fraction; ramping_fraction];  % TO DO: use it for multi-cond case (e.g., MHb vs LHb, or as a function of MHb dorsal fraction)

figure; set(gcf,'color','w');
hb = bar(ramping_fraction, 'stacked'); ylim([0,1.05]);
labels = {'Ramping up','Ramping down','Ramping n.s.'}; lgd = legend(labels);
hb(1).FaceColor = 'r'; hb(2).FaceColor = 'b'; hb(3).FaceColor = 'w';
% save('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\ramping_TRS.mat', 'rate_Bxt', 'rate_BxN', 'ramping_N', '-v7.3');

% pie chart
% figure; set(gcf,'color','w'); pie(categorical(ramping_N.class)); colormap(redblue); %title(strcat('MHb (N=', num2str(sum(cond)), ')'));
% labels = {'Ramp DOWN', 'n.s.', 'Ramp UP'}; lgd = legend(labels);



%% ramping summary

list_pop = {'MHbTac1', 'MHb', 'LHbTac1', 'LHb', 'PVT', 'MSC', 'TRS'};

ramping_fraction_all = [];
for idx_pop = 1:numel(list_pop)
    
    load(strcat('ramping_', list_pop{idx_pop}, '.mat'));
    population{idx_pop}.rate_Bxt = rate_Bxt;
    population{idx_pop}.rate_BxN = rate_BxN;
    population{idx_pop}.ramping_N = ramping_N;
    
    ramping_count = [sum(ramping_N.class==1) sum(ramping_N.class==-1) sum(ramping_N.class==0)];
    ramping_fraction = ramping_count / sum(ramping_count);
    ramping_fraction_all = [ramping_fraction_all; ramping_fraction];
    
end

figure; set(gcf,'color','w'); title('Ramping summary');
hb = bar(ramping_fraction_all, 'stacked');
hb(1).FaceColor = [255,140,186]/255; hb(2).FaceColor = [127,213,255]/255; hb(3).FaceColor = 'w';
%labels = {'Ramping up','Ramping down','Ramping n.s.'}; lgd = legend(labels);
ylabel('Fraction of neurons'); ylim([0,1.05]);
set(gca, 'XTickLabel', list_pop);
uniformFigureProps();
% h = findobj('Type','figure'); h.Position = [100 100 700 420]; save_fig_MHb(h, 'panel_ramping_summary');

% Note that the ramping fraction may vary depending on the linear fitting window
%{
for idx_pop = 1:numel(list_pop)
    rate_B_mean = nanmean(population{idx_pop}.rate_BxN(31:end,:), 2);
    ramping_N = fit_ramping_MHb(rate_B_mean);
    disp(ramping_N.class);
end


figure; set(gcf,'color','w');
imagesc(rate_Bxt(500-num_last_trials+20:end,200:end)); colormap inferno;

%xlim([-70,0]); ylim([-0.25,+0.25])
%caxis([-0.5,1.0])
%}

%% Peak-sorted activity across regions (set cond==ones)

% Prerequisite: concat cohorts MHb and septum

% cue alignment and task-modulation tests
tic; [delta_rate_rw_Nxt, delta_rate_nr_Nxt, delta_rate_ms_Nxt, p_Nx8] = align_cue_modulation_MHb(cohort, list_sess, list_unit, 1); toc;  % do zscoring

% Benjamini-Hochberg FDR correction
adj_p_thres = 0.01;
[h_Nx12, ~, ~, adj_p_Nx12] = fdr_bh(p_Nx8,adj_p_thres,'pdep','no');
h_Nx1 = (sum(h_Nx12,2)~=0); % sum(h_Nx1)

% filter by task-mudulatedness
delta_rate_rw = delta_rate_rw_Nxt(h_Nx1,:);
delta_rate_nr = delta_rate_nr_Nxt(h_Nx1,:);
delta_rate_ms = delta_rate_ms_Nxt(h_Nx1,:);
unit_group = cohort_flat.group(h_Nx1);

% smoothing (and then cut out initial segments)
g_std = 20;
delta_rate_rw = smooth_half_gaussian(delta_rate_rw, g_std);
delta_rate_nr = smooth_half_gaussian(delta_rate_nr, g_std);
delta_rate_ms = smooth_half_gaussian(delta_rate_ms, g_std);
delta_rate_rw = delta_rate_rw(:,201:end);
delta_rate_nr = delta_rate_nr(:,201:end);
delta_rate_ms = delta_rate_ms(:,201:end);

% save for later
%{
group = {};
for idx_unit = 1:numel(unit_group)
    group{idx_unit} = region_idx2acr(unit_group(idx_unit));
end
save('MHb_activity_summary.mat', 'delta_rate_rw', 'delta_rate_nr', 'delta_rate_ms', 'group', 'groups_of_interest');
%}
% load('MHb_activity_summary.mat');

% first, generate region-group breakdowns
sort_group = zeros(size(delta_rate_rw,1),1);
for idx_group = 1:numel(groups_of_interest)
    sort_group(unit_group==region_acr2idx(groups_of_interest{idx_group})) = idx_group;
end
%sum(sort_group==0)

% group sizes for region boundaries in the plots
size_group = [];
for idx_group = 1:max(sort_group)
    size_group = [size_group; sum(sort_group==idx_group)];
end
size_group_cumsum = cumsum(size_group);

% then, peak-sort within each region (using rewarded trials)
sort_order = {};
for idx_group = 1:max(sort_group)
    [~, psort] = peak_sort(delta_rate_rw(sort_group==idx_group, :));
    sort_order{idx_group} = psort;
end

% construct visualization
delta_rate_rw_vis = delta_rate_rw(sort_group==1,:); delta_rate_rw_vis = delta_rate_rw_vis(sort_order{1},:);
delta_rate_nr_vis = delta_rate_nr(sort_group==1,:); delta_rate_nr_vis = delta_rate_nr_vis(sort_order{1},:);
delta_rate_ms_vis = delta_rate_nr(sort_group==1,:); delta_rate_ms_vis = delta_rate_ms_vis(sort_order{1},:);
for idx_group = 2:max(sort_group)
    delta_rate_rw_new = delta_rate_rw(sort_group==idx_group,:); delta_rate_rw_new = delta_rate_rw_new(sort_order{idx_group},:);
    delta_rate_rw_vis = cat(1, delta_rate_rw_vis, delta_rate_rw_new);
    delta_rate_nr_new = delta_rate_nr(sort_group==idx_group,:); delta_rate_nr_new = delta_rate_nr_new(sort_order{idx_group},:);
    delta_rate_nr_vis = cat(1, delta_rate_nr_vis, delta_rate_nr_new);
    delta_rate_ms_new = delta_rate_ms(sort_group==idx_group,:); delta_rate_ms_new = delta_rate_ms_new(sort_order{idx_group},:);
    delta_rate_ms_vis = cat(1, delta_rate_ms_vis, delta_rate_ms_new);
end

% plot activity summary

clim = [-2,2];
figure('units','normalized','outerposition',[0 0 1 1]); set(gcf,'color','w');

subplot(131);
imagesc(delta_rate_rw_vis); colormap(redblue); caxis(clim); title('Rewarded');
hcb=colorbar; title(hcb,'Z-score');
for idx_group = 1:(max(sort_group)-1)
    yline(size_group_cumsum(idx_group), '-k', 'LineWidth', 1);
end
xlabel('Time from cue (s)'); xline(201,'--k'); %xline(401,'--k');
xt = 1:100:900+1; xtlbl = -2:1:7;
set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
yt = ([0; size_group_cumsum(1:end-1)] + size_group_cumsum)/2;
ytlbl = groups_of_interest;
set(gca, 'YTick', yt, 'YTickLabel', ytlbl);
uniformFigureProps();

subplot(132);
imagesc(delta_rate_nr_vis); colormap(redblue); caxis(clim); title('Unrewarded');
hcb=colorbar; title(hcb,'Z-score');
for idx_group = 1:(max(sort_group)-1)
    yline(size_group_cumsum(idx_group), '-k', 'LineWidth', 1);
end
xlabel('Time from cue (s)'); xline(201,'--k'); %xline(401,'--k');
xt = 1:100:900+1; xtlbl = -2:1:7;
set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
yt = [1,size(delta_rate_rw_vis,1)];
set(gca, 'YTick', yt, 'YTickLabel', yt);
ylabel('Neurons');
uniformFigureProps();

subplot(133);
imagesc(delta_rate_ms_vis); colormap(redblue); caxis(clim); title('Miss');
hcb=colorbar; title(hcb,'Z-score');
for idx_group = 1:(max(sort_group)-1)
    yline(size_group_cumsum(idx_group), '-k', 'LineWidth', 1);
end
xlabel('Time from cue (s)'); xline(201,'--k'); %xline(401,'--k');
xt = 1:100:900+1; xtlbl = -2:1:7;
set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
yt = [1,size(delta_rate_rw_vis,1)];
set(gca, 'YTick', yt, 'YTickLabel', yt);
ylabel('Neurons');
uniformFigureProps();

% h = findobj('Type','figure'); h.Position = [100 100 600 510]; save_fig_MHb(h, 'panel_optotagging');


%% Task modulation

task_modulation = [];
for idx_group = 1:numel(groups_of_interest)
    h_group = h_Nx1(cohort_flat.group == region_acr2idx(groups_of_interest{idx_group}));
    task_modulation = [task_modulation; sum(h_group)/numel(h_group)];
end
% MHb/LHb-Tac1
h_group = h_Nx1(logical((cohort_flat.group == region_acr2idx(groups_of_interest{1})) .* optotagged'));
task_modulation(end+1) = sum(h_group)/numel(h_group);
h_group = h_Nx1(logical((cohort_flat.group == region_acr2idx(groups_of_interest{2})) .* optotagged'));
task_modulation(end+1) = sum(h_group)/numel(h_group);
groups_of_interest_opto = groups_of_interest; 
groups_of_interest_opto{end+1} = 'MHb^{Tac1}';
groups_of_interest_opto{end+1} = 'LHb^{Tac1}';

figure('Position', [500 500 1200 200]); set(gcf,'color','w');
b = bar(task_modulation); b.FaceColor = 'flat';
for idx_group = 1:numel(groups_of_interest)
    b.CData(idx_group,:) = cmap_allen_ccf(groups_of_interest{idx_group});
end
b.CData(idx_group+1,:) = [0.2 0.2 0.2]; b.CData(idx_group+2,:) = [0.2 0.2 0.2];
xt = 1:numel(groups_of_interest_opto); xtlbl = groups_of_interest_opto; set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
ylabel('Fraction task-modulated'); ylim([0 1]); yline(sum(h_Nx1)/numel(h_Nx1), '--k', 'LineWidth', 1);
uniformFigureProps();
% h = findobj('Type','figure'); h.Position = [100 100 1317 280]; save_fig_MHb(h, 'panel_task_modulation');

% average activity cluster - fraction quantification - clustering can be updated


%% optotagging example raster

unitNum = 15;
idx_sess = list_sess(unitNum); idx_unit = list_unit(unitNum); ID_unit = list_ID(unitNum);
spikeTimes = cohort{idx_sess}.spike_su{idx_unit};

figure,

subplot(311);
idxTrial = ((cohort{idx_sess}.trial_width==0.002).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.4,'LineWidth',0.4);
end
title('Pulse width = 2 ms'); xlabel(''); ylim([-1,11]);
uniformFigureProps();

subplot(312);
idxTrial = ((cohort{idx_sess}.trial_width==0.005).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.4,'LineWidth',0.4);
end
title('Pulse width = 5 ms'); xlabel(''); ylim([-1,11]);
uniformFigureProps();

subplot(313);
idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.4,'LineWidth',0.4);
end
title('Pulse width = 10 ms'); xlabel('Time from pulse train onset (s)'); ylim([-1,11]);
uniformFigureProps();

% h = findobj('Type','figure'); h.Position = [100 100 600 510]; save_fig_MHb(h, 'panel_optotagging');


%% Firing rate plot (export for seabon)

fr = cohort_flat.fr; 
group = {};
for idx_unit = 1:numel(cohort_flat.group)
    group{idx_unit} = region_idx2acr(cohort_flat.group(idx_unit));
end
% save('MHb_stats.mat', 'fr', 'group', 'groups_of_interest', 'optotagged');
% figure, UnivarScatter(cohort_flat.fr)


%% PSTH: rewarded/unrewarded/stim (cohort type 1 and 3)

trialType = 2;
do_zscore = 0; countParam = [-4, 7, 0.010 1]; bsln_time = [-2, 0]; nboot = 100; g_std = 20;

dFR_nbootxt = PSTH2_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam, bsln_time, nboot);
bsln_idx = window_time2idx(bsln_time, countParam);
analysis_idx = window_time2idx(bsln_time+countParam(2), countParam);

[dFR_mean, dFR_sem] = smooth_PSTH_MHb(dFR_nbootxt, g_std, bsln_idx);
% PSTH visualization
figure;
tAxisPSTH = bsln_time(1):countParam(3):countParam(2);
shadedErrorBar(tAxisPSTH, dFR_mean, dFR_sem, {'Color', [0.5 0 0]}, 0.8);
xlabel('Time from cue/stim (s)'); xline(0,'--'); xlim([tAxisPSTH(1),tAxisPSTH(end)]);
yline(0,'--'); ylim([-3 12]); %ylim([-0.25 0.25]); 
if do_zscore
    ylabel('delta(firing rate) (z-score)');
else
    ylabel('delta(firing rate) (spikes/s)'); 
end
uniformFigureProps();

p = sum(mean(dFR_nbootxt(:,analysis_idx(1):analysis_idx(2)),2) < 0) / nboot;
disp(p);

% figure, hist(mean(dFR_nbootxt(:,analysis_idx(1):analysis_idx(2)),2),20)
% rate_S_bxtxN = align_MHb(cohort, list_sess, list_unit, trialType, do_zscore, countParam);

% dFR_rw = dFR_nbootxt; save('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_rw_un.mat', 'dFR_rw', 'do_zscore', 'countParam', 'bsln_time', 'bsln_idx', 'analysis_idx', '-v7.3');
% dFR_nr = dFR_nbootxt; save('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_nr_un.mat', 'dFR_nr', 'do_zscore', 'countParam', 'bsln_time', 'bsln_idx', 'analysis_idx', '-v7.3');
% dFR_stim = dFR_nbootxt; save('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_stim_un.mat', 'dFR_stim', 'do_zscore', 'countParam', 'bsln_time', 'bsln_idx', 'analysis_idx', '-v7.3');


%% PSTH summary and stats

load('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_rw.mat');
load('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_nr.mat');
load('C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\PSTH_stim.mat');

% smoothing
g_std = 20;  % 200 ms std, causal half-gaussian smoothing after 10 ms binning
[dFR_rw_mean, dFR_rw_sem] = smooth_PSTH_MHb(dFR_rw, g_std, bsln_idx);
[dFR_nr_mean, dFR_nr_sem] = smooth_PSTH_MHb(dFR_nr, g_std, bsln_idx);
[dFR_stim_mean, dFR_stim_sem] = smooth_PSTH_MHb(dFR_stim, g_std, bsln_idx);

% PSTH visualization
figure;
tAxisPSTH = bsln_time(1):countParam(3):countParam(2);
%shadedErrorBar(tAxisPSTH, dFR_rw_mean, dFR_rw_sem, {'Color', [0 0.5 0]}, 0.8); hold on;
%shadedErrorBar(tAxisPSTH, dFR_nr_mean, dFR_nr_sem, {'Color', [0.2 0.2 0.2]}, 0.8);
shadedErrorBar(tAxisPSTH, dFR_stim_mean, dFR_stim_sem, {'Color', [0.5 0 0]}, 0.8); hold off;
xlabel('Time from cue/stim (s)'); xline(0,'--'); xline(5,'--'); xlim([tAxisPSTH(1),tAxisPSTH(end)]);
yline(0,'--'); ylim([-1 4]); ylim([-0.1 0.2]); 
if do_zscore
    ylabel('delta(firing rate) (z-score)');
else
    ylabel('delta(firing rate) (spikes/s)'); 
end
uniformFigureProps();
% h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_within_trial_dynamics');
% h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_within_trial_dynamics_rewarded');
% h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_within_trial_dynamics_unrewarded');
% h = findobj('Type','figure'); h.Position = [100 100 560 420]; save_fig_MHb(h, 'panel_within_trial_dynamics_perturbation');

% stats
test_dFR_rw = mean(dFR_rw(:,analysis_idx(1):analysis_idx(2)),2);
p_rw = sum(test_dFR_rw < 0) / numel(test_dFR_rw);
test_dFR_nr = mean(dFR_nr(:,analysis_idx(1):analysis_idx(2)),2);
p_nr = sum(test_dFR_nr < 0) / numel(test_dFR_nr);
test_dFR_stim = mean(dFR_stim(:,analysis_idx(1):analysis_idx(2)),2);
p_stim = sum(test_dFR_stim < 0) / numel(test_dFR_stim);
disp([p_rw; p_nr; p_stim]);

figure;
errorbar(1:3,[mean(test_dFR_rw) mean(test_dFR_nr) mean(test_dFR_stim)], [std(test_dFR_rw) std(test_dFR_nr) std(test_dFR_stim)], 'o');
yline(0,'--'); xlim([0.5 3.5]);
xt = 1:3; xtlbl = {'Rewarded', 'Unrewarded', 'Perturbation'}; set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
if do_zscore
    ylabel('delta(firing rate) (z-score)');
else
    ylabel('delta(firing rate) (spikes/s)'); 
end
uniformFigureProps();
% h = findobj('Type','figure'); h.Position = [100 100 560 320]; save_fig_MHb(h, 'panel_within_trial_dynamics_summary');


%% effect of stim

do_zscore = 1; countParam = [-4, 7, 0.010 1]; bsln_time = [-2, 0]; nboot = 100;
perturbation_analysis_MHb(cohort, list_sess, list_unit, do_zscore, countParam, bsln_time, nboot);
% h = findobj('Type','figure'); h.Position = [100 100 610 350]; save_fig_MHb(h, 'panel_perturbation_halfhalf');


%% time constants of stim
% : signed rank test with 0.5 s time bins

tbin_size = 0.5; countParam = [-4, 7, 0.010 1]; bsln_time = [-2, 0];
[tau_N, class_on, class_off] = stim_tau_MHb(cohort, list_sess, list_unit, countParam, bsln_time, tbin_size);

%figure; histogram(tau_N, 0.001:0.5:5.001, 'Normalization', 'probability', 'FaceColor', 'k', 'FaceAlpha', 0.2); 
%xlim([0,5.5]); ylim([0,0.8]); xlabel('Time to baseline recovery (s)'); ylabel('Fraction of neurons'); uniformFigureProps();
% h = findobj('Type','figure'); save_fig_MHb(h, 'panel_recovery_MHb');

%save('tau_off_MHb.mat', 'tau_N');
%save('tau_off_MHb_Tac1.mat', 'tau_N');

load('tau_off_MHb.mat'); tau_MHb = tau_N;
load('tau_off_MHb_Tac1.mat'); tau_MHb_Tac1 = tau_N;
figure; cdfplot(tau_MHb); hold on; cdfplot(tau_MHb_Tac1); hold off;
xlim([0,5.5]); xline(0.5,'--'); xlabel('Time to baseline recovery (s)'); ylabel('Cumulative fraction of neurons'); 
title(''); grid off; uniformFigureProps();
% h = findobj('Type','figure'); save_fig_MHb(h, 'panel_recovery_cumulative');


%% NWB conversion

% experiment type selection
load('D:\Dropbox\Ephys\MHb_data\cohort_Tac1.mat'); exp_desc = 'mouse performing a reward-seeking task; Neuropixels 2.0 recording targeted to the medial habenula; transcranial optotagging of Tac1 neurons';
%load('D:\Dropbox\Ephys\MHb_data\cohort_septum.mat'); exp_desc = 'mouse performing a reward-seeking task; Neuropixels 2.0 recording targeted to the septum';
%load('D:\Dropbox\Ephys\MHb_data\cohort_perturbation'); exp_desc = 'mouse performing a reward-seeking task; Neuropixels 2.0 recording targeted to the medial habenula; transcranial transient perturbation and optotagging of Tac1 neurons';

for idx_sess = 1:numel(cohort)

    session = cohort{idx_sess};

    nwb = NwbFile( ...
        'session_description', ' ', ...
        'identifier', session.info, ...
        'session_start_time', datetime(str2double(session.info(end-7:end-4)), str2double(session.info(end-3:end-2)), str2double(session.info(end-1:end))), ...
        'general_experimenter', 'Jo, YoungJu', ...
        'general_lab', 'Deisseroth', ...
        'general_institution', 'Stanford University', ...
        'general_related_publications', 'doi: 10.1016/j.cell.2022.08.019', ...
        'general_keywords', {'electrophysiology', 'habenula'}, ...
        'general_experiment_description', exp_desc);
    
    
    % subject
    if str2double(session.info(1:3)) == 170
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0170', ...
            'date_of_birth', datetime(2020,10,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 171
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0171', ...
            'date_of_birth', datetime(2020,10,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 172
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0172', ...
            'date_of_birth', datetime(2020,10,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 173
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0173', ...
            'date_of_birth', datetime(2020,10,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 174
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0174', ...
            'date_of_birth', datetime(2020,10,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 176
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0176', ...
            'date_of_birth', datetime(2021,3,19), ...
            'sex', 'F', ...
            'genotype', 'TH-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 178
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0178', ...
            'date_of_birth', datetime(2021,5,31), ...
            'sex', 'M', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 179
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0179', ...
            'date_of_birth', datetime(2021,5,31), ...
            'sex', 'M', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 180
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0180', ...
            'date_of_birth', datetime(2021,5,31), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 181
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0181', ...
            'date_of_birth', datetime(2021,5,31), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 188
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0188', ...
            'date_of_birth', datetime(2021,7,1), ...
            'sex', 'F', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    elseif str2double(session.info(1:3)) == 190
        subject = types.core.Subject( ...
            'subject_id', 'ANM_0190', ...
            'date_of_birth', datetime(2021,8,9), ...
            'sex', 'M', ...
            'genotype', 'Tac1-Cre', ...
            'species', 'Mus musculus', ...
            'description', 'mouse');
    end
    nwb.general_subject = subject;
    
    
    % ecephys: probes and channels
    
    variables = {'x', 'y', 'z', 'location', 'group', 'group_name'};
    tbl = cell2table(cell(0, length(variables)), 'VariableNames', variables);
    
    idx_probe = 0; % for Probe 0 -- should tweak for multi-probe sessions (stitched tbl, etc.)
    device = types.core.Device('description', 'Neuropixels 2.0 4-shank', 'manufacturer', 'IMEC');
    nwb.general_devices.set(strcat('Probe', num2str(idx_probe)), device);
    electrode_group = types.core.ElectrodeGroup( ...
        'description', ['electrode group for Probe' num2str(idx_probe)], ...
        'location', ['location of Probe' num2str(idx_probe)], ...
        'device', types.untyped.SoftLink(device));
    nwb.general_extracellular_ephys.set(['Probe' num2str(idx_probe)], electrode_group);
    group_object_view = types.untyped.ObjectView(electrode_group);
    for ielec = 1:size(session.channel_coord,1)
        tbl = [tbl; {session.channel_coord(ielec,2), session.channel_coord(ielec,3), session.channel_coord(ielec,1), ...
                     region_idx2acr(session.channel_region(ielec)), group_object_view, num2str(idx_probe)}];
        % *** validate this again
        % nwb format: +x = posterior, +y = inferior, +z = subject's right) % atlas volumes: AP/DV/ML
        % registered coordinates: ML/AP/DV
    end
    % consider adding relative channel positions somewhere: session.channel_positions(:,1), session.channel_positions(:,2)
    
    electrode_table = util.table2nwb(tbl, 'all probes');
    nwb.general_extracellular_ephys_electrodes = electrode_table;
    
    
    % ecephys: units
    
    spikes = session.spike_su;
    for idx_unit = 1:numel(spikes)
        spikes{idx_unit} = spikes{idx_unit}';
    end
    [spike_times_vector, spike_times_index] = util.create_indexed_column(spikes);
    spike_times_vector.description = 'spike times';
    
    nwb.units = types.core.Units( ...
        'colnames', {'spike_times', 'probe_index', 'unit_index', 'channel_index', 'region', 'x', 'y', 'z', 'avg_firing_rate', 'isi_violation', 'salt_p', 'salt_I', 'spike_probability'}, ... 
        'description', 'units table', ...
        'id', types.hdmf_common.ElementIdentifiers('data', int64(0:length(spikes)-1)), ...
        'spike_times_index', spike_times_index, ...
        'spike_times', spike_times_vector, ...
        'probe_index', types.hdmf_common.VectorData('data', zeros(size(session.list_su)), 'description', 'equivalent to "group" in electrode specification'), ...  % should tweak for multi-probe sessions
        'unit_index', types.hdmf_common.VectorData('data', int64(session.list_su), 'description', 'Kilosort/Phy unit index (within each probe)'), ...
        'channel_index', types.hdmf_common.VectorData('data', session.sites_su, 'description', 'electrode channel closest to the unit'), ...
        'region', types.hdmf_common.VectorData('data', session.unit_region, 'description', 'brain region specified in "id" column of structure_tree_safe_2017.csv'), ...
        'x', types.hdmf_common.VectorData('data', session.unit_coord(:,2), 'description', '+x = posterior'), ...
        'y', types.hdmf_common.VectorData('data', session.unit_coord(:,3), 'description', '+y = inferior'), ...
        'z', types.hdmf_common.VectorData('data', session.unit_coord(:,1), 'description', '+z = subjects right'), ...
        'avg_firing_rate', types.hdmf_common.VectorData('data', session.metrics{:,'firing_rate'}, 'description', 'QC metric'), ...
        'isi_violation', types.hdmf_common.VectorData('data', session.metrics{:,'isi_viol'}, 'description', 'QC metric'), ...
        'salt_p', types.hdmf_common.VectorData('data', session.salt_p, 'description', 'optotagging metric'), ...
        'salt_I', types.hdmf_common.VectorData('data', session.salt_I, 'description', 'optotagging metric'), ...
        'spike_probability', types.hdmf_common.VectorData('data', session.spike_probability, 'description', 'optotagging metric'));
    
    
    % behavior: trials
    response_time = session.reactionTime;
    response_time(isnan(response_time)) = 2;  % response_time=2 for no lick trials
    intervals_trials = types.core.TimeIntervals(...
        'colnames', {'start_time', 'stop_time', 'responseTime', 'trial_type'}, ...
        'description', 'trials table', ...
        'id', types.hdmf_common.ElementIdentifiers('data', int64(0:size(session.trialMatrix,1)-1)), ...
        'start_time', types.hdmf_common.VectorData('data', session.TTL_trial,'description', 'Go cue onset timestamps'), ...
        'stop_time', types.hdmf_common.VectorData('data', session.TTL_trial,'description', 'Go cue onset timestamps (duplicate)'), ...
        'responseTime', types.hdmf_common.VectorData('data', response_time, 'description', 'time from Go cue onset to lick (2 for no lick trials)'), ...
        'trial_type', types.hdmf_common.VectorData('data', session.trialMatrix, 'description', '1 = lick-reward, 2 = lick-noreward, 3 = no lick, 0 = perturbation') ...
        );
    nwb.intervals_trials = intervals_trials;
    
    
    % behavior: events
    
    behavioral_events = types.core.BehavioralEvents();
    
    timestamp_lick = types.core.TimeSeries( ...
        'data', ones(size(session.TTL_lick)), ...
        'timestamps', session.TTL_lick, ...
        'description', 'lick timestamps', ...
        'data_unit', 'event');
    behavioral_events.timeseries.set('timestamp_lick', timestamp_lick);
    
    timestamp_reward = types.core.TimeSeries( ...
        'data', ones(size(session.TTL_reward)), ...
        'timestamps', session.TTL_reward, ...
        'description', 'reward timestamps', ...
        'data_unit', 'event');
    behavioral_events.timeseries.set('timestamp_reward', timestamp_reward);
    
    behavior_processing_module = types.core.ProcessingModule('description', 'stores behavioral events');
    behavior_processing_module.nwbdatainterface.set('BehavioralEvents', behavioral_events);
    nwb.processing.set('behavior', behavior_processing_module);
    
    
    % optogenetics
    if isfield(session, 'TTL_stim') && (~isempty(session.TTL_stim))
        device_opto = types.core.Device('description', 'OBIS', 'manufacturer', 'Coherent');
        nwb.general_devices.set('StimLaser', device_opto);
        
        ogen_stim_site = types.core.OptogeneticStimulusSite( ...
            'description', 'transcranial excitation', ...
            'location', 'transcranial', ... 
            'excitation_lambda', 637, ...
            'device', types.untyped.SoftLink(device_opto));
        nwb.general_optogenetics.set('OptogeneticStimulusSite', ogen_stim_site);
        
        ogen_series = types.core.OptogeneticSeries( ...
            'data', randn(1, 1), ...
            'site', types.untyped.SoftLink(ogen_stim_site), ...
            'starting_time', 0.0, ...
            'starting_time_rate', 0.0, ...  % Hz
            'description', 'dummy -- data in intervals below');
        nwb.stimulus_presentation.set('OptogeneticSeries', ogen_series);
        
        if isfield(session, 'trial_power')
            intervals_stimblock = types.core.TimeIntervals(...
                'colnames', {'start_time', 'stop_time', 'power', 'width', 'freq', 'num_pulse'}, ...
                'description', '1-second stim blocks for optotagging', ...
                'id', types.hdmf_common.ElementIdentifiers('data', int64(0:size(session.TTL_stimblock,1)-1)), ...
                'start_time', types.hdmf_common.VectorData('data', session.TTL_stimblock, 'description', 'stim block onset'), ...
                'stop_time', types.hdmf_common.VectorData('data', session.TTL_stimblock + 1, 'description', 'stim block offset'), ...
                'power', types.hdmf_common.VectorData('data', session.trial_power, 'description', 'unit: analog voltage input'), ...
                'width', types.hdmf_common.VectorData('data', session.trial_width, 'description', 'width in seconds'), ...
                'freq', types.hdmf_common.VectorData('data', session.trial_freq, 'description', 'frequency in Hz'), ...
                'num_pulse', types.hdmf_common.VectorData('data', session.len_pulse, 'description', 'number of pulses within each stim block'));
            nwb.intervals.set('stimblock', intervals_stimblock);
        
            intervals_stim = types.core.TimeIntervals(...
                'colnames', {'start_time', 'stop_time', 'power', 'width', 'freq'}, ...
                'description', 'individual stim pulses', ...
                'id', types.hdmf_common.ElementIdentifiers('data', int64(0:size(session.TTL_stim,1)-1)), ...
                'start_time', types.hdmf_common.VectorData('data', session.TTL_stim, 'description', 'pulse onset'), ...
                'stop_time', types.hdmf_common.VectorData('data', session.TTL_stim + session.pulse_width, 'description', 'pulse offset'), ...
                'power', types.hdmf_common.VectorData('data', session.pulse_power, 'description', 'unit: analog voltage input'), ...
                'width', types.hdmf_common.VectorData('data', session.pulse_width, 'description', 'width in seconds'), ...
                'freq', types.hdmf_common.VectorData('data', session.pulse_freq, 'description', 'frequency in Hz'));
            nwb.intervals.set('stim', intervals_stim);
        end
    end
    
    
    % export
    nwbExport(nwb, ['D:\Dropbox\Ephys\MHb_data\nwb\' session.info '.nwb']);

end


% delete('nwb_mhb_test.nwb');  % delete first instead of overwriting

%{
fname = ['D:\Dropbox\Ephys\MHb_data\nwb\' session.info '.nwb'];
nwb = nwbRead(fname, 'ignorecache');

nwb.processing.get('behavior').nwbdatainterface.get('BehavioralEvents').timeseries.get('timestamp_reward').timestamps.load()

unit_ids = nwb.units.id.data.load(); % array of unit ids represented within this
unit_regions = containers.Map('KeyType',class(unit_ids),'ValueType','any');
unit_times = containers.Map('KeyType',class(unit_ids),'ValueType','any');

last_idx = 0;
for i = 1:length(unit_ids)
    unit_id = unit_ids(i);
    % ??
    row = nwb.units.getRow(unit_id, 'useId', true, 'columns', {'spike_times', 'region'});
    unit_trials(unit_id) = row.trials{1};
    unit_times(unit_id) = row.spike_times{1};
end

nwb.units.getRow(1)
%}

%% for later

% export for data-driven modeling
%{
rate_BxtxN = rate_BxtxN(500-numel(cohort{3}.trialMatrix)+1:end, 200:end,:);
size(rate_BxtxN)
trialMatrix = cohort{3}.trialMatrix;

save('MHb_perturbation_sess3_test.mat', 'rate_BxtxN', 'trialMatrix');

% DataHigh
idx_sess = 3;
TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
spike_bxtxn = bin_spikes(TTL_trial, [-2 4 0.001 1], cohort{idx_sess}.spike_su(list_unit(list_sess == idx_sess)));
for idxTrial = 1:size(spike_bxtxn,1)
    D(idxTrial).data = squeeze(spike_bxtxn(idxTrial,:,:))';
    D(idxTrial).condition = num2str(trialMatrix(idxTrial));
    D(idxTrial).epochstarts = 2001;
end
save('MHb_DataHigh_test.mat', 'D');
%}

% autocorrelation
%{
[ac,xbin] = acf(cohort{1}.spike_su{10}, 0.010, 0.3);
figure, plot(xbin, ac, '.');

[K, Qi, Q00, Q01, Ri] = ccg(cohort{1}.spike_su{10}, cohort{1}.spike_su{10}, 100, 0.010);
K_ = K; K_(501) = 0;
%}

% angles
%{
do_zscore = 1;

% event-aligned rates
delta_rate_rw = align_cue_MHb(cohort, list_sess, list_unit, 1, do_zscore);
vector_rw = mean(delta_rate_rw(:,400:600),2);
delta_rate_stim = align_cue_MHb(cohort, list_sess, list_unit, 0, do_zscore);
%delta_rate_stim = align_cue_MHb(cohort, list_sess, list_unit, -2, do_zscore);
vector_stim = mean(delta_rate_stim(:,400:450),2);

ndangle(vector_stim, vector_rw)

% cohort type 1
% 4: 5 / 104.2518 / 26.2473
% 5: 6 / 62.9411 / 26.6832
% cohort type 3
% 3: 11 / 53.6433 / 18.9334
% 4: 12 / 91.4294 / 16.2466


rv_dim = size(vector_stim,1);
nsample = 1000;

ndangles = nan(nsample,1);
for idx = 1:nsample
    rv1 = randn(rv_dim,1);
    rv2 = randn(rv_dim,1);
    ndangles(idx) = ndangle(rv1,rv2);
end
%mean(ndangles)
std(ndangles)

% focus on the relation between rv_dim and std(ndangles)
%}

% Optotagging plots
%{
idx_sess = 2;
idx = 10; idx_sess = cohort_flat.sess(optotagged); idx_sess = idx_sess(idx);

thres_salt_I = 0.2; thres_wf_corr = 0.6;
cohort{idx_sess}.resp_unit_idx = find((cohort{idx_sess}.salt_I > thres_salt_I) .* (cohort{idx_sess}.wf_corr > thres_wf_corr));

% PLOT 1

figure; set(gcf,'color','w');
scatter(cohort{idx_sess}.salt_I, cohort{idx_sess}.wf_corr);
xlabel('"Distance" of stimulus-associated latency distribution'); ylabel('Waveform correlation (behavior vs tagging)')
xline(thres_salt_I, '--'); yline(thres_wf_corr, '--');

% PLOT 2

resp_unit_positions = cohort{idx_sess}.channel_positions(cohort{idx_sess}.sites_su(cohort{idx_sess}.resp_unit_idx)+1,:);
all_unit_positions = cohort{idx_sess}.channel_positions(cohort{idx_sess}.sites_su+1,:);
all_unit_positions = all_unit_positions + 5*randn(size(all_unit_positions));
figure; set(gcf,'color','w');
plot(s.channel_positions(:,1),s.channel_positions(:,2),'.k'); hold on;
plot(all_unit_positions(:,1), all_unit_positions(:,2), '.b', 'MarkerSize', 20); hold on;
plot(resp_unit_positions(:,1),resp_unit_positions(:,2),'*r', 'MarkerSize', 30); hold off;
xlabel('X coordinate (um)'); ylabel('Y coordinate (um)');
xlim([-100 900]); ylim([-100 800]);

% PLOT 3

figure, 

tmp = find(cohort_flat.region(optotagged) == 483);

idx = tmp(43);
idx_sess = cohort_flat.sess(idx);

idx_unit = find(cohort{idx_sess}.list_su==cohort_unit_id(tagged_unit(idx)));
%idx_unit = cohort{idx_sess}.resp_unit_idx(1);
% idx_unit = 94;

subplot(311);
idxTrial = ((cohort{idx_sess}.trial_width==0.002).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 2 ms'); xlabel('');

subplot(312);
idxTrial = ((cohort{idx_sess}.trial_width==0.005).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 5 ms'); xlabel('');

subplot(313);
idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 10 ms'); xlabel('Time from stim sequence onset');

%
idxTrial = ((trial_width==0.010).*(trial_freq==10).*(trial_power==5))==1;
plot_raster(s.TTL_stimblock(idxTrial), [-0.5 1.5 0.001 5], s.spike_su, s.list_su);%, s.list_su);%, s.isPyr);

figure, hist(cohort_flat.salt_p); set(gca,'xscale','log');

figure, plot(cohort_flat.salt_I, cohort_flat.salt_p, '.')
%}

% integration -- re-do this with some population technique (across sessions)
%{
% [h,p] = ttest(diff_rate_rw,0,'Tail','right')

idx_sess = 12; 
do_zscore = 1;

TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
list_unit_sess = list_unit(list_sess == idx_sess);

mid_trial = round(numel(TTL_trial)/2); 
%TTL_trial = TTL_trial(1:mid_trial); trialMatrix = trialMatrix(1:mid_trial);  % last half trials only
%TTL_trial = TTL_trial(mid_trial:end); trialMatrix = trialMatrix(mid_trial:end);  % last half trials only
        
TTL_of_interest = TTL_trial;

spike_bxtxn = bin_spikes(TTL_of_interest, [-4 6 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));

if do_zscore == 1
    unit_mean = cohort{idx_sess}.unit_mean(list_unit_sess);
    unit_std = cohort{idx_sess}.unit_std(list_unit_sess);
    rate_bxtxn = (spike_bxtxn - permute(unit_mean, [1,3,2])) ./ permute(unit_std, [1,3,2]);  % z-score
else
    rate_bxtxn = spike_bxtxn / 0.01;  % spikes per sec
end

%size(rate_bxtxn)
%sum(trialMatrix==2)

%figure, plot(trialMatrix, '.')

%rate_b = mean(rate_bxtxn(:,201:400,:), [2,3]);
rate_b = mean(rate_bxtxn(:,601:800,:), [2,3]) - mean(rate_bxtxn(:,201:400,:), [2,3]);

trialType = 1;
idx_trial = find(trialMatrix==trialType);
diff_rate_rw = rate_b(idx_trial);
%if max(idx_trial) == numel(trialMatrix)
%    idx_trial = idx_trial(1:end-1);
%end
%diff_rate_rw = rate_b(idx_trial+1) - rate_b(idx_trial);

trialType = 2;
idx_trial = find(trialMatrix==trialType);
diff_rate_nr = rate_b(idx_trial);
%if max(idx_trial) == numel(trialMatrix)
%    idx_trial = idx_trial(1:end-1);
%end
%diff_rate_nr = rate_b(idx_trial+1) - rate_b(idx_trial);

[p,~,stats] = ranksum(diff_rate_rw, diff_rate_nr, 'tail', 'right');
[h, p] = ttest2(diff_rate_rw,diff_rate_nr);

figure, hist(diff_rate_rw);
figure, hist(diff_rate_nr);

% mean(diff_rate_rw)
% mean(diff_rate_nr)
% sqrt((std(diff_rate_rw)^2+std(diff_rate_nr)^2)/2)

% mean(diff_rate_rw) - std(diff_rate_rw)/sqrt(numel(diff_rate_rw))
% mean(diff_rate_nr) + std(diff_rate_nr)/sqrt(numel(diff_rate_nr))

sum(diff_rate_rw) + sum(diff_rate_nr)


do_zscore = 1;
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, -1, do_zscore, 1);  % trialType, do_zscore, do_smoothing

figure, plot(squeeze(mean(rate_BxtxN(:,201:400,:), [2,3])))



TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
        list_unit_sess = list_unit(list_sess == idx_sess);
        
        spike_bxtxn = bin_spikes(TTL_of_interest, [-4 6 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));
%}

% waveform features / feature-based unit visualization
%{

% waveform
idx_sess = 18; idx_unit = 30;

wf_sess = cohort{idx_sess}.wf(:,:,1:60); wf_sess_stim = cohort{idx_sess}.wf_stim(:,:,1:60);
wf_sess(:,385,:) = []; wf_sess_stim(:,385,:) = [];
load('C:\Users\YoungJu Jo\Dropbox\Ephys\YJ_ephys_npx\hStripe0.mat');
wf_sess(:,connected==0,:) = []; wf_sess_stim(:,connected==0,:) = [];
%if idx_sess == 4  % hardcoded: 171_0926 has channel 112 (matlab indexing) disabled due to noise level
%    wf_sess(:,112,:) = []; wf_sess_stim(:,112,:) = [];
%end

% second cohort sessions have weird issue in waveform calculation (baseline not subtracted)
% so don't believe some waveform features e.g., PT ratio for these sessions 
wf_sess_baseline = squeeze(mean(wf_sess, [1,3]))'; wf_sess = permute(permute(wf_sess, [2,1,3]) - wf_sess_baseline, [2,1,3]);
wf_sess_stim_baseline = squeeze(mean(wf_sess_stim, [1,3]))'; wf_sess_stim = permute(permute(wf_sess_stim, [2,1,3]) - wf_sess_stim_baseline, [2,1,3]);

wf_unit = squeeze(wf_sess(idx_unit,:,:))/3; wf_unit_stim = squeeze(wf_sess_stim(idx_unit,:,:))/3;
wf_taxis = (1:60)/3;
channel_positions_sess = cohort{idx_sess}.channel_positions;

wf_vis_x = []; wf_vis_y = []; wf_vis_x_stim = []; wf_vis_y_stim = [];
for cidx = 1:size(wf_unit,1)
    wf_vis_x = [wf_vis_x; wf_taxis+channel_positions_sess(cidx,1)];
    wf_vis_y = [wf_vis_y; wf_unit(cidx,:)+channel_positions_sess(cidx,2)];
    wf_vis_x_stim = [wf_vis_x_stim; wf_taxis+channel_positions_sess(cidx,1)];
    wf_vis_y_stim = [wf_vis_y_stim; wf_unit_stim(cidx,:)+channel_positions_sess(cidx,2)];
end

figure,
%subplot(224)
for cidx = 1:size(wf_unit,1)
    plot(wf_vis_x(cidx,:),wf_vis_y(cidx,:), 'Color', [0 0 0 0.7], 'LineWidth', 2); hold on;
    %plot(wf_vis_x_stim(cidx,:),wf_vis_y_stim(cidx,:), 'Color', [0.8 0 0 0.7], 'LineWidth', 2); hold on;
end
unit_center = channel_positions_sess(cohort{idx_sess}.sites_su(idx_unit),:);
xlim([unit_center(1)-40 unit_center(1)+60]); set(gca,'xtick',[]);
ylim([unit_center(2)-80 unit_center(2)+80]); set(gca,'ytick',[]);
%}

% sorting trials for rasters etc.
%{
TTL_trial_rw = TTL_trial(trialMatrix==1);
[rtRW,idxSortRW] = sort(reactionTime(trialMatrix==1));
TTL_trial_rw = TTL_trial_rw(idxSortRW);

TTL_trial_nr = TTL_trial(trialMatrix==2);
[rtNR,idxSortNR] = sort(reactionTime(trialMatrix==2));
TTL_trial_nr = TTL_trial_nr(idxSortNR);

% binning
TTL_rw = []; TTL_nr = [];
for t = 1:nTrials
    if trialMatrix(t)==1
        TTL_rw = [TTL_rw TTL_trial(t)+reactionTime(t)];
    elseif trialMatrix(t)==2
        TTL_nr = [TTL_nr TTL_trial(t)+reactionTime(t)];      
    end
end

%bin_size = 0.020;
%t_cutoff = TTL_trial_all(end)+10;

lick_min_dur = 0.05;
TTL_lick = s.TTL_lick(1);
for t = 2:numel(s.TTL_lick)
    if s.TTL_lick(t) - TTL_lick(end) > lick_min_dur
        TTL_lick = [TTL_lick s.TTL_lick(t)];
    end
end

s.TTL_trial_all = TTL_trial;
s.TTL_rw = TTL_rw; %unsorted
s.TTL_nr = TTL_nr; %unsorted
s.TTL_trial_rw = TTL_trial_rw;
s.TTL_trial_nr = TTL_trial_nr;
s.rtRW = rtRW;
s.rtNR = rtNR;

s.binned_spike_cue_pre = int32(squeeze(bin_spikes(TTL_trial, [-0.4999 0 0.5 1], s.spike_su)));
s.binned_spike_cue = int32(squeeze(bin_spikes(TTL_trial, [0 0.4999 0.5 1], s.spike_su)));
%s.binned_spike_lick_pre = int32(squeeze(bin_spikes(TTL_lick, [-0.1999 0 1 1], s.spike_su)));
%s.binned_spike_lick_post = int32(squeeze(bin_spikes(TTL_lick, [0 0.1999 1 1], s.spike_su)));
s.binned_spike_rw = int32(squeeze(bin_spikes(TTL_rw, [0 2.9999 3 1], s.spike_su)));
s.binned_spike_nr = int32(squeeze(bin_spikes(TTL_nr, [0 2.9999 3 1], s.spike_su)));
%}

% misc functions from Python
%{

def half_gaussian(g_std):
    # causal half-gaussian filter
    half_gaussian = signal.gaussian(g_std*10, g_std)
    half_gaussian[:round(half_gaussian.shape[0]/2)] = 0
    half_gaussian = half_gaussian / half_gaussian.sum()
    return half_gaussian


def boxcar(b_window):
    # causal boxcar filter
    boxcar = np.ones(b_window*2,)
    boxcar[:b_window] = 0
    boxcar = boxcar / boxcar.sum()
    return boxcar


def length(v):
    return math.sqrt(np.real(np.vdot(v.T, v)))  # Also handles complex numbers


def normalize(v):
    return v / length(v)


def angle(v1, v2):
    return math.acos(np.real(np.dot(normalize(v1).T, normalize(v2)))) * 180/math.pi


def gram_schmidt(A):
    """Orthnormalize a set of vectors stored as the columns of matrix A."""
    # Get the number of vectors.
    n = A.shape[1]
    for j in range(n):
        # To orthogonalize the vector in column j with respect to the
        # previous vectors, subtract from it its projection onto
        # each of the previous vectors.
        for k in range(j):
            A[:, j] -= np.dot(A[:, k], A[:, j]) * A[:, k]
        A[:, j] = A[:, j] / np.linalg.norm(A[:, j])
    return A

def mode_proj(data_matrix, mode_matrix):
    data_proj = np.matmul(data_matrix, mode_matrix)
    return data_proj

batch_mode_proj = vmap(mode_proj, in_axes=(0,None))


def pca_model(data_tensor, dim_component):
    state_all = np.reshape(data_tensor, (-1, data_tensor.shape[2]))
    pca = PCA(n_components=dim_component).fit(state_all)
    return pca
%}

% stim session across trials (discarded)
%{
% add annotations to the optotagging analysis script
% next time, use even lower freq for optotagging (1-2 Hz?) -- pulse train is just for visualization

size(rate_BxtxN)

figure, 
for idx = 41:42
    plot(mean(rate_BxtxN(end-idx+1,201:end,:),3)); hold on;
end

% rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, trialType, do_zscore, 0);  % trialType, do_zscore, do_smoothing

% mean/sem calculation (time window: baseline 2 s)
rate_BxN = squeeze(nanmean(rate_BxtxN(500-numel(cohort{3}.trialMatrix)+1:end, 200:400,:), 2));  % also try 400:600 reward period

%diff_rate_B = sum(diff(rate_BxN,1,1).^2,2);
%trialMatrix1 = cohort{3}.trialMatrix(1:end-1);
%mean(diff_rate_B(trialMatrix1==0))

stimTrial = find(cohort{4}.trialMatrix==0);
stim_pre = mean(rate_BxN(stimTrial,:),2);
stim_post = mean(rate_BxN(stimTrial+1,:),2);

figure; set(gcf,'color','w');
plot(stimTrial,stim_pre,'.-'); hold on;
plot(stimTrial,stim_post,'.-'); hold off;
labels = {'Pre-stim','Post-stim'}; lgd = legend(labels);
xlabel('Trial'); ylabel('Activity (AU)');

figure, hist(stim_post-stim_pre)
%}

% across-trial changes during optotagging (discarded)

%{
trialType = -2; plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-0.5 1.5 0.010 2]);
%}