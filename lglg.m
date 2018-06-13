IT=I(1:2:16385);
ID=I(2:2:16386);
xlim([50 1000])
%loglog(IT,ID,'-sc')
loglog(IT,ID,'-s', 'color', [0.3 0.6 0.7])
xlim([10 1000])