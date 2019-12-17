function [T] = otsu_th(I, N)
    
    %Obtention of the histogram vector and the vector of average of intensity level of each bin
    [hist_vect, bin_centers] = hist(I(:), N);
    
    sigma_b_k = zeros(1,N);  %Empty vector with as many elements as bins
    s = 0;  %Help variable to store the sum of the elements of the histogram vector
    
    %1. Compute the N-bin histogram of the grayscale image.
    for a = 1:N
        s = s+hist_vect(1,a);  %Sum of the elements of the vector
    end
    
    %2. Normalize the histogram vector
    norm_hist_vect = hist_vect/s;
    
    %3. Compute parameters
    for k = 1:N
        %Help variables to store the sum of each parameter
        omega_1_k = 0;
        omega_2_k = 0;
        mu_1_k = 0;
        mu_2_k = 0;
        %Obtention of omega1 by sum accumulation
        for i = 1:k
        omega_1_k = omega_1_k + norm_hist_vect(1,i);
        end
        %Obtention of mu1 by sum accumulation
        for p = 1:k
        mu_1_k = mu_1_k + (p * norm_hist_vect(1,p))/omega_1_k;
        end
        %Obtention of omega2 by sum accumulation
        for j = (k+1):N
        omega_2_k = omega_2_k + norm_hist_vect(1,j);
        end
        %Obtention of mu2 by sum accumulation
        for q = (k+1):N
        mu_2_k = mu_2_k + (q * norm_hist_vect(1,q))/omega_2_k;
        end
        %Formula for sigma b, which is stored in a vector
        sigma_b_k(1,k) = omega_1_k * omega_2_k * (mu_1_k - mu_2_k)^2;
    end

    %4. Get the arg. max of the sigma_b vector
    [~, arg_max_sigma_b] = max(sigma_b_k);
    
    %5. Get the appropriate bin center; this will be the threshold level:
    th = bin_centers(arg_max_sigma_b);
    
    %6. Threshold the input image with the threshold th and return the result.
    T = I>th;
    T = double(T);  %Thresholded image has to be double type or won't work in the following functions
       
end
