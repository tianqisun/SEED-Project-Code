load('swcfilenames.mat')


for i = 1:10
    ind = randi(length(swcfiles));
    disp(ind)
    M = readswc(swcfiles{ind});
    [soma_point] = getSomaBran(M);
    pause
end