function [handle] = textitle(text,size)
% text 为文本，size用来控制字体大小
%   H = textitle(text) sets the text
%   H = textitle(text,size) sets the text in a specific font size
%
%   See also TITLE

    if nargin < 1
        error('Function requires text argument.')
    end

    if nargin < 2
        size = 11;
    end

    h = title({['$' text '$']},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',size,...
    'FontName','Times');

    if nargout > 0
        handle = h;
    end

end


