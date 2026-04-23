% método da bissecção

a = 1;
b = 1.1;
erro = 0.1;

f = @(x) x^8 - 2;

meio = (a + b)/2

while abs(f(meio)) > erro

  if(f(a) * f(meio) < 0)
    b = meio;
  else
    a = meio;
  endif

  meio = (a + b)/2

endwhile

raiz = meio
