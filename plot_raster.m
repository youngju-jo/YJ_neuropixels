function plot_raster(eventTimes, countParam, sp, idClu)%, list_su)%, isPyr)

rate_bxtxn = bin_spikes(eventTimes, countParam, sp) * 1/countParam(3);

preCueDur = countParam(1); postCueDur = countParam(2);
tAxisPSTH = preCueDur:countParam(3):postCueDur;

unitNum = 1; %unitNum = 4;
figure; set(gcf,'color','w');
while true
    
    if unitNum == 0
        unitNum = numel(sp);
    elseif unitNum == numel(sp)+1
        unitNum = 1;
    end
    
    subplot(211);
    plot(tAxisPSTH, mean(rate_bxtxn(:,:,unitNum),1), 'k');
    title(strcat('Unit ID:', {' '}, num2str(idClu(unitNum))));%, ...
      %  ', isSU:', {' '}, num2str(ismember(unitNum, list_su))))%, ', isPyr:', {' '}, num2str(isPyr(unitNum))));
    xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); 

    subplot(212);
    generate_raster(eventTimes, countParam, sp, idClu, unitNum);
    title('Spike raster');

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
