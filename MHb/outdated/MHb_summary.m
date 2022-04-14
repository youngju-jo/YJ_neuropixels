
%% Directories into "cohort_info"

%% Tac1-Cre

% 170
% 20210905: MHb(R) / hStripe0 / 3700-3600 / CM-DiI / no /
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0170_20210905_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210905_113925.mat');
s.info = '170_20210905';
cohort_info{1} = s;

% 171
% 20210920: MHb(R) / hStripe0 / 3600-3500 / CM-DiI / yes / with Sam
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210920_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210920_164219.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210920_161237.mat');
s.info = '171_20210920';
cohort_info{2} = s;
% 20210922: MHb(R) / hStripe0 / 3600-3500 / DiD / yes / with Jalal
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210922_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210922_175548.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210922_173653.mat');
s.info = '171_20210922';
cohort_info{3} = s;
% (T) 20210926: MHb(L) / hStripe0 / 3650-3350 / CM-DiI / yes / 
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210926_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210926_221943.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210926_220008.mat');
s.info = '171_20210926';
cohort_info{4} = s;

% 173
% (T) 20210928: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20210928_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20210928_143149.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20210928_135940.mat');
s.info = '173_20210928';
cohort_info{5} = s;
% 20211001
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211001_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211001_181628.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211001_174346.mat');
s.info = '173_20211001';
cohort_info{6} = s;
% 20211002
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211002_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211002_135247.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211002_132401.mat');
s.info = '173_20211002';
cohort_info{7} = s;
% 20211004
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211004_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211004_181616.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211004_173828.mat');
s.info = '173_20211004';
cohort_info{8} = s;

% 174
% (?) 20210910: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes (594 nm DPSS laser) / power fluctuation in DPSS laser
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210910_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210910_160827.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210910_153646.mat');
s.info = '174_20210910';
cohort_info{9} = s;
% (T) 20210915: MHb(R) / hStripe0 / 3650-3550 / DiD / yes (637 nm, 100 mW) / started fiber water-dipping
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210915_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210915_175119.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210915_172533.mat');
s.info = '174_20210915';
cohort_info{10} = s;

% 178

% 20211115
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211115_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211115_224416.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211115_214142.mat');
s.info = '178_20211115';
cohort_info{11} = s;

% 20211116
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211116_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211116_230917.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211116_221429.mat');
s.info = '178_20211116';
cohort_info{12} = s;

% 20211118
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211118_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211118_165608.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211118_162416.mat');
s.info = '178_20211118';
cohort_info{13} = s;

% 20211120
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211120_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211120_224826.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211120_215953.mat');
s.info = '178_20211120';
cohort_info{14} = s;

% 20211121
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211121_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211121_222346.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211121_215217.mat');
s.info = '178_20211121';
cohort_info{15} = s;

% 180

% 20211121
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0180_20211121_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\Optostim1pShort\Session Data\ANM_0180_Optostim1pShort_20211121_172700.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\NoImageCueLightReward\Session Data\ANM_0180_NoImageCueLightReward_20211121_163129.mat');
s.info = '180_20211121';
cohort_info{16} = s;

% 181

% 20211118
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211118_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\Optostim1pShort\Session Data\ANM_0181_Optostim1pShort_20211118_223529.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211118_214411.mat');
s.info = '181_20211118';
cohort_info{17} = s;

% 20211120
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211120_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\Optostim1pShort\Session Data\ANM_0181_Optostim1pShort_20211120_172154.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211120_162734.mat');
s.info = '181_20211120';
cohort_info{18} = s;




%% TH-Cre (in progress)

%
% 176
% 20211105
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0176_20211105_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0176\Optostim1p\Session Data\ANM_0176_Optostim1p_20211105_230420.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0176\NoImageCueLightReward\Session Data\ANM_0176_NoImageCueLightReward_20211105_215248.mat');
s.info = '176_20211105';
cohort_info{1} = s;

%
% 177
% 20211106
s.baseDir = 'C:\SGL_DATA\output\catgt_ANM_0177_20211106_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0177\Optostim1p\Session Data\ANM_0177_Optostim1p_20211106_150900.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0177\NoImageCueLightReward\Session Data\ANM_0177_NoImageCueLightReward_20211106_144556.mat');
s.info = '177_20211106';
cohort_info{1} = s;

%
% 177
% 20211107
s.baseDir = 'C:\SGL_DATA\output\catgt_ANM_0177_20211107_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0177\Optostim1p\Session Data\ANM_0177_Optostim1p_20211107_160919.mat');
s.d_bhvr = NaN;
s.info = '177_20211107';
cohort_info{1} = s;

%
% 177
% 20211107
s.baseDir = 'C:\SGL_DATA\output\catgt_ANM_0177_20211107_behavior_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0177\Optostim1p\Session Data\ANM_0177_Optostim1p_20211107_225053.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0177\NoImageCueLightReward\Session Data\ANM_0177_NoImageCueLightReward_20211107_220946.mat');
s.info = '177_20211107';
cohort_info{1} = s;

%
% 182
% 20211109
s.baseDir = 'C:\SGL_DATA\output\catgt_ANM_0182_20211109_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0182\Optostim1p\Session Data\ANM_0182_Optostim1p_20211109_120800.mat');
s.d_bhvr = NaN;
s.info = '182_20211109';
cohort_info{1} = s;

%
% 178
% 20211114
s.baseDir = 'C:\SGL_DATA\output\catgt_ANM_0178_20211114_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211114_223214.mat');
s.d_bhvr = NaN;
s.info = '178_20211114_1';
cohort_info{1} = s;


%% perturbation experiments

% 188
% 20211202
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0188_20211202_behavior_stim_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\Optostim1pShort\Session Data\ANM_0188_Optostim1pShort_20211202_175829.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightRewardStim1p\Session Data\ANM_0188_NoImageCueLightRewardStim1p_20211202_170431.mat');
s.info = '188_20211202';
cohort_info{1} = s;

% 20211203
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0188_20211203_behavior_stim_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\Optostim1pShort\Session Data\ANM_0188_Optostim1pShort_20211203_151948.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightRewardStim1p\Session Data\ANM_0188_NoImageCueLightRewardStim1p_20211203_142222.mat');
s.info = '188_20211202';
cohort_info{2} = s;

% 190
% 20211202
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0190_20211202_behavior_stim_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\Optostim1pShort\Session Data\ANM_0190_Optostim1pShort_20211203_002346.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightRewardStim1p\Session Data\ANM_0190_NoImageCueLightRewardStim1p_20211202_214837.mat');
s.info = '190_20211202';
cohort_info{3} = s;

% 20211203
s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0190_20211203_behavior_stim_optotagging_001_g0';
s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\Optostim1pShort\Session Data\ANM_0190_Optostim1pShort_20211203_165827.mat');
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightRewardStim1p\Session Data\ANM_0190_NoImageCueLightRewardStim1p_20211203_161012.mat');
s.info = '190_20211203';
cohort_info{4} = s;


%% septum

% 170_20210906
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0170_20210906_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210906_155246.mat');
s.info = '170_20210906';
cohort_info{1} = s;

% 172_20210907
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0172_20210907_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\NoImageCueLightReward\Session Data\ANM_0172_NoImageCueLightReward_20210907_174320.mat');
s.info = '172_20210907';
cohort_info{2} = s;

% 174_20210909
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0174_20210909_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210909_163438.mat');
s.info = '174_20210909';
cohort_info{3} = s;

% 176_20211108
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0176_20211108_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0176\NoImageCueLightReward\Session Data\ANM_0176_NoImageCueLightReward_20211108_223301.mat');
s.info = '176_20211108';
cohort_info{4} = s;

% 178_20211122
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211122_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211122_125121.mat');
s.info = '178_20211122';
cohort_info{5} = s;

% 179_20211121
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0179_20211121_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0179\NoImageCueLightReward\Session Data\ANM_0179_NoImageCueLightReward_20211122_015802.mat');
s.info = '179_20211121';
cohort_info{6} = s;

% 180_20211122
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0180_20211122_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\NoImageCueLightReward\Session Data\ANM_0180_NoImageCueLightReward_20211122_141557.mat');
s.info = '180_20211122';
cohort_info{7} = s;

% 181_20211121
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211121_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211122_041526.mat');
s.info = '181_20211121';
cohort_info{8} = s;

% 188_20211130
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0188_20211130_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightReward\Session Data\ANM_0188_NoImageCueLightReward_20211130_172212.mat');
s.info = '188_20211130';
cohort_info{9} = s;

% 190_20211130
s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0190_20211130_behavior_001_g0';
s.d_stim = NaN;
s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightReward\Session Data\ANM_0190_NoImageCueLightReward_20211130_214059.mat');
s.info = '190_20211130';
cohort_info{10} = s;



%% Load common files

load('C:\Users\YoungJu Jo\Dropbox\Ephys\YJ_ephys_npx\hStripe0.mat');

tv = readNPY('template_volume_10um.npy'); % grey-scale "background signal intensity"
% tv = max(tv(:)) - tv; % for color inversion
av = readNPY('annotation_volume_10um_by_index.npy'); % the number at each pixel labels the area, see note below
st = loadStructureTree('structure_tree_safe_2017.csv'); % a table of what all the labels mean


%% Load and process data

for idx_sess = 1:numel(cohort_info)
    
    tic; 
    s = load_ephys_session(cohort_info{idx_sess}.baseDir);
    
    
    % quality control (pre-analysis)
    
    QC_fr = (s.metrics{:,3} > 0.2);
    %QC_isiviolation = (s.metrics{:,5} < 0.01);
    %QC_amplitudecutoff = (s.metrics{:,6} <= 0.1);
    %QC_presenceratio = (s.metrics{:,4} > 0.8);
    
    QC_passed = logical(QC_fr);
    %QC_passed = logical(QC_isiviolation);
    %QC_passed = logical(QC_isiviolation .* QC_amplitudecutoff);
    %QC_passed = logical(QC_isiviolation .* QC_amplitudecutoff .* QC_presenceratio);

    s.list_su = s.list_su(QC_passed);
    s.spike_su = s.spike_su(QC_passed);
    s.sites_su = s.sites_su(QC_passed);

    s.metrics = s.metrics(QC_passed,:);
    s.wf = s.wf(QC_passed,:,:);
    
    if isfield(s, 'wf_stim')
        s.metrics_stim = s.metrics_stim(QC_passed,:);
        s.wf_stim = s.wf_stim(QC_passed,:,:);
    end
    
    numUnit = numel(s.spike_su);
    
    
    % coordinate/region for individual units
    
    if isfield(s, 'registered_coord_shank0')

        shankind_ = shankind(connected==1);
        %if idx_sess == 4  % hardcoded: 171_0926 has channel 112 (matlab indexing) disabled due to noise level
        if cohort_info{idx_sess}.info == '171_20210926'
            shankind_(112) = [];
        elseif cohort_info{idx_sess}.info == '178_20211115'
            shankind_(174) = [];
        elseif cohort_info{idx_sess}.info == '178_20211116'
            shankind_([150, 210]) = [];
        end

        s.channel_coord = zeros(size(s.channel_positions,1),3);
        s.channel_coord(shankind_==0,:) = s.registered_coord_shank0;
        s.channel_coord(shankind_==1,:) = s.registered_coord_shank1;
        s.channel_coord(shankind_==2,:) = s.registered_coord_shank2;
        s.channel_coord(shankind_==3,:) = s.registered_coord_shank3;

        s.channel_region = zeros(numel(s.channel_positions,1),1);
        s.channel_region(shankind_==0,:) = s.registered_region_shank0;
        s.channel_region(shankind_==1,:) = s.registered_region_shank1;
        s.channel_region(shankind_==2,:) = s.registered_region_shank2;
        s.channel_region(shankind_==3,:) = s.registered_region_shank3;

        s.unit_coord = s.channel_coord(s.sites_su+1,:);
        s.unit_region = s.channel_region(s.sites_su+1,:);
        
    elseif isfield(s, 'registered_coord')
        
        s.channel_coord = s.registered_coord;
        s.channel_region = s.registered_region;
        
        s.unit_coord = s.channel_coord(s.sites_su+1,:);
        s.unit_region = s.channel_region(s.sites_su+1,:);
    
    end
    
    
    % optotagging
    
    if isfield(s, 'wf_stim')
        
        % stim conditions
        
        trial_width = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.trial_width;
        trial_freq = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.trial_freq;
        trial_power = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.trial_power;
        s.trial_width = trial_width; s.trial_freq = trial_freq; s.trial_power = trial_power;
        
        list_width = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.list_width;
        list_freq = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.list_freq;
        list_power = cohort_info{idx_sess}.d_stim.SessionData.TrialInfo.list_power;
        s.list_width = list_width; s.list_freq = list_freq; s.list_power = list_power;

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
        s.pulse_width = pulse_width; s.pulse_freq = pulse_freq; s.pulse_power = pulse_power; s.len_pulse = len_pulse;
        
        % spike-associated latency test (SALT)
        
        idxPulse = ((pulse_width==0.010).*(pulse_freq==10).*(pulse_power==5))==1;  % stim condition for optotagging 
        salt_p_all = zeros(length(s.spike_su),1); salt_I_all = zeros(length(s.spike_su),1);
        for idx_su = 1:length(s.spike_su)
            count_baseline = bin_spikes(s.TTL_stimblock-0.9, [0 0.8-0.001 0.001 1], s.spike_su(idx_su));
            count_test = bin_spikes(s.TTL_stim(idxPulse), [0 0.025 0.001 1], s.spike_su(idx_su));  % mean(sum(count_test,2))  % hardcoded 25 ms window
            [salt_p, salt_I] = salt(count_baseline,count_test,0.001,0.020);  % 20 ms window for perturbation experiments (INTRSECT construct)
            salt_p_all(idx_su) = salt_p; salt_I_all(idx_su) = salt_I;
        end
        s.salt_p = salt_p_all; s.salt_I = salt_I_all;
        
        % spike probability, latency, and jitter
        
        s.spike_probability = NaN(numUnit,1); s.spike_latency = NaN(numUnit,1); s.spike_jitter = NaN(numUnit,1);
        for idx_unit = 1:numUnit
            x = s.spike_su{idx_unit};
            if length(x) < 2
                continue;
            end
            ind = interp1(x,1:length(x),s.TTL_stim(idxPulse),'next');
            ind(isnan(ind)) = numel(x); % in case of no spike after a timestamp
            timestamp_to_spike = x(ind) - s.TTL_stim(idxPulse);
            is_spike_in_window = logical((timestamp_to_spike > 0) .* (timestamp_to_spike < 0.025));  % hardcoded 25 ms window
            if sum(is_spike_in_window) == 0
                continue;
            else
                s.spike_probability(idx_unit) = sum(is_spike_in_window) / sum(idxPulse);
                latency_data = timestamp_to_spike(is_spike_in_window);
                s.spike_latency(idx_unit) = mean(latency_data);
                s.spike_jitter(idx_unit) = std(latency_data);
            end
        end
        
        % waveform correlation
        s.wf_corr = diag(corr(reshape(s.wf,numel(s.list_su),[])', reshape(s.wf_stim,numel(s.list_su),[])'));
        
    else
        
        s.salt_p = NaN(numUnit,1);
        s.salt_I = NaN(numUnit,1);
        s.spike_probability = NaN(numUnit,1);
        s.spike_latency = NaN(numUnit,1);
        s.spike_jitter = NaN(numUnit,1);
        s.wf_corr = NaN(numUnit,1);

    end
    
    
    % behavior
    
    trialIdx = find(cohort_info{idx_sess}.d_bhvr.SessionData.TrialTypes~=2);
    nTrials = length(trialIdx);
    trialTypes = cohort_info{idx_sess}.d_bhvr.SessionData.TrialTypes(trialIdx);
    % sum(d.SessionData.TrialTypes~=0)/numel(d.SessionData.TrialTypes)

    trialMatrix = nan(nTrials,1);   % 1: lick-reward, 2: lick-noreward, 3: nolick / 0: perturbation
    reactionTime = nan(nTrials,1);
    ts_TTL = nan(nTrials,1);

    for t=1:nTrials
        x = cohort_info{idx_sess}.d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.States;
        y = cohort_info{idx_sess}.d_bhvr.SessionData.RawEvents.Trial{trialIdx(t)}.Events;

        if ~isnan(x.Reward(1))
            trialMatrix(t) = 1;
            reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
        elseif ~isnan(x.NoReward(1))
            trialMatrix(t) = 2;
            reactionTime(t) = x.DeliverCue(2) - x.DeliverCue(1);
        %elseif ~isnan(x.OptoStim(1))
        %    trialMatrix(t) = 0;
        else
            trialMatrix(t) = 3;
        end

        ts_TTL(t) = cohort_info{idx_sess}.d_bhvr.SessionData.TrialStartTimestamp(trialIdx(t)) + x.TTL(2);  % TTL offset (= cue onset)

    end
    
    s.trialMatrix = trialMatrix;
    s.reactionTime = reactionTime;
    %s.ts_TTL = ts_TTL;

    % figure, plot(s.TTL_bhvrOff(1:nTrials), ts_TTL);
    % disp(corr(s.TTL_bhvrOff(1:nTrials), ts_TTL)>0.99999);
    f1 = fitlm(ts_TTL,s.TTL_bhvrOff(1:nTrials));
    Rsquared = f1.Rsquared.Ordinary;
    if Rsquared < 0.99999
        error('Check trial alignment!');
    end
    
    TTL_trial_all = s.TTL_bhvrOff(1:numel(trialMatrix));
    
    TTL_trial_rw = TTL_trial_all(trialMatrix==1);
    [rtRW,idxSortRW] = sort(reactionTime(trialMatrix==1));
    TTL_trial_rw = TTL_trial_rw(idxSortRW);

    TTL_trial_nr = TTL_trial_all(trialMatrix==2);
    [rtNR,idxSortNR] = sort(reactionTime(trialMatrix==2));
    TTL_trial_nr = TTL_trial_nr(idxSortNR);

    % binning
    TTL_rw = []; TTL_nr = [];
    for t = 1:nTrials
        if trialMatrix(t)==1
            TTL_rw = [TTL_rw TTL_trial_all(t)+reactionTime(t)];
        elseif trialMatrix(t)==2
            TTL_nr = [TTL_nr TTL_trial_all(t)+reactionTime(t)];      
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
    
    s.TTL_trial_all = TTL_trial_all;
    s.TTL_rw = TTL_rw; %unsorted
    s.TTL_nr = TTL_nr; %unsorted
    s.TTL_trial_rw = TTL_trial_rw;
    s.TTL_trial_nr = TTL_trial_nr;
    s.rtRW = rtRW;
    s.rtNR = rtNR;
    
    s.binned_spike_cue_pre = int32(squeeze(bin_spikes(TTL_trial_all, [-0.4999 0 0.5 1], s.spike_su)));
    s.binned_spike_cue = int32(squeeze(bin_spikes(TTL_trial_all, [0 0.4999 0.5 1], s.spike_su)));
    %s.binned_spike_lick_pre = int32(squeeze(bin_spikes(TTL_lick, [-0.1999 0 1 1], s.spike_su)));
    %s.binned_spike_lick_post = int32(squeeze(bin_spikes(TTL_lick, [0 0.1999 1 1], s.spike_su)));
    s.binned_spike_rw = int32(squeeze(bin_spikes(TTL_rw, [0 2.9999 3 1], s.spike_su)));
    s.binned_spike_nr = int32(squeeze(bin_spikes(TTL_nr, [0 2.9999 3 1], s.spike_su)));
    
    
    % normalization
    
    binned_spike = bin_spikes([0], [0 s.TTL_trial_all(end) + 10 0.010 20], s.spike_su);

    s.unit_mean = squeeze(mean(squeeze(binned_spike),1));
    s.unit_std = squeeze(std(squeeze(binned_spike),1));
    
    %
    cohort{idx_sess} = s;
    
    toc;

end



%% Aggregate single-unit metrics across sessions

cohort_unit_sess = [];
cohort_unit_id = [];
cohort_unit_coord = [];
cohort_unit_region = [];
cohort_unit_fr = [];
cohort_unit_duration = [];
cohort_unit_PTratio = [];
cohort_unit_acutoff = [];
cohort_unit_isiviolation = [];

cohort_unit_salt_I = [];
cohort_unit_wf_corr = [];
cohort_unit_spike_probability = [];
cohort_unit_spike_latency = [];
cohort_unit_spike_jitter = [];

cohort_unit_cue_pre = [];
cohort_unit_cue = [];
cohort_unit_cue_fold = [];
cohort_unit_rw = [];
%cohort_unit_rw_across_trials = {};
cohort_unit_nr = [];
cohort_unit_selectivity = [];

cohort_unit_wf_features = [];

for idx_sess = 1:numel(cohort_info)
    
    cohort_unit_sess = [cohort_unit_sess; idx_sess*ones(size(cohort{idx_sess}.list_su,1),1)];
    cohort_unit_id = [cohort_unit_id; cohort{idx_sess}.list_su];
    cohort_unit_coord = [cohort_unit_coord; cohort{idx_sess}.unit_coord];
    cohort_unit_region = [cohort_unit_region; cohort{idx_sess}.unit_region];
    cohort_unit_fr = [cohort_unit_fr; cohort{idx_sess}.metrics{:,3}];
    cohort_unit_duration = [cohort_unit_duration; cohort{idx_sess}.metrics{:,19}];
    cohort_unit_PTratio = [cohort_unit_PTratio; cohort{idx_sess}.metrics{:,21}];
    cohort_unit_acutoff = [cohort_unit_acutoff; cohort{idx_sess}.metrics{:,6}];
    cohort_unit_isiviolation = [cohort_unit_isiviolation; cohort{idx_sess}.metrics{:,5}];
    %s.metrics{:,19} % 3: firing rate, 19: duration, 21: PT ratio, 25: spread
    
    cohort_unit_salt_I = [cohort_unit_salt_I; cohort{idx_sess}.salt_I];
    %cohort_unit_wf_corr = [cohort_unit_wf_corr; cohort{idx_sess}.wf_corr];
    cohort_unit_spike_probability = [cohort_unit_spike_probability; cohort{idx_sess}.spike_probability];
    cohort_unit_spike_latency = [cohort_unit_spike_latency; cohort{idx_sess}.spike_latency];
    cohort_unit_spike_jitter = [cohort_unit_spike_jitter; cohort{idx_sess}.spike_jitter];
    
    precue_avg = mean(cohort{idx_sess}.binned_spike_cue,1)'/0.5;
    cue_avg = mean(cohort{idx_sess}.binned_spike_cue,1)'/0.5;
    cohort_unit_cue_pre = [cohort_unit_cue_pre; precue_avg];
    cohort_unit_cue = [cohort_unit_cue; cue_avg];
    cohort_unit_cue_fold = [cohort_unit_cue; cue_avg./precue_avg];
    
    rw_avg = mean(cohort{idx_sess}.binned_spike_rw,1)'/3;
    nr_avg = mean(cohort{idx_sess}.binned_spike_nr,1)'/3;
    cohort_unit_rw = [cohort_unit_rw; rw_avg];
    %cohort_unit_rw_across_trials = {cohort_unit_rw_across_trials{:}; num2cell(cohort{idx_sess}.binned_spike_rw'/3,2)};
    cohort_unit_nr = [cohort_unit_nr; nr_avg];
    cohort_unit_selectivity = [cohort_unit_selectivity; (rw_avg-nr_avg)./(rw_avg+nr_avg+0.000001)];
    
    cohort_unit_wf_features = [cohort_unit_wf_features; cohort{idx_sess}.metrics{:,19:27}];
    
end

% filter units by QC - can we do (QC_thres) in a programmable way, rather
% than manually adding...

QC_thres_1 = cohort_unit_acutoff < 0.51;
QC_thres_2 = cohort_unit_PTratio < 5; % >1: putative axonal spikes
QC_thres_3 = cohort_unit_isiviolation < 0.5;

QC_thres = logical(QC_thres_1 .* QC_thres_2 .* QC_thres_3);

cohort_unit_sess = cohort_unit_sess(QC_thres);
cohort_unit_id = cohort_unit_id(QC_thres);
cohort_unit_coord = cohort_unit_coord(QC_thres,:);
cohort_unit_region = cohort_unit_region(QC_thres);
cohort_unit_fr = cohort_unit_fr(QC_thres);
cohort_unit_duration = cohort_unit_duration(QC_thres);
cohort_unit_PTratio = cohort_unit_PTratio(QC_thres);
cohort_unit_acutoff = cohort_unit_acutoff(QC_thres);
cohort_unit_isiviolation = cohort_unit_isiviolation(QC_thres);

cohort_unit_salt_I = cohort_unit_salt_I(QC_thres);
%cohort_unit_wf_corr = cohort_unit_wf_corr(QC_thres);
cohort_unit_spike_probability = cohort_unit_spike_probability(QC_thres);
cohort_unit_spike_latency = cohort_unit_spike_latency(QC_thres);
cohort_unit_spike_jitter = cohort_unit_spike_jitter(QC_thres);

cohort_unit_cue_pre = cohort_unit_cue_pre(QC_thres);
cohort_unit_cue = cohort_unit_cue(QC_thres);
cohort_unit_cue_fold = cohort_unit_cue_fold(QC_thres);

cohort_unit_rw = cohort_unit_rw(QC_thres);
cohort_unit_nr = cohort_unit_nr(QC_thres);
cohort_unit_selectivity = cohort_unit_selectivity(QC_thres);

cohort_unit_wf_features = cohort_unit_wf_features(QC_thres,:);


%tagged_unit = (cohort_unit_salt_I > 0.2) .* (cohort_unit_wf_corr > 0.3) .* (cohort_unit_spike_probability > 0.3) .* (cohort_unit_spike_latency < 0.015);
tagged_unit = (cohort_unit_salt_I > 0.2) .* (cohort_unit_spike_probability > 0.3) .* (cohort_unit_spike_latency < 0.020);

%{

sum((cohort_unit_sess==9).*(cohort_unit_region==483))

sum(tagged_unit)
sum(cohort_unit_region==483)

sum(tagged_unit.*(cohort_unit_region==483))


tmp = [cohort_unit_sess(cohort_unit_region==483) cohort_unit_id(cohort_unit_region==483) find(cohort_unit_region==483)];

figure, plot(cohort_unit_selectivity(cohort_unit_region==483))

sum(cohort_unit_region==483) %MHb
sum(cohort_unit_region==186) %LHb

median(cohort_unit_fr(cohort_unit_region==483))
median(cohort_unit_fr(cohort_unit_region==186))

mean(cohort_unit_duration(cohort_unit_region==483))
mean(cohort_unit_duration(cohort_unit_region==186))

mean(cohort_unit_cue(cohort_unit_region==483))
mean(cohort_unit_cue(cohort_unit_region==186))

mean(cohort_unit_rw(cohort_unit_region==483))
mean(cohort_unit_rw(cohort_unit_region==186))

mean(cohort_unit_nr(cohort_unit_region==483))
mean(cohort_unit_nr(cohort_unit_region==186))

median(cohort_unit_selectivity(cohort_unit_region==483))
median(cohort_unit_selectivity(cohort_unit_region==186))

mean(cohort_unit_selectivity(cohort_unit_region==483)>0)
mean(cohort_unit_selectivity(cohort_unit_region==483)<0)
%}

%% 2D atlas visualization -- IMPORTANT: "within_interval" line has some bugs (the thickness should be changed to update automatically)

% Hb-cropped coronal slices w/ region colors & tagged MHb units (flipped)

APi = 120; %80/-90
APf = APi + 140; APc = linspace(APi,APf,15); APt = APc - 5;
cohort_unit_coord_display = cohort_unit_coord/10 + 0 * randn(size(cohort_unit_coord));

for idx = 1:size(cohort_unit_coord_display,1)
    if cohort_unit_coord_display(idx,1) < 570
        cohort_unit_coord_display(idx,1) = 1140 - cohort_unit_coord_display(idx,1);
    end
end

cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1) - 570 + 20;
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3) - 230;
figure;
for ii = 1:15
    subplot(3,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),231:end-350,571-20:end-460)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+10));
    
    %{
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region~=483).*(cohort_unit_region~=186)),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region==186)),:); %LHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region==483)),:); %MHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',1); 
    %}
    
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*(cohort_unit_region~=483).*(cohort_unit_region~=186)),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',0.2);
    registered_coord_display_interval = cohort_unit_coord_display(within_interval.*cohort_unit_region==186,:); %LHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',0.2);
    registered_coord_display_interval = cohort_unit_coord_display(within_interval.*cohort_unit_region==483,:); %MHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',0.2);
    
    hold off;
end
set(gcf,'color','w');

%

% Hb-cropped coronal slices w/ region colors - 200 um sections

APi = 130; %80/-90
APf = APi + 80; APc = linspace(APi,APf,5); APt = APc - 10;
cohort_unit_coord_display = cohort_unit_coord/10 + 0 * randn(size(cohort_unit_coord));

for idx = 1:size(cohort_unit_coord_display,1)
    if cohort_unit_coord_display(idx,1) < 570
        cohort_unit_coord_display(idx,1) = 1140 - cohort_unit_coord_display(idx,1);
    end
end

cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1) - 570 + 20;
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3) - 230;
figure;
for ii = 1:5
    subplot(1,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),231:end-350,571-20:end-460)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+20));
    
    %{
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region~=483).*(cohort_unit_region~=186)),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region==186)),:); %LHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*tagged_unit.*(cohort_unit_region==483)),:); %MHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',1); 
    %}
    
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*(cohort_unit_region~=483).*(cohort_unit_region~=186)),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',0.2);
    registered_coord_display_interval = cohort_unit_coord_display(within_interval.*cohort_unit_region==186,:); %LHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',0.2);
    registered_coord_display_interval = cohort_unit_coord_display(within_interval.*cohort_unit_region==483,:); %MHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',0.2);
    
    hold off;
end
set(gcf,'color','w');

%

% Whole coronal slices for septum / 564, 581
APi = -80;
APf = APi + 180; APc = linspace(APi,APf,10); APt = APc - 10;
cohort_unit_coord_display = cohort_unit_coord/10 + 1.5*randn(size(cohort_unit_coord));
cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1);
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3);
figure;
for ii = 1:5
    subplot(1,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),:,:)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+20));

    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*(cohort_unit_region~=581).*(cohort_unit_region~=564)),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',0.1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*(cohort_unit_region==581)),:); %TRS
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',0.1);
    registered_coord_display_interval = cohort_unit_coord_display(logical(within_interval.*(cohort_unit_region==564)),:); %%MS
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',0.1);
    
    hold off;
end
set(gcf,'color','w');


%% event-aligned rasters (for perturbation experiments)

tagged_MHb = find(tagged_unit.*(cohort_unit_region==483)); 
%tagged_MHb = find(cohort_unit_region==186);

idx = 100;

idx_sess = cohort_unit_sess(tagged_MHb(idx));
idx_unit = find(cohort{idx_sess}.list_su==cohort_unit_id(tagged_MHb(idx)));

figure; set(gcf,'color','w');

% ramping
subplot(222);
plot(single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3, 'Color', [0 0.5 0]); xlim([-5 size(cohort{idx_sess}.binned_spike_rw,1)+5]);
xlabel('Trial'); ylabel('Firing rate (Hz)')

% raster

unitNum = idx_unit;

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
    

    
    
    
% stim

figure; set(gcf,'color','w');
idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 10 ms'); xlabel('Time from pulse train onset'); set(gca,'ytick',[]);


idx_sess = 3;
TTL_trial = cohort{idx_sess}.TTL_bhvrOff(1:numel(cohort{idx_sess}.trialMatrix));
plot_raster(TTL_trial(trialMatrix==0), [-0.5 1.0 0.001 50], cohort{idx_sess}.spike_su(cohort{idx_sess}.unit_region==483), cohort{idx_sess}.list_su(cohort{idx_sess}.unit_region==483));
% gate by dorsal/ventral, optotagged/not within MHb


%% single-unit responses - 1, 14, 18?

tagged_MHb = find(tagged_unit.*(cohort_unit_region==483)); 

idx = 18;

idx_sess = cohort_unit_sess(tagged_MHb(idx));
idx_unit = find(cohort{idx_sess}.list_su==cohort_unit_id(tagged_MHb(idx)));

figure; set(gcf,'color','w');

% ramping
subplot(222);
plot(single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3, 'Color', [0 0.5 0]); xlim([-5 size(cohort{idx_sess}.binned_spike_rw,1)+5]);
xlabel('Trial'); ylabel('Firing rate (Hz)')

% raster

unitNum = idx_unit;

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


% stim
%{
figure; set(gcf,'color','w');
idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
generate_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.2 1.2 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su, idx_unit);
stim_time = 0:(1/10):1; stim_time = stim_time(1:end-1);
for idx_stim = 1:length(stim_time)
    xline(stim_time(idx_stim),'color',[1,0,0],'alpha',0.2,'LineWidth',0.4);
end
title('Pulse width = 10 ms'); xlabel('Time from pulse train onset'); set(gca,'ytick',[]);
%}

% waveform
wf_sess = cohort{idx_sess}.wf(:,:,1:60); wf_sess_stim = cohort{idx_sess}.wf_stim(:,:,1:60);
wf_sess(:,385,:) = []; wf_sess_stim(:,385,:) = [];
wf_sess(:,connected==0,:) = []; wf_sess_stim(:,connected==0,:) = [];
if idx_sess == 4  % hardcoded: 171_0926 has channel 112 (matlab indexing) disabled due to noise level
    wf_sess(:,112,:) = []; wf_sess_stim(:,112,:) = [];
end
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


%figure,
subplot(224)
for cidx = 1:size(wf_unit,1)
    plot(wf_vis_x(cidx,:),wf_vis_y(cidx,:), 'Color', [0 0 0 0.7], 'LineWidth', 2); hold on;
    %plot(wf_vis_x_stim(cidx,:),wf_vis_y_stim(cidx,:), 'Color', [0.8 0 0 0.7], 'LineWidth', 2); hold on;
end
unit_center = channel_positions_sess(cohort{idx_sess}.sites_su(idx_unit),:);
xlim([unit_center(1)-40 unit_center(1)+60]); set(gca,'xtick',[]);
ylim([unit_center(2)-80 unit_center(2)+80]); set(gca,'ytick',[]);



%% peak-sorted activity - perhaps plot selectivity / valence as well? - z-scroing after smoothing?

%{
idx_sess = 5;
test = squeeze(bin_spikes(cohort{idx_sess}.TTL_trial_all, [-1 3 0.010 1], cohort{idx_sess}.spike_su));
%test = squeeze(bin_spikes(cohort{idx_sess}.TTL_rw, [-2 4 0.010 1], cohort{idx_sess}.spike_su));
for ii = 1:size(test,3)
    test(:,:,ii) = (test(:,:,ii) - cohort{idx_sess}.unit_mean(ii))/cohort{idx_sess}.unit_std(ii);
end

% compute a filter, which will be used to smooth the firing rate
filter = gaussmf(-50:50,[10 0]); filter(1:50) = 0; filter = filter/sum(filter); 
%dt = post(3)-post(2); fr = spiketrain/dt;
%smooth_fr = conv(fr,filter,'same');
%smooth_fr = conv(test,filter,'same');
for ii = 1:size(test,1)
    for jj = 1:size(test,3)
        test(ii,:,jj) = conv(test(ii,:,jj),filter,'same');
    end
end


test1 = squeeze(mean(test,1))';

[m,idx] = max(test1');
[~,rsort] = sort(idx);
trial_avg_data_sorted = test1(rsort,:);
figure, imagesc(trial_avg_data_sorted);
%figure, imagesc(squeeze(mean(test,1))');


%test1 = mean(test,3);
%figure, imagesc(mean(test,3));

%}

% All
filter = gaussmf(-200:200,[20 0]); filter(1:200) = 0; filter = filter/sum(filter); 
cohort_unit_tavg = []; 

for idx_sess = 1:numel(cohort_info)
    
    tic;
    
    test = squeeze(bin_spikes(cohort{idx_sess}.TTL_trial_rw, [-1 3 0.010 1], cohort{idx_sess}.spike_su));
    %TTL_rw, TTL_nr, TTL_trial_all
    
    for ii = 1:size(test,3)
        test(:,:,ii) = (test(:,:,ii) - cohort{idx_sess}.unit_mean(ii))/cohort{idx_sess}.unit_std(ii);
    end
    
    for ii = 1:size(test,1)
        for jj = 1:size(test,3)
            test(ii,:,jj) = conv(test(ii,:,jj),filter,'same');
        end
    end
    
    cohort_unit_tavg = [cohort_unit_tavg; squeeze(mean(test,1))'];
    
    toc;

end
cohort_unit_tavg = cohort_unit_tavg(QC_thres,:);


[m,idx] = max(cohort_unit_tavg');
[~,rsort] = sort(idx);
trial_avg_data_sorted = cohort_unit_tavg(rsort,:);

figure; set(gcf,'color','w');
imagesc(trial_avg_data_sorted, [-0.2 0.5]); colormap inferno;
hcb=colorbar; title(hcb,'Z-score'); 
title('All neurons, trial-averaged'); xlabel('Time from go cue (sec)'); ylabel('Neuron');
xticks([1 101 201 301 401]); xticklabels({'-1','0','1','2','3'});
xline(101, '--w');

 
% Selected
tagged_MHb = logical(tagged_unit.*(cohort_unit_region==483)); 
%tagged_tavg = cohort_unit_tavg(logical(tagged_unit),:);
tagged_tavg = cohort_unit_tavg(logical(tagged_MHb),:);
[m,idx] = max(tagged_tavg');
[~,rsort] = sort(idx);
trial_avg_data_sorted = tagged_tavg(rsort,:);

figure; set(gcf,'color','w');
imagesc(trial_avg_data_sorted, [-0.3 0.3]); colormap inferno;
hcb=colorbar; title(hcb,'Z-score'); 
title('MHb Tac1 neurons, trial-averaged'); xlabel('Time from go cue (sec)'); ylabel('Neuron');
xticks([1 101 201 301 401]); xticklabels({'-1','0','1','2','3'});
xline(101, '--w');


%% population ramping - quantify fraction! explore new normalization schemes!

filter = gaussmf(-200:200,[20 0]); filter(1:200) = 0; filter = filter/sum(filter); 
%figure; set(gcf,'color','w');
for idx_class = 1:1
    
    if idx_class == 1
        tagged_localized = logical(tagged_unit.*(cohort_unit_region==483));%.*(cohort_unit_sess==9)); 
        pcolor = 'r';
    elseif idx_class == 2
        tagged_localized = logical(tagged_unit.*(cohort_unit_region==186)); pcolor = 'g';
    else
        tagged_unit_id = find(tagged_unit);
        randpick = randperm(numel(cohort_unit_sess)); randpick = randpick(1:20);
        tagged_localized = zeros(numel(cohort_unit_sess),1); tagged_localized(randpick) = 1; tagged_localized = logical(tagged_localized);
        pcolor = [0 0 0 0.1];
    end
    
    tagged_sess = cohort_unit_sess(tagged_localized); tagged_id = cohort_unit_id(tagged_localized);
    avg_activity = nan(100, sum(tagged_localized)); avg_raster = nan(100, 401, sum(tagged_localized));
    for idx = 1:sum(tagged_localized)

        idx_sess = tagged_sess(idx);
        idx_unit = find(cohort{idx_sess}.list_su==tagged_id(idx));

        test = bin_spikes(cohort{idx_sess}.TTL_rw, [-1 3 0.010 1], cohort{idx_sess}.spike_su(idx_unit));
        % TTL_nr, TTL_trial_all
        test = (test - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit);

        for ii = 1:size(test,1)
            test(ii,:) = conv(test(ii,:),filter,'same');
        end

        test_a = flipud(mean(test(:,101:end),2));
        %test = flipud((single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3 - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit));
        behavior_length = min(numel(test_a),100);
        avg_activity(1:behavior_length, idx) = test_a(1:behavior_length);
        disp(behavior_length);

        test_r = flipud(test);
        avg_raster(1:behavior_length,:,idx) = test_r(1:behavior_length,:);

    end
    avg_activity = flipud(avg_activity);
    avg_raster = flipud(avg_raster);
    
    %plot(nanmean(avg_activity(21:end,:),2), 'Color', pcolor); hold on;

end

figure, plot(nanmean(avg_activity(21:end,:),2), 'r'); hold on;
xlabel('Trials'); ylabel('Population activity (z-score)');



%figure, plot(nanmean(avg_activity(21:end,:),2), 'Color', [0 0 0 0.8]); 
figure, plot(nanmean(avg_activity(21:end,:),2) - nanmean(avg_activity(21:40,:),'all'), 'Color', [0 0 0 0.8]); 

tagged_localized = logical(tagged_unit.*(cohort_unit_region==483));
cohort_unit_sess(tagged_localized)


ramp_data = nanmean(avg_activity(21:end,:),2);
figure,
plot(ramp_data, 'r'); hold on;
for ii = 1:100
    plot(ramp_data(randperm(numel(ramp_data))), 'Color', [0 0 0 0.1]);
end



figure, imagesc(nanmean(avg_raster(20:end,:,:),3));
%figure, plot(nanmean(nanmean(avg_raster(20:end,:,:),3),2));


figure; set(gcf,'color','w');
imagesc(nanmean(avg_raster(21:end,:,:),3), [-0.05 0.15]); colormap inferno;
hcb=colorbar; title(hcb,'Z-score'); 
title('MHb Tac1 neurons, population-averaged'); xlabel('Time from reward delivery (sec)'); ylabel('Trial');
xticks([1 101 201 301 401]); xticklabels({'-1','0','1','2','3'});
xline(101, '--w');

figure; set(gcf,'color','w');
imagesc(nanmean(avg_raster(21:end,:,:),3), [-0.1 0.3]); colormap inferno;
hcb=colorbar; title(hcb,'Z-score'); 
title('LHb Tac1 neurons, population-averaged'); xlabel('Time from reward delivery (sec)'); ylabel('Trial');
xticks([1 101 201 301 401]); xticklabels({'-1','0','1','2','3'});
xline(101, '--w');


% fitting linear/sigmoidal models

tic;
cohort_unit_ramping_class = [];
cohort_unit_ramping_Rsq = [];
cohort_unit_ramping_param = [];
for uidx = 1:numel(cohort_unit_sess)
    
    idx_sess = cohort_unit_sess(uidx);
    idx_unit = find(cohort{idx_sess}.list_su == cohort_unit_id(uidx));
    
    %rw_spks_across_trial = bin_spikes(cohort{idx_sess}.TTL_rw, [0 2.9999 3 1], cohort{idx_sess}.spike_su(idx_unit));
    rw_spks_across_trial = bin_spikes(cohort{idx_sess}.TTL_trial_all, [-1.9999 0 2 1], cohort{idx_sess}.spike_su(idx_unit)); % baseline
    axis_trial = 1:numel(rw_spks_across_trial);
    
    %linear fit
    lnEqn = 'a*x + b'; %powEqn = 'x^a + b';
    f1 = fit(axis_trial',rw_spks_across_trial,lnEqn);

    cfitv = confint(f1);
    if cfitv(1,1) > 0
        rclass = +1;
    elseif cfitv(2,1) < 0
        rclass = -1;
    else
        rclass = 0;
    end
    cohort_unit_ramping_class = [cohort_unit_ramping_class; rclass];
    
    Rsq = 1 - sum((rw_spks_across_trial - f1(axis_trial)).^2)/sum((rw_spks_across_trial - mean(rw_spks_across_trial)).^2);
    cohort_unit_ramping_Rsq = [cohort_unit_ramping_Rsq; Rsq];
    cohort_unit_ramping_param = [cohort_unit_ramping_param; f1.a f1.b];
    
    disp(uidx);

end
toc;

%explode = {'1'};


cond = logical(cohort_unit_region==564);
% cond = logical((cohort_unit_region==483).*tagged_unit); sum(cond)
% cond = logical((cohort_unit_region==483).*tagged_unit.*(cohort_unit_acutoff<0.5)); sum(cond)
%cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2850));
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2950).*(cohort_unit_sess==12)); sum(cond)
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2850).*(cohort_unit_acutoff<0.5)); sum(cond)
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2850).*(cohort_unit_sess==9).*(cohort_unit_acutoff<0.5)); sum(cond)
figure; set(gcf,'color','w'); pie(categorical(cohort_unit_ramping_class(cond))); colormap(redblue); title(strcat('MHb (N=', num2str(sum(cond)), ')'));

labels = {'Ramp DOWN', 'n.s.', 'Ramp UP'}; lgd = legend(labels); lgd = legend(labels);


% sessions with reasonably large dorsal MHb populations: 4(unclear ramping) 9 11 12
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2850));
% sum(cohort_unit_sess(cond)==17)

% region labels
% 483: MHb / 186: LHb / 564: MS / 581: TRS

% dorsal/ventral MHb atlas visualization
% figure, imagesc(squeeze(av(710,:,:))==713); yline(285);

% finding good dorsal boundary
% sum(logical((cohort_unit_region==483).*tagged_unit.*(cohort_unit_coord(:,3) < 3050)))

% pick up highly ramping neurons
% find(cohort_unit_ramping_param(:,1)==max(cohort_unit_ramping_param(:,1)))

 
%{

idx_sess = 1; idx_unit = 10;
test = bin_spikes(cohort{idx_sess}.TTL_rw, [-1 3 0.010 1], cohort{idx_sess}.spike_su(idx_unit));
%test = (test - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit);
test = sum(test(:,101:end),2);

y = test;
x = 1:numel(test);

%y = avg_activity(31:100,19);  %44
%x = 1:70;


%linear fit
lnEqn = 'a*x + b ';
%powEqn = 'x^a + b ';
f1 = fit(x',y,lnEqn)  ;

cfitv = confint(f1);
cfitv(1,1)
cfitv(2,1)


%SSE_ln = sum((y - f1(x)).^2);


Rsq = 1 - sum((y - f1(x)).^2)/sum((y - mean(y)).^2);

error_lin_fit{ii}(jj) = Rsq;
p_lin_fit{ii}(jj,:) = [f1.a f1.b];
DATA_ln_fit{ii}{jj} = f1;

clear b  Rsq

%step fit
f2 = @(p,x) p(1) + (p(2)-p(1)) ./ (1 + 10.^((p(3)-x)*p(4)));
p = sigm_fit(x', y, [NaN NaN NaN 2], [], 0);


Rsq = 1 - sum((y - f2(p,x)').^2)/sum((y - mean(y)).^2);

p_sig_fit{ii}(jj,1:length(p)) = p;
error_sig_fit{ii}(jj) = Rsq;
DATA_step_fit{ii}{jj} = f2;

%}

%% export for data-driven modeling

idx_sess = 12;

cond1 = (cohort{idx_sess}.unit_region==483);
cond2 = (cohort{idx_sess}.unit_coord(:,3) < 2950);
cond3 = 1;
cond4 = (cohort{idx_sess}.metrics{:,3} > 0.2);  % firing rate
cond5 = 1; %(cohort{idx_sess}.metrics{:,5} < 0.5);  % ISI violation
cond6 = 1; %(cohort{idx_sess}.metrics{:,6} < 0.5);  % amplitude cutoff
cond7 = 1;
cond = logical(cond1.*cond2.*cond3.*cond4.*cond5.*cond6.*cond7); sum(cond)

unitID = cohort{idx_sess}.list_su(cond);
trialMatrix = cohort{idx_sess}.trialMatrix;
TTL_trial = cohort{idx_sess}.TTL_bhvrOff(1:numel(trialMatrix));
spike_bxtxn = bin_spikes(TTL_trial, [-2 4 0.020 1], cohort{idx_sess}.spike_su(cond));
% figure, plot(squeeze(sum(spike_bxtxn, [2,3])))
% figure, stem(squeeze(spike_bxtxn(128, :, 5)))
% try without ampilitude cutoff criteria!!! try including multi-units!!!
save('MHb_sess12_test.mat', 'spike_bxtxn', 'unitID', 'trialMatrix', 'TTL_trial');


%{
cohort_unit_fr = [cohort_unit_fr; cohort{idx_sess}.metrics{:,3}];
cohort_unit_duration = [cohort_unit_duration; cohort{idx_sess}.metrics{:,19}];
cohort_unit_PTratio = [cohort_unit_PTratio; cohort{idx_sess}.metrics{:,21}];
cohort_unit_acutoff = [cohort_unit_acutoff; cohort{idx_sess}.metrics{:,6}];
cohort_unit_isiviolation = [cohort_unit_isiviolation; cohort{idx_sess}.metrics{:,5}];
%s.metrics{:,19} % 3: firing rate, 19: duration, 21: PT ratio, 25: spread

QC_thres_1 = cohort_unit_acutoff < 0.51;
QC_thres_2 = cohort_unit_PTratio < 5; % >1: putative axonal spikes
QC_thres_3 = cohort_unit_isiviolation < 0.5;

QC_thres = logical(QC_thres_1 .* QC_thres_2 .* QC_thres_3);
%}





%% valence

tic;
cohort_unit_valence = [];
cohort_unit_valence_selectivity = [];
for uidx = 1:numel(cohort_unit_sess)
    
    idx_sess = cohort_unit_sess(uidx);
    idx_unit = find(cohort{idx_sess}.list_su == cohort_unit_id(uidx));
    
    rw_spks_across_trial = bin_spikes(cohort{idx_sess}.TTL_rw, [0 0.9999 1 1], cohort{idx_sess}.spike_su(idx_unit));
    nr_spks_across_trial = bin_spikes(cohort{idx_sess}.TTL_nr, [0 0.9999 1 1], cohort{idx_sess}.spike_su(idx_unit));
    
    [p,~,stats] = ranksum(rw_spks_across_trial, nr_spks_across_trial);
    
    if p >= 0.05
        vclass = 0;
    elseif stats.zval > 0
        vclass = +1;
    else
        vclass = -1;
    end
    cohort_unit_valence = [cohort_unit_valence; vclass];
    
    vs = (mean(rw_spks_across_trial) - mean(nr_spks_across_trial))/1;
    vs = (vs - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit);
    cohort_unit_valence_selectivity = [cohort_unit_valence_selectivity; vs];

    disp(uidx);

end
toc;


% cond = logical(cohort_unit_region==483);
% cond = logical((cohort_unit_region==483).*tagged_unit);
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2950));
% cond = logical((cohort_unit_region==483).*(cohort_unit_coord(:,3) < 2850).*(cohort_unit_sess==12)); sum(cond)
figure; set(gcf,'color','w'); pie(categorical(cohort_unit_valence(cond))); colormap(redblue); title(strcat('MHb (N=', num2str(sum(cond)), ')'));

labels = {'Negative valence', 'n.s.', 'Positive valence'}; lgd = legend(labels); lgd = legend(labels);

mean(cohort_unit_valence_selectivity(cond))
[h,p] = ttest(cohort_unit_valence_selectivity(cond))
figure, hist(cohort_unit_valence_selectivity(cond))



%% single-session analysis (#9)

% cohort_unit_sess(logical(tagged_unit.*(cohort_unit_region==483)))
idx_sess = 9;

unit_of_interest = logical((cohort_unit_sess==idx_sess).*(cohort_unit_region==483).*tagged_unit);
% sum(unit_of_interest)
idx_unit = find(ismember(cohort{idx_sess}.list_su, cohort_unit_id(unit_of_interest)));
% cohort{idx_sess}.unit_region(idx_unit)

% PERHAPS for stim analysis the frequency could be higher?
idxTrial = ((cohort{idx_sess}.trial_width==0.010).*(cohort{idx_sess}.trial_freq==10).*(cohort{idx_sess}.trial_power==5))==1;
plot_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.5 1.5 0.001 5], cohort{idx_sess}.spike_su(idx_unit), cohort{idx_sess}.list_su(idx_unit));
%plot_raster(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.5 1.5 0.001 5], cohort{idx_sess}.spike_su, cohort{idx_sess}.list_su);


% SHOULD DO channel-wise zscoring before adding like below

test = bin_spikes(cohort{idx_sess}.TTL_stimblock(idxTrial), [-0.5 1.5 0.010 5], cohort{idx_sess}.spike_su(idx_unit));
test = zscore(test,0,[1 2]);
figure, plot(squeeze(sum(test,3))', 'Color', [0 0 0 0.2]);

test = bin_spikes(cohort{idx_sess}.TTL_rw, [-1 3 0.010 1], cohort{idx_sess}.spike_su(idx_unit));
test = zscore(test,0,[1 2]);
figure, plot(squeeze(mean(test(:,101:end,:),[2 3])), 'Color', [0 0 0 0.2]);

% CALCULATE: direction-dependent correlation, both natural/recovery











%% Optotagging plots

idx = 1;

%idx_sess = 2;
idx_sess = cohort_unit_sess(tagged_unit(idx));

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

tmp = find(cohort_unit_region(tagged_unit) == 483);

idx = tmp(16);
idx_sess = cohort_unit_sess(tagged_unit(idx));

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








%% waveform features

% irreversible - should run aggregation again first to run this again
cohort_unit_wf_features(:,6) = [];
cohort_unit_wf_features = [cohort_unit_wf_features cohort_unit_fr];
cohort_unit_wf_features(isnan(cohort_unit_wf_features)) = 0; % or just remove the NaN neurons!!!


Y = tsne(cohort_unit_wf_features, 'Standardize', true, 'Perplexity', 30);


region_label = zeros(size(cohort_unit_wf_features,1),1); region_label(cohort_unit_region==483) = 1;
figure, gscatter(Y(:,1),Y(:,2),region_label, [0.5 0.5 0.5; 1 0 0], ['.','*']); axis off; set(gcf,'color','w');

tagging_label = zeros(size(cohort_unit_wf_features,1),1); tagging_label(logical(tagged_unit)) = 1;
figure, gscatter(Y(:,1),Y(:,2),tagging_label, [0.5 0.5 0.5; 1 0 0], ['.','*']); axis off; set(gcf,'color','w');

region_tagging_label = zeros(size(cohort_unit_wf_features,1),1); region_tagging_label(logical(tagged_unit .*(cohort_unit_region==483))) = 1;
figure, gscatter(Y(:,1),Y(:,2),region_tagging_label, [0.5 0.5 0.5; 1 0 0], ['.','*']); axis off; set(gcf,'color','w');



ccode = cohort_unit_wf_features(:,6);  % duration, halfwidth, PT_ratio, repolarization slope, recovery slope, spread, velocity_above, velocity_below, firing rate
% figure, hist(ccode);

%cmin = 0.2; cmax = 1;
%cmin = 0.2; cmax = 0.7;
%cmin = 0; cmax = 2;
%cmin = 0; cmax = 1;
%cmin = -0.2; cmax = 0;
cmin = 0; cmax = 200;
%cmin = -4; cmax = 4;
%cmin = -4; cmax = 4;
%cmin = 0; cmax = 30;

ccode(ccode<cmin) = cmin; ccode(ccode>cmax) = cmax; 
ccode = (ccode-min(ccode))/(max(ccode)-min(ccode));
ccode = [ccode zeros(size(ccode)) (1-ccode)]; %ones(size(ccode))

figure, scatter(Y(:,1),Y(:,2),5,ccode,'filled'); axis off; set(gcf,'color','w'); title('channel spread');






%subcohort_unit_wf_features = [cohort_unit_wf_features(cohort_unit_region == 483,:); cohort_unit_wf_features(cohort_unit_region == 186,:)];
%region_label = [1*ones(sum(cohort_unit_region == 483),1); 2*ones(sum(cohort_unit_region == 186),1)];
%Y = tsne(subcohort_unit_wf_features, 'Perplexity', 30);
%figure, gscatter(Y(:,1),Y(:,2),region_label, ['r','b']);




%%
% population - deprcated
figure,
for iidx = 1:1000
    
    %tagged_MHb = logical(tagged_unit.*(cohort_unit_region==483)); 
    tagged_MHb = logical(tagged_unit(randperm(numel(tagged_unit))));
    tagged_sess = cohort_unit_sess(tagged_MHb); tagged_id = cohort_unit_id(tagged_MHb);
    avg_activity = nan(100, sum(tagged_MHb));
    for idx = 1:sum(tagged_MHb)

        %idx_sess = cohort_unit_sess(tagged_MHb(idx));
        %idx_unit = find(cohort{idx_sess}.list_su==cohort_unit_id(tagged_MHb(idx)));
        idx_sess = tagged_sess(idx);
        idx_unit = find(cohort{idx_sess}.list_su==tagged_id(idx));

        %figure, plot((single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3 - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit));

        test = flipud((single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3 - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit));
        behavior_length = min(numel(test),100);
        avg_activity(1:behavior_length, idx) = test(1:behavior_length);
    end
    avg_activity = flipud(avg_activity);
    plot(nanmean(avg_activity(20:end,:),2), 'Color', [0 0 0 0.1]); hold on;
    
end

tagged_MHb = logical(tagged_unit.*(cohort_unit_region==186)); 
tagged_sess = cohort_unit_sess(tagged_MHb); tagged_id = cohort_unit_id(tagged_MHb);
avg_activity = nan(100, sum(tagged_MHb));
for idx = 1:sum(tagged_MHb)

    %idx_sess = cohort_unit_sess(tagged_MHb(idx));
    %idx_unit = find(cohort{idx_sess}.list_su==cohort_unit_id(tagged_MHb(idx)));
    idx_sess = tagged_sess(idx);
    idx_unit = find(cohort{idx_sess}.list_su==tagged_id(idx));

    %figure, plot((single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3 - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit));

    test = flipud((single(cohort{idx_sess}.binned_spike_rw(:,idx_unit))/3 - cohort{idx_sess}.unit_mean(idx_unit))/cohort{idx_sess}.unit_std(idx_unit));
    behavior_length = min(numel(test),100);
    avg_activity(1:behavior_length, idx) = test(1:behavior_length);
end
avg_activity = flipud(avg_activity);

figure, plot(nanmean(avg_activity(20:end,:),2));

%





%% feature-based unit visualization

ccode = cohort_unit_fr;
ccode(ccode>20) = 20;
ccode(ccode<0.1) = 0;


ccode = cohort_unit_duration;
ccode(ccode>1) = 1;
ccode(ccode<0.3) = 0.3;

ccode = cohort_unit_cue_fold;
ccode(ccode>10) = 10;
ccode(ccode<0) = 0;


ccode = (ccode-min(ccode))/(max(ccode)-min(ccode));
ccode = [ccode zeros(size(ccode)) (1-ccode)]; %ones(size(ccode))




ccode = cohort_unit_selectivity;
ccode(cohort_unit_selectivity>0.3) = 0.3;
ccode(cohort_unit_selectivity<-0.3) = -0.3;

ccode = 2*(ccode-min(ccode))/(max(ccode)-min(ccode))-1;
ccode = [max(0,ccode) zeros(size(ccode)) max(0,(1-ccode))]; %ones(size(ccode))



% Hb-cropped coronal slices w/ feature-based color coding
APi = 120; %80/-90
APf = APi + 140; APc = linspace(APi,APf,15); APt = APc - 5;
cohort_unit_coord_display = cohort_unit_coord/10 + 1.5 * randn(size(cohort_unit_coord));
cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1) - 400;
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3) - 200;
figure;
for ii = 1:15
    subplot(3,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),201:end-340,401:end-400)), [0 200]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+10));
    registered_coord_display_interval = cohort_unit_coord_display(within_interval,:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 5, ccode(within_interval,:), 'filled'); hold off;
end
set(gcf,'color','w');

%

% Whole coronal slices
APi = 120; %80/-90
APf = APi + 140; APc = linspace(APi,APf,15); APt = APc - 5;
cohort_unit_coord_display = cohort_unit_coord/10 + 1.5*randn(size(cohort_unit_coord));
cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1);
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3);
figure;
for ii = 1:15
    subplot(3,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),:,:)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+10));
    registered_coord_display_interval = cohort_unit_coord_display(within_interval,:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',0.2); hold off;
end
set(gcf,'color','w');

% Hb-cropped coronal slices
APi = 120; %80/-90
APf = APi + 140; APc = linspace(APi,APf,15); APt = APc - 5;
cohort_unit_coord_display = cohort_unit_coord/10 + 1.5*randn(size(cohort_unit_coord));
cohort_unit_coord_display(:,1) = cohort_unit_coord_display(:,1) - 400;
cohort_unit_coord_display(:,3) = cohort_unit_coord_display(:,3) - 200;
figure;
for ii = 1:15
    subplot(3,5,ii);
    imagesc(squeeze(tv(540 + APc(ii),201:end-340,401:end-400)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((cohort_unit_coord_display(:,2) > 540+APt(ii)) .* (cohort_unit_coord_display(:,2) < 540+APt(ii)+10));
    registered_coord_display_interval = cohort_unit_coord_display(within_interval,:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',0.2); hold off;
end
set(gcf,'color','w');




%%



figure; set(gcf,'color','w');
plot(channel_positions(:,2),registered_coord(:,3),'.k');

figure; set(gcf,'color','w');
plot(registered_coord(:,1),registered_coord(:,3),'.k'); axis image; %ML-DV

figure; set(gcf,'color','w');
plot(registered_coord(:,1),registered_coord(:,3),'.k'); axis image; %AP-DV

cohort_unit_coord_display = cohort_unit_coord/10 + randn(size(cohort_unit_coord));
figure, imagesc(squeeze(tv(520,:,:))); axis image; colormap gray; hold on;
plot(cohort_unit_coord_display(:,1),cohort_unit_coord_display(:,3),'.r'); axis image; %ML-DV

figure, imagesc(squeeze(tv(540 + 140,:,:))); axis image; axis off; colormap gray; hold on;

