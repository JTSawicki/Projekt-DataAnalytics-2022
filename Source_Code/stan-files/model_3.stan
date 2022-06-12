// Model alpha + beta*x + gamma*x^2 + delta*x^3
data {
    int<lower=0> N;
    vector[N] x;
    vector[N] y;
}

parameters {
    real alpha;
    real beta;
    real gamma;
    real delta;
    real<lower=0> sigma;
}

model {
    alpha ~ normal(0,10);
    beta ~ normal(0,10);
    gamma ~ normal(0,10);
    delta ~ normal(0,10);
    sigma ~ normal(0,1);

    y ~ normal(alpha + beta * x + gamma * x^2 + delta * x^3, sigma);
}

generated quantities {
    vector[N] y_sim;
    for(i in 1:N)
        y_sim[i] = normal_rng(alpha + beta * x[i] + gamma * x[i]^2 + delta * x[i]^3, sigma);
}