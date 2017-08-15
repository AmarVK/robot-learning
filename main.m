
ball_world = zeros(5,5);
ball_pos = randi(5);
bot_world = zeros(5,5);
bot_curr_pos = randi(5);
value_table = zeros(25,5);
for i=1:25
    if mod(i,5)=0
        value_table(i,5)=100;
    end
end

for t = 0:20
    ball_world = zeros(5,5);
    curr_pos = mod(t,5)+1;
    ball_world(curr_pos , ball_pos) = 10;
    
    bot_world = zeros(5,5);
    bot_curr_pos = mod(bot_curr_pos+curr_pos,5)+1;
    bot_next_pos = botAction(bot_curr_pos,qtable);
    bot_world(5, bot_curr_pos) = 50;
    
    world = ball_world + bot_world;
    image(world)
    axis ij
    axis square
    pause('on')
    pause(0.5)
    pause('off')

    
end