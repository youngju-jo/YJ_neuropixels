function uniformFigureProps()
%%% Make all figures uniform in size, text, and tick properties.  
%%% from Emily Sylwestrak

%set figure size and text size
%set(gcf, 'Position',  [378 806 360 307])
set(gca, 'FontSize',16);
set(gcf,'color','w');

%Change box and ticks
box off
ax = gca;
ax.TickLength = [0.01 0.01];
ax.TickDir = 'out';
box off
ax.LineWidth = 2;
% legend('Location','northeast', 'FontSize', 10)
% legend boxoff   
end
