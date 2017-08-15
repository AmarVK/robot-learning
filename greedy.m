function [x,y] = greedy(a, b, c , d, vals)
    if vals(a, b) > vals(c, d)
        x =a;
        y = b;
    elseif vals(a, b) < vals(c, d)
        x = c;
        y = d;
    else
        if rand>0.5
            x = a;
            y = b;
        else 
            x = c;
            y = d;
        end
    end
end
