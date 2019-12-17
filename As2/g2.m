function [c] = g2(nn_diff, K)

    [m, n] = size(nn_diff);  %Size of the input nearest neighbour difference
    c = nn_diff;  %So that the output has the same size as the input
    
    for x = 1:m
        for y = 1:n
            %Formula of the conduction coefficient that privileges wide regions over smaller ones
            c(x,y) = 1/(1+(nn_diff(x,y)/K)^2);  
        end
    end

end