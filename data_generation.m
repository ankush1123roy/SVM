
function [X,y] = data_generation(t, model);
n = 2; % dimension
t = t; % training size
u = 2*ones(n,1); % target weights (models 1 & 2)
v = 0.8*n; % target offset (models 1 & 2)
p_pos = 0.5; % prob of positive example
mu_pos = ones(n,1); % mean loc for pos (model 3)
mu_neg = zeros(n,1); % mean loc for neg (model 3)
if model == 1
    [X,y]=Generative_Model_1(n,t,u,v);
elseif model == 2
    [X,y]=Generative_Model_2(n,t,u,v);
elseif model == 3
    [X,y]=Generative_Model_3(n,t,u,v,p_pos,mu_pos,mu_neg);
end
