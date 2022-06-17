// Model alpha + beta*x + gamma*x^2 + delta*x^3
data {
    int<lower=0> N;
    vector[N] x;
    vector[N] y;
}

parameters {
    real<lower=0> alpha;
    real<lower=0> beta;
    real<lower=0> gamma;
    real<lower=0> delta;
    real<lower=0> epsilon;
    real<lower=0> sigma;
}

model {
    alpha ~ normal(0,10);
    beta ~ normal(0.007,0.1);
    gamma ~ normal(0,0.1);
    delta ~ normal(0,0.1);
    epsilon ~ normal(0,0.1);
    sigma ~ normal(0,1);

    y ~ normal(alpha + beta * x + gamma * x^2 + delta * x^3 + epsilon * x^4, sigma);
}

generated quantities {
    vector[N] y_sim;
    for(i in 1:N)
        y_sim[i] = normal_rng(alpha + beta * x[i] + gamma * x[i]^2 + delta * x[i]^3 + epsilon * x[i]^4, sigma);
}