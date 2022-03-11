function session_data = load_events_MHb(baseDir)

baseDir_split = split(baseDir,'\'); baseDir_stem = baseDir_split{end}(7:end);
myKsDir = strcat(baseDir, '\', baseDir_stem, '_imec0\imec0_ks2');


%% load events

% MHb head-fixed task
if isfile(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_0.adj.txt'))
    
    TTL_bhvrOn = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_0.adj.txt'));
    TTL_bhvrOff = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.iXD_1_1_0.adj.txt'));
    TTL_reward = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_2_0.adj.txt'));
    TTL_lick = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_4_0.adj.txt'));
    
    session_data.TTL_bhvrOn = TTL_bhvrOn;
    session_data.TTL_bhvrOff = TTL_bhvrOff;
    session_data.TTL_lick = TTL_lick;
    session_data.TTL_reward = TTL_reward;
    
end

% Optotagging
if isfile(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XA_0_0.adj.txt'))
    
    TTL_stim = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XA_0_0.adj.txt'));
    TTL_stimblock = readmatrix(strcat(baseDir, '\', baseDir_stem, '_tcat.nidq.XD_1_1_1000.adj.txt'));
    
    session_data.TTL_stim = TTL_stim;
    session_data.TTL_stimblock = TTL_stimblock;
    
end