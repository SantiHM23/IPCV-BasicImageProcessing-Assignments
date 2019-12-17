function fifo_print(FIFO)
    
    if numel(FIFO) == 0
        fprintf('   0 (EMPTY)');
    elseif numel(FIFO) == 1
        fprintf('(HEAD=TAIL)');
        fprintf(' [%s]\n', strjoin(cellstr(num2str(FIFO{1})),', '));
    else
        for k=1:numel(FIFO)
            if k == 1
                fprintf('   1 (HEAD)');
            elseif k == numel(FIFO)
                fprintf('%4d (TAIL)', numel(FIFO));
            else
                fprintf('%4d ━━━━━━', k); 
            end

            fprintf(' [%s]\n', strjoin(cellstr(num2str(FIFO{k})),', '));
        end
    end
end