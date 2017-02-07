% Eilam Morag
% November 28, 2016
% Calls plotFStat for all pulsars

clear
close
A = Date([11, 24, 2015]);
B = Date([12, 3, 2016]);

for i=0:14
    plotFStat(A, B, i);
end