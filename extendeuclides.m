function [s,t,gcd] = extendeuclides(a,b)
% INPUT: a,b positive integers
% OUTPUT: gcd greatest common divisor of a and b;
% s, t integers such that gcd(a,b)=s*a+t*b

A = [1 0 a];
B = [0 1 b];
T = zeros(1,3);

while B(3)~=0
    q = floor(A(3)/B(3));
    T = A-(B*q);
    A = B;
    B = T;
end

gcd = A(3)
s = A(1)
t = A(2)
end

