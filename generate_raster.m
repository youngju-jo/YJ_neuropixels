function generate_raster(eventTimes, countParam, sp, idClu, unitNum)

preCueDur = countParam(1); postCueDur = countParam(2);
tAxisPSTH = preCueDur:countParam(3):postCueDur;

spikeTimes = sp{unitNum};

spikeTimesOfTrials = []; trialIndexOfTrials = [];
for i = 1:numel(eventTimes)

    inTrial = logical((spikeTimes > eventTimes(i)+preCueDur).*(spikeTimes < eventTimes(i)+postCueDur));
    spikeInTrial = spikeTimes(inTrial) - eventTimes(i);

    spikeTimesOfTrials = [spikeTimesOfTrials; spikeInTrial];
    trialIndexOfTrials = [trialIndexOfTrials; ones(size(spikeInTrial))*i];
    
    set(gcf,'color','w');
    if isempty(spikeTimesOfTrials)
        cla;
    else
        plot(spikeTimesOfTrials, trialIndexOfTrials, '.k')
        ylabel('Trials'); %title(strcat('Unit ID:', {' '}, num2str(idClu(unitNum))))
        ylim([0-3, max(trialIndexOfTrials)+3]);
        xlim([preCueDur postCueDur]); xlabel('Time from event onset (s)');
        set(gca, 'YDir','reverse')
        xline(0,'--');
    end

end

