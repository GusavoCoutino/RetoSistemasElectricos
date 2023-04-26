clear;
clc;

xline(0,Color="red");
xline(3, Color="red");

xline(12, Color="blue");
xline(15, Color="blue");

hold on
inicio = [3 0];
final = [12 0];

espacioPuntos = final-inicio;

axis([0 18 0 18]);

x = 3;
y = input("Que coordenada en y quieres?");
ultimoPuntoX = 12 - x;

x2 = 12;
y2 = input("Que coordenada en y quieres para el segundo punto?");


y3 = input("Que coordenada en y quieres? (Segunda coordenada)");
y4 = input("Que coordenada en y quieres? (Tercera coordenada)");


q = 11*10^-8;
ke = 8.9875517873681764*10^9;


dx = x2-x;
dy = y2-y;
r = sqrt(dx^2+dy^2);

dex = ke*(q)/(r^3)*dx;        
dey = ke*(q)/(r^3)*dy;

dx2 = x2-x;
dy2 = y3-y;
r2 = sqrt(dx2^2+dy2^2);

dex2 = ke*(q)/(r2^3)*dx2;        
dey2 = ke*(q)/(r2^3)*dy2;

dx3 = x2-x;
dy3 = y4-y;
r3 = sqrt(dx3^2+dy3^2);

dex3 = ke*(q)/(r3^3)*dx3;        
dey3 = ke*(q)/(r3^3)*dy3;

% Suma final
detXFinal = dex+dex2+dex3;
detYFinal = dey+dey2+dey3;

hold on
plot(x2,y2)
hold on
plot(x2, y3)
hold on
plot(x2, y4);
hold on
quiver(x,y,detXFinal/5, detYFinal)
hold on
quiver(x2,y2,-detXFinal/5, detYFinal)
hold on
quiver(x2,y3,-detXFinal/5, detYFinal)
hold on
quiver(x2,y4,-detXFinal/5, detYFinal)
hold on

