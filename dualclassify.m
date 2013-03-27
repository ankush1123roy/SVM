function [yhat]=dualclassify(Ktest,lambda,b,y,beta,margintype)
[m,n] = size(Ktest);
if(margintype == 0) % SOFT
    yhat = sign((Ktest*diag(y)*lambda)/beta - b*ones(m,1));
elseif (margintype == 1) % HARD
    yhat = sign(Ktest*diag(y)*lambda - b*ones(m,1));
end
