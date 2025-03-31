%% CZĘŚĆ 2
% 1. Narysuj wykres liniowy, zawierający nałożone na siebie dane 
%  ze wszystkich plików z folderu czesc2.
% 2. Przeprowadź aproksymację liniową oraz wyznacz współczynnik 
%  kierunkowy funkcji aproksymującej dla wszystkich plików z 
%  folderu czesc2. Stwórz wektor, który będzie zawierał wyznaczone
%  współczynniki kierunkowe dla wszystkich przeanalizowanych 
%  plików z tego folderu.
% 3. Oblicz średnią oraz odchylenie standardowe dla wektora, 
%  zawierającego współczynniki kierunkowe funkcji.
% 4. Narysuj histogram dla wyznaczonych współczynników kierunkowych.

clear; clc

%% 1.Wczytywanie danych i narysowanie wykresu liniowego
files = cell(168,1);

folder = 'dane/czesc2/';

% Pętla do wczytywania plików
for i=1:169
    % Najpierw, aby dane wczytały się z poprawnego pliku tworzymy
    % odpowiednią nazwę za pomocą:
    % a) sprintf - pozwala nam na włączenie do ciagu znaków
    %    inkrementowanego i (%d -> int)
    % b) fullfile - pozwala na złączenie nam dwóch łańcuchów, dzięki czemu
    %    otrzymamy odpowiednią ścieżkę do pliku

    nazwa_pliku = fullfile(folder,sprintf('punkty%d.txt',i));

    % Dla każdego pliku wczytujemy współrzędne do "dane"
    dane = readmatrix(nazwa_pliku);
    
    % Wrzucamy odpowiednie współrzędne do naszych wektorów
    rozmiar_danych = size(dane,1);
    files{i} = zeros(rozmiar_danych,2);
    files{i}(:,1:2) = dane(:,1:2);
end   
figure
% Aby narysować wszystkie funkcje użyjemy funkcji "hold on",
% która utrzyma aktualny wykres aż do odwołania 
hold on

% Rysowanie wykresu dla każdego wczytanego punktu
for i=1:169
    plot(files{i}(:,1),files{i}(:,2))
end

hold off

%% 2. Tworzenie wektora zawierającego współczynniki kierunkowe 

%Wektor na współczynniki
vector = zeros(1);
for i=1:169
    ya1 = fit(files{i}(:,1),files{i}(:,2),'poly1');
    vector(i) = ya1.p1;    
end

%% 3.Obliczanie średniej i odchylenia standardowego utworzonego wektora
srednia = mean(vector);
odchylenie = std(vector);

%% 4.Histogram 
figure;
histogram(vector)







