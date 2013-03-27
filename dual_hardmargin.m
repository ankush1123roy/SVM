function [lambda,b]=dual_hardmargin(K,y,beta)
[t,n]=size(y);
f=[-ones(t,1)];
Aeq=y';
Beq=0;
lb=zeros(t,1);

H = [diag(y)*K*diag(y)];
H = H+1e-10*eye(t);
options = optimset('Algorithm','active-set','LargeScale','Off','Display','off');
[x,fval,exitflag] = quadprog(H,f,[],[],Aeq,Beq,lb,[],[],options);
lambda=x;
if exitflag ==-2
    lambda=randm(t,1);
    b = median(K*K'*lambda);
    if sign(K*K'*lambda-b)'*y < 0
        b = -b;
    end
elseif exitflag==-3
s = sign(y(1));
lambda = randn(t,1);
b = s*min(K*lambda/beta - 1);
end
[max_lambda, n1] = max(lambda);
b = K(n1,:)*diag(y)*lambda-y(n1);
end
