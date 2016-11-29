function policy = CS4300_MDP_policy(S,A,P,U)
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

for s = 1:16
    above = CS4300_move(s,1);
    left = CS4300_move(s,2);
    down = CS4300_move(s,3);
    right = CS4300_move(s,4);
    actions = zeros(1,4);
    
    %Action up 1
    actions(1) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
    
    t = P(s,1).probs(above)
    t=P(s,1).probs(left)
    t=P(s,1).probs(right)
    %Action left 2
    actions(2) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
    t=P(s,2).probs(above)
    t=P(s,2).probs(down)
    t=P(s,2).probs(left)
    %Action down 3
    actions(3) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
    t=P(s,3).probs(down)
    t=P(s,3).probs(left)
    t=P(s,3).probs(right)
    %Action right 4
    actions(4) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
    t=P(s,4).probs(above)
    t=P(s,4).probs(right)
    t=P(s,4).probs(down)
    policy(s) = max(actions);
end