function [FIFO, item] = fifo_dequeue(FIFO)
    if numel(FIFO) == 0
        item = [];
    else 
        item = FIFO{1};
        FIFO = FIFO(2:end);
    end
end