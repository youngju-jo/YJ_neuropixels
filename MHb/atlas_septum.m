function atlas_septum(cohort_flat) %, plot_optotagged, optotagged)
% Hb-cropped coronal slices w/ region colors
% 200 um sections

global atlas

% AP start/end
APi = -100; APf = APi + 120; 

% visualization offsets
offset_ML_1 = 20; offset_ML_2 = 410;
offset_DV_1 = 290; offset_DV_2 = 130; 

% convert coordinates
APc = linspace(APi,APf,5); APthickness = APc(2)-APc(1); APt = APc - APthickness/2;
coord_display = cohort_flat.coord/10 + 0 * randn(size(cohort_flat.coord));

% reflection by the midline
for idx = 1:size(coord_display,1)
    if coord_display(idx,1) < 570
        coord_display(idx,1) = 1140 - coord_display(idx,1);
    end
end

% apply offsets
coord_display(:,1) = coord_display(:,1) - 570 + offset_ML_1;
coord_display(:,3) = coord_display(:,3) - offset_DV_1;

figure('units','normalized','outerposition',[0 0 1 1]); set(gcf,'color','w');
for ii = 1:5
    subplot(1,5,ii);
    imagesc(squeeze(atlas.tv(540 + APc(ii),offset_DV_1+1:end-offset_DV_2,570-offset_ML_1+1:end-offset_ML_2)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((coord_display(:,2) > 540+APt(ii)) .* (coord_display(:,2) < 540+APt(ii)+APthickness));
    
    is_MHb = within_interval.*(cohort_flat.region==564);
    is_LHb = within_interval.*(cohort_flat.region==581);
    is_elsewhere = within_interval.*(cohort_flat.region~=564).*(cohort_flat.region~=581);

    %{
    if plot_optotagged == 1
        registered_coord_display_interval = coord_display(logical(is_elsewhere.*optotagged),:);
        scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha',1);
        registered_coord_display_interval = coord_display(logical(is_LHb.*optotagged),:); %LHb
        scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha',1);
        registered_coord_display_interval = coord_display(logical(is_MHb.*optotagged),:); %MHb
        scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), '*', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha',1); 
    end
    %}
    
    registered_coord_display_interval = coord_display(logical(is_elsewhere),:);
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha', 0.2);
    registered_coord_display_interval = coord_display(logical(is_LHb),:); %LHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha', 0.2);
    registered_coord_display_interval = coord_display(logical(is_MHb),:); %MHb
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha', 0.2);
    
    hold off;
end