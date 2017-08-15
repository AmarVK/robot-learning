function f = valueUpdate(ball_row_now, ball_col, ball_row_next, bot_col_now, bot_col_next, value_table, alpha)
    r = -1;
    gamma = 0.7;
    [row_now col_now] = currentState(ball_row_now, ball_col, bot_col_now);
    [row_next col_next] = currentState(ball_row_next, ball_col, bot_col_next);
    value_table(row_now, col_now) = value_table(row_now, col_now) + alpha* (r + (gamma*value_table(row_next, col_next))- value_table(row_now, col_now));
    f = value_table;
end