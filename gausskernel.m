function [K] = gausskernel(X1,X2,sigma)

  distance = repmat(sum(X1.^2,2),1,size(X2,1)) ...
		+ repmat(sum(X2.^2,2)',size(X1,1),1) ...
		- 2*X1*X2';

	K = exp(-distance/(2*sigma^2));
