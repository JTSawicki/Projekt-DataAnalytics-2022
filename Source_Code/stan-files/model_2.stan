// Model alpha + beta*x + gamma*x^2
data {
    int<lower=0> N;
    vector[N] x;
    vector[N] y;
}

parameters {
    real<lower=0> alpha;
    real<lower=0> beta;
    real<lower=0> gamma;
    real<lower=0> sigma;
}

model {
    alpha ~ normal(0,10);
    beta ~ normal(0.007,0.1);
    gamma ~ normal(0,0.1);
    sigma ~ normal(0,1);

    y ~ normal(alpha + beta * x + gamma * x^2, sigma);
}

generated quantities {
    vector[N] y_sim;
    for(i in 1:N)
        y_sim[i] = normal_rng(alpha + beta * x[i] + gamma * x[i]^2, sigma);
}