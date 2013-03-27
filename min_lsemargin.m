function [w,b] = min_lsemargin(X,y,beta)
[m,n]=size(X);
opt = optimset('TolFun',1e-6, 'LargeScale', 'off',  'display', 'off');
Initial = zeros(n+1,1);
[x,fval] = fminunc(@myfun,Initial,opt);

function D = myfun(W)
S=0;
for i=1:m
    S=S+log(1+exp(-y(i,1)*(X(i,:)*W(1:n,1)-W(n+1,1))));
end
D = (beta/2)*(W(1:n,1)'*W(1:n,1)) + S;
end
w = x(1:n,1);
b = x(n+1,1);
end
