casos_positivos = (casos.confirmados_novos ./ amostras.amostras_novas);

figure(7)
subplot(1,3,1);
plot(amostras.data, movavg(amostras.amostras_novas, 'simple', 6));
title('amostras novas');
subplot(1,3,2);
plot(amostras.data, movavg(casos.confirmados_novos, 'simple', 6));
title('casos confirmados novos');
subplot(1,3,3);
plot(amostras.data, movavg(casos_positivos*100, 'simple', 6));
title('osras positivas [%]');
set(f, 'Position', [0 0 1000 250])