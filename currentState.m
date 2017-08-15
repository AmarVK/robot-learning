function [table_x table_y] = currentState(ball_row, ball_column, bot_column)
    table_x = ((ball_column-1)*5)+ ball_row;
    table_y = bot_column; 
end