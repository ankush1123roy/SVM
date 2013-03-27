function [X,y]=Generative_Model_2(n,t,u,v);
X = rand(t,n);
y = sign( sin(X) * u - v );
end
