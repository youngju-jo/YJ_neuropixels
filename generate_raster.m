function generate_raster(eventTimes, countParam, sp, idClu, unitNum)

preCueDur = countParam(1); postCueDur = countParam(2);
%tAxisPSTH = preCueDur:countParam(3):postCueDur;

spikeTimes = sp{unitNum};

[spikeTimesOfTrials, trialIndexOfTrials] = prepare_raster(eventTimes, spikeTimes, preCueDur, postCueDur);

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

