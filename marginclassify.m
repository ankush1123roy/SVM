function [yhat] = marginclassify(Xtest,w,b)
[m,n]=size(Xtest);
for i=1:m
yhat(i,1) = sign(Xtest(i,:)*w-b);
end
