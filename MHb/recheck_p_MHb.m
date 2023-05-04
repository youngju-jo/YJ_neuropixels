tac1_2p = tac12p{:,:}; %mean(,2);
[r,p] = corrcoef(repmat(1:65,1,2),tac1_2p(:)');
vpa(p(1,2))
vpa(r(1,2))

f1 = fit(repmat(1:65,1,2)', tac1_2p(:), 'poly1'); cfitv = confint(f1); 
sd = (cfitv(2,1) - cfitv(1,1))/(2*1.96); z = abs(0-f1.p1)/sd; p = exp(-0.717*z-0.416*z^2);