function res = CS4300_MDP_policy3(S,A,P,U,action)

above = CS4300_move(s,1);
left = CS4300_move(s,2);
down = CS4300_move(s,3);
right = CS4300_move(s,4);
    

    %corner cases
    if(s == 1 || s == 4 || s == 13 || s == 16) 
        if(s == 1)
            %Action up 1
            switch action
                case 1
                   res = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    res = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down);
                case 3
                    res = P(s,3).probs(down) + P(s,3).probs(right) * U(right);
                otherwise
                    res = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end
        end
        if(s == 13)
            switch action
                case 1
                   res = P(s,1).probs(above) * U(above) + P(s,1).probs(right) * U(right);
                case 2
                    res = P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    res = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    res = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end

        end
        if(s == 4)
            switch action
                case 1
                   res = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    res =  P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    res = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left);
                otherwise
                    res = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right);
            end

        end
        if(s == 16)
            switch action
                case 1
                   res = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left);
                case 2
                    res = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    res = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    res = P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end

        end
    %all other cases
    else
        switch action
                case 1
                   res = P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    res = P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    res = P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    res = P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
        end
    end


