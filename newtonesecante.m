# Método de Newton e Secante

f = @(x) x^2 + 2*x - 2;
df = @(x) 2*x + 2;        # Derivada de f(x) necessária para Newton

# --- PARTE 1: MÉTODO DA SECANTE (Seu código original) ---
x0 = 0;
x1 = 1;
tolerancia = 0.0001;
erro_sec = 1;

while (erro_sec > tolerancia)
    x_novo = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    erro_sec = abs(x_novo - x1);
    x0 = x1;
    x1 = x_novo;
end

# --- PARTE 2: MÉTODO DE NEWTON ---
xn = 1;                   # Newton precisa de apenas 1 chute inicial
erro_newton = 1;

while (erro_newton > tolerancia)
    xn_proximo = xn - f(xn) / df(xn);

    erro_newton = abs(xn_proximo - xn);
    xn = xn_proximo;
end

---
printf('Raiz pela Secante: %.4f\n', x1);
printf('Raiz por Newton:  %.4f\n', xn);
