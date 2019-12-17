function [cluster_space] = join_regions(filtered_space, distance_th)

    [m, ~] = size(filtered_space);  %Number of featured vectors
    cluster_space = zeros(m,1);  %Cluster to which each feature vector belongs
    FIFO = {};  %Empty fifo
    c = 0;  %Initialization of the counting of number of vectors clustered
    
    while c < m  %Loop finishes when all the feature vectors have been assigned to a cluster
        [a, ~] = size(FIFO);  %Number of elements in the FIFO
        if a == 0  %FIFO is empty
            for i = 1:m
                if cluster_space(i) == 0  %Vector has not been assigned to any cluster
                    cluster_space(i) = i; %Vector gets a cluster assigned
                    c = c+1;  %Increment the number of vectors clustered
                end
                for j = i:m
                    if cluster_space(j) == 0  %Vector has not been assigned to any cluster
                        dist = 0;  %Calculate the distance between this vector and the one that created the cluster
                        dist = sqrt((filtered_space(i,1)-filtered_space(j,1))^2 + (filtered_space(i,2)-filtered_space(j,2))^2 + (filtered_space(i,3)-filtered_space(j,3))^2);
                        if dist < distance_th
                            cluster_space(j) = i;  %Vector belongs to that same cluster if it is located inside the radius neighbourhood
                            FIFO{end+1} = filtered_space(j,:);  %New vector of the ccluster is added to the FIFO
                            c = c+1;  %Increment the number of vectors clustered
                        end
                    end
                end
                
                for k = i:m
                [a, ~] = size(FIFO);  %Get the number of elements in the fifo
                    if a ~= 0  %FIFO not empty
                        v = FIFO{1};  %First element of the FIFO will be used to find neighbours
                        for p = 1:(a-1)
                            FIFO{p} = FIFO{p+1};  %Every other element in the FIFO move a place to the left
                        end
                        FIFO = FIFO(1:a-1,:);  %FIFO size is reduced
                        if cluster_space(k) == 0  %Feature vector does not belong to any cluster
                            dist2 = 0;  %Calculate the distance between this vector and the one that belongs to a cluster
                            dist2 = sqrt((v(1)-filtered_space(k,1))^2 + (v(2)-filtered_space(k,2))^2 + (v(3)-filtered_space(k,3))^2);
                            if dist2 < distance_th
                                cluster_space(k) = i;  %Add the vector to the cluster if it belongs to the neighbourhood ratio
                                FIFO{end+1} = filtered_space(k,:);  %Add the vector to the FIFO
                                c = c+1;  %Increment the counting of vectors clustered
                            end
                        end
                    end
                end 
            end           
        end        
    end
end