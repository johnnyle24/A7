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

U = zeros(1,16);
policy = zeros(1,16);
for i = 1:16
   policy(i) = randi([1,4]); 
end
Ut = [];
delta = 0;
iter = 1;
unchanged = true;

while(unchanged) 
    U = CS4300_MDP_policy_evaluation(S,A,P,R,policy,U);
    unchanged = true;
    
    for s = 1:16
       p = CS4300_MDP_policy(S,A,P,U);
       
    end
    
    
    
end

% while(iter < max_iter)
%     U = Uprime;
%     delta = 0;
%     p = CS4300_MDP_policy(S,A,P,U);
% 
% 
%     for s = 1:16
%         Uprime(s) = R(s) + gamma * p(s);
%         if(abs(Uprime(s) - U(s)) > delta)
%             delta = abs(Uprime(s) - U(s));
%         end
%     end
%     U_trace = [U_trace;U];
%     iter = iter + 1;
%     
%     if(delta < (eta * (1-gamma) / gamma))
%         break;
%     end
% end
     
end