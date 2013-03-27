% Assignment 4


load('data2.mat')
[mtr,ntr]=size(y);
[mts,nts]=size(ytest);

%%%%%%%%% KERNEL FOR TRAINING
K1=polykernel(X,X,1);
K2=polykernel(X,X,2);
K3=polykernel(X,X,3);

%%% THE KERNEL FOR TEST
Ktest1=polykernel(Xtest,X,1);
Ktest2=polykernel(Xtest,X,2);
Ktest3=polykernel(Xtest,X,3);
beta = 1;

[l1 b1]= dual_softmargin(K1,y,beta);
[l2 b2]= dual_softmargin(K2,y,beta);
[l3 b3]=dual_softmargin(K3,y,beta);
[a1 c1]=adj_lsemargin(K1,y,beta);
[a2 c2]=adj_lsemargin(K2,y,beta);
[a3 c3]= adj_lsemargin(K3,y,beta);

[yhat_DSTR1]=sum(abs(dualclassify(K1,l1,b1,y,beta,0)-y)/2);
[yhat_DSTR2]=sum(abs(dualclassify(K2,l2,b2,y,beta,0)-y)/2);
[yhat_DSTR3]=sum(abs(dualclassify(K3,l3,b3,y,beta,0)-y)/2);
[yhat_ALSTR1]=sum(abs(adjclassify(K1,a1,c1)-y)/2);
[yhat_ALSTR2]=sum(abs(adjclassify(K2,a2,c2)-y)/2);
[yhat_ALSTR3]=sum(abs(adjclassify(K3,a3,c3)-y)/2);


[yhat_DSTS1]=sum(abs(dualclassify(Ktest1,l1,b1,y,beta,0)-ytest)/2);
[yhat_DSTS2]=sum(abs(dualclassify(Ktest2,l2,b2,y,beta,0)-ytest)/2);
[yhat_DSTS3]=sum(abs(dualclassify(Ktest3,l3,b3,y,beta,0)-ytest)/2);
[yhat_ALSTS1]=sum(abs(adjclassify(Ktest1,a1,c1)-ytest)/2);
[yhat_ALSTS2]=sum(abs(adjclassify(Ktest2,a2,c2)-ytest)/2);
[yhat_ALSTS3]=sum(abs(adjclassify(Ktest3,a3,c3)-ytest)/2);

[yhat_train] = [yhat_DSTR1 yhat_DSTR2 yhat_DSTR3 yhat_ALSTR1 yhat_ALSTR2 yhat_ALSTR3]
[yhat_test] = [yhat_DSTS1 yhat_DSTS2 yhat_DSTS3 yhat_ALSTS1 yhat_ALSTS2 yhat_ALSTS3]
