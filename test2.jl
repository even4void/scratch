sum_abs(vec) = sum(abs(x) for x in vec)

v = rand(100)

@time sum_abs(v);
@time sum_abs(v);
