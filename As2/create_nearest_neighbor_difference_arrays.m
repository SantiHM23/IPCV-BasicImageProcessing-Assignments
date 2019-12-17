function [nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(I)

    nabla_N = I;  %So that the nearest neighbour north difference has the same size as the input image
    nabla_S = I;  %So that the nearest neighbour south difference has the same size as the input image
    nabla_E = I;  %So that the nearest neighbour east difference has the same size as the input image
    nabla_W = I;  %So that the nearest neighbour west difference has the same size as the input image
    
    large_I = padarray(I, [1 1], 'replicate');  %Single replication of all the borders of the input image
    
    [m, n] = size(I);  %Size of the input image
    
    for x = 1:m
        for y = 1:n
            nabla_N(x,y) = large_I(x,y+1) - large_I(x+1,y+1);  %Formula for the north neighbour difference
        end
    end
    
    for x = 1:m
        for y = 1:n
            nabla_S(x,y) = large_I(x+2,y+1) - large_I(x+1,y+1);  %Formula for the south neighbour difference
        end
    end
    
    for x = 1:m
        for y = 1:n
            nabla_E(x,y) = large_I(x+1,y+2) - large_I(x+1,y+1);  %Formula for the east neighbour difference
        end
    end
    
    for x = 1:m
        for y = 1:n
            nabla_W(x,y) = large_I(x+1,y) - large_I(x+1,y+1);  %Formula for the west neighbour difference
        end
    end

end