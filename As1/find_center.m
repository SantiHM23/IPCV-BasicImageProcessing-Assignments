function [mass_x, mass_y] = find_center(MASK)
% MASK: logical array (only zeros and ones).
    [m, n] = size(MASK);  %Size of the mask
    
    X0=(1:n);
    X=repmat(X0,m,1); %Matrix with the column indices
    
    Y0=(1:m)';
    Y=repmat(Y0,1,n); %Matrix with the row indices
    
    for x = 1:m
        for y =1:n
            Xmasked(x,y)=MASK(x,y).*X(x,y); %Masking of the X and Y matrices
            Ymasked(x,y)=MASK(x,y).*Y(x,y); %according to the mask input
        end
    end
    
% mass_x: coordinate of center of mass (horizontal), integer
Xcent = sum(Xmasked(:)) / sum(MASK(:));
mass_x = round(Xcent);
% mass_y: coodrinate of center of mass (vertical), integer
Ycent = sum(Ymasked(:)) / sum(MASK(:));
mass_y = round(Ycent);
%The center of mass is the mean of the non-zero elements   

end