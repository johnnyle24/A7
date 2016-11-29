function move = CS4300_move(s,a)
% Actions
% 1 = UP
% 2 = LEFT
% 3 = Down
% 4 = RIGHT

switch a
    %up
    case 1
        move = s + 4;
        if(s == 13 || s == 14 || s == 15 || s == 16) 
            move = s;
        end
    %left
    case 2
        move = s - 1;
        if(s == 1 || s == 5 || s == 9 || s == 13)
            move = s;
        end
    %down
    case 3
        move = s - 4;
        if(s == 1 || s == 2 || s == 3 || s == 4)
            move = s;
        end
    %right
    otherwise
        move = s + 1;
        if(s == 4 || s == 8 || s == 12 || s == 16) 
            move = s;
        end            
end
