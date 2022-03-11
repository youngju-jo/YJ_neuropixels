function plot_raster_dual(eventTimes1, eventTimes2, countParam, sp, idClu, list_su)%, isPyr)

rate_bxtxn1 = bin_spikes(eventTimes1, countParam, sp) * 1/countParam(3);
rate_bxtxn2 = bin_spikes(eventTimes2, countParam, sp) * 1/countParam(3);

preCueDur = countParam(1); postCueDur = countParam(2);
tAxisPSTH = preCueDur:countParam(3):postCueDur;


unitNum = 1; 
figure; set(gcf,'color','w');
while true
    
    if unitNum == 0
        unitNum = numel(sp);
    elseif unitNum == numel(sp)+1
        unitNum = 1;
    end
    
    spikeTimes = sp{unitNum};

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

    subplot(311);
    plot(tAxisPSTH, mean(rate_bxtxn1(:,:,unitNum),1), 'r'); hold on;
    plot(tAxisPSTH, mean(rate_bxtxn2(:,:,unitNum),1), 'b'); hold off;
    title(strcat('Unit ID:', {' '}, num2str(idClu(unitNum))))%, ...
        %', isSU:', {' '}, num2str(ismember(unitNum, list_su))))%, ', isPyr:', {' '}, num2str(isPyr(unitNum))));
    xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); 

    subplot(312); plot(spikeTimesOfTrials1, trialIndexOfTrials1, '.r')
    ylabel('Trials'); %title('Spike raster'); 
    xline(0,'--'); xlim([preCueDur postCueDur]); %xlabel('Time from event onset (s)');
    
    subplot(313); plot(spikeTimesOfTrials2, trialIndexOfTrials2, '.b')
    ylabel('Trials'); %title('Spike raster'); 
    xline(0,'--'); xlim([preCueDur postCueDur]); xlabel('Time from event onset (s)');

    waitforbuttonpress;
    % 28 leftarrow / 29 rightarrow / 30 uparrow / 31 downarrow
    arrow = double(get(gcf,'CurrentCharacter'));
    if arrow==28
        unitNum = unitNum - 1;
    elseif arrow==29
        unitNum = unitNum + 1;
    else
        break;
    end
end


end


