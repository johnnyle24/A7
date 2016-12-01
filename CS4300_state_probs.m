function probs = CS4300_state_probs(s, P, U)


policy = zeros(1, 16);
max = zeros(1,16);

    su = CS4300_move(s, 1);
    sl = CS4300_move(s, 2);
    sd = CS4300_move(s, 3);
    sr = CS4300_move(s, 4);
    
    u = U(su) * P(s,1).probs(su) + U(sl) * P(s,1).probs(sl) + U(sr) * P(s,1).probs(sl);
    l = U(sl) * P(s,2).probs(sl) + U(su) * P(s,2).probs(su) + U(sd) * P(s,2).probs(sd);
    d = U(sd) * P(s,3).probs(sd) + U(sl) * P(s,3).probs(sl) + U(sr) * P(s,3).probs(sr);
    r = U(sr) * P(s,4).probs(sr) + U(su) * P(s,4).probs(su) + U(sd) * P(s,4).probs(sd);
    
    % upper corners
    if su == s && sr == s
        u = U(su) * P(s,1).probs(su) + U(sl) * P(s,1).probs(sl);
        r = U(sr) * P(s,4).probs(sr) + U(sd) * P(s,4).probs(sd);
    elseif su == s && sl == s
        u = U(su) * P(s,1).probs(su) + U(sr) * P(s,1).probs(sr);
        l = U(sl) * P(s,2).probs(sl) + U(sd) * P(s,2).probs(sd);
    end
    
    % bottom corners
    if sd == s && sr == s
        d = U(sd) * P(s,3).probs(sd) + U(sl) * P(s,3).probs(sl);
        r = U(sr) * P(s,4).probs(sr) + U(su) * P(s,4).probs(su);
    elseif sd == s && sl == s
        d = U(sd) * P(s,3).probs(sd) + U(sr) * P(s,3).probs(sr);
        l = U(sl) * P(s,2).probs(sl) + U(su) * P(s,2).probs(su);
    end
    
    probs = [u, l, d, r];
end