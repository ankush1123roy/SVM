function [X,y]=Generative_Model_1(n,t,u,v);
X = rand(t,n);
y = sign( X * u - v );
end
