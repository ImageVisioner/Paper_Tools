function [handle] = texylabel(text,size)

% 设置两种API调用方式
% text 为文本，size用来控制字体大小
%   H = texylabel(text) sets the t ext
%   H = texylabel(text,size) sets the text in a specific font size
%
%   See also YLABEL

    if nargin < 1
        error('Function requires text argument.')
    end

    if nargin < 2
        size = 11;
    end

    h = ylabel({['$' text '$']},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',size,...
    'FontName','Times');

    if nargout > 0
        handle = h;
    end

end


