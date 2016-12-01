function util = CS4300_MDP_policy_evaluation(pi, U, P, S, R, k, gamma)
%Given a policy P_i, calculate Ui = U_p_i, the utility of each state if p_i
%were to be executed
counter = 1;

while counter <= k
    util = U;
    for s = 1:size(S, 2)
        above = CS4300_move(s, 1);
        left = CS4300_move(s, 2);
        down = CS4300_move(s, 3);
        right = CS4300_move(s, 4);
        
            
        u = U(above) * P(s,1).probs(above) + U(left) * P(s,1).probs(left) + U(right) * P(s,1).probs(right);
        l = U(left) * P(s,2).probs(left) + U(above) * P(s,2).probs(above) + U(down) * P(s,2).probs(down);
        d = U(down) * P(s,3).probs(down) + U(left) * P(s,3).probs(left) + U(right) * P(s,3).probs(right);
        r = U(right) * P(s,4).probs(right) + U(above) * P(s,4).probs(above) + U(down) * P(s,4).probs(down);
    

        if(s == 1)
            d = U(down) * P(s,3).probs(down) + U(right) * P(s,3).probs(right);
            l = U(left) * P(s,2).probs(left) + U(above) * P(s,2).probs(above);
        end
        
        if(s == 4)
            d = U(down) * P(s,3).probs(down) + U(left) * P(s,3).probs(left);
            r = U(right) * P(s,4).probs(right) + U(above) * P(s,4).probs(above);
        end
        
        if(s == 13)
            u = U(above) * P(s,1).probs(above) + U(right) * P(s,1).probs(right);
            l = U(left) * P(s,2).probs(left) + U(down) * P(s,2).probs(down);
        end
        
        if(s == 16)
            u = U(above) * P(s,1).probs(above) + U(left) * P(s,1).probs(left);
            r = U(right) * P(s,4).probs(right) + U(down) * P(s,4).probs(down);
        end

        switch pi(s)
            case 1
                U(s) = R(s) + gamma * u;
            case 2
                U(s) = R(s) + gamma * l;
            case 3
                U(s) = R(s) + gamma * d;
            case 4
                U(s) = R(s) + gamma * r;
        end
    end
    counter = counter + 1;
end
util = U;

