syms x f(x) a b

X = linspace(0, 10, 100);
Y = 2*(1 - exp(-X*0.5))+ rand(1, length(X))*0.1;
f(x) = a*(1 - exp(-b*x));

errors = (Y - f(X));
err = sum(errors.*errors);

% [err_X err_Y] = meshgrid(linspace(0, 3, 20));
% err_Z = double(subs(err, {a, b}, {err_X, err_Y}));
% mesh(err_X, err_Y, err_Z);

err_func = matlabFunction(err, 'Vars', {[a b]});
params = fminsearch(err_func, [1 1])

 func_X = linspace(min(X), max(X));
 func_Y = double(subs(f(func_X), {a, b}, {params(1), params(2)}));
 plot(X, Y, func_X, func_Y);
