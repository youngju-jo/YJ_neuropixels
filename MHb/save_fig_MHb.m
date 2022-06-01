function save_fig_MHb(h, fname)
cd('C:\Users\YoungJu Jo\Dropbox\Shared\MHb Figure Drafts\Revisions\Neuropixels\figures\pdf');
set(h,'Units','Inches'); pos = get(h,'Position'); set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fname,'-dpdf','-r0');