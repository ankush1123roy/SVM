function [w,b] = adj_lsemargin(K,y,beta)
[m,m]=size(K);
opt = optimset('TolFun',1e-6, 'LargeScale', 'off',  'display', 'off');
Initial = zeros(m+1,1);
[x,fval,exitflag] = fminunc(@myfun,Initial,opt);
w = x(1:m,1);
b = x(m+1,1);
function D = myfun(W)
    
S=0;
for i=1:m
    margin = -y(i) * (K(i,:) * W(1:m,1) - W(m+1,1));
    alpha = max(0,margin) - log(realmax) + 2*log(length(W));
    S=S+alpha+log(exp(-alpha) + exp(margin-alpha));
end
D = (beta/2)*(W(1:m,1)'*K*W(1:m,1)) + S;
end

end
