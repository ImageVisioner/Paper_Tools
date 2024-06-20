clc
clear all
close all 

%% delete
delete( '*.asv')



%% 2D case


%%[0] load data from *.fig file

fig_name = './load/sample.fig';

[xdata ydata] = fig2data( fig_name);

%%[1] plot results read from *.fig file

figure(1)

h_ax = axes();
plot( xdata{1}, ydata{1}, xdata{2}, ydata{2}, xdata{3}, ydata{3}, 'LineWidth', 2)
xlabel( 'X', 'FontSize', 20, 'FontName', 'Times New Roman')
ylabel( 'Y', 'FontSize', 20, 'FontName', 'Times New Roman')
grid( h_ax, 'on')
xlim( [0 2*pi])

set( h_ax, 'FontName', 'Times New Roman', 'FontSize', 15)



%% 3D case


%%[0] load data from *.fig file

fig_name = './load/sample3d.fig';

[xdata2 ydata2 zdata2] = fig2data( fig_name);

%%[1] plot results read from *.fig file

figure(2)

h_ax = axes();
surf( xdata2, ydata2, zdata2)
xlabel( 'X', 'FontSize', 20, 'FontName', 'Times New Roman')
ylabel( 'Y', 'FontSize', 20, 'FontName', 'Times New Roman')
zlabel( 'Z', 'FontSize', 20, 'FontName', 'Times New Roman')
grid( h_ax, 'on')


set( h_ax, 'FontName', 'Times New Roman', 'FontSize', 15)




