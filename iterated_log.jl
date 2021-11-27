using LinearAlgebra
using Distributions
Pkg.add("StatsBase")
Pkg.add("LaTeXStrings")
using StatsBase
Pkg.add("PlotlyJS")
using PlotlyJS
using Plots
using LaTeXStrings
#закон повторного логарифма
plotly()
n = 100000
x = Bernoulli(0.5)
xi = rand(x, n)*2 - ones(n)
S = cumsum(xi)
sq(x) = 2sqrt(x)
sq_ln(x) = (2*x*log(log(x)))^0.5
msq(x) = -2sqrt(x)
msq_ln(x) = -(2*x*log(log(x)))^0.5
plt = plot(S, lw = 0.3, legend = :topleft, label ="")

xi = rand(x, n)*2 - ones(n)
S = cumsum(xi)
chk = sum(S .> 2*(cumsum(ones(n)).^0.5))
chk2 = sum(S .< -2*(cumsum(ones(n)).^0.5))
plot!(plt, S, lw = 0.3, label = "")

plot!(sq, label = L"$\pm 2\sqrt{n}$", color = "blue")
plot!(sq_ln, label = L"\pm\sqrt{2n \ln \ln n}", color = "black")
plot!(msq, label = "", color = "blue")
plot!(msq_ln, label = "", color = "black")
xlabel!(L"n")
ylabel!(L"S_n")
savefig("iterated_log.png")
pwd()
