m = 10000;
for i in 1:5
    A = rand(m, m)
    B = rand(m, 1)
    t = time()
    A \ B
    println(time() - t)
end;

function f(x)
    tmp = x + 1
    return x
end
