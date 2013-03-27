function [X,y]=Generative_Model_3(n,t,u,v,p_pos,mu_pos,mu_neg);
X = rand(t,n);
y = 2 * (rand(t,1) < p_pos) - 1;
pos = find(y > 0);
neg = find(y < 0);
X(pos,1) = X(pos,1) + mu_pos(1); X(pos,2) = X(pos,2) + mu_pos(2);
X(neg,1) = X(neg,1) + mu_neg(1); X(neg,2) = X(neg,2) + mu_neg(2);
end
