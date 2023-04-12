figure(1)

xline(0,Color="red");
xline(3, Color="red");

xline(12, Color="blue");
xline(15, Color="blue");

hold on
inicio = [3 0];
final = [12 0];

espacioPuntos = final-inicio;

axis([0 18 0 18]);

for i = 1:50
    inicio(2) = inicio(2)+1;
    final(2) = final(2)+1;
    quiver(inicio(1), inicio(2),espacioPuntos(1),espacioPuntos(2),0);
    hold on
end

x = input("Que coordenada en x quieres?");
y = input("Que coordenada en y quieres?");
ultimoPuntoX = 12 - x+1;
quiver(x,y, ultimoPuntoX, 0);


