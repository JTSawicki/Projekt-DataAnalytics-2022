// Model alpha + beta*x
data {
    int<lower=0> N;
    vector[N] x;
    vector[N] y;
}

// Parameter prior
// <lower=0> - ponieważ zależność wiemy że musi być dodatnia
parameters {
    real<lower=0> alpha;
    real<lower=0> beta;
    real<lower=0> sigma;
}

model {
    alpha ~ normal(0,10);
    beta ~normal(0.007,0.01);
    sigma ~ normal(0,1);

    y ~ normal(alpha + beta * x, sigma);
}

generated quantities {
    vector[N] y_sim;
    for(i in 1:N)
        y_sim[i] = normal_rng(alpha + beta * x[i], sigma);
}