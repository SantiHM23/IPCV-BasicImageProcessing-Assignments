function [HoleVolumes] = process_the_block_of_cheese(cube)

    [a, b, c] = size(cube);
    total_voxels = a*b*c;
    
    %1. Initialization
    %a. Variable to store the number of holes found
    HoleCount = 0;
    %b. Empty vector to store the volumes of the holes.
    HoleVolumes = [];
    %c. Variable to store the index of the last visited voxel.
    LastVisited = 0;
    %d. Empty queue as a 0×1 cell.
    FIFO = {};
    
    while LastVisited < total_voxels %Loop ends when all the voels have been checked
        [~, n] = size(FIFO); %In order to get the size of the fifo
        
        if n == 0  %Scanning step
            LastVisited = LastVisited +1;
            [px, py, pz] = ind2sub(size(cube),LastVisited);  %Coordinates of the last visited voxel
            v = cube(px, py, pz);  %Value of the voxel (0 is cheese, 1 is hole)
            if v == 1  %There is a hole
                FIFO = fifo_enqueue(FIFO, [px, py, pz]); %Add the coordinates of the hole to the fifo
                HoleCount = HoleCount+1;  %One more hole to count
                HoleVolumes(HoleCount) = 0;  %New hole which volume has to be stored
            end
        else  %Filling step
            [FIFO, v_dq] = fifo_dequeue(FIFO); %Obtention of the first element of the FIFO
            %Coordinates of the element of the FIFO
            v_dq_x = v_dq(1);
            v_dq_y = v_dq(2);
            v_dq_z = v_dq(3);
            if cube(v_dq_x,v_dq_y,v_dq_z) == 0  %Case in which this element is cheese
                continue  %No further action
            else  %The element is a hole
                HoleVolumes(HoleCount) = HoleVolumes(HoleCount) +1;  %Increment of the volume of that hole
                cube(v_dq_x,v_dq_y,v_dq_z) = 0;  %Now the hole is cheese
                %Vector in which the neighbours of the current voxel are stored
                neigh = [v_dq_x-1, v_dq_x+1, v_dq_y-1, v_dq_y+1, v_dq_z-1, v_dq_z+1];
                for i = 1:6
                    %The neighbour is outside the space in any direction
                    if neigh(i) <1 || neigh(i) >100
                        continue  %No further action
                    elseif i == 1 || i == 2 %Neighbour in the X axis
                        if cube(neigh(i),v_dq_y,v_dq_z) == 1  %The neighbour is a hole
                            FIFO = fifo_enqueue(FIFO,[neigh(i),v_dq_y,v_dq_z]);  %We add the neighburing hole to the FIFO
                        end
                    elseif i == 3 || i == 4 %Neighbour in the Y axis
                        if cube(v_dq_x,neigh(i),v_dq_z) == 1  %The neighbour is a hole
                            FIFO = fifo_enqueue(FIFO,[v_dq_x,neigh(i),v_dq_z]);  %We add the neighburing hole to the FIFO
                        end
                    elseif i == 5 || i == 6 %Neighbour in the Z axis
                        if cube(v_dq_x,v_dq_y,neigh(i)) == 1  %The neighbour is a hole
                            FIFO = fifo_enqueue(FIFO,[v_dq_x,v_dq_y,neigh(i)]);  %We add the neighburing hole to the FIFO
                        end
                    end
                end
            end
            
        end
    end

end
