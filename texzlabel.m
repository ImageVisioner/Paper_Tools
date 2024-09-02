function [handle] = texzlabel(text,size)
% 设置两种API调用方式
% text 为文本，size用来控制字体大小
%   H = texzlabel(text) sets the text
%   H = texzlabel(text,size) sets the text in a specific font size
%
%   See also ZLABEL

    if nargin < 1
        error('Function requires text argument.')
    end

    if nargin < 2
        size = 11;
    end

    h = zlabel({['$' text '$']},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',size,...
    'FontName','Times');
    

    if nargout > 0
        handle = h;
    end

end


