
baseDir = 'C:\SGL_DATA\output\catgt_ANM_0174_20210915_behavior_optotagging_001_g0';

baseDir_split = split(baseDir,'\'); baseDir_stem = baseDir_split{end}(7:end);
myKsDir = strcat(baseDir, '\', baseDir_stem, '_imec0\imec0_ks2');

cd(myKsDir);

st = readNPY('spike_times.npy');
sc = readNPY('spike_clusters.npy');
sa = readNPY('amplitudes.npy');
sm = readNPY('spike_templates.npy');
sp = readNPY('pc_features.npy');
sf = readNPY('template_features.npy');

sts = readNPY('spike_times_sec.npy');
TTL_stimblock = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_1000.adj.txt'));
eb = find(sts < TTL_stimblock(1)-1, 1, 'last');

writeNPY(st(1:eb), 'spike_times_bhvr.npy');
writeNPY(st(eb+1:end), 'spike_times_stim.npy');
writeNPY(sc(1:eb), 'spike_clusters_bhvr.npy');
writeNPY(sc(eb+1:end), 'spike_clusters_stim.npy');
writeNPY(sa(1:eb), 'amplitudes_bhvr.npy');
writeNPY(sa(eb+1:end), 'amplitudes_stim.npy');
writeNPY(sm(1:eb), 'spike_templates_bhvr.npy');
writeNPY(sm(eb+1:end), 'spike_templates_stim.npy');
writeNPY(sp(1:eb,:,:), 'pc_features_bhvr.npy');
writeNPY(sp(eb+1:end,:,:), 'pc_features_stim.npy');
writeNPY(sf(1:eb,:,:), 'template_features_bhvr.npy');
writeNPY(sf(eb+1:end,:,:), 'template_features_stim.npy');



% figure, imagesc(squeeze(wf_bhvr(116+1,:,:)-wf_stim(116+1,:,:)));
% corr(reshape(squeeze(wf_bhvr(116+1,95:125,:)),1,[])',reshape(squeeze(wf_stim(116+1,95:125,:)),1,[])')
% corr(reshape(squeeze(wf_bhvr(116+1,:,:)),1,[])',reshape(squeeze(wf_stim(116+1,:,:)),1,[])')
% ct = readNPY('clus_Table.npy');
% readtable('metrics.csv')

figure, imagesc(squeeze(s.wf(s.list_su(resp_unit2(6)),:,:)))

wf_bhvr = readNPY('mean_waveforms_0.npy');
wf_stim = readNPY('mean_waveforms_1.npy');

figure; set(gcf,'color','w');
subplot(121); imagesc(squeeze(wf_bhvr(285+1,48:2:60,:)), [-80 60]);
title('Waveform (behavior)'); xlabel('Time bins (at 30 kHz)'); ylabel('Channels');
subplot(122); imagesc(squeeze(wf_stim(285+1,48:2:60,:)), [-80 60]);
title('Waveform (stim)'); xlabel('Time bins (at 30 kHz)');


%numUnit = size(wf_bhvr,1);
%diag(corr(reshape(wf_bhvr,numUnit,[])', reshape(wf_stim,numUnit,[])'))

{
'D:\ephys_backup\Processed\catgt_ANM_0170_20210905_behavior_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0171_20210920_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0171_20210922_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0171_20210926_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0173_20210928_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0173_20211001_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0173_20211002_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0173_20211004_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0174_20210910_behavior_optotagging_001_g0'
'D:\ephys_backup\Processed\catgt_ANM_0174_20210915_behavior_optotagging_001_g0'
}


{
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0170_20210905_behavior_001_g0\ANM_0170_20210905_behavior_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0171_20210920_behavior_optotagging_001_g0\ANM_0171_20210920_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0171_20210922_behavior_optotagging_001_g0\ANM_0171_20210922_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0171_20210926_behavior_optotagging_001_g0\ANM_0171_20210926_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0173_20210928_behavior_optotagging_001_g0\ANM_0173_20210928_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0173_20211001_behavior_optotagging_001_g0\ANM_0173_20211001_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0173_20211002_behavior_optotagging_001_g0\ANM_0173_20211002_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0173_20211004_behavior_optotagging_001_g0\ANM_0173_20211004_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0174_20210910_behavior_optotagging_001_g0\ANM_0174_20210910_behavior_optotagging_001_g0_imec0\imec0_ks2'
'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0174_20210915_behavior_optotagging_001_g0\ANM_0174_20210915_behavior_optotagging_001_g0_imec0\imec0_ks2'
}


%% spikes & bpod

% 170
% 20210905: MHb(R) / hStripe0 / 3700-3600 / CM-DiI / no / 
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0170_20210905_behavior_001_g0';
d_stim = NaN;
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210905_113925.mat');
% 20210906: Septum(R) / third / 5100-5000 / CM-DiI / no / 
baseDir = 'D:\ephys_backup\output\catgt_ANM_0170_20210906_behavior_001_g0';
d_stim = NaN;
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210906_155246.mat');

% 171
% 20210920: MHb(R) / hStripe0 / 3600-3500 / CM-DiI / yes / with Sam
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210920_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210920_164219.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210920_161237.mat');
% 20210922: MHb(R) / hStripe0 / 3600-3500 / DiD / yes / with Jalal
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210922_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210922_175548.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210922_173653.mat');
% (T) 20210926: MHb(L) / hStripe0 / 3650-3350 / CM-DiI / yes / 
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210926_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210926_221943.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210926_220008.mat');


% 172
% (X) 20210903: MHb(R) / hStripe0 / 3680-3550 / CM-DiI / yes (561 nm) / 100% reward probability
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0172_20210903_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\Optostim1p\Session Data\ANM_0172_Optostim1p_20210903_232332.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\NoImageCueLightReward\Session Data\ANM_0172_NoImageCueLightReward_20210903_225635.mat');
% (?) 20210905: MHb(R) / hStripe0 / 3750-3650 / none / yes (561 nm) /
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0172_20210905_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\Optostim1p\Session Data\ANM_0172_Optostim1p_20210905_182025.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\NoImageCueLightReward\Session Data\ANM_0172_NoImageCueLightReward_20210905_174920.mat');
% 20210907: Septum(R) / second / 5100-5000 / CM-DiI / no /
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0172_20210907_behavior_001_g0';
d_stim = NaN;
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\NoImageCueLightReward\Session Data\ANM_0172_NoImageCueLightReward_20210907_174320.mat');

% 173
% (T) 20210928: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20210928_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20210928_143149.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20210928_135940.mat');
% (X) 20210929: MHb(R) / hStripe0 / 3600-3500 / DiD / yes / low SNR recording (most units do not pass QC) - discarded
baseDir = 'C:\SGL_DATA\output\catgt_ANM_0173_20210929_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20210929_180737.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20210929_170103.mat');
% 20210930: MHb(R) / hStripe0 / none-3600 / none / yes / guided by real-time LFP visualization in SpikeGLX
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20210930_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20210930_203726.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20210930_201013.mat');
% 20211001
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211001_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211001_181628.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211001_174346.mat');
% 20211002
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211002_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211002_135247.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211002_132401.mat');
% 20211004
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211004_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211004_181616.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211004_173828.mat');


% 174
% 20210909: Septum(R) / second / 5100-5000 / CM-DiI / no /
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210909_behavior_001_g0';
d_stim = NaN;
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210909_163438.mat');
% (?) 20210910: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes (594 nm DPSS laser) / power fluctuation in DPSS laser
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210910_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210910_160827.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210910_153646.mat');
% (T) 20210915: MHb(R) / hStripe0 / 3650-3550 / DiD / yes (637 nm, 100 mW) / started fiber water-dipping
baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210915_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210915_175119.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210915_172533.mat');


% 175
% 20211014: MHb(R) / hStripe0
baseDir = 'C:\SGL_DATA\output\catgt_ANM_0175_20211014_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0175\Optostim1p\Session Data\ANM_0175_Optostim1p_20211014_190242.mat');
d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0175\NoImageCueLightReward\Session Data\ANM_0175_NoImageCueLightReward_20211014_181605.mat');
% 20211016:
baseDir = 'C:\SGL_DATA\output\catgt_ANM_0175_20211016_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0175\Optostim1p\Session Data\ANM_0175_Optostim1p_20211016_232250.mat');
d_bhvr = NaN;
% 20211017:
baseDir = 'C:\SGL_DATA\output\catgt_ANM_0175_20211017_behavior_optotagging_001_g0';
d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0175\Optostim1p\Session Data\ANM_0175_Optostim1p_20211017_183825.mat');
d_bhvr = NaN;


%% read and screening

s = load_ephys_session(baseDir);
% s.list_su
idx_metrics = find(ismember(s.list_su, s.metrics{:,2}));
%s.metrics = s.metrics(idx_metrics,:);
s.list_su = s.list_su(idx_metrics);
s.spike_su = s.spike_su(idx_metrics);
s.sites_su = s.sites_su(idx_metrics);

%figure, histogram(s.metrics{:,19}, 20)

%{
test_lratio = (s.metrics{:,8} < 0.1);
test_isolationdistance = (s.metrics{:,7} > 19);
test_ptratio = (s.metrics{:,21} < 0.99);
test_recoveryslope = (s.metrics{:,23} < 0);
test_firingrate = (s.metrics{:,3} > 0.5);

test_all = logical(test_lratio .* test_isolationdistance .* test_ptratio .* test_recoveryslope .* test_firingrate);
% sum(test_all) / length(test_all)

%}


% check indicise AGAIN!!!!

%test_presenceratio = (s.metrics{:,4} > 0.8);
test_isiviolation = (s.metrics{:,5} < 0.05);
%test_amplitudecutoff = (s.metrics{:,6} <= 0.1);

%test_all = logical(test_presenceratio .* test_isiviolation .* test_amplitudecutoff);
test_all = logical(test_isiviolation);
disp(sum(test_all) / length(test_all));
disp(sum(test_all));



s.metrics = s.metrics(test_all,:);
s.list_su = s.list_su(test_all);
s.spike_su = s.spike_su(test_all);
s.sites_su = s.sites_su(test_all);

%figure, histogram(s.metrics{:,19},20);
%set(gcf,'color','w');
%xlabel('Spike duration (ms)'); ylabel('Number of units');

%figure, scatter(s.metrics{:,19},s.metrics{:,3});

%resp_unit_positions = s.channel_positions(s.sites_su(resp_unit)+1,:);
all_unit_positions = s.channel_positions(s.sites_su+1,:);
all_unit_positions = all_unit_positions + 5*randn(size(all_unit_positions));
figure; set(gcf,'color','w');
plot(s.channel_positions(:,1),s.channel_positions(:,2),'.k'); hold on;
plot(all_unit_positions(:,1), all_unit_positions(:,2), '.b', 'MarkerSize', 20); hold on;
%plot(resp_unit_positions(:,1),resp_unit_positions(:,2),'*r', 'MarkerSize', 30); hold off;
xlabel('X coordinate (um)'); ylabel('Y coordinate (um)');
xlim([-100 900]); ylim([-100 800]);









%%

trial_width = d_stim.SessionData.TrialInfo.trial_width;
trial_freq = d_stim.SessionData.TrialInfo.trial_freq;
trial_power = d_stim.SessionData.TrialInfo.trial_power;

list_width = d_stim.SessionData.TrialInfo.list_width;
list_freq = d_stim.SessionData.TrialInfo.list_freq;
list_power = d_stim.SessionData.TrialInfo.list_power;

%pulseOn = s.TTL_stim;
%s.TTL_stimblock

pulse_width = zeros(length(s.TTL_stim),1);
pulse_freq = zeros(length(s.TTL_stim),1);
pulse_power = zeros(length(s.TTL_stim),1);
len_pulse = zeros(length(s.TTL_stimblock),1);

stimDuration = 1.0;  % sec
for idx_bhvr = 1:length(s.TTL_stimblock)
    idx_pulse = find((s.TTL_stim > s.TTL_stimblock(idx_bhvr)) .* (s.TTL_stim < s.TTL_stimblock(idx_bhvr)+stimDuration));
    len_pulse(idx_bhvr) = length(idx_pulse);
    pulse_width(idx_pulse) = trial_width(idx_bhvr);
    pulse_freq(idx_pulse) = trial_freq(idx_bhvr);
    pulse_power(idx_pulse) = trial_power(idx_bhvr);
    % latency correction
    if ~isempty(idx_pulse)
        s.TTL_stimblock(idx_bhvr) = s.TTL_stim(idx_pulse(1));
    end
end
len_pulse(len_pulse==0) = -1;

countParam = [0 0.020 0.001 1];  
%preCueDur = countParam(1); postCueDur = countParam(2);
%tAxisPSTH = preCueDur:countParam(3):postCueDur;
% s.list_su

% pick up robustly responding units
idxPulse = ((pulse_width==0.010).*(pulse_freq==10).*(pulse_power==5))==1;
count_bxtxn = bin_spikes(s.TTL_stim(idxPulse), countParam, s.spike_su);
resp_trial_bxn = squeeze(sum(count_bxtxn,2)) > 0;
resp_unit = find(squeeze(sum(resp_trial_bxn,1)) >= size(resp_trial_bxn,1)*0.8);
% s.list_su(resp_unit)
% s.sites_su(resp_unit)

resp_unit_positions = s.channel_positions(s.sites_su(resp_unit)+1,:);
all_unit_positions = s.channel_positions(s.sites_su+1,:);
%all_unit_positions = all_unit_positions + randn(size(all_unit_positions));
figure; set(gcf,'color','w');
plot(s.channel_positions(:,1),s.channel_positions(:,2),'.k'); hold on;
plot(all_unit_positions(:,1), all_unit_positions(:,2), '.b', 'MarkerSize', 20); hold on;
plot(resp_unit_positions(:,1),resp_unit_positions(:,2),'*r', 'MarkerSize', 30); hold off;
xlabel('X coordinate (um)'); ylabel('Y coordinate (um)');
xlim([-100 900]); ylim([-100 800]);

% plot_raster(s.TTL_stim(idxPulse), [-0.020 0.060 0.001 5], s.spike_su, s.list_su);%, s.list_su);%, s.isPyr);

salt_p_all = zeros(length(s.spike_su),1); salt_I_all = zeros(length(s.spike_su),1);
for idx_su = 1:length(s.spike_su)
    count_baseline = bin_spikes(s.TTL_stimblock-0.9, [0 0.8-0.001 0.001 1], s.spike_su(idx_su));
    count_test = bin_spikes(s.TTL_stim(idxPulse), [0 0.025 0.001 1], s.spike_su(idx_su));  % mean(sum(count_test,2))
    [salt_p, salt_I] = salt(count_baseline,count_test,0.001,0.010);
    salt_p_all(idx_su) = salt_p; salt_I_all(idx_su) = salt_I;
end
%figure, scatter(salt_p_all, salt_I_all);
%[out,idx] = sort(salt_I_all);
%resp_unit2 = find(salt_p_all < 0.01);

figure; set(gcf,'color','w');
scatter(salt_I_all, s.wf_corr(s.list_su+1));
xlabel('"Distance" of stimulus-associated latency distribution'); ylabel('Waveform correlation (behavior vs tagging)')
xline(0.2, '--'); yline(0.6, '--');

resp_unit2 = find(salt_I_all > 0.2);
%s.wf_corr(s.list_su(resp_unit2)+1)
%figure, scatter(s.list_su(resp_unit2), s.wf_corr(s.list_su(resp_unit2)+1))
resp_unit2 = resp_unit2(s.wf_corr(s.list_su(resp_unit2)+1) > 0.6);

resp_unit_positions = s.channel_positions(s.sites_su(resp_unit2)+1,:);
all_unit_positions = s.channel_positions(s.sites_su+1,:);
figure; set(gcf,'color','w');
plot(s.channel_positions(:,1),s.channel_positions(:,2),'.k'); hold on;
plot(all_unit_positions(:,1), all_unit_positions(:,2), '.b', 'MarkerSize', 20); hold on;
plot(resp_unit_positions(:,1),resp_unit_positions(:,2),'*r', 'MarkerSize', 30); hold off;
xlabel('X coordinate (um)'); ylabel('Y coordinate (um)');
xlim([-100 900]); ylim([-100 800]);



%%

wf_features = s.metrics{:,19:25};
wf_features(:,6) = s.metrics{:,3};
wf_features(isnan(wf_features)) = 0; 
[coeff,score,latent] = pca(zscore(wf_features));

figure, 
scatter(score(:,1), score(:,2)); hold on;
scatter(score(resp_unit2(1:end),1), score(resp_unit2(1:end),2)); hold off;
set(gcf,'color','w'); xlabel('PC 1'); ylabel('PC 2');



ccode = s.metrics{:,19}; %s.metrics{:,19} % 3: firing rate, 19: duration, 21: PT ratio, 25: spread
%ccode = score(:,1);
ccode(ccode>0.9) = 0.9;
ccode(ccode<0.2) = 0.2;
ccode = (ccode-min(ccode))/(max(ccode)-min(ccode));
ccode = [ccode zeros(size(ccode)) (1-ccode)]; %ones(size(ccode))
figure; set(gcf,'color','w');
plot(s.channel_positions(:,1),s.channel_positions(:,2),'.k'); hold on;
scatter(all_unit_positions(:,1), all_unit_positions(:,2), 40, ccode, 'filled'); hold off;
xlabel('X coordinate (um)'); ylabel('Y coordinate (um)');
xlim([-100 900]); ylim([-100 800]);

%s.wf(s.list_su)

figure,
scatter(s.metrics{:,19}, s.metrics{:,3}); hold on;
scatter(s.metrics{resp_unit2(1:end),19}, s.metrics{resp_unit2(1:end),3}); hold off;
set(gcf,'color','w'); xlabel('Spike duration (ms)'); ylabel('Firing rate (Hz)');


%{
resp_idx = find(ismember(waveformmetrics{:,2}, s.list_su(resp_unit)));

figure,
histogram(s.metrics{:,19},10,'Normalization','probability','FaceColor','k','FaceAlpha',0.2); hold on;
histogram(s.metrics{resp_unit2,19},10,'Normalization','probability','FaceColor','r','FaceAlpha',0.2); hold off;
mean(waveformmetrics{:,6})
mean(waveformmetrics{resp_idx,6})


resp_idx = find(ismember(metrics{:,2}, s.list_su(resp_unit)));
metrics{resp_idx,3}



figure,
histogram(metrics{:,3},30,'Normalization','probability','FaceColor','k','FaceAlpha',0.2);

hold on;
histogram(waveformmetrics{resp_idx,6},'Normalization','probability','FaceColor','r','FaceAlpha',0.2); hold off;
mean(waveformmetrics{:,6})
mean(waveformmetrics{resp_idx,6})
%}

binSize = 0.010; numSmooth = 1;
preCueDur  = -3; postCueDur = 5;
spike_bxtxn = bin_spikes(s.TTL_bhvrOff, [preCueDur postCueDur binSize numSmooth], s.spike_su);



resp_unit = resp_unit2;

% observables: spike probability, spikes per trial, spike latency
% conditions: power, width, freq
coi = list_power; % condition of interest

prob_mean = zeros(length(coi),1); count_mean = zeros(length(coi),1); latency_mean = zeros(length(coi),1);
prob_std = zeros(length(coi),1); count_std = zeros(length(coi),1); latency_std = zeros(length(coi),1);

%%%%%% This should not be done with stim block!!! - a few ms latency!!!
%%%%%% Do all quantifications below with individual pulses
%%%%%% 

for idxCond = 1:length(coi)

    % quantification per stim condition
    %idxPulse = ((pulse_width==list_width(idxCond)).*(pulse_freq==10).*(pulse_power==5))==1;
    %idxPulse = ((pulse_width==0.010).*(pulse_freq==list_freq(idxCond)).*(pulse_power==5))==1;
    idxPulse = ((pulse_width==0.010).*(pulse_freq==10).*(pulse_power==list_power(idxCond)))==1;

    % spike probability
    count_bxtxn = bin_spikes(s.TTL_stim(idxPulse), countParam, s.spike_su);
    resp_trial_bxn = squeeze(sum(count_bxtxn(:, :, resp_unit),2)) > 0;
    prob_n = squeeze(mean(resp_trial_bxn,1));
    prob_mean(idxCond) = nanmean(prob_n);
    prob_std(idxCond) = nanstd(prob_n);

    % spikes per trial
    count_bxtxn = bin_spikes(s.TTL_stim(idxPulse), countParam, s.spike_su);
    count_bxn = squeeze(sum(count_bxtxn(:, :, resp_unit),2));
    count_n = zeros(size(count_bxn,2),1);
    for idxUnit = 1:size(count_bxn,2)
        count_1 = squeeze(count_bxn(:,idxUnit));
        count_n(idxUnit) = mean(count_1(count_1>0));
    end
    count_mean(idxCond) = nanmean(count_n);
    count_std(idxCond) = nanstd(count_n);

    % spike latency
    count_bxtxn = bin_spikes(s.TTL_stim(idxPulse), countParam, s.spike_su);
    count_bxn = squeeze(sum(count_bxtxn(:, :, resp_unit),2));
    latency_n = zeros(size(count_bxn,2),1);
    for idxUnit = 1:size(count_bxn,2)
        count_1 = squeeze(count_bxn(:,idxUnit));
        [~, latency_trial] = max(count_bxtxn(count_1>0,:,resp_unit(idxUnit))~=0, [], 2 );
        latency_n(idxUnit) = mean((latency_trial-1)*countParam(3));
    end
    latency_mean(idxCond) = nanmean(latency_n);
    latency_std(idxCond) = nanstd(latency_n);

end


coiname = 'Pulse width';
ticklabels = {'2 ms', '5 ms', '10 ms'};

coiname = 'Frequency';
ticklabels = {'10 Hz', '20 Hz', '40 Hz'};

coiname = 'Irradiance';
ticklabels = {'320 mW/mm^2', '560 mW/mm^2', '800 mW/mm^2'};


figure; set(gcf,'color','w');

subplot(131);
bar(prob_mean); hold on;
errorbar(prob_mean, prob_std/sqrt(length(resp_unit)),'k', 'LineStyle','none');
ylabel('Spike probability'); ylim([0 1]);
xlabel(coiname); set(gca, 'xticklabel', ticklabels);

subplot(132);
bar(count_mean); hold on;
errorbar(count_mean, count_std/sqrt(length(resp_unit)),'k', 'LineStyle','none');
ylabel('Spikes per trial'); %ylim([0 1]);
xlabel(coiname); set(gca, 'xticklabel', ticklabels);

subplot(133);
bar(latency_mean*1000); hold on;
errorbar(latency_mean*1000, latency_std*1000/sqrt(length(resp_unit)),'k', 'LineStyle','none');
ylabel('Spike latency (ms)'); %ylim([0 1]);
xlabel(coiname); set(gca, 'xticklabel', ticklabels);

% exact latency?
% sem normalization for nan elements?





    


idxTrial = ((trial_width==0.010).*(trial_freq==10).*(trial_power==5))==1;
%idxTrial = (trial_freq==10)==1;
%idxTrial = ((trial_freq==10))==1;

plot_raster(s.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], s.spike_su, s.list_su);%, s.list_su);%, s.isPyr);
% find(s.list_su==36)

figure; generate_raster(s.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], s.spike_su, s.list_su, 15);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',2);
end






figure, 

idx_su = 199;

subplot(311);
idxTrial = ((trial_width==0.002).*(trial_freq==10).*(trial_power==5))==1;
generate_raster(s.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], s.spike_su, s.list_su, idx_su);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 2 ms'); xlabel('');

subplot(312);
idxTrial = ((trial_width==0.005).*(trial_freq==10).*(trial_power==5))==1;
generate_raster(s.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], s.spike_su, s.list_su, idx_su);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',1);
end
title('Pulse width = 5 ms'); xlabel('');

subplot(313);
idxTrial = ((trial_width==0.010).*(trial_freq==10).*(trial_power==5))==1;
generate_raster(s.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], s.spike_su, s.list_su, idx_su);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',2);
end
title('Pulse width = 10 ms');




plot_raster(s.TTL_bhvr(idxTrial), [-0.2 1.2 0.001 5], s.spike, s.idClu);%, s.list_su);%, s.isPyr);
plot_raster(s.TTL_bhvr(idxTrial), [-0.05 0.15 binSize numSmooth], s.spike, s.idClu);%, s.list_su);%, s.isPyr);



%%

%d = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\Optostim1p\Session Data\ANM_0170_Optostim1p_20210826_174014.mat');

trialIdx = find(d_bhvr.SessionData.TrialTypes~=2);
nTrials = length(trialIdx);
trialTypes = d_bhvr.SessionData.TrialTypes(trialIdx);
% sum(d.SessionData.TrialTypes~=0)/numel(d.SessionData.TrialTypes)

trialMatrix = nan(nTrials,1);   % 1: lick-reward, 2: lick-noreward, 3: nolick
reactionTime = nan(nTrials,1);
ts_TTL = nan(nTrials,1);

for t=1:nTrials
    x = d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.States;
    y = d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.Events;
    
    if ~isnan(x.Reward(1))
        trialMatrix(t) = 1;
        reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
    elseif ~isnan(x.NoReward(1))
        trialMatrix(t) = 2;
        reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
    else
        trialMatrix(t) = 3;
    end
    
    ts_TTL(t) = d_bhvr.SessionData.TrialStartTimestamp(trialIdx(t)) + x.DeliverCue(1);  % TTL offset (= cue onset)
    
end

% figure, plot(s.TTL_bhvrOff(1:nTrials), ts_TTL);
disp(corr(s.TTL_bhvrOff(1:nTrials), ts_TTL)>0.99999);


TTL_trial_all = s.TTL_bhvrOff(1:numel(trialMatrix));

TTL_trial_rw = TTL_trial_all(trialMatrix==1);
[rtRW,idxSortRW] = sort(reactionTime(trialMatrix==1));
TTL_trial_rw = TTL_trial_rw(idxSortRW);

TTL_trial_nr = TTL_trial_all(trialMatrix==2);
[rtNR,idxSortNR] = sort(reactionTime(trialMatrix==2));
TTL_trial_nr = TTL_trial_nr(idxSortNR);

% plot_raster_dual(TTL_trial_rw, TTL_trial_nr, [-2 3 binSize numSmooth], s.spike_su, s.idClu);%, s.list_su);%, s.isPyr);


% binning

TTL_rw = []; TTL_nr = [];
for t = 1:nTrials
    if trialMatrix(t)==1
        TTL_rw = [TTL_rw TTL_trial_all(t)+reactionTime(t)];
    elseif trialMatrix(t)==2
        TTL_nr = [TTL_nr TTL_trial_all(t)+reactionTime(t)];      
    end
end

bin_size = 0.020;
t_cutoff = TTL_trial_all(end)+10;

lick_min_dur = 0.05;
TTL_lick = s.TTL_lick(1);
for t = 2:numel(s.TTL_lick)
    if s.TTL_lick(t) - TTL_lick(end) > lick_min_dur
        TTL_lick = [TTL_lick s.TTL_lick(t)];
    end
end


binned_spike = int32(squeeze(bin_spikes([0], [0 t_cutoff bin_size 1], s.spike_su)));

binned_cue = int32(squeeze(bin_events([0], [0 t_cutoff bin_size 1], TTL_trial_all)))';
binned_lick = int32(squeeze(bin_events([0], [0 t_cutoff bin_size 1], TTL_lick)))';
binned_rw = int32(squeeze(bin_events([0], [0 t_cutoff bin_size 1], TTL_rw)))';
binned_nr = int32(squeeze(bin_events([0], [0 t_cutoff bin_size 1], TTL_nr)))';

ts_cue = find(binned_cue);
t_i = round(ts_cue(66)-50); t_f = t_i + 200;
figure; set(gcf,'color','w');
subplot(411); plot(t_i:t_f, binned_cue(t_i:t_f)); ylim([-0.1 1.1]); title('Cue onset');
subplot(412); plot(t_i:t_f, binned_lick(t_i:t_f)); ylim([-0.1 1.1]); title('Lick onset');
subplot(413); plot(t_i:t_f, binned_rw(t_i:t_f)); ylim([-0.1 1.1]); title('Reward delivery onset');
subplot(414); plot(t_i:t_f, binned_nr(t_i:t_f)); ylim([-0.1 1.1]); title('Reward omission onset'); xlabel('Time (20 ms bins)');

save('20210930.mat', 'binned_spike', 'binned_cue', 'binned_lick', 'binned_rw', 'binned_nr');


% perhaps try adding ramping regressor?



%%

% s.idClu(3)
% find(ismember(s.idClu, [14, 18, 19, 20]))

% s.list_su(resp_unit2)

unitNum = 190; %46
%14    15    17    19    23    31    37
% 3, 4, 6, 15, 19, 20, 21, 24, 27, 30, 40, 43, 63, 64, 76, 81, 85, 91, 94, 96, 124, 126, 158, 167, 213, 239, 254

preCueDur = -1; postCueDur = 2; binSize = 0.001; numSmooth = 100;
eventTimes1 = TTL_trial_rw; eventTimes2 = TTL_trial_nr;

rate_bxtx1_e1 = bin_spikes(eventTimes1, [preCueDur postCueDur binSize numSmooth], s.spike_su(unitNum)) * 1/binSize;
rate_bxtx1_e2 = bin_spikes(eventTimes2, [preCueDur postCueDur binSize numSmooth], s.spike_su(unitNum)) * 1/binSize;

spikeTimes = s.spike_su{unitNum};

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


figure; set(gcf,'color','w');
subplot(211);
plot(tAxisPSTH, mean(rate_bxtx1_e1,1), 'Color', [0 0.5 0]); hold on;
plot(tAxisPSTH, mean(rate_bxtx1_e2,1), 'Color', [0.2 0.2 0.2]); hold off;
title(strcat('Unit ID: ', {' '}, num2str(s.list_su(unitNum))));%, ...
    %', isSU:', {' '}, num2str(ismember(unitNum, list_su))))%, ', isPyr:', {' '}, num2str(isPyr(unitNum))));
xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); 
subplot(212); 
plot(spikeTimesOfTrials1, trialIndexOfTrials1, '.', 'Color', [0 0.5 0]); hold on;
plot(spikeTimesOfTrials2, trialIndexOfTrials2, '.', 'Color', [0.2 0.2 0.2]);
plot(rtRW, (1:numel(eventTimes1))+numel(eventTimes2), '--k');
plot(rtNR, 1:numel(eventTimes2), '--k'); hold off;
ylabel('Trials (sorted by RT)'); %title('Spike raster'); 
xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from cue onset (s)'); set(gca,'ytick',[]);





%% aligned activity

% baseDir = 'D:\ephys_backup\output\catgt_ANM_0154_20210816_behavior_g0';
baseDir = 'D:\ephys_backup\output\catgt_ANM_0172_20210905_behavior_optotagging_001_g0';
%baseDir = 'D:\ephys_backup\output\catgt_ANM_0154_20210822_optotagging_001_g0';
s = load_ephys_session(baseDir);

%{
eventTimes_start = s.eventTimesAll(s.eventLabel==3);
eventTimes_stop = s.eventTimesAll(s.eventLabel==-3);
eventTimes = (eventTimes_start + eventTimes_stop)/2;
eventTimes1 = eventTimes(eventTimes_stop - eventTimes_start > 0.01);
% eventTimes1 = unifrnd(min(eventTimes1),max(eventTimes1),numel(eventTimes1),1);

eventTimes_start = s.eventTimesAll(s.eventLabel==4);
eventTimes_stop = s.eventTimesAll(s.eventLabel==-4);
eventTimes = (eventTimes_start + eventTimes_stop)/2;
eventTimes2 = eventTimes(eventTimes_stop - eventTimes_start > 0.01);

binSize = 0.001; numSmooth = 100;
% spike_bxtxn = bin_spikes(eventTimes, [-0.3 0.3 binSize numSmooth], s.spike);
% rate_bxtxn = spike_bxtxn * 1/binSize;
%}


%% stim-aligned activity

baseDir = 'C:\Users\YoungJu Jo\Documents\Open Ephys\ANM_0118_2021-03-25_16-10-30_behavior_stim_001\Record Node 102\experiment1\recording2';
s = load_ephys_session(baseDir);

%D1.Timestamps = readNPY(strcat(baseDir,'\events\Rhythm_FPGA-100.0\TTL_1\timestamps.npy'));
%D1.Data = readNPY(strcat(baseDir,'\events\Rhythm_FPGA-100.0\TTL_1\channel_states.npy'));
%s.eventTimesAll = double(D1.Timestamps - 12498432)/30000;
%s.eventLabel = D1.Data;

eventTimes_start = s.eventTimesAll(s.eventLabel==2);
eventTimes_stop = s.eventTimesAll(s.eventLabel==-2);
eventTimes = eventTimes_start(eventTimes_stop - eventTimes_start > 0.49);
%eventTimes = eventTimes_start(eventTimes_stop - eventTimes_start > 1.49);

binSize = 0.001; numSmooth = 100;
plot_raster(eventTimes, [-0.5 1 binSize numSmooth], s.spike, s.idClu, s.list_su, s.isPyr);


%% cue-aligned activity (and spike width)

dir_ephys = {
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-03-21_22-12-24_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-03-25_11-46-12_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-03-26_15-09-20_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0121_2021-03-21_23-56-49_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0121_2021-03-25_14-12-36_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0121_2021-03-26_17-22-57_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-05-10_19-39-14_RSP_R_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-05-11_17-46-21_RSP_R_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0118_2021-05-11_16-11-54_ALM_L_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0120_2021-05-12_17-22-14_RSP_R_behavior_001\Record Node 102\experiment1\recording1'
    'X:\users\YJ\Ephys\OpenEphys\ANM_0118_2021-05-12_15-14-45_ALM_L_behavior_001\Record Node 102\experiment1\recording1'};

dir_bpod = {
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210321_221313.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210325_114645.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210326_150949.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0121\CueRewardDualBlock\Session Data\extracted_ANM_0121_CueRewardDualBlock_20210321_235720.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0121\CueRewardDualBlock\Session Data\extracted_ANM_0121_CueRewardDualBlock_20210325_141345.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0121\CueRewardDualBlock\Session Data\extracted_ANM_0121_CueRewardDualBlock_20210326_172319.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210510_193947.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210511_174641.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0118\CueRewardDualBlock\Session Data\extracted_ANM_0118_CueRewardDualBlock_20210511_161220.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0120\CueRewardDualBlock\Session Data\extracted_ANM_0120_CueRewardDualBlock_20210512_172228.mat'
    'D:\Dropbox\Behavior\Bpod\Data\ANM_0118\CueRewardDualBlock\Session Data\extracted_ANM_0118_CueRewardDualBlock_20210512_151503.mat'};

idSess = []; idClu_p = []; spike_p = {}; rate_p = []; durTemplate_p = []; isPyr_p = []; isFast_p = []; list_su_p = []; 
p_matrix_p = []; selectivity_correct_p = []; selectivity_incorrect_p = []; selectivity_t_p = [];

numSess = numel(dir_ephys);
for idxSess = 1:numSess
    
    sess = load_ephys_session(char(dir_ephys(idxSess)));
    idSess = [idSess; idxSess*ones(numel(sess.spike),1)];
    idClu_p = [idClu_p; sess.idClu];
    list_su_p = [list_su_p; sess.list_su + numel(spike_p)];
    spike_p = [spike_p  sess.spike];
    rate_p = [rate_p; sess.rate];
    durTemplate_p = [durTemplate_p; sess.durTemplate];
    isPyr_p = [isPyr_p; sess.isPyr]; isFast_p = [isFast_p; sess.isFast];
    
    load(char(dir_bpod(idxSess)));
    eventTimes = sess.eventTimesAll(sess.eventLabel==-1);
    numTrial = numel(ts_TTL); eventTimes = eventTimes(1:numTrial);
    f1 = fitlm(ts_TTL(1:numTrial),eventTimes(1:end));
    Rsquared = f1.Rsquared.Ordinary;
    if Rsquared < 0.99999
        error('Check trial alignment!');
    end
    
    binSize = 0.001; numSmooth = 1;
    rate_ll = bin_spikes(eventTimes(trialMatrix(:,1)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    rate_lr = bin_spikes(eventTimes(trialMatrix(:,2)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    rate_rr = bin_spikes(eventTimes(trialMatrix(:,4)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    rate_rl = bin_spikes(eventTimes(trialMatrix(:,5)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    
    p_matrix = nan(2, 2, numel(sess.list_su));
    for suNum = 1:numel(sess.list_su)
        [p,~,stats] = ranksum(mean(rate_ll(:,1:1000,sess.list_su(suNum)),2), mean(rate_rr(:,1:1000,sess.list_su(suNum)),2));
        p_matrix(1,1,suNum) = p; p_matrix(2,1,suNum) = stats.zval;
        [p,~,stats] = ranksum(mean(rate_ll(:,1002:end,sess.list_su(suNum)),2), mean(rate_rr(:,1002:end,sess.list_su(suNum)),2));
        p_matrix(1,2,suNum) = p; p_matrix(2,2,suNum) = stats.zval;
    end
    p_matrix_p = cat(3,p_matrix_p,p_matrix);
    
    selectivity_correct = squeeze(mean(rate_ll(:,1:1000,:),[1 2]) - mean(rate_rr(:,1:1000,:),[1 2]));
    selectivity_incorrect = squeeze(mean(rate_lr(:,1:1000,:),[1 2]) - mean(rate_rl(:,1:1000,:),[1 2]));
    selectivity_correct_p = [selectivity_correct_p; selectivity_correct];
    selectivity_incorrect_p = [selectivity_incorrect_p; selectivity_incorrect];
    
    binSize = 0.001; numSmooth = 400;
    rate_ll = bin_spikes(eventTimes(trialMatrix(:,1)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    rate_rr = bin_spikes(eventTimes(trialMatrix(:,4)==1), [-1 1 binSize numSmooth], sess.spike) * 1/binSize;
    selectivity_t = squeeze(mean(rate_ll,1) - mean(rate_rr,1));
    selectivity_t_p = cat(2,selectivity_t_p,selectivity_t);
    
    disp(idxSess);
    
end

% spike width distribution
figure, hist(durTemplate_p(list_su_p)); set(gcf,'color','w');
xlabel('Spike width (ms)'); ylabel('Number of single units'); 
xline(0.35, '--'); xline(0.45, '--');
% figure, hist(durTemplate_p);
% figure, plot(durTemplate_p(list_su_p), rate_p(list_su_p), '.')

% firing rate of putative cell types
rate_p_su = rate_p(list_su_p); cluType = -1*isFast_p(list_su_p) + 1*isPyr_p(list_su_p); 
rate_p_su = rate_p_su(cluType~=0); cluType = cluType(cluType~=0);
figure, boxplot(rate_p_su, cluType); set(gcf,'color','w');
xticklabels({'Fast','Pyramidal'}); ylim([-3 65]); xlabel('Putative cell type'); ylabel('Firing rate (Hz)');

% statistical tests of selectivity
p_matrix_p_su = p_matrix_p(:,:,ismember(list_su_p, find(isPyr_p)));
sig_pre = sum(p_matrix_p_su(1,1,:)<0.05)/size(p_matrix_p_su,3);
sig_post = sum(p_matrix_p_su(1,2,:)<0.05)/size(p_matrix_p_su,3);
sig_prepost = sum((p_matrix_p_su(1,1,:)<0.05).*(p_matrix_p_su(1,2,:)<0.05))/size(p_matrix_p_su,3);
sig_none = 1 - sig_pre - sig_post + sig_prepost;

% pre-cue selectivity "angle"
selectivity_slope = squeeze(selectivity_correct_p ./ selectivity_incorrect_p);
figure, hist(atand(selectivity_slope(list_su_p)), -90:15:90); set(gcf,'color','w');
xline(0, '--'); xlabel('"Angle" of correct/incorrect selectivity'); ylabel('Number of single units'); 
% figure, plot(selectivity_incorrect_p, selectivity_correct_p, '.'); xlim([-5 5]); ylim([-5 5]);
% figure, hist(atand(selectivity_slope), -90:15:90);
% figure, hist(atand(selectivity_slope(find(p_matrix_p(1,1,:)<0.05))), -90:15:90)

% visualization of selectivity
%sig_pos = list_su_p(logical(squeeze(((p_matrix_p(1,1,:)<0.05).*(p_matrix_p(2,1,:)>0)).*~((p_matrix_p(1,2,:)<0.05).*(p_matrix_p(2,2,:)>0)))));
%sig_pos = list_su_p(logical(squeeze(((p_matrix_p(1,1,:)<0.05).*(p_matrix_p(2,1,:)>0)))));
sig_pos = list_su_p(logical(squeeze(((p_matrix_p(1,1,:)<0.05).*(p_matrix_p(2,1,:)>0))+((p_matrix_p(1,2,:)<0.05).*(p_matrix_p(2,2,:)>0)))));
selectivity_pos = selectivity_t_p(:,sig_pos); selectivity_pos = selectivity_pos(:,ismember(sig_pos, find(isPyr_p)));
[selectivity_pos_max, idxPeak] = max(+1*selectivity_pos,[],1); [~,orderPeak] = sort(idxPeak); 
selectivity_pos = selectivity_pos./selectivity_pos_max; selectivity_pos = selectivity_pos(:,orderPeak);

sig_neg = list_su_p(logical(squeeze(((p_matrix_p(1,1,:)<0.05).*(p_matrix_p(2,1,:)<0))+((p_matrix_p(1,2,:)<0.05).*(p_matrix_p(2,2,:)<0)))));
selectivity_neg = selectivity_t_p(:,sig_neg); selectivity_neg = selectivity_neg(:,ismember(sig_neg, find(isPyr_p)));
[selectivity_neg_max, idxPeak] = max(-1*selectivity_neg,[],1); [~,orderPeak] = sort(idxPeak); 
selectivity_neg = selectivity_neg./selectivity_neg_max; selectivity_neg = selectivity_neg(:,orderPeak);

figure; set(gcf,'color','w');
subplot(211); imagesc(selectivity_pos'); colormap(redblue); caxis([-1 1]); colorbar; 
xticks([1,501,1001,1501,2001]); xticklabels([-1,-0.5,0,0.5,1]);
title('Normalized selectivity'); ylabel('Left-selective single units'); xline(1001, '--')
subplot(212); imagesc(selectivity_neg'); colormap(redblue); caxis([-1 1]); colorbar;
xticks([1,501,1001,1501,2001]); xticklabels([-1,-0.5,0,0.5,1]); 
xlabel('Time from cue onset (s)'); ylabel('Right-selective single units'); xline(1001, '--')

% visualization of spike rasters and PSTHs
% figure, hist(squeeze(p_matrix_p(2,1,:)))
% [~,idx_all] = sort(squeeze(p_matrix_p(2,1,:)));
% idx = idx_all(end-6);
% idSess(list_su_p(idx))
% list_su_p(idx) - sum(idSess<idSess(list_su_p(idx)))

[~,idx_all] = sort(selectivity_correct_p(list_su_p));
idx = idx_all(3);
idSess(list_su_p(idx))
list_su_p(idx) - sum(idSess<idSess(list_su_p(idx)))

idxSess = idSess(list_su_p(idx));
sess = load_ephys_session(char(dir_ephys(idxSess)));
load(char(dir_bpod(idxSess)));
eventTimes = sess.eventTimesAll(sess.eventLabel==-1);
numTrial = numel(ts_TTL); eventTimes = eventTimes(1:numTrial);
numSmooth = 200;
%sess.idClu(list_su_p(idx))
plot_raster_dual(eventTimes(trialMatrix(:,1)==1), eventTimes(trialMatrix(:,4)==1), [-1 1 binSize numSmooth], sess.spike, idClu_p(idSess==idxSess), sess.list_su, sess.isPyr)


%% export for data-driven modeling

idxSess = 9; t_cutoff = 2000;

sess = load_ephys_session(char(dir_ephys(idxSess)));
load(char(dir_bpod(idxSess)));
eventTimes = sess.eventTimesAll(sess.eventLabel==-1);
numTrial = numel(ts_TTL); eventTimes = eventTimes(1:numTrial);
f1 = fitlm(ts_TTL(1:numTrial),eventTimes(1:end));
Rsquared = f1.Rsquared.Ordinary;
if Rsquared < 0.99999
    error('Check trial alignment!');
end

if t_cutoff ~= 0
    trial_cutoff = max(find(ts_TTL + 30 < t_cutoff));
    eventTimes = eventTimes(1:trial_cutoff); trialMatrix = trialMatrix(1:trial_cutoff,:); 
    reactionTime = reactionTime(1:trial_cutoff); transitionCount = transitionCount(1:trial_cutoff); ts_TTL = ts_TTL(1:trial_cutoff);
end

binSize = 0.010; numSmooth = 1;
preCueDur  = -2; postCueDur = 1;
spike_bxtxn = bin_spikes(eventTimes, [preCueDur postCueDur binSize numSmooth], sess.spike);

idClu = sess.idClu;
eventTimesAll = sess.eventTimesAll;
eventLabel = sess.eventLabel;

save('10ms_ANM_0118_20210511.mat', 'spike_bxtxn', 'idClu', 'trialMatrix', 'reactionTime', 'transitionCount', 'ts_TTL', 'eventTimesAll', 'eventLabel', 't_cutoff');




