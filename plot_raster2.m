function plot_raster2(eventTimes, countParam, sp, idClu, unitNum) %, drift_metric)
% improved smoothing
% specifiable unitNum for the first unit to visualize

% causal half-gaussian filter for smoothing
g_std = countParam(4);
half_gaussian = gaussmf(-g_std*5:g_std*5,[g_std 0]); half_gaussian(1:g_std*5) = 0; half_gaussian = half_gaussian/sum(half_gaussian); 

% spike binning with no smoothing
countParam1 = countParam; countParam1(4) = 1; countParam1(1) = countParam(1) - countParam(3)*g_std*5;
rate_bxtxn = bin_spikes(eventTimes, countParam1, sp) * 1/countParam(3);

% define time axis
preCueDur = countParam(1); postCueDur = countParam(2);
tAxisPSTH = preCueDur:countParam(3):postCueDur;

figure; set(gcf,'color','w');
while true
    
    % circular unit indexing for browsing
    if unitNum == 0
        unitNum = numel(sp);
    elseif unitNum == numel(sp)+1
        unitNum = 1;
    end
    
    % firing rate
    subplot(211);
    rate_visualization = mean(rate_bxtxn(:,:,unitNum),1);  % trial averaging
    rate_visualization = conv(rate_visualization, half_gaussian, 'same');  % smoothing
    rate_visualization = rate_visualization(countParam(4)*5+1:end);  % cropping in time to remove smoothing artifact
    plot(tAxisPSTH, rate_visualization, 'k');
    title(strcat('Unit ID:', {' '}, num2str(idClu(unitNum))));
    xline(0,'--'); xlim([preCueDur postCueDur]); ylabel('Firing rate (Hz)'); 
    
    % spike raster
    subplot(212);
    generate_raster(eventTimes, countParam, sp, idClu, unitNum);
    %title('Spike raster');
    %title(num2str(drift_metric(unitNum)));
    
    % browsing: 28 leftarrow / 29 rightarrow / 30 uparrow / 31 downarrow
    waitforbuttonpress;
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
