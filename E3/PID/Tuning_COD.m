%Tuning
fun = @(s)(0.0091*s+0.000297)/(s^2+0.4173*s+0.02478)
x = particleswarm(fun,1)