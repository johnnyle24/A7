function [policy,utils] = CS4300_MDP_policy2(S,A,P,U)
% CS4300_MDP_policy - generate a policy from utilities
% See p. 648 Russell & Norvig
% On input:
%     S (vector): states (1 to n)
%     A (vector): actions (1 to k)
%     P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       from s to s_prime, given action a)
%     U (vector): state utilities
% On output:
%     policy (vector): actions per state
% Call:
%     p = CS4300_MDP_policy(S,A,P,U);
% Author:
%     Johnny Le and Trung Le
%     UU
%     Fall 2016
%

% Actions
% 1 = UP
% 2 = LEFT
% 3 = Down
% 4 = RIGHT

policy = zeros(1,16);
utils = zeros(1,16);

for s = 1:16
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

    t = 0;
    maxt = max(actions);
    if(maxt == actions(1))
        t = 1;
    end
    if(maxt == actions(2))
        t = 2;
    end
    if(maxt == actions(3))
        t = 3;
    end
    if(maxt == actions(4))
        t = 4;
    end
    
    policy(s) = t;
    utils(s) = maxt;
end