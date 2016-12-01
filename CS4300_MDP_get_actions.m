function actions = CS4300_MDP_get_actions(s,P,U)

above = CS4300_move(s,1);
left = CS4300_move(s,2);
down = CS4300_move(s,3);
right = CS4300_move(s,4);
actions = zeros(1,4);


%corner cases
if(s == 1 || s == 4 || s == 13 || s == 16) 
    if(s == 1)
        %Action up 1
        actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
        %Action left 2
        actions(2) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down);

        %Action down 3
        actions(3) = P(s,3).probs(down) + P(s,3).probs(right) * U(right);

        %Action right 4
        actions(4) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
    end
    if(s == 13)
        %Action up 1
        actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(right) * U(right);

        %Action left 2
        actions(2) = P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);

        %Action down 3
        actions(3) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);

        %Action right 4
        actions(4) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
    end
    if(s == 4)
        %Action up 1
        actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);

        %Action left 2
        actions(2) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);

        %Action down 3
        actions(3) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left);

        %Action right 4
        actions(4) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right);
    end
    if(s == 16)
        %Action up 1
        actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left);

        %Action left 2
        actions(2) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);

        %Action down 3
        actions(3) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);

        %Action right 4
        actions(4) = P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
    end
%all other cases
else
    %Action up 1
    actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);

    %Action left 2
    actions(2) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);

    %Action down 3
    actions(3) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);

    %Action right 4
    actions(4) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
end



