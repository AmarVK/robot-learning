% ENPM 808F, Robot Learning
% Summer 2017
% Author: Amar Vamsi Krishna
% Instructor: Prof Donald Sofge
% UID: 114921871
% Final Project
% Ball catching robot in 2D grid-world 
% Version 1.0 -  The robot can move only in the 5th row. The ball can start its drop only
% in the first row
% Calling functions : 'botNext' - gives out the next state for the bot and
% 'valueUpdate' - updates the value function after the transition
%% Initial world setup

ball_world = zeros(5,5);    % This is the state description of the ball. Ball position is given by the cell that has a value '10'
bot_world = zeros(5,5);     % This is the state description of the ball. Ball position is given by the cell that has a value '10'
value_table = zeros(25,5);  % Initializing the value table to be 0
display = 1;
% Giving the terminal states of the game a high value of 100
for i=1:25
    if mod(i,5)==0
        value_table(i,5)=100;
    end
end
%% 
iter = 100;        % Number of iterations
for i = 1:iter
    ball_col = randi(5);   % The ball can start from any random position in the first row
    bot_init_col = randi(5);    % Randomly allocating the initial position of the bot in any colum
    for t = 0:12                % Each episode. 20 time steps are given for the ball befor timeout
        T = t+1 ;               % To find the learning rate
        alpha = 1/T;            % Learning rate
        if t ==0                % Assigning the initial column value of the ball to the current column value
            ball_curr_row = 1;
            bot_curr_col = bot_init_col;
        else                    % Assigning the previous state predictions to current state values
            ball_curr_row = ball_next_row;
            bot_curr_col = bot_next_col;
        end
        % State-space of the ball
        ball_world = zeros(5,5); % Initializing the statespace   
        % ball_curr_row = mod(t,5)+1; % Finding the row value of the ball
        ball_world(ball_curr_row , ball_col) = 10;   % Setting up the current ball-state
        ball_next_row = mod(ball_curr_row + 1,5)+1;   % Finding the next row of the ball
        
        % State-space of the bot
        bot_world = zeros(5,5); %Initializing statespace of the bot
        bot_world(5, bot_curr_col) = 50;
        bot_next_col = botNext(ball_curr_row, ball_col, bot_curr_col, value_table);  % Finding the next state of the bot
        %Update the value table
        value_table = valueUpdate(ball_curr_row, ball_col, ball_next_row, bot_curr_col, bot_next_col, value_table, alpha);

        %Displaying the images as an animation
        world = ball_world + bot_world;
        if display == 1
            image(world)
            axis ij
            axis square
            pause('on')
            pause(0.15)
            pause('off')
        end
        % Checking if the terminal states are reached
        if bot_world == ball_world*5;
            %Final display of states
            world = ball_world + bot_world;
            image(world)
            axis ij
            axis square
            pause('on')
            pause(0.5)
            pause('off')
           break
        end
         

    end
end