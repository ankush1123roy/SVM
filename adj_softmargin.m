function [a,b] = adj_softmargin(K,y,beta)
    [t,t] = size(K); % t x n matrix 
    %IdentMatn = eye(t);
    H = [beta*K zeros(t,t+1); zeros(t+1,t+t+1)] ;
    H=H+1e-14*(ones(t+t+1,t+t+1));
    f = [zeros(t+1,1);ones(t,1)];
    A = [-diag(y)*K  diag(y)*ones(t,1) -eye(t); zeros(t,t+1) -eye(t)];
    b = [-ones(t,1);zeros(t,1)];
    options = optimset('Algorithm','active-set','LargeScale','Off','Display','off');
    [x,fval,exitflag] = quadprog(H,f,A,b,[],[],[],[],[],options);
    a = x(1:t,1);
    b=x(t+1,1);
end


