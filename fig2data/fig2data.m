function [ xdata, ydata, zdata] = fig2data( fig_name)

h_fig = openfig( fig_name);
h_ax = get( h_fig, 'children');
h_line = get( h_ax, 'children');

xdata = get( h_line, 'XData');
ydata = get( h_line, 'YData');
zdata = get( h_line, 'ZData');


close( h_fig);