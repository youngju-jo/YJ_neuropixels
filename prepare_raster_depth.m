function [spikeTimesOfUnits, depthOfUnits] = prepare_raster_depth(eventTime, spikeTimes_all, z_coord, preCueDur, postCueDur)

max_depth = 2865;

spikeTimesOfUnits = []; depthOfUnits = [];

for i = 1:numel(spikeTimes_all)
    
    spikeTimes = spikeTimes_all{i};
    
    inWindow = logical((spikeTimes > eventTime+preCueDur).*(spikeTimes < eventTime+postCueDur));
    spikeInTrial = spikeTimes(inWindow) - eventTime;

    spikeTimesOfUnits = [spikeTimesOfUnits; spikeInTrial];
    depthOfUnits = [depthOfUnits; ones(size(spikeInTrial))*(max_depth-z_coord(i))];

end

end

