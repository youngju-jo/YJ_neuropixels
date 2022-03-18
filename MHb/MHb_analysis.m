
% Neuropixels 2.0 data analysis for the medial habenula project
% YoungJu Jo (yjjo@stanford.edu)


%% Load mouse brain atlas

global atlas
atlas.tv = readNPY('template_volume_10um.npy'); % grey-scale "background signal intensity"
% atlas.tv = max(atlas.tv(:)) - atlas.tv; % for color inversion
atlas.av = readNPY('annotation_volume_10um_by_index.npy'); % the number at each pixel labels the area, see note below
atlas.st = loadStructureTree('structure_tree_safe_2017.csv'); % a table of what all the labels mean

% atlas volumes: AP/DV/ML
% registered coordinates: ML/AP/DV


%% cohort_info: data directories (from cohort_MHb.m)

cohort_type = 1;  % 1: Tac1, 2: septum, 3: perturbation
cohort = cohort_MHb(cohort_type);


%% Load and process data

mergestructs = @(x,y) cell2struct([struct2cell(x);struct2cell(y)],[fieldnames(x);fieldnames(y)]);
for idx_sess = 1:numel(cohort)
    cohort{idx_sess} = mergestructs(cohort{idx_sess}, process_session_MHb(cohort{idx_sess}, cohort_type));
end
% save('cohort_Tac1.mat', 'cohort', '-v7.3');  % load('cohort_Tac1.mat');
% save('cohort_septum.mat', 'cohort', '-v7.3');  % load('cohort_septum.mat');
% save('cohort_perturbation.mat', 'cohort', '-v7.3');  % load('cohort_perturbation.mat');

% concat_field: extract certain fields (e.g., concat_field(cohort, 'unit_region'))


%% Concatenate unit info and filter by QC metrics

% concat units
cohort_flat = concat_cohort_MHb(cohort, cohort_type);

% QC conditions
cond1 = cohort_flat.isiviolation < 0.5;
cond2 = cohort_flat.fr > 0.2;
cond3 = 1;
cond4 = 1;
cond5 = 1; %cohort_flat.sess == 1;
cond = logical(cond1.*cond2.*cond3.*cond4.*cond5); disp(sum(cond));

% filtering
cohort_flat_fields = fieldnames(cohort_flat);
for idx_field = 1:numel(cohort_flat_fields)
    field_values = cohort_flat.(cohort_flat_fields{idx_field});
    cohort_flat.(cohort_flat_fields{idx_field}) = field_values(cond, :);
end

% specifying optotagged units
if cohort_type == 1
    optotagged = logical((cohort_flat.salt_p < 0.01) .* (cohort_flat.spike_probability > 0.2).* (cohort_flat.wf_corr > 0.8));
    %optotagged = logical((cohort_flat.salt_I > 0.2) .* (cohort_flat.spike_probability > 0.2) .* (cohort_flat.spike_latency < 0.020)); disp(sum(optotagged)); % .* (cohort_flat.wf_corr > 0.3)); 
    % figure, hist(cohort_flat.wf_corr)
elseif cohort_type == 3
    optotagged = logical((cohort_flat.salt_p < 0.01) .* (cohort_flat.spike_probability > 0.2));
end

% atlas visualization
plot_optotagged = 1;
atlas_MHb(cohort_flat, plot_optotagged, optotagged);
% to be implemented: atlas_septum

% print all brain regions with any units recorded
%{
unit_region = cohort_flat.region; 
regions = unique(unit_region);
for idx = 1:numel(regions)
    disp(atlas.st{atlas.st{:,2}==regions(idx),5});  % 4, 5, 14
end
%}


% example: from concatenated logical vector to session index, unit index, and unit ID
% [list_sess, list_unit, list_ID] = vector2index(cohort, cohort_flat, optotagged);

% figure, hist(idx_sess); 
% idx = 20; disp(cohort{idx_sess(idx)}.spike_latency(idx_unit(idx),:)); 
% figure, hist(cohort{12}.spike_latency);
% figure, plot(cohort_flat.spike_latency, cohort_flat.fr, '.'); -- interesting, let's go through the optotagging metrics code again


%% "cond": specify target units from cohort_flat

% always, target neurons should be set first for the downstream population analyses

cond1 = cohort_flat.region==149;  % 483: MHb / 186: LHb / 149: PVT / 564: MS / 581: TRS
cond2 = optotagged;
cond3 = 1; cohort_flat.coord(:,3) < 2850; % is_dorsal_MHb(cohort_flat.coord, 0.5); %cohort_flat.coord(:,3) < 2900;
cond4 = 1;
cond5 = 1; %cohort_flat.sess == 4;
cond = logical(cond1.*cond2.*cond3.*cond4.*cond5.*ones(numel(cohort_flat.id),1)); 
[list_sess, list_unit, list_ID] = vector2index(cohort, cohort_flat, cond);
disp(sum(cond));

% atlas visualization
% atlas_MHb_specified(cohort_flat, cond);

% "neuron card"
plot_comprehensive_MHb(cohort, list_sess, list_unit, list_ID);
%save_comprehensive_MHb(cohort, list_sess, list_unit, list_ID, 'C:\Users\YoungJu Jo\Dropbox\Ephys\MHb_data\NeuronCards\PVT');

% hold off;

%%

% Single-unit spike raster and smoothed rate

trialType = 1;
plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-2.0 4.0 0.010 20]);

cohort{list_sess(1)}.unit_region(list_unit)

trialType = -2;
plot_raster_MHb(cohort, list_sess, list_unit, list_ID, trialType, [-0.5 1.5 0.010 2]);


%% Activity across trials -- try including unrewarded trials but excluding miss trials?

% across-trial processing
% (1) spike_bxtxn -> reshape individual data cubes to 500xtxn (ragged structure)
% (2) concat along n dimension (500xtxN)
% (3) (optional) do smoothing for heatmap generation
% (4) nanmean/sem calculation along the neuron dimension

do_zscore = 1;

% check number of existing trials across sessions
% figure, plot(mean(isnan(rate_BxtxN), [2,3]));  
num_last_trials = 150;

% cue aligned rate in rewarded trials
% ***for heatmap: with smoothing***
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, 1, do_zscore, 1);  % trialType, do_zscore, do_smoothing

% visualize heatmap (add time axis)
rate_Bxt = nanmean(rate_BxtxN, 3);

figure; set(gcf,'color','w');
imagesc(rate_Bxt(500-num_last_trials:end,200:end)); colormap inferno;
xlabel('Time from cue (s)'); xline(200,'-w');
xt = 1:100:800+1; xtlbl = -2:1:6;
set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
ylabel('Rewarded trials from session end');
yt = 1:20:num_last_trials+1; ytlbl = -1*num_last_trials:20:0;
set(gca, 'YTick', yt, 'YTickLabel', ytlbl);
cb=colorbar; 
if do_zscore
    ylabel(cb, 'Firing rate (z-score)', 'Rotation', 270);
else
    ylabel(cb, 'Firing rate (spikes/s)','Rotation', 270); 
end
cb.Label.Position(1) = 3;

% ***for curve: without smoothing***
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, 1, do_zscore, 0);  % trialType, do_zscore, do_smoothing

% mean/sem calculation (time window: baseline 2 s)
rate_BxN = squeeze(nanmean(rate_BxtxN(500-num_last_trials:end, 200:400,:), 2));  % also try 400:600 reward period
rate_B_mean = nanmean(rate_BxN, 2);
rate_B_sem = nanstd(rate_BxN, 0, 2)/sqrt(size(rate_BxN,2));

% plot baseline ramping
figure; set(gcf,'color','w');
tAxisTrial = -1*num_last_trials:0;
shadedErrorBar(tAxisTrial,rate_B_mean,rate_B_sem, {'Color', [0 0.5 0]}, 0.8); hold on;
xlabel('Rewarded trials from session end');  % ylim([10,20]);
if do_zscore
    ylabel('Firing rate (z-score)');
else
    ylabel('Firing rate (spikes/s)');
end

% single-unit ramping quantification
ramping_N = fit_ramping_MHb(rate_BxN);  % linear fit for individual units

ramping_count = [sum(ramping_N.class==1) sum(ramping_N.class==-1) sum(ramping_N.class==0)];
ramping_fraction = ramping_count / sum(ramping_count);
ramping_fraction = [ramping_fraction; ramping_fraction];  % TO DO: use it for multi-cond case (e.g., MHb vs LHb, or as a function of MHb dorsal fraction)

figure; set(gcf,'color','w');
hb = bar(ramping_fraction, 'stacked'); ylim([0,1.05]);
labels = {'Ramping up','Ramping down','Ramping n.s.'}; lgd = legend(labels);
hb(1).FaceColor = 'r'; hb(2).FaceColor = 'b'; hb(3).FaceColor = 'w';

% pie chart
% figure; set(gcf,'color','w'); pie(categorical(ramping_N.class)); colormap(redblue); %title(strcat('MHb (N=', num2str(sum(cond)), ')'));
% labels = {'Ramp DOWN', 'n.s.', 'Ramp UP'}; lgd = legend(labels);




%% peak-sorted activity across regions (set cond==ones)

% Note: trialType
% 1: lick-reward, 2: lick-noreward, 3: nolick / 0: perturbation
% -1: all trials, -2: optotagging trials

regions_of_interst = [483, 186];  % Hb: [483, 186], Septum: [564, 581]
% Note: set cond to be everything for region breakdown

delta_rate_rw = align_cue_MHb(cohort, list_sess, list_unit, 1, 1);  % rewarded trials, do zscoring
g_std = 20;  % 200 ms std, causal half-gaussian smoothing after 10 ms binning
half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 
for idx_N = 1:size(delta_rate_rw,1)
    delta_rate_rw(idx_N, :) = conv(delta_rate_rw(idx_N, :), half_gaussian, 'same'); 
end
delta_rate_rw = delta_rate_rw(:,201:end);

unit_region = cohort_flat.region(cond);
delta_rate_rw_1 = peak_sort(delta_rate_rw(unit_region==regions_of_interst(1), :));
delta_rate_rw_2 = peak_sort(delta_rate_rw(unit_region==regions_of_interst(2), :));
delta_rate_rw_3 = peak_sort(delta_rate_rw(logical((unit_region~=regions_of_interst(1)).*(unit_region~=regions_of_interst(2))), :));
delta_rate_rw_all = cat(1,delta_rate_rw_1,delta_rate_rw_2,delta_rate_rw_3);

figure; set(gcf,'color','w');
imagesc(delta_rate_rw_all); colormap(redblue); caxis([-0.7 0.7]); %colormap(inferno);
hcb=colorbar; title(hcb,'Z-score');
yline(size(delta_rate_rw_1,1), '-k', 'LineWidth', 2);
yline(size(delta_rate_rw_1,1)+size(delta_rate_rw_2,1), '-k', 'LineWidth', 2);
xlabel('Time from cue (s)'); xline(200,'--k');
xt = 1:100:800+1; xtlbl = -2:1:6;
set(gca, 'XTick', xt, 'XTickLabel', xtlbl);
ylabel('Neurons');
yt = [1,size(delta_rate_rw_all,1)];
set(gca, 'YTick', yt, 'YTickLabel', yt);




%% 




% add annotations to the optotagging analysis script
% next time, use even lower freq for optotagging (1-2 Hz?) -- pulse train is just for visualization

% generic within-session browser
% idx_sess = 12; plot_raster2(cohort{idx_sess}.TTL_trial(cohort{idx_sess}.trialMatrix==1), [-2.0 4.0 0.010 20], cohort{idx_sess}.spike_su(cohort{idx_sess}.unit_region==483), cohort{idx_sess}.list_su(cohort{idx_sess}.unit_region==483), 1);


% raster

idx = 24;

idx_sess = list_sess(idx);
idx_unit = list_unit(idx);
idx_ID = list_ID(idx);


TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;

size(TTL_trial(trialMatrix == 1))
size(TTL_trial(trialMatrix == 2))

size(cohort{idx_sess}.reactionTime)

countParam = [-2 6 0.001 1];

TTL_of_interest = TTL_trial(trialMatrix == 1);
figure,
generate_raster(TTL_of_interest, countParam, cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);


TTL_trial_rw = TTL_trial(trialMatrix==1);
[rtRW,idxSortRW] = sort(reactionTime(trialMatrix==1));
TTL_trial_rw = TTL_trial_rw(idxSortRW);

TTL_trial_nr = TTL_trial(trialMatrix==2);
[rtNR,idxSortNR] = sort(reactionTime(trialMatrix==2));
TTL_trial_nr = TTL_trial_nr(idxSortNR);


preCueDur = -1; postCueDur = 3; binSize = 0.010; numSmooth = 20;
%eventTimes1 = cohort{idx_sess}.TTL_trial_rw; eventTimes2 = cohort{idx_sess}.TTL_trial_nr;
eventTimes1 = cohort{idx_sess}.TTL_rw; eventTimes2 = cohort{idx_sess}.TTL_nr;

rate_bxtx1_e1 = bin_spikes(eventTimes1, [preCueDur postCueDur binSize numSmooth], cohort{idx_sess}.spike_su(unitNum)) * 1/binSize;
rate_bxtx1_e2 = bin_spikes(eventTimes2, [preCueDur postCueDur binSize numSmooth], cohort{idx_sess}.spike_su(unitNum)) * 1/binSize;

spikeTimes = cohort{idx_sess}.spike_su{unitNum};

spikeTimesOfTrials1 = []; trialIndexOfTrials1 = [];
for i = 1:numel(eventTimes1)

    inTrial = logical((spikeTimes > eventTimes1(i)+preCueDur).*(spikeTimes < eventTimes1(i)+postCueDur));
    spikeInTrial = spikeTimes(inTrial) - eventTimes1(i);

    spikeTimesOfTrials1 = [spikeTimesOfTrials1; spikeInTrial];
    trialIndexOfTrials1 = [trialIndexOfTrials1; ones(size(spikeInTrial))*i];

end

spikeTimesOfTrials2 = []; trialIndexOfTrials2 = [];
for i = 1:numel(eventTimes2)

    inTrial = logical((spikeTimes > eventTimes2(i)+preCueDur).*(spikeTimes < eventTimes2(i)+postCueDur));
    spikeInTrial = spikeTimes(inTrial) - eventTimes2(i);

    spikeTimesOfTrials2 = [spikeTimesOfTrials2; spikeInTrial];
    trialIndexOfTrials2 = [trialIndexOfTrials2; ones(size(spikeInTrial))*i];

end

trialIndexOfTrials1 = trialIndexOfTrials1 + numel(eventTimes2);
tAxisPSTH = preCueDur:binSize:postCueDur;

%figure; set(gcf,'color','w');
subplot(223);
plot(tAxisPSTH, mean(rate_bxtx1_e1,1), 'Color', [0 0.5 0]); hold on;
plot(tAxisPSTH, mean(rate_bxtx1_e2,1), 'Color', [0.2 0.2 0.2]); hold off;
xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); xlabel('Time from reward/omission onset (s)');
subplot(221); 
plot(spikeTimesOfTrials1, trialIndexOfTrials1, '.', 'Color', [0 0.5 0]); hold on;
plot(spikeTimesOfTrials2, trialIndexOfTrials2, '.', 'Color', [0.2 0.2 0.2]);
%plot(cohort{idx_sess}.rtRW, (1:numel(eventTimes1))+numel(eventTimes2), '--k');
%plot(cohort{idx_sess}.rtNR, 1:numel(eventTimes2), '--k'); hold off;
%ylabel('Trials (sorted by RT)'); %title('Spike raster');
%xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from cue onset (s)'); set(gca,'ytick',[]);
ylabel('Trials'); %title('Spike raster');
xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from reward/omission onset (s)'); set(gca,'ytick',[]);
title(strcat('Session: ', {' '}, num2str(idx_sess), ' / Unit: ', {' '}, num2str(cohort{idx_sess}.list_su(unitNum))));%, ...
    %', isSU:', {' '}, num2str(ismember(unitNum, list_su))))%, ', isPyr:', {' '}, num2str(isPyr(unitNum))));
    
    
    

%% PSTH: reward delivery vs omission

% within-trial processing
% (1) trial averaging within session (and baseline subtraction given the ramping)
% (2) concat (neuron x time) matrices
% (3) mean/sem calculation along the neuron dimension
% (4) smoothing for visualization

do_zscore = 0;

% cue aligned rate
delta_rate_rw = align_cue_MHb(cohort, list_sess, list_unit, 1, do_zscore);
delta_rate_nr = align_cue_MHb(cohort, list_sess, list_unit, 2, do_zscore);
%delta_rate_ms = align_cue_MHb(cohort, list_sess, list_unit, 3, do_zscore);

% PSTH calculation and smoothing
g_std = 20;  % 200 ms std, causal half-gaussian smoothing after 10 ms binning
half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 
delta_rate_rw_mean = conv(mean(delta_rate_rw,1), half_gaussian, 'same'); delta_rate_rw_mean = delta_rate_rw_mean(201:end);
delta_rate_rw_sem = conv(std(delta_rate_rw,1)/sqrt(size(delta_rate_rw,1)), half_gaussian, 'same'); delta_rate_rw_sem = delta_rate_rw_sem(201:end);
delta_rate_nr_mean = conv(mean(delta_rate_nr,1), half_gaussian, 'same'); delta_rate_nr_mean = delta_rate_nr_mean(201:end);
delta_rate_nr_sem = conv(std(delta_rate_nr,1)/sqrt(size(delta_rate_nr,1)), half_gaussian, 'same'); delta_rate_nr_sem = delta_rate_nr_sem(201:end);

% PSTH visualization
figure; set(gcf,'color','w');
tAxisPSTH = -2:0.010:6;
shadedErrorBar(tAxisPSTH,delta_rate_rw_mean,delta_rate_rw_sem, {'Color', [0 0.5 0]}, 0.8); hold on;
shadedErrorBar(tAxisPSTH,delta_rate_nr_mean,delta_rate_nr_sem, {'Color', [0.2 0.2 0.2]}, 0.8); hold off;
xlabel('Time from cue (s)'); xline(0,'--');
if do_zscore
    ylabel('? Firing rate (z-score)');
else
    ylabel('? Firing rate (spikes/s)'); 
end
% title('Pan-neuronal LHb'); % title('Tac1 LHb'); % title('Tac1 MHb');


% try gating the LHb signal based on ML coordinates?
% given the size of error bar, what if we do neuron averaging first, concatenate trials, and do trial averaging?




%% integration -- re-do this with some population technique (across sessions)

idx_sess = 12; 
do_zscore = 1;

TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
list_unit_sess = list_unit(list_sess == idx_sess);

mid_trial = round(numel(TTL_trial)/2); 
TTL_trial = TTL_trial(1:mid_trial); trialMatrix = trialMatrix(1:mid_trial);  % last half trials only
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

rate_b = mean(rate_bxtxn(:,201:400,:), [2,3]);

trialType = 1;
idx_trial = find(trialMatrix==trialType);
if max(idx_trial) == numel(trialMatrix)
    idx_trial = idx_trial(1:end-1);
end
diff_rate_rw = rate_b(idx_trial+1) - rate_b(idx_trial);

trialType = 2;
idx_trial = find(trialMatrix==trialType);
if max(idx_trial) == numel(trialMatrix)
    idx_trial = idx_trial(1:end-1);
end
diff_rate_nr = rate_b(idx_trial+1) - rate_b(idx_trial);

[p,~,stats] = ranksum(diff_rate_rw, diff_rate_nr);
[h, p] = ttest2(diff_rate_rw,diff_rate_nr);

figure, hist(diff_rate_rw);
figure, hist(diff_rate_nr);

sum(diff_rate_rw) + sum(diff_rate_nr)


do_zscore = 1;
rate_BxtxN = align_across_trials_MHb(cohort, list_sess, list_unit, -1, do_zscore, 1);  % trialType, do_zscore, do_smoothing

figure, plot(squeeze(mean(rate_BxtxN(:,201:400,:), [2,3])))



TTL_trial = cohort{idx_sess}.TTL_trial; trialMatrix = cohort{idx_sess}.trialMatrix;
        list_unit_sess = list_unit(list_sess == idx_sess);
        
        spike_bxtxn = bin_spikes(TTL_of_interest, [-4 6 0.010 1], cohort{idx_sess}.spike_su(list_unit_sess));
        
        

%% autocorrelation

[ac,xbin] = acf(cohort{1}.spike_su{10}, 0.010, 0.3);
figure, plot(xbin, ac, '.');

[K, Qi, Q00, Q01, Ri] = ccg(cohort{1}.spike_su{10}, cohort{1}.spike_su{10}, 100, 0.010);
K_ = K; K_(501) = 0;

%% TO DO

% (done) perfect the visulizations above
% (done) anatomical neuron specification
% (done) atlas visualization
% (done) peak-sorted activity, grouped by regions

% raster visualizing function? (choose units based on slope) -- together with optotagging and ramping?
% optotagging figures -- read the code again and make it browsable

% quantify integration

% stim PSTH
% baseline/integration quantiication with stim
% autocorrelation
% directions...

% check out the re-sorted data / go through the optotagged units with Phy / exclude session with different wavelength

% RT-sorted rasters are just for visualization (make a function with browsing capability?)

% 3D atlas visualization (main computer)










%% event-aligned rasters (for perturbation experiments)

%% single-unit responses - 1, 14, 18?

%% trajectories (smoothing + PCA)

%% peak-sorted activity - perhaps plot selectivity / valence as well? - z-scroing after smoothing?

%% export for data-driven modeling

%% single-session analysis (#9)

%% Optotagging plots



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


%% waveform features / feature-based unit visualization


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


%%

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





