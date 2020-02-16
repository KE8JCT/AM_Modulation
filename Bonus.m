%Bonus Problem
fs = 8000;
aa = (1+mm).*cc;
hold on
showspec(cc, fs);
showspec(mm, fs);
showspec(aa, fs);
hold off

fc = 24000;
dd = amdemod(aa, fc, fs, .9);
ds = dd(1:12:length(dd));
sound(ss, fs);
pause(1.5);
sound(aa, fs);
pause(6.5);
sound(ds, fs);


