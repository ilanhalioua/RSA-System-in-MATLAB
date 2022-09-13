function [C,CC] = rsa_encrypt(M,n,e)
% INPUT:
% M: string of characters: Capital letters A-Z and the space
% n: positive integer, defined as the product of p and q
% e: positive integer, such that gcd(e, (p-1)(q-1))=1
%
% OUTPUT:
% C: vector of nonnegative integers that encode the message M
% CC: string of characters, conversion of C
%

LS = [];
N = [];
d = 1;
add = 0;
C = [];
CC = [];
for i = 1:length(M)
    if (27^i)<n
        d = i;
    end
end
S = [];
i = 1;
for k = 1:d:length(M)
   if k+d-1<=length(M)
       S{i} = M(k:(k+d-1));
   else
       S{i} = M(k:length(M));
   end
   i = i+1;
end
for i = 1:length(M)
        if M(i) == ' '
            subNum = 26;
        else 
            subNum = double(M(i))- 65;
        end
        LS =[LS subNum];
end
for u=1:d:length(LS)
        if u+d-1<=length(M)
       vector1 = LS(u:(u+d-1));
       
        else
       vector1 = LS(u:length(LS));
        end
    for j=1:length(vector1)
        add = add + (vector1(j)*(27^(d-j)));
    end
    usemod = expmod(add,e,n);
    N =[N usemod];
    add = 0;
end
for i = 1:length(N)
    R = [];
    t = 0;
    largeNum = N(i);
    while t<4
    quot = floor(largeNum/27);
    exc = rem(largeNum,27);
    R = [R exc];
    largeNum = quot;
    t = t+1;
    end
    C = [C R];
    for j = length(R):-1:1
        val = R(j);
        if val == 26
            lett = ' ';
        else
            lett = char(val+65);
        end
        CC = [CC lett];
    end
end
disp(C);
disp(CC);
end

