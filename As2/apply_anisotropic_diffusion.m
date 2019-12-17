function [out_img] = apply_anisotropic_diffusion(in_img, iternum, K, lambda, which_g)

    out_img = in_img;  %So that the output image has the same size as the input image
    
    [m, n] = size(in_img);  %Size of the input image

    if which_g == 1  %Application of g1 formula
        for a = 1:iternum  %For every iteration
            %The north, south, east and west nearer neighbourhoods are
            %created
            [nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(in_img);
            %Use of the neighbourhoods in the g1 formula
            c_N = g1(abs(nabla_N),K); 
            c_S = g1(abs(nabla_S),K);
            c_E = g1(abs(nabla_E),K);
            c_W = g1(abs(nabla_W),K);
            
            for x = 1:m
                for y = 1:n
                    %Anisotropic diffusion formula applied to every pixel
                    %of the image
                    in_img(x,y) = in_img(x,y) + lambda*(c_N(x,y)*nabla_N(x,y) + c_S(x,y)*nabla_S(x,y) + c_E(x,y)*nabla_E(x,y) + c_W(x,y)*nabla_W(x,y));
                end
            end
            
        end
        
       out_img = in_img;  %The output image is the modified inut image after the predefined number of iterations
        
    %end
    
    else   %Application of g2 formula
        for a = 1:iternum  %For every iteration
            %The north, south, east and west nearer neighbourhoods are
            %created
            [nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(in_img);
            %Use of the neighbourhoods in the g1 formula
            c_n = g2(abs(nabla_N),K);
            c_s = g2(abs(nabla_S),K);
            c_e = g2(abs(nabla_E),K);
            c_w = g2(abs(nabla_W),K);
            
            for x = 1:m
                for y = 1:n
                    %Anisotropic diffusion formula applied to every pixel
                    %of the image
                    in_img(x,y) = in_img(x,y) + lambda*(c_n(x,y)*nabla_N(x,y) + c_s(x,y)*nabla_S(x,y) + c_e(x,y)*nabla_E(x,y) + c_w(x,y)*nabla_W(x,y));                
                end
            end
            
        end
        
        out_img = in_img;  %The output image is the modified inut image after the predefined number of iterations
        
    end

end