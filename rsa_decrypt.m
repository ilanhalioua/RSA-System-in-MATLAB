function [M,d] = rsa_decrypt(CC,p,q,e)
% INPUT:
% CC: string of characters
% p,q: prime numbers
% e: positive integer, such that gcd(e, (p-1)(q-1))=1
%
% OUTPUT:
% M: string of characters: the secret message that corresponds to CC.
% d: private key exponent, such that 0<d<(p-1)*(q-1)
%

On = (p-1)*(q-1);
[s,t,gcd] = extendeuclidean(e,On);
n = p*q;
d=expmod(s,1,On);
k = 1;
D = [];
Z = [];
N = [];
M = [];
for i = 1:4:length(CC)
    D{k} = CC(i:i+3);
    k = k+1;
end
for j = 1:length(D)
    Z = D{j};
    sum = 0;
    for i = 1:4
        if Z(i)==' '
            sum = sum + (26*(27^(4-i)));
        else
            sum = sum + (double(Z(i))-65)*(27^(4-i));
        end
    end
    N =[N sum];
end
for i = 1:length(N)
    N2(i) = expmod(N(i),d,n);
end
for i = 1:length(N2)
    R = [];
    t = 0;
    largeNum = N2(i);
    while t<3
    quot = floor(largeNum/27);
    remainder = rem(largeNum,27);
    R = [R remainder];
    largeNum=quot;
    t=t+1;
    end
    
    for j = length(R):-1:1
        val = R(j);
        if val == 26
            lett = ' ';
        else
        lett=char(val+65);
        end
        if (j == 1) && (R(2) == 0) && (R(1) == 0)
           M = [M];
        else
        M = [M lett];
        end
    end
end
disp(d);
disp(M);
end

