% Definição da função
f = @(x) x.*x.*x;

% Intervalo de integração
a = 0; 
b = 2;
n = 100;

h = (b - a) / n; % 0,02

ponto = [a:h:b]; % [a=0 ,i1= 0.02, i2 = 0.04,...,i98 = 1.96, i99 = 1.98, b=2]

soma_impares = sum(f(ponto(2:2:end-1))); % i2,i4,i6,i8...

soma_pares = sum(f(ponto(3:2:end-2))); % i3,i5,i7,i9...

area = (h / 3) * (f(ponto(1)) + 4 * soma_impares + 2 * soma_pares + f(ponto(end)));

disp('Resultado da Integral:');
disp(area);




  
% Dados da tabela fornecida na prova
t = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
v = [0.0, 16.8, 42.4, 76.8, 120.0, 172.0, 232.8, 302.4, 380.8, 468.0, 564.0];

% O passo h é o intervalo de tempo entre as medições
h = 2;

% Na Regra de Simpson, a fórmula é: (h/3) * (f(x0) + 4*f(impares) + 2*f(pares) + f(xn))
soma_impares = sum(v(2:2:end-1));
soma_pares = sum(v(3:2:end-2));

% Aplicação final da fórmula de Simpson 1/3
altura = (h / 3) * (v(1) + 4 * soma_impares + 2 * soma_pares + v(end));

fprintf('A altura do foguete após 20 segundos é: %.2f pés\n', altura);
