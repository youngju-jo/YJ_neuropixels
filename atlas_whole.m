function atlas_whole(cohort_flat) %, plot_optotagged, optotagged)
% Whole brain coronal slices
% 200 um sections

global atlas

% AP start/end
num_slice = 12;
APi = -300; APf = APi + 880;  % multiple of num_slice-1 

% visualization offsets
offset_ML_1 = 30; offset_ML_2 = 30;
offset_DV_1 = 5; offset_DV_2 = 30; 

% convert coordinates
APc = linspace(APi,APf,num_slice); APthickness = APc(2)-APc(1); APt = APc - APthickness/2;
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
for ii = 1:num_slice
    subplot(2,num_slice/2,ii);  % hardcoded
    imagesc(squeeze(atlas.tv(540 + APc(ii),offset_DV_1+1:end-offset_DV_2,570-offset_ML_1+1:end-offset_ML_2)), [0 300]); axis image; axis off; colormap gray; title(strcat('AP=', num2str(-10*APc(ii)))); hold on;
    within_interval = logical((coord_display(:,2) > 540+APt(ii)) .* (coord_display(:,2) < 540+APt(ii)+APthickness));
    
    %is_INS = within_interval .* ((cohort_flat.group==1057)+(cohort_flat.group==677)+(cohort_flat.group==95) ~= 0);
    %is_LHb = within_interval.*(cohort_flat.region==581);
    is_elsewhere = within_interval; % .* ~is_INS;

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
    scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'b', 'MarkerEdgeAlpha', 0.4);
    %registered_coord_display_interval = coord_display(logical(is_LHb),:); %LHb
    %scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'g', 'MarkerEdgeAlpha', 0.1);
    %registered_coord_display_interval = coord_display(logical(is_INS),:); % Insula
    %scatter(registered_coord_display_interval(:,1),registered_coord_display_interval(:,3), 100, '.', 'MarkerEdgeColor', 'r', 'MarkerEdgeAlpha', 0.4);
    
    hold off;
end