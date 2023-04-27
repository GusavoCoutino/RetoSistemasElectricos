clear;
clc;

%Pide el tamano del campo electrico de cada lado
inicioCampoPositivo = input("Donde quieres que empiece el campo positivo? ");
finalCampoPositivo = input("Donde quieres que termine el campo positivo? ");

inicioCampoNegativo = input("Donde quieres que empiece el campo negativo? ");
finalCampoNegativo = input("Donde quieres que termine el campo negativo? ");



% Pide numero de cargas
cargasPositivas = input("Ingresa el numero de cargas positivas: ");
cargasNegativas = input("Ingresa el numero de cargas negativas: ");

% Inicializa los arreglos para las cargas
x = zeros(1,cargasPositivas);
y = zeros(1,cargasPositivas);
q = zeros(1,cargasPositivas);
x2 = zeros(1,cargasPositivas);
y2 = zeros(1,cargasPositivas);
q2 = zeros(1,cargasPositivas);

% Obtiene coordenadas y magnitud por carga
for i = 1:cargasPositivas
    x(i) = input(sprintf("Ingresa la coordenada x para la carga %d: ", i));
    y(i) = input(sprintf("Ingresa la coordenada y para la carga %d: ", i));
    q(i) = input(sprintf("Ingresa la magnitud de la carga %d: ", i));
end

for i = 1:cargasNegativas
    x2(i) = input(sprintf("Ingresa la coordenada x para la carga %d: ", i));
    y2(i) = input(sprintf("Ingresa la coordenada y para la carga %d: ", i));
    q2(i) = input(sprintf("Ingresa la magnitud de la carga %d: ", i));
end

% Crea los puntos para calcular el campo electrico 
[xx, yy] = meshgrid(0:1:30, 0:1:30);

% Calculo de cada carga electrica positiva
k = 9e9;  
ex = 0;
ey = 0;
for i = 1:cargasPositivas
    dx = xx - x(i);
    dy = yy - y(i);
    r = sqrt(dx.^2 + dy.^2);
    ex = ex + k * q(i) * dx ./ r.^3;
    ey = ey + k * q(i) * dy ./ r.^3;
end

% Calculo de cada carga electrica negativas
ex2 = 0;
ey2 = 0;
for i = 1:cargasNegativas
    dx2 = xx - x2(i);
    dy2 = yy - y2(i);
    r2 = sqrt(dx2.^2 + dy2.^2);
    ex2 = ex2 + k * q2(i) * dx2 ./ r2.^3;
    ey2 = ey2 + k * q2(i) * dy2 ./ r2.^3;
end



% Grafica los vectores de las cargas positivas
quiver(xx, yy, ex, ey, 2)
hold on


% Grafica los vectores de las cargas negativas
quiver(xx, yy, ex2, ey2, 2)
hold on

% Crea las placas positivas y negativas
xline(0, 'r', 'LineWidth', 2)
line([3 3], [inicioCampoPositivo finalCampoPositivo], 'Color', 'r', 'LineWidth', 2)
line([12 12], [inicioCampoNegativo finalCampoNegativo], 'Color', 'b', 'LineWidth', 2)
xline(15, 'b', 'LineWidth', 2)

% Grafica las cargas
for i = 1:cargasPositivas
    if q(i) > 0
        plot(x(i), y(i), 'ro', 'MarkerSize', 8, 'LineWidth', 2)
    else
        plot(x(i), y(i), 'bo', 'MarkerSize', 8, 'LineWidth', 2)
    end
end


for i = 1:cargasNegativas
    if q(i) > 0
        plot(x2(i), y2(i), 'ro', 'MarkerSize', 8, 'LineWidth', 2)
    else
        plot(x2(i), y2(i), 'bo', 'MarkerSize', 8, 'LineWidth', 2)
    end
end

xlabel('x')
ylabel('y')
title('Campo electrico')
axis equal
