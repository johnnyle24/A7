function res = CS4300_Max_Arg(S,P,U)

v = [];

for a = 1:4
    for s = 1:16
        val = P(s,a).probs(s)*U(s);
        v = [v;val];
    end
end

res = max(v);


