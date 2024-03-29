function ramping_N = fit_ramping_MHb(rate_baseline_BxN)

ramping_N.class = [];
ramping_N.param = [];
ramping_N.Rsq = [];

[~,nn] = size(rate_baseline_BxN);

for uidx = 1:nn
    
    rate_across_trial = rate_baseline_BxN(:,uidx);
    rate_across_trial = rate_across_trial(~isnan(rate_across_trial));
    axis_trial = 1:numel(rate_across_trial);
    
    %linear fit
    %lnEqn = 'a*x + b'; %powEqn = 'x^a + b';
    %tic; f1 = fit(axis_trial', rate_across_trial, lnEqn); toc;
    f1 = fit(axis_trial', rate_across_trial, 'poly1');
    
    % polyfit is much faster but cannot automatically generate fitobject necessary for confidence interval calculation
    % coefficients = polyfit(axis_trial', rate_across_trial, 1); toc;

    cfitv = confint(f1);
    if cfitv(1,1) > 0
        rclass = +1;
    elseif cfitv(2,1) < 0
        rclass = -1;
    else
        rclass = 0;
    end
    ramping_N.class = [ramping_N.class; rclass];

    Rsq = 1 - sum((rate_across_trial - f1(axis_trial)).^2)/sum((rate_across_trial - mean(rate_across_trial)).^2);
    ramping_N.Rsq = [ramping_N.Rsq; Rsq];
    ramping_N.param = [ramping_N.param; f1.p1 f1.p2];

    %disp(uidx);
    
end