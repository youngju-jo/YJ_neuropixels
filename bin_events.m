function binned_events = bin_events(eventTimes, countParam, timestamps)

% countParam = [-0.3 0.3 0.001 100];
preCueDur = countParam(1); postCueDur = countParam(2); binSize = countParam(3); numSmooth = countParam(4);
tAxisPSTH = preCueDur-binSize*numSmooth:binSize:postCueDur+binSize*numSmooth;

numTrials = numel(eventTimes);
    
binned_events_tmp = nan(numTrials, numel(tAxisPSTH));
for tr = 1:numTrials
    EventTmp = timestamps - eventTimes(tr);
    binned_spikes_tmp = hist(EventTmp, tAxisPSTH);%*(1/binSize);
    binned_events_tmp(tr,:) = smooth(binned_spikes_tmp, numSmooth);
end

binned_events = binned_events_tmp(:,numSmooth+1:end-numSmooth);

end
