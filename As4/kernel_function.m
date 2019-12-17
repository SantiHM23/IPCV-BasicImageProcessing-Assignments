function [ out ] = kernel_function(x)

    [m, n] = size(x);  %Size of the input matrix
    out = zeros(m,n);  %So that the output matrix has the same size as the input one
    
    for i = 1:m
        for j = 1:n
            %Derivative of the normal kernel formula
            out(i,j) = 0.5 * exp(-0.5 * x(i,j));
        end
    end

end