function [w,b]=min_softmargin (X, y, beta)
    [t,n] = size(X); % t x n matrix 
    IdentMatn = eye(n);
    H = [beta*IdentMatn zeros(n,t+1); zeros(t+1,n+t+1)] ;
    H=H+1e-11*(eye(n+t+1));
    f = [zeros(n+1,1);ones(t,1)];
    A = [-diag(y)*X diag(y)*ones(t,1) -eye(t); zeros(t,n+1) -eye(t)];
    b = [-ones(t,1);zeros(t,1)];
    options = optimset('Algorithm','active-set','LargeScale','Off','Display','off');
    [x,fval,exitflag] = quadprog(H,f,A,b,[],[],[],[],[],options);
    w = x(1:n,1);
    b=x(n+1,1);
end
