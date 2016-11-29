function CS4300_MDP_driver()
% CS4300_MDP_driver - driver function for the value iteration function
% On input:
%     S (vector): states (1 to n)
%     A (vector): actions (1 to k)
%     P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       (from s to s_prime, given action a)
%     R (vector): state rewards
%     gamma (float): discount factor
%     eta (float): termination threshold
%     max_iter (int): max number of iterations
% Call:
%     p = CS4300_MDP_driver();
% Author:
%     Johnny Le and Trung Le
%     UU
%     Fall 2016
%

% Place loop and such here


% Actions
% 1 = UP
% 2 = LEFT
% 3 = Down
% 4 = RIGHT

S = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
A = [1, 2, 3, 4];



