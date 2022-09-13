% INPUT: x,e,n positive integers x basis, e exponent, n modulus
% OUTPUT: y integer such that y=xˆe mod (n)

function y = expmod (x, e, n)

    %anything raised to 0th power = 1 so return 1
    if (e == 0)
        y = 1;
        return;
    end

    %recurse
    z = expmod(x, floor(e/2), n);

    %if even square the result
    if (mod(e, 2) == 0)
        y = mod(z*z, n);
        return;
    else
        %odd so square the result & multiply by itself
        y = mod(x*z*z, n);
        return;
    end
end