function [policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,k,gamma)
% CS4300_MDP_policy_iteration - policy iteration
% Chapter 17 Russell and Norvig (Table p. 657)
% On input:
% S (vector): states (1 to n)
% A (vector): actions (1 to k)
% P (nxk array): transition model
% R (vector): state rewards
% k (int): number of iterations
% gamma (float): discount factor
% On output:
% policy (nx1 vector): policy for problem
% U (nx1 vector): final utilities found
% Ut (num_iter by n array): trace of utilities (each is U at that step)
% Call:
%
% Layout: 1
% ˆ
% 9 10 11 12 |
% 5 6 7 8 2 <- -> 4
% 1 2 3 4 |
% V
% 3
% [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000);
% [p,Up,Tpt] = CS4300_MDP_policy_iteration(S,A,P,R,10,0.999)
% p’
%
% p =
%
% 1 corrresponds to:
% 2
% 2 -> -> -> X
% 2 ˆ X ˆ X
% 1 ˆ <- <- <-
% 1
% 1
% 1
% 4
% 4
% 4
% 1
%
% Author:
% Your name
% UU
% Fall 2016

U = zeros(1, 16);
Ut = [];
changed = true;
pi = zeros(1, 16);
for i=1:16
   r = randi([1,4]);
   pi(i) = r;
end

while changed
     changed = false;
     U = CS4300_MDP_policy_evaluation(pi, U, P, S, R, k, gamma);
     
     for s = 1:16
        probs = CS4300_MDP_get_actions(s, P, U);
        [m, a] = max(probs);
        if (m > U(s) && a ~= pi(s))
            pi(s) = a;
            changed = true;
        end
     end
     Ut = [Ut; U];
end

policy = pi;