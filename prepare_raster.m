function [spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(eventTimes, spikeTimes, preCueDur, postCueDur)

spikeTimesOfTrials = []; trialIndexOfTrials = [];

for i = 1:numel(eventTimes)

    inTrial = logical((spikeTimes > eventTimes(i)+preCueDur).*(spikeTimes < eventTimes(i)+postCueDur));
    spikeInTrial = spikeTimes(inTrial) - eventTimes(i);

    spikeTimesOfTrials = [spikeTimesOfTrials; spikeInTrial];
    trialIndexOfTrials = [trialIndexOfTrials; ones(size(spikeInTrial))*i];
    
end