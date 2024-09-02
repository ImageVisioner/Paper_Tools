function fig2eps( varargin )
% FIG2EPS  Converts the figure to eps format
%   调用方式
%   Accepts one or more of either a figure handle or a filename to a .fig
%   file.
%
%   fig2eps converts the focused figure if present
%   fig2eps('filename')
%   fig2eps(figureHandle)
%   fig2eps(figureHandle, 'filename', figureHandle)
%

if nargin == 0
    h = gcf;
    if isempty(h)
        error(['Function accepts either a figure handle or a string',...
            'containing the filename of a figure file. e.g. <name>.fig']);
    else
        varargin{1} = h;
    end
end

for k=1:length(varargin)

    figure = varargin{k};
    
    if isa(figure,'char')
        h = openfig(figure);
        fileName = figure;
    elseif isa(figure,'matlab.ui.Figure');
        h = figure;
        fileName = h.Name;
        if isempty(fileName)
            fileName = datestr(now,'DD_mm_YYYY__HH_MM');
        end
    else
        error(['Function accepts either a figure handle or a string',...
            'containing the filename of a figure file. e.g. <name>.fig']);
    end

    print(h, fileName, '-depsc');
    close(h);
end

end

