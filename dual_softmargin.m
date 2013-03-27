function [lambda,b] = dual_softmargin(K,y,beta)
%[expX]=feval(featurefun,Xtest,par);
[t,n]=size(y);
f=[-ones(t,1)];
Aeq=y';
Beq=0;
lb=zeros(1,t);
ub = ones(1,t);
H = [(diag(y)*K*diag(y))/beta];
H = H+1e-10*ones(t,t);
options = optimset('Algorithm','active-set','LargeScale','Off','Display','off');
[x,fval,exitflag] = quadprog(H,f,[],[],Aeq,Beq,lb,ub,[],options);
lambda=x;
if (exitflag ==-3)
s = sign(y(1))
lambda = randn(t,1)
b = s*min(K*lambda/beta - 1)
     s = sign(y(1))
lambda = randn(t,1)
b = s*min(K*lambda/beta - 1)
end 
for i=1:t
    if (lambda(i)>0 && lambda(i)<1)
        b = (K(i,:)*diag(y)*lambda)/beta-y(i);
        break
    end
end
   
end
