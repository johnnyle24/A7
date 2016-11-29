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

% 13|14|15|16
% 9 |10|11|12
% 5 |6 |7 |8
% 1 |2 |3 |4

% 0 0 0 G
% 0 0 W P
% 0 0 P 0
% 0 0 0 0

% Actions
% 1 = UP
% 2 = LEFT
% 3 = Down
% 4 = RIGHT

S = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
A = [1, 2, 3, 4];

% p = [-0.04, -0.04, -0.04, -0.04;...
%     -0.04, -0.04, -1, -0.04;...
%     -0.04, -0.04, -1, -1;...
%     -0.04, -0.04, -0.04, 1;];

p = [-0.04, -0.04, -0.04, -0.04;...
    -0.04, -0.04, -1, -0.04;...
    -0.04, -0.04, -1, -1;...
    -0.04, -0.04, -0.04, 1;];

R = [981, 980, 960, 950,...
    982, 981, -1000, 732,...
    984, 983, -1000, -1000,...
    985, 987, 988, 1000];


P(1,1).probs = [.1, .1, 0, 0,...
                .8, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(1,2).probs = [.9, 0, 0, 0,...
                .1, 0, 0, 0,...
                 0, 0, 0, 0,...
                 0, 0, 0, 0];
P(1,3).probs = [.9, .1, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(1,4).probs = [.1, .8, 0, 0,...
                .1, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];

P(2,1).probs = [.1, 0, .1, 0,...
                0, .8, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(2,2).probs = [.8, .1, 0, 0,...
                0, .1, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(2,3).probs = [.1, .8, .1, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(2,4).probs = [0, .1, .8, 0,...
                0, .1, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];

P(3,1).probs = [0, .1, 0, .1,...
                0, 0, .8, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(3,2).probs = [0, .8, .1, 0,...
                0, 0, .1, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(3,3).probs = [0, .1, .8, .1,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(3,4).probs = [0, 0, .1, .8,...
                0, 0, .1, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];

P(4,1).probs = [0, 0, .1, .1,...
                0, 0, 0, .8,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(4,2).probs = [0, 0, .8, .1,...
                0, 0, 0, .1,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(4,3).probs = [0, 0, .1, .9,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(4,4).probs = [0, 0, 0, .9,...
                0, 0, 0, .1,...
                0, 0, 0, 0,...
                0, 0, 0, 0];

P(5,1).probs = [0, 0, 0, 0,...
                .1, .1, 0, 0,...
                .8, 0, 0, 0,...
                0, 0, 0, 0];
P(5,2).probs = [.1, 0, 0, 0,...
                .8, 0, 0, 0,...
                .1, 0, 0, 0,...
                0, 0, 0, 0];
P(5,3).probs = [.8, 0, 0, 0,...
                .1, .1, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(5,4).probs = [.1, 0, 0, 0,...
                0, .8, 0, 0,...
                .1, 0, 0, 0,...
                0, 0, 0, 0];

P(6,1).probs = [0, 0, 0, 0,...
                .1, 0, .1, 0,...
                0, .8, 0, 0,...
                0, 0, 0, 0];
P(6,2).probs = [0, .1, 0, 0,...
                .8, 0, 0, 0,...
                0, .1, 0, 0,...
                0, 0, 0, 0];
P(6,3).probs = [0, .8, 0, 0,...
                .1, 0, .1, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(6,4).probs = [0, .1, 0, 0,...
                0, 0, .8, 0,...
                0, .1, 0, 0,...
                0, 0, 0, 0];

P(8,1).probs = [0, 0, 0, 0,...
                0, 0, .1, .1,...
                0, 0, 0, .8,...
                0, 0, 0, 0];
P(8,2).probs = [0, 0, 0, .1,...
                0, 0, .8, 0,...
                0, 0, 0, .1,...
                0, 0, 0, 0];
P(8,3).probs = [0, 0, 0, .8,...
                0, 0, .1, .1,...
                0, 0, 0, 0,...
                0, 0, 0, 0];
P(8,4).probs = [0, 0, 0, .1,...
                0, 0, 0, .8,...
                0, 0, 0, .1,...
                0, 0, 0, 0];

P(9,1).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                .1, .1, 0, 0,...
                .8, 0, 0, 0];
P(9,2).probs = [0, 0, 0, 0,...
                .1, 0, 0, 0,...
                .8, 0, 0, 0,...
                .1, 0, 0, 0];
P(9,3).probs = [0, 0, 0, 0,...
                .8, 0, 0, 0,...
                .1, .1, 0, 0,...
                0, 0, 0, 0];
P(9,4).probs = [0, 0, 0, 0,...
                .1, 0, 0, 0,...
                0, .8, 0, 0,...
                .1, 0, 0, 0];

P(10,1).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                .1, 0, .1, 0,...
                0, .8, 0, 0];
P(10,2).probs = [0, 0, 0, 0,...
                0, .1, 0, 0,...
                .8, 0, 0, 0,...
                0, .1, 0, 0];
P(10,3).probs = [0, 0, 0, 0,...
                0, .8, 0, 0,...
                .1, 0, .1, 0,...
                0, 0, 0, 0];
P(10,4).probs = [0, 0, 0, 0,...
                0, .1, 0, 0,...
                0, 0, .8, 0,...
                0, .1, 0, 0];

P(13,1).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                .9, .1, 0, 0];
P(13,2).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                .1, 0, 0, 0,...
                .9, 0, 0, 0];
P(13,3).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                .8, 0, 0, 0,...
                .1, .1, 0, 0];
P(13,4).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                .1, 0, 0, 0,...
                .1, .8, 0, 0];

P(14,1).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                .1, .8, .1, 0];
P(14,2).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, .1, 0, 0,...
                .8, .1, 0, 0];
P(14,3).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, .8, 0, 0,...
                .1, 0, .1, 0];
P(14,4).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, .1, 0, 0,...
                0, .1, .8, 0];

P(15,1).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, .1, .8, .1];
P(15,2).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, .1, 0,...
                0, .8, .1, 0];
P(15,3).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, .8, 0,...
                0, .1, 0, .1];
P(15,4).probs = [0, 0, 0, 0,...
                0, 0, 0, 0,...
                0, 0, .1, 0,...
                0, 0, .1, .8];

gammaArr = [0.9, 0.99, .999, .9999, .99999, .999999];
      
eta = 0.01;
max_iter = 1000;

for g = 1:6
   gamma = gammaArr(g); 
   [U,U_trace] = CS4300_MDP_value_iteration(S,A,P,R,gamma,eta,max_iter);
end


