% Método do Ponto Fixo

chute = 0.5;                # Chute inicial
phi = @(x) exp(x)/4;        # A função de iteração x = phi(x)
tol = 0.0001;               # Erro máximo tolerado
erro = 1;                   # Inicialização do erro

# 2. Loop de Iteração
while (erro > tol)
    prox_chute = phi(chute);
    erro = abs(prox_chute - chute);

    chute = prox_chute;     # Atualiza para a próxima rodada
endwhile

printf('Raiz encontrada: %.4f\n', chute)

