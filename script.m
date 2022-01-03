clear;
close all;

addpath('covid19pt-data/');
amostras = readtable('amostras.csv');
amostras.data = datetime(amostras.data, 'InputFormat','d-MM-uuuu');
casos = readtable('data.csv');
casos.data = datetime(casos.data, 'InputFormat','d-MM-uuuu');
casos.data_dados = datetime(casos.data_dados, 'InputFormat','d-MM-uuuu HH:mm');
casos([1,2,3,4,size(casos,1)],:) = [];


casos_positivos = (casos.confirmados_novos ./ amostras.amostras_novas);

figure(7)
subplot(1,3,1);
plot(amostras.data, amostras.amostras_novas);%movavg(amostras.amostras_novas, 'simple', 6));
title('amostras novas');
subplot(1,3,2);
plot(amostras.data, movavg(casos.confirmados_novos, 'simple', 6));
title('casos confirmados novos');
subplot(1,3,3);
plot(amostras.data, casos_positivos*100); %movavg(casos_positivos*100, 'simple', 6));
title('osras positivas [%]');
set(f, 'Position', [0 0 1000 250])