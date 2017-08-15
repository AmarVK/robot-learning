% [a b] and [c d] are the coordinates of next two potential states from
% value table
% x and y are the coordinates of the current state in the value table
function [a b c d] = stateNext(x, y) 
    if x ==25
        a = x + 1 - 25;
        c = x + 1 - 25;
    else
        a = x + 1; 
        c = x + 1;
    end
    
    if y == 1 
        b = y;
        d = y+1;
    elseif y ==5
        b = y-1;
        d = y;
    else
        b = y-1;
        d = y+1;
    end
end