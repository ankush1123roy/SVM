


beta=0.01;

% FOR DATA GENERATION MODEL NO 1
[Xtest1,ytest1] = data_generation(1000,1);
for i=1:100
        [Xtrain1,ytrain1] = data_generation(10,1);
        Ktrain1 = polykernel(Xtrain1,Xtrain1,2);
        Ktest1=polykernel(Xtest1,Xtrain1,2);
        [lh, bh]=dual_hardmargin(Ktrain1,ytrain1,beta);
        [ls, bs]= dual_softmargin(Ktrain1,ytrain1,beta);
        
        [yhat_htest_1(i)]=sum(abs(dualclassify(Ktest1,lh,bh,ytrain1,beta,1)-ytest1)/2)/1000;
        [yhat_stest_1(i)]=sum(abs(dualclassify(Ktest1,ls,bs,ytrain1,beta,0)-ytest1)/2)/1000;
        [yhat_htrain_1(i)]=sum(abs(dualclassify(Ktrain1,lh,bh,ytrain1,beta,1)-ytrain1)/2)/10;
        [yhat_strain_1(i)]=sum(abs(dualclassify(Ktrain1,ls,bs,ytrain1,beta,0)-ytrain1)/2)/10;
        
end
 yhat_htest_1 = sum(yhat_htest_1(:))/100;
 yhat_stest_1 = sum(yhat_stest_1(:))/100;
 yhat_htrain_1 = sum(yhat_htrain_1(:))/100;
 yhat_strain_1 = sum(yhat_strain_1(:))/100;
 
 
 % FOR DATA GENERATION MODEL NO 2
 
        [Xtest2,ytest2] = data_generation(1000,2);
 for i=1:100
        [Xtrain2,ytrain2] = data_generation(10,2);
        Ktrain2 = polykernel(Xtrain2,Xtrain2,2);
        Ktest2=polykernel(Xtest2,Xtrain2,2);
        [lh, bh]=dual_hardmargin(Ktrain2,ytrain2,beta);
        [ls, bs] = dual_softmargin(Ktrain2,ytrain2,beta);
        
        [yhat_htest_2(i)]=sum(abs(dualclassify(Ktest2,lh,bh,ytrain2,beta,1)-ytest2)/2)/1000;
        [yhat_stest_2(i)]=sum(abs(dualclassify(Ktest2,ls,bs,ytrain2,beta,0)-ytest2)/2)/1000;
        [yhat_htrain_2(i)]=sum(abs(dualclassify(Ktrain2,lh,bh,ytrain2,beta,1)-ytrain2)/10);
        [yhat_strain_2(i)]=sum(abs(dualclassify(Ktrain2,ls,bs,ytrain2,beta,0)-ytrain2)/10);
        
end
 yhat_htest_2 = sum(yhat_htest_2(:))/100;
 yhat_stest_2 = sum(yhat_stest_2(:))/100;
 yhat_htrain_2 = sum(yhat_htrain_2(:))/100;
 yhat_strain_2 = sum(yhat_strain_2(:))/100;
 
% FOR DATA GENERATION MODEL NO 3 
 
 [Xtest3,ytest3] = data_generation(1000,3);
for i=1:100
        [Xtrain3,ytrain3] = data_generation(10,3);
        Ktrain3 = polykernel(Xtrain3,Xtrain3,2);
        Ktest3 =polykernel(Xtest3,Xtrain3,2);
        [lh, bh]=dual_hardmargin(Ktrain3,ytrain3,beta);
        [ls, bs]= dual_softmargin(Ktrain3,ytrain3,beta);
        
        [yhat_htest_3(i)]=sum(abs(dualclassify(Ktest3,lh,bh,ytrain3,beta,1)-ytest3)/2)/1000;
        [yhat_stest_3(i)]=sum(abs(dualclassify(Ktest3,ls,bs,ytrain3,beta,0)-ytest3)/2)/1000;
        [yhat_htrain_3(i)]=sum(abs(dualclassify(Ktrain3,lh,bh,ytrain3,beta,1)-ytrain3)/2)/10;
        [yhat_strain_3(i)]=sum(abs(dualclassify(Ktrain3,ls,bs,ytrain3,beta,0)-ytrain3)/2)/10;
        
end
 yhat_htest_3 = sum(yhat_htest_3(:))/100;
 yhat_stest_3 = sum(yhat_stest_3(:))/100;
 yhat_htrain_3 = sum(yhat_htrain_3(:))/100;
 yhat_strain_3 = sum(yhat_strain_3(:))/100;
 
 hard_margin_train = [yhat_htrain_1 yhat_htrain_2 yhat_htrain_3]
 hard_margin_test = [yhat_htest_1 yhat_htest_2 yhat_htest_3]
 soft_margin_train = [yhat_strain_1 yhat_strain_2 yhat_strain_3]
 soft_margin_test = [yhat_stest_1 yhat_stest_2 yhat_stest_3]
