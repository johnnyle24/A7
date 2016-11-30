function util = CS4300_MDP_policy_evaluation(S,A,P,R,policy,U)
%Given a policy P_i, calculate Ui = U_p_i, the utility of each state if p_i
%were to be executed

util = zeros(1,16);

for s = 1:16
   action = policy(s);
   
   if(s == 1 || s == 4 || s == 13 || s == 16)
        if(s == 1)
            switch action 
                case 1
                    util(s) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down);
                case 3
                    util(s) = P(s,3).probs(down) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end
        end
        if(s == 13)
            
            switch action 
                case 1
                    util(s) = P(s,1).probs(above) * U(above) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end

        end
        if(s == 4)
            
            switch action 
                case 1
                    util(s) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left);
                otherwise
                    util(s) = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right);
            end
        end
        if(s == 16)
            switch action 
                case 1
                    util(s) = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left);
                case 2
                    util(s) = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end
        end
       
       
       
   else
        switch action
            case 1


            case 2


            case 3


            otherwise



        end
       
       
   end
   
   
    
end