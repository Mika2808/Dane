% CZĘŚĆ 1
% 1. Wczytaj dane z pliku i przypisz je do zmiennej o 
%  wybranej przez siebie nazwie.

% 2. Narysuj wykres punktowy, w formie czerwonych 
%  kropek dla co 10 punktu z wczytanego zbioru.

% 3. Przeprowadź aproksymację liniową dla wczytanych danych, 
%  a następnie wyświetl współczynnik kierunkowy funkcji aproksymującej.

% 4. Narysuj dwa, nałożone na siebie wykresy. Pierwszy z nich 
%  to wykres punktowy dla danego zbioru punktów, a drugi to 
%  wykres liniowy dla funkcji aproksymującej. Wykres powinien 
%  zawierać opisy osi x oraz y, a także legendę.

clear; clc

%% 1. Wczytywanie danych z pliku
dane = readmatrix('dane\czesc1\punkty.TXT');

%% 2. Rysowanie wykresu punktowego dla co 10 punktu z "dane"

% Tworzenie wektorów zawierających współrzędne x i y o odpowiednim
% rozmiarze
liczba_wierszy = size(dane,1);

vector_x = zeros(liczba_wierszy,1);
vector_y = zeros(liczba_wierszy,1);

% Przypisywanie wektorom co 10 współrzędną z macierzy "dane"
for i = 1:10:liczba_wierszy
    vector_x(i) = dane(i,1);
    vector_y(i) = dane(i,2);
end

% Tworzenie wykresu punktowego za pomocą stworzonych wektorów
figure
scatter(vector_x,vector_y,'red')

%% 3. Aproksymacja liniowa dla wczytanych danych    
ya1 = fit(dane(:,1),dane(:,2),'poly1');

%% 4. Dwa nakładające się wykresy
figure
plot(ya1,dane(:,1),dane(:,2),".")

