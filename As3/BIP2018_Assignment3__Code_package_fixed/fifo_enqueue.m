function [FIFO] = fifo_enqueue(FIFO, item)
    
    %Insertion of the new element at the end of the FIFO
    FIFO{end+1} = item;

end
