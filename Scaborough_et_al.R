# Simple model linking exponential tumour growth to an
# exponential survival function

g<- log(2)/62 # 62 day (2 months) doubling time
k <- 0.001 # rate parameter

t<-seq(0,500,by=1) # time-frame

# plot dynamics
plot(t,exp(g*t),type="l",xlab="Time (Days)",ylab="Tumour Burden")
# doubling time slows modestly
lines(t,exp(0.9*g*t),col=2)
# 100 is the death number
abline(h=100,lty=2)

# the above two options give following survival time using threshold
# y = exp(g*t), 100 = exp(g*t), t = log(100)/g
log(100)/g # 412 days
log(100)/(0.9*g)# 458 days

# lets now account for cumulative risk - as is what is observed
S<- exp(-k*exp(g*t)*t)
plot(t,S,type="l", ylab="Survival Probability",xlab = "Time (Days)")
S<- exp(-k*exp(0.9*g*t)*t)
lines(t,S,col=2)

# the above will depend on your choice of K, but there is something else to
# remember here, tumour burden doesn't really explain that much of the 
# survival variance, so in reality....

k0<- 0.01
k1<- 0.001

S<- exp(-(k0+k1*exp(g*t))*t)
plot(t,S,type="l", ylab="Survival Probability",xlab = "Time (Days)")
S<- exp(-(k0+k1*exp(0.9*g*t))*t)
lines(t,S,col=2)

# This may make your results stronger - have a play