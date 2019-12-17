function [FIFO, item] = fifo_dequeue(FIFO)
    
    [~, n] = size(FIFO);  %Number of elements in the FIFO cell 
    
    if n == 0  %Implies there are no elements in the FIFO
        %Return elements are empty
        FIFO = [];
        item = [];
    else
        item = FIFO{1};  %The returned item is the first element of the input FIFO
        for p = 1:(n-1)
            %Each element of the FIFO moves one place to the left
            FIFO{p} = FIFO{p+1};
        end
        FIFO = FIFO(:,1:n-1);  %Removal of the last element of the FIFO
    end

end
