function f = botNext(i,j,k,vals)% i = ball's current row, j = ball's current column, k = bot's current column, vals = value_table
    [row, column] = currentState(i, j, k);
    [a b c d] = stateNext(row, column); % [a,b] is one potential state and [c,d] is another potential state
    [x_val,y_val] = greedy(a, b, c, d, vals);
    f = y_val;
    %f = mod(k+1,5)+1;
end
