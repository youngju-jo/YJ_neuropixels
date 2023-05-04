function spike_bxtxn = bin_spikes(eventTimes, countParam, sp)
% countParam: [preCueDur, postCueDur, binSize, numSmooth]
% Output:
% spike_bxtxn: [num_trials (eventTimes) x time_bins x n_neurons]

% countParam = [-0.3 0.3 0.001 1];
preCueDur = countParam(1); postCueDur = countParam(2); binSize = countParam(3); numSmooth = countParam(4);
tAxisPSTH = preCueDur-binSize*numSmooth:binSize:postCueDur+binSize*numSmooth;

numTrials = numel(eventTimes);
numTimepoints = length(tAxisPSTH)-2*numSmooth;
numUnits = numel(sp);

spike_bxtxn = nan(numTrials, numTimepoints, numUnits);

parfor unitIdx = 1 : numUnits
    
    spikeTimes = sp{unitIdx};
    
    binned_spikes = nan(numTrials, numel(tAxisPSTH));
    for tr = 1:numTrials
        SpikesTmp = spikeTimes - eventTimes(tr);
        %binned_spikes(tr,:) = hist(SpikesTmp, tAxisPSTH);
        binned_spikes_tmp = hist(SpikesTmp, tAxisPSTH);
        binned_spikes(tr,:) = smooth(binned_spikes_tmp, numSmooth);
    end
    
    spike_bxtxn(:,:,unitIdx) = binned_spikes(:,numSmooth+1:end-numSmooth);
    
end

end
