function ramping_N = fit_ramping_MHb(rate_baseline_BxN)

ramping_N.class = [];
ramping_N.param = [];
ramping_N.Rsq = [];

[tt,nn] = size(rate_baseline_BxN);

for uidx = 1:nn
    
    axis_trial = 1:tt;
    rate_across_trial = rate_baseline_BxN(:,uidx);
    
    %linear fit
    lnEqn = 'a*x + b'; %powEqn = 'x^a + b';
    f1 = fit(axis_trial', rate_across_trial, lnEqn);

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
    ramping_N.param = [ramping_N.param; f1.a f1.b];

    disp(uidx);
    
end