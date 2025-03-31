%% CZĘŚĆ 3
% 1. Wczytaj dane z plików i przypisz je do zmiennych 
%    o wybranych przez siebie nazwach.
% 2. Narysuj dwa wykresy liniowe z wypełnieniem, 
%    znajdujące się na jednym rysunku. Wypełnienie powinno być 
%    zlokalizować pomiędzy danym wykresem, a odpowiadającą osią poziomą. 
%    Niech wykres stali miękkiej narysowany będzie kolorem czerwonym,
%    z przeźroczystym wypełnieniem tego samego koloru, o parametrze 
%    przenikania 0.1. Niech wykres stali twardej narysowane będzie kolorem
%    niebieskim, z przeźroczystym wypełnieniem tego samego koloru, 
%    o parametrze przenikania 0.1. Dla obu wykresów zakres osi x 
%    powinien wynosić od 0 do 3, a jej opis to Przemieszczenie, mm. 
%    Zakres osi y dla obu wykresów powinien wynosić od 0 do 50000, 
%    a jej opis to Siła, N. Oba wykresy powinny mieć linie siatki.
% 3. Oblicz zakreślone pole pod wykresem dla obu plików.

clear; clc
%%  1.Import danych z plików z pomocą biblioteki numpy do zmiennej "dane"
dane_miekka = readmatrix('dane\czesc3\stal_miekka.TXT');
dane_twarda = readmatrix('dane\czesc3\stal_twarda.TXT');

%% 2. Rysowanie wykresów
figure

% Wykres na górze
subplot(2,1,1)

% Dodanie wierchołka o wartości 0 aby wypełnienie było poprawne
wspolrzedne_x = dane_miekka(:,1);
wspolrzedne_x = cat(1,wspolrzedne_x,wspolrzedne_x(end));
wspolrzedne_y = dane_miekka(:,2);
wspolrzedne_y = cat(1,wspolrzedne_y,0);

hold on
fill(wspolrzedne_x,wspolrzedne_y,'red','FaceAlpha',0.1,'LineStyle','none')
plot(dane_miekka(:,1),dane_miekka(:,2),'- r')

grid("on")
xlim([0,3])
ylim([0,50000])
xlabel('Przemieszczenie, mm')
ylabel('Siła, N')
title('Stal miękka')
hold off

% Wykres na dole
subplot(2,1,2)

% Dodanie wierchołka o wartości 0 aby wypełnienie było poprawne
wspolrzedne_x = dane_twarda(:,1);
wspolrzedne_x = cat(1,wspolrzedne_x,wspolrzedne_x(end));
wspolrzedne_y = dane_twarda(:,2);
wspolrzedne_y = cat(1,wspolrzedne_y,0);

hold on
fill(wspolrzedne_x,wspolrzedne_y,'blue','FaceAlpha',0.1,'LineStyle','none')
plot(dane_twarda(:,1),dane_twarda(:,2))

grid("on")
xlim([0,3])
ylim([0,50000])
xlabel('Przemieszczenie, mm')
ylabel('Siła, N')
title('Stal twarda')
hold off

%%  3. Obliczanie zakreślonego pola pod wykresem
Pole_miekka = trapz(dane_miekka(:,1),dane_miekka(:,2))/1000;
Pole_twarda = trapz(dane_twarda(:,1),dane_twarda(:,2))/1000;





