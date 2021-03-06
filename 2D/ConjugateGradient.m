function [xmin, iter] = ConjugateGradient(A, b, x)
    tol = 10^-14;
    r = b - A*x;
    p = r;
    repeat = true;
    iter = 0;
    while repeat
        alpha = (r' * r) / (p' * A * p);
        xCurrent = x + alpha * p;
        rCurrent = r - alpha * A * p;
        DisplayLine(x(1), x(2), xCurrent(1), xCurrent(2));
        DisplayPoint(xCurrent);
        if (norm(rCurrent) < tol)
            repeat = false;
            continue;
        end
        beta = (rCurrent' * rCurrent) / (r' * r);
        pCurrent = rCurrent + beta * p;
        x = xCurrent;
        p = pCurrent;
        r = rCurrent;
        iter = iter + 1;
    end
    xmin = x;
end

