
[Xtest1,ytest1]=data_generation(1000,1);
[Xtest2,ytest2]=data_generation(1000,2);
[Xtest3,ytest3]=data_generation(1000,3);


[Xtrain1,ytrain1]=data_generation(10,1);
[Xtrain2,ytrain2]=data_generation(10,2);
[Xtrain3,ytrain3]=data_generation(10,3);




[wl, bl] = min_lsemargin(Xtrain1,ytrain1,0.01);
[ws, bs] = min_softmargin(Xtrain1,ytrain1,0.01);
[Eltr1]=sum(abs(marginclassify(Xtrain1,wl,bl)-ytrain1)/2)/10;
[Estr1]=sum(abs(marginclassify(Xtrain1,ws,bs)-ytrain1)/2)/10;
[Elts1]=sum(abs(marginclassify(Xtest1,wl,bl)-ytest1)/2)/1000;
[Ests1]=sum(abs(marginclassify(Xtest1,ws,bs)-ytest1)/2)/1000;

clf; axis([0 1 0 1]); hold; axis('square');
pos = find(ytrain1 > 0); plot(Xtrain1(pos,1)',Xtrain1(pos,2)','g+') % pos examples
neg = find(ytrain1 < 0); plot(Xtrain1(neg,1)',Xtrain1(neg,2)','rx') % neg examples
plot([0 1],[bl bl-wl(1)]/wl(1),'m-'); % lse-margin trained
plot([0 1],[bs bs-ws(1)]/ws(1),'b-'); % soft-margin trained
print -depsc experiment.2.1.<1>.ps
hold off



[wl, bl] = min_lsemargin(Xtrain2,ytrain2,0.01);
[ws, bs] = min_softmargin(Xtrain2,ytrain2,0.01);
[Eltr2]=sum(abs(marginclassify(Xtrain2,wl,bl)-ytrain2)/2)/10;
[Estr2]=sum(abs(marginclassify(Xtrain2,ws,bs)-ytrain2)/2)/10;
[Elts2]=sum(abs(marginclassify(Xtest2,wl,bl)-ytest2)/2)/1000;
[Ests2]=sum(abs(marginclassify(Xtest2,ws,bs)-ytest2)/2)/1000;

clf; axis([0 1 0 1]); hold; axis('square');
pos = find(ytrain1 > 0); plot(Xtrain2(pos,1)',Xtrain2(pos,2)','g+') % pos examples
neg = find(ytrain1 < 0); plot(Xtrain2(neg,1)',Xtrain2(neg,2)','rx') % neg examples
plot([0 1],[bl bl-wl(1)]/wl(1),'m-'); % lse-margin trained
plot([0 1],[bs bs-ws(1)]/ws(1),'b-'); % soft-margin trained
print -depsc experiment.2.1.<2>.ps
hold off

[wl, bl] = min_lsemargin(Xtrain3,ytrain3,0.01);
[ws, bs] = min_softmargin(Xtrain3,ytrain3,0.01);
[Eltr3]=sum(abs(marginclassify(Xtrain3,wl,bl)-ytrain3)/2)/10;
[Estr3]=sum(abs(marginclassify(Xtrain3,ws,bs)-ytrain3)/2)/10;
[Elts3]=sum(abs(marginclassify(Xtest3,wl,bl)-ytest3)/2)/1000;
[Ests3]=sum(abs(marginclassify(Xtest3,ws,bs)-ytest3)/2)/1000;


clf; axis([0 1 0 1]); hold; axis('square');
pos = find(ytrain3 > 0); plot(Xtrain3(pos,1)',Xtrain3(pos,2)','g+') % pos examples
neg = find(ytrain3 < 0); plot(Xtrain3(neg,1)',Xtrain3(neg,2)','rx') % neg examples
plot([0 1],[bl bl-wl(1)]/wl(1),'m-'); % lse-margin trained
plot([0 1],[bs bs-ws(1)]/ws(1),'b-'); % soft-margin trained
print -depsc experiment.2.1.<3>.ps
hold off

[wlbl] = [ Eltr1 Elts1 Eltr2 Elts2 Eltr3 Elts3]
[wsbs] = [ Estr1 Ests1 Estr2 Ests2 Estr3 Ests3]
