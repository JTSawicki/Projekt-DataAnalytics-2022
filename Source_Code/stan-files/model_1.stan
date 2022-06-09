data { // Dane wejściowe
   int N;
}

parameters { // Zmienne programu STAN idące na wyjście
   real random;
}

model { // Obliczenia i zmienne lokalne
   random ~ normal(0, N);
}

generated quantities { // Dane wyjściowe obliczne po model
   int result = 0;
   for (i in 1:N) {
      result += i*i;
      print("Stan jest głupi", i);
   }
}