fs = 8000;
tt=(0:1/fs:1);
fc = 1200;
fm = 100;
A = .8;

t = 0:(1/fs):(200/fs);

%x = cos(2*pi*fc*tt)+(A/2)*cos(2*pi*(fc+fm)*tt)+(A/2)*cos(2*pi*(fc-fm)*tt);
m = A*cos(2*pi*fm*tt); %subsitute tt for t to get actual tone
c = cos(2*pi*fc*tt);
x=(1+A*m).*c;

%sound(x,fs);

%plot(t, m, '--', t, c, '--')

%Demodulation Time
%x1=.5*m+.5+.5*(1+m).*cos(2*pi*2*fc*tt);

%showspec(x1, fs);
nn = 0:(1/fs):(200/fs);
mm = A*cos(2*pi*fm*nn);
cc = cos(2*pi*fc*nn);
xx = (1+mm).*cc;
xx = xx.*cos(2*pi*fc*nn);
bb = [1, 0, 1];
fnot = 2400;
wnot = 2*pi*fnot/fs;
yy = firfilt(bb, xx);
yy = firfilt(bb, yy); %double filter!
y2 = amdemod(xx, fc, fs, .95); %Lab question 2
if length(nn) ~= yy
newy = zeros(size(nn));
newy(1:size(yy,1),1:size(yy,2)) = yy;
newx = zeros(size(newy));
newx(1:size(nn,1),1:size(nn,2)) = nn;
end
%plot(nn, xx, nn, (mm+.75), newx, newy);

hold on
showspec(xx, fs);
showspec(mm, fs);
showspec(yy, fs);
showspec(y2, fs);
hold off
