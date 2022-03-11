function session_data = load_npx_spikes(baseDir)

baseDir_split = split(baseDir,'\'); baseDir_stem = baseDir_split{end}(7:end);
myKsDir = strcat(baseDir, '\', baseDir_stem, '_imec0\imec0_ks2');


%% atlas-registered channel coordinates and brain regions

if isfile(strcat(myKsDir, '\registered_coord.npy'))
    
    registered_coord = readNPY(strcat(myKsDir, '\registered_coord.npy'));
    session_data.registered_coord = registered_coord;
    
    registered_region = readNPY(strcat(myKsDir, '\registered_region.npy'));
    session_data.registered_region = registered_region;
    
elseif isfile(strcat(myKsDir, '\registered_coord_shank0.npy'))

    registered_coord_shank0 = readNPY(strcat(myKsDir, '\registered_coord_shank0.npy'));
    registered_coord_shank1 = readNPY(strcat(myKsDir, '\registered_coord_shank1.npy'));
    registered_coord_shank2 = readNPY(strcat(myKsDir, '\registered_coord_shank2.npy'));
    registered_coord_shank3 = readNPY(strcat(myKsDir, '\registered_coord_shank3.npy'));
    session_data.registered_coord_shank0 = registered_coord_shank0;
    session_data.registered_coord_shank1 = registered_coord_shank1;
    session_data.registered_coord_shank2 = registered_coord_shank2;
    session_data.registered_coord_shank3 = registered_coord_shank3;
    
    registered_region_shank0 = readNPY(strcat(myKsDir, '\registered_region_shank0.npy'));
    registered_region_shank1 = readNPY(strcat(myKsDir, '\registered_region_shank1.npy'));
    registered_region_shank2 = readNPY(strcat(myKsDir, '\registered_region_shank2.npy'));
    registered_region_shank3 = readNPY(strcat(myKsDir, '\registered_region_shank3.npy'));
    session_data.registered_region_shank0 = registered_region_shank0;
    session_data.registered_region_shank1 = registered_region_shank1;
    session_data.registered_region_shank2 = registered_region_shank2;
    session_data.registered_region_shank3 = registered_region_shank3;
    
end

session_data.channel_positions = readNPY(strcat(myKsDir, '\channel_positions.npy'));


%% load metrics and waveforms

if isfile(strcat(myKsDir,'\mean_waveforms.npy'))
    
    metrics = readtable(strcat(myKsDir,'\metrics.csv'));
    
    idClu = metrics{:,2};
    metrics = metrics(ismember(metrics{:,2}, idClu),:);
    session_data.metrics = metrics;
    
    wf = readNPY(strcat(myKsDir,'\mean_waveforms.npy'));
    session_data.wf = wf(idClu+1,:,:);
    
elseif isfile(strcat(myKsDir,'\mean_waveforms_0.npy'))
    
    metrics = readtable(strcat(myKsDir,'\metrics.csv'));
    metrics_stim = readtable(strcat(myKsDir,'\metrics_1.csv'));
    
    idClu = intersect(metrics{:,2},metrics_stim{:,2});
    metrics = metrics(ismember(metrics{:,2}, idClu),:);
    metrics_stim = metrics_stim(ismember(metrics_stim{:,2}, idClu),:);
    session_data.metrics = metrics;
    session_data.metrics_stim = metrics_stim;
    
    wf = readNPY(strcat(myKsDir,'\mean_waveforms_0.npy'));
    wf_stim = readNPY(strcat(myKsDir,'\mean_waveforms_1.npy'));
    session_data.wf = wf(idClu+1,:,:);
    session_data.wf_stim = wf_stim(idClu+1,:,:);
    
else
    
    error("First calculate the QC metrics and waveforms!");
    
end

%proper_idx = find(ismember(idClu, idClu));


%% classify and quantify spikes

spikeClu = readNPY(strcat(myKsDir, '\spike_clusters.npy'));
spikeTimesSec = readNPY(strcat(myKsDir, '\spike_times_sec.npy'));

% spike assignment
if ~exist('idClu','var')  % for before QC metric calculation
    idClu = unique(spikeClu);
end
numClu = numel(idClu);
sp_all = {}; sites_all = [];
for uidx = 1:numClu
    tidx_sp = (spikeClu == idClu(uidx));
    sp_all{uidx} = spikeTimesSec(tidx_sp);
end

session_data.spike_su = sp_all; %sp_su;
session_data.list_su = idClu; %su_list';
%session_data.idClu = idClu;

if exist('metrics','var')
    sites_all = metrics{:,17};
    session_data.sites_su = sites_all; %sites_su;
end
end
