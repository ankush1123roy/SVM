% Assignment1e
[Xtest1, ytest1] = data_generation(1000,1);
[Xtest2, ytest2] = data_generation(1000,2);
[Xtest3, ytest3] = data_generation(1000,3);
beta = 0.01;

for i=1:100
    [Xtrain1,ytrain1] = data_generation(10,1);
    [Xtrain2,ytrain2] = data_generation(10,2);
    [Xtrain3,ytrain3] = data_generation(10,3);
    
    [wl1, bl1] = min_lsemargin(Xtrain1,ytrain1,beta);
    [ws1, bs1] = min_softmargin(Xtrain1,ytrain1,beta);
    [Eltr1(i)]=sum(abs(marginclassify(Xtrain1,wl1,bl1)-ytrain1)/2)/10;
    [Estr1(i)]=sum(abs(marginclassify(Xtrain1,ws1,bs1)-ytrain1)/2)/10;
    [Elts1(i)]=sum(abs(marginclassify(Xtest1,wl1,bl1)-ytest1)/2)/1000;
    [Ests1(i)]=sum(abs(marginclassify(Xtest1,ws1,bs1)-ytest1)/2)/1000;

        
    [wl2, bl2] = min_lsemargin(Xtrain2,ytrain2,beta);
    [ws2, bs2] = min_softmargin(Xtrain2,ytrain2,beta);
    [Eltr2(i)]=sum(abs(marginclassify(Xtrain2,wl2,bl2)-ytrain2)/2)/10;
    [Estr2(i)]=sum(abs(marginclassify(Xtrain2,ws2,bs2)-ytrain2)/2)/10;
    [Elts2(i)]=sum(abs(marginclassify(Xtest2,wl2,bl2)-ytest2)/2)/1000;
    [Ests2(i)]=sum(abs(marginclassify(Xtest2,ws2,bs2)-ytest2)/2)/1000;

    
    
    
    [wl3, bl3] = min_lsemargin(Xtrain3,ytrain3,beta);
    [ws3, bs3] = min_softmargin(Xtrain3,ytrain3,beta);
    [Eltr3(i)]=sum(abs(marginclassify(Xtrain3,wl3,bl3)-ytrain3)/2)/10;
    [Estr3(i)]=sum(abs(marginclassify(Xtrain3,ws3,bs3)-ytrain3)/2)/10;
    [Elts3(i)]=sum(abs(marginclassify(Xtest3,wl3,bl3)-ytest3)/2)/1000;
    [Ests3(i)]=sum(abs(marginclassify(Xtest3,ws3,bs3)-ytest3)/2)/1000;

end

    [wlbl] = [ sum(Eltr1(:))/100 sum(Elts1(:))/100 sum(Eltr2(:))/100 sum(Elts2(:))/100 sum(Eltr3(:))/100 sum(Elts3(:))/100]
[wsbs] = [ sum(Estr1(:))/100 sum(Ests1(:))/100 sum(Estr2(:))/100 sum(Ests2(:))/100 sum(Estr3(:))/100 sum(Ests3(:))/100]
    
    
