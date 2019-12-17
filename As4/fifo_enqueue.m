function [FIFO] = fifo_enqueue(FIFO, item)
    FIFO{end+1} = item;
end