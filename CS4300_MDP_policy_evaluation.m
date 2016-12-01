function util = CS4300_MDP_policy_evaluation(S,A,P,R,policy,U)
%Given a policy P_i, calculate Ui = U_p_i, the utility of each state if p_i
%were to be executed

util = zeros(1,16);

for s = 1:16
   action = policy(s);
   above = CS4300_move(s,1);
    left = CS4300_move(s,2);
    down = CS4300_move(s,3);
    right = CS4300_move(s,4);

   
   if(s == 1 || s == 4 || s == 13 || s == 16)
        if(s == 1)
            switch action 
                case 1
                    util(s) = R(s) + P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = R(s) + P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down);
                case 3
                    util(s) = R(s) + P(s,3).probs(down) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = R(s) + P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end
        end
        if(s == 13)
            
            switch action 
                case 1
                    util(s) = R(s) + P(s,1).probs(above) * U(above) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = R(s) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = R(s) + P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = R(s) + P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end

        end
        if(s == 4)
            
            switch action 
                case 1
                    util(s) = R(s) + P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);
                case 2
                    util(s) = R(s) + P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = R(s) + P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left);
                otherwise
                    util(s) = R(s) + P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right);
            end
        end
        if(s == 16)
            switch action 
                case 1
                    util(s) = R(s) + P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left);
                case 2
                    util(s) = R(s) + P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);
                case 3
                    util(s) = R(s) + P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);
                otherwise
                    util(s) = R(s) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);
            end
        end
       
       
       
   else
        switch action
            case 1
                util(s) = R(s) + P(s,1).probs(above) * U(above) + P(s,1).probs(left) * U(left) + P(s,1).probs(right) * U(right);

            case 2
                util(s) = R(s) + P(s,2).probs(above) * U(above) + P(s,2).probs(down) * U(down) + P(s,2).probs(left) * U(left);

            case 3
                util(s) = R(s) + P(s,3).probs(down) * U(down) + P(s,3).probs(left) * U(left) + P(s,3).probs(right) * U(right);

            otherwise
                util(s) = R(s) + P(s,4).probs(above) * U(above) + P(s,4).probs(right) * U(right) + P(s,4).probs(down) * U(down);

        end
       
       
   end
   
   
    
end

% counter = 1;
% 
% while counter <= k
%     for s=1:size(S, 2)
%         su = CS4300_move(s, 1);
%         sl = CS4300_move(s, 2);
%         sd = CS4300_move(s, 3);
%         sr = CS4300_move(s, 4);
% 
% 
%         u = U(su) * P(s,1).probs(su) + U(sl) * P(s,1).probs(sl) + U(sr) * P(s,1).probs(sl);
%         l = U(sl) * P(s,2).probs(sl) + U(su) * P(s,2).probs(su) + U(sd) * P(s,2).probs(sd);
%         d = U(sd) * P(s,3).probs(sd) + U(sl) * P(s,3).probs(sl) + U(sr) * P(s,3).probs(sr);
%         r = U(sr) * P(s,4).probs(sr) + U(su) * P(s,4).probs(su) + U(sd) * P(s,4).probs(sd);
% 
%         % upper corners
%         if su == s && sr == s
%             u = U(su) * P(s,1).probs(su) + U(sl) * P(s,1).probs(sl);
%             r = U(sr) * P(s,4).probs(sr) + U(sd) * P(s,4).probs(sd);
%         elseif su == s && sl == s
%             u = U(su) * P(s,1).probs(su) + U(sr) * P(s,1).probs(sr);
%             l = U(sl) * P(s,2).probs(sl) + U(sd) * P(s,2).probs(sd);
%         end
% 
%         % bottom corners
%         if sd == s && sr == s
%             d = U(sd) * P(s,3).probs(sd) + U(sl) * P(s,3).probs(sl);
%             r = U(sr) * P(s,4).probs(sr) + U(su) * P(s,4).probs(su);
%         elseif sd == s && sl == s
%             d = U(sd) * P(s,3).probs(sd) + U(sr) * P(s,3).probs(sr);
%             l = U(sl) * P(s,2).probs(sl) + U(su) * P(s,2).probs(su);
%         end
% 
%         switch pi(s)
%             case 1
%                 U(s) = R(s) + gamma * u;
%             case 2
%                 U(s) = R(s) + gamma * l;
%             case 3
%                 U(s) = R(s) + gamma * d;
%             case 4
%                 U(s) = R(s) + gamma * r;
%         end
%     end
%     counter = counter + 1;
% end
% end