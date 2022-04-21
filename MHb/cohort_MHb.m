function cohort_info = cohort_MHb(cohort_type)

if cohort_type == 1  % Tac1
    
    % 170
    
    % 20210905: MHb(R) / hStripe0 / 3700-3600 / CM-DiI / no /
    s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0170_20210905_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210905_113925.mat');
    s.info = '170_20210905'; cohort_info{1} = s;

    % 171
    
    % 20210920: MHb(R) / hStripe0 / 3600-3500 / CM-DiI / yes / with Sam
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210920_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0171_20210920_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210920_164219.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210920_161237.mat');
    s.info = '171_20210920'; cohort_info{end+1} = s;
    
    % 20210922: MHb(R) / hStripe0 / 3600-3500 / DiD / yes / with Jalal
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210922_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0171_20210922_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210922_175548.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210922_173653.mat');
    s.info = '171_20210922'; cohort_info{end+1} = s;

    % (T) 20210926: MHb(L) / hStripe0 / 3650-3350 / CM-DiI / yes / 
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0171_20210926_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0171_20210926_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\Optostim1p\Session Data\ANM_0171_Optostim1p_20210926_221943.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0171\NoImageCueLightReward\Session Data\ANM_0171_NoImageCueLightReward_20210926_220008.mat');
    s.info = '171_20210926'; cohort_info{end+1} = s;

    % 173
    
    % (T) 20210928: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20210928_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0173_20210928_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20210928_143149.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20210928_135940.mat');
    s.info = '173_20210928'; cohort_info{end+1} = s;

    % 20211001
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211001_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0173_20211001_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211001_181628.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211001_174346.mat');
    s.info = '173_20211001'; cohort_info{end+1} = s;

    % 20211002
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211002_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0173_20211002_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211002_135247.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211002_132401.mat');
    s.info = '173_20211002'; cohort_info{end+1} = s;

    % 20211004
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0173_20211004_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0173_20211004_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\Optostim1p\Session Data\ANM_0173_Optostim1p_20211004_181616.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0173\NoImageCueLightReward\Session Data\ANM_0173_NoImageCueLightReward_20211004_173828.mat');
    s.info = '173_20211004'; cohort_info{end+1} = s;

    % 174

    % (?) 20210910: MHb(R) / hStripe0 / 3650-3550 / CM-DiI / yes (594 nm DPSS laser) / power fluctuation in DPSS laser
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210910_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0174_20210910_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210910_160827.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210910_153646.mat');
    s.info = '174_20210910'; cohort_info{end+1} = s;

    % (T) 20210915: MHb(R) / hStripe0 / 3650-3550 / DiD / yes (637 nm, 100 mW) / started fiber water-dipping
    %s.baseDir = 'D:\ephys_backup\Processed\catgt_ANM_0174_20210915_behavior_optotagging_001_g0';
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed_new\catgt_ANM_0174_20210915_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\Optostim1p\Session Data\ANM_0174_Optostim1p_20210915_175119.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210915_172533.mat');
    s.info = '174_20210915'; cohort_info{end+1} = s;

    % 178

    % 20211115
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211115_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211115_224416.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211115_214142.mat');
    s.info = '178_20211115'; cohort_info{end+1} = s;

    % 20211116
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211116_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211116_230917.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211116_221429.mat');
    s.info = '178_20211116'; cohort_info{end+1} = s;

    % 20211118
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211118_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211118_165608.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211118_162416.mat');
    s.info = '178_20211118'; cohort_info{end+1} = s;

    % 20211120
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211120_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211120_224826.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211120_215953.mat');
    s.info = '178_20211120'; cohort_info{end+1} = s;

    % 20211121
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211121_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\Optostim1pShort\Session Data\ANM_0178_Optostim1pShort_20211121_222346.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211121_215217.mat');
    s.info = '178_20211121'; cohort_info{end+1} = s;

    % 180

    % 20211121
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0180_20211121_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\Optostim1pShort\Session Data\ANM_0180_Optostim1pShort_20211121_172700.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\NoImageCueLightReward\Session Data\ANM_0180_NoImageCueLightReward_20211121_163129.mat');
    s.info = '180_20211121'; cohort_info{end+1} = s;

    % 181

    % 20211118
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211118_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\Optostim1pShort\Session Data\ANM_0181_Optostim1pShort_20211118_223529.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211118_214411.mat');
    s.info = '181_20211118'; cohort_info{end+1} = s;

    % 20211120
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211120_behavior_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\Optostim1pShort\Session Data\ANM_0181_Optostim1pShort_20211120_172154.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211120_162734.mat');
    s.info = '181_20211120'; cohort_info{end+1} = s;

    
elseif cohort_type == 2  % septum
    
    % 170_20210906
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0170_20210906_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0170\NoImageCueLightReward\Session Data\ANM_0170_NoImageCueLightReward_20210906_155246.mat');
    s.info = '170_20210906'; cohort_info{1} = s;
   
    % 172_20210907
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0172_20210907_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0172\NoImageCueLightReward\Session Data\ANM_0172_NoImageCueLightReward_20210907_174320.mat');
    s.info = '172_20210907'; cohort_info{end+1} = s;

    % 174_20210909
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0174_20210909_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0174\NoImageCueLightReward\Session Data\ANM_0174_NoImageCueLightReward_20210909_163438.mat');
    s.info = '174_20210909'; cohort_info{end+1} = s;
    
    % 176_20211108
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0176_20211108_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0176\NoImageCueLightReward\Session Data\ANM_0176_NoImageCueLightReward_20211108_223301.mat');
    s.info = '176_20211108'; cohort_info{end+1} = s;

    % 178_20211122
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0178_20211122_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0178\NoImageCueLightReward\Session Data\ANM_0178_NoImageCueLightReward_20211122_125121.mat');
    s.info = '178_20211122'; cohort_info{end+1} = s;

    % 179_20211121
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0179_20211121_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0179\NoImageCueLightReward\Session Data\ANM_0179_NoImageCueLightReward_20211122_015802.mat');
    s.info = '179_20211121'; cohort_info{end+1} = s;

    % 180_20211122
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0180_20211122_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0180\NoImageCueLightReward\Session Data\ANM_0180_NoImageCueLightReward_20211122_141557.mat');
    s.info = '180_20211122'; cohort_info{end+1} = s;

    % 181_20211121
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0181_20211121_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0181\NoImageCueLightReward\Session Data\ANM_0181_NoImageCueLightReward_20211122_041526.mat');
    s.info = '181_20211121'; cohort_info{end+1} = s;

    % 188_20211130
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0188_20211130_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightReward\Session Data\ANM_0188_NoImageCueLightReward_20211130_172212.mat');
    s.info = '188_20211130'; cohort_info{end+1} = s;

    % 190_20211130
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0190_20211130_behavior_001_g0';
    s.d_stim = NaN;
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightReward\Session Data\ANM_0190_NoImageCueLightReward_20211130_214059.mat');
    s.info = '190_20211130'; cohort_info{end+1} = s;
    
elseif cohort_type == 3  % perturbation
    
    % 188 (excluded due to low optotagged MHb neuron count?)
    
    % 20211202
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0188_20211202_behavior_stim_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\Optostim1pShort\Session Data\ANM_0188_Optostim1pShort_20211202_175829.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightRewardStim1p\Session Data\ANM_0188_NoImageCueLightRewardStim1p_20211202_170431.mat');
    s.info = '188_20211202'; cohort_info{1} = s;

    % 20211203
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0188_20211203_behavior_stim_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\Optostim1pShort\Session Data\ANM_0188_Optostim1pShort_20211203_151948.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0188\NoImageCueLightRewardStim1p\Session Data\ANM_0188_NoImageCueLightRewardStim1p_20211203_142222.mat');
    s.info = '188_20211203'; cohort_info{end+1} = s;
    
    
    % 190
 
    % 20211202
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0190_20211202_behavior_stim_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\Optostim1pShort\Session Data\ANM_0190_Optostim1pShort_20211203_002346.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightRewardStim1p\Session Data\ANM_0190_NoImageCueLightRewardStim1p_20211202_214837.mat');
    s.info = '190_20211202'; cohort_info{end+1} = s;

    % 20211203
    s.baseDir = 'O:\users\YJ\Ephys\SpikeGLX\Processed\catgt_ANM_0190_20211203_behavior_stim_optotagging_001_g0';
    s.d_stim = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\Optostim1pShort\Session Data\ANM_0190_Optostim1pShort_20211203_165827.mat');
    s.d_bhvr = load('C:\Users\YoungJu Jo\Dropbox\Behavior\Bpod\Data\ANM_0190\NoImageCueLightRewardStim1p\Session Data\ANM_0190_NoImageCueLightRewardStim1p_20211203_161012.mat');
    s.info = '190_20211203'; cohort_info{end+1} = s;

else
    error('Check cohort name!');
end

end