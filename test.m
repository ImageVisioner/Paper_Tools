clc
clear all
close all


% 初始化数据
data = randn(50, 80) * 5;
x = (1:size(data, 2)) - 40;
yP = sin(linspace(-2 * pi, 2 * pi, length(x))) * 20;
y = bsxfun(@plus, data, yP) + 60;
% 计算标准差和平均值
err = std(data);
meany = mean(y, 1);
% 计算标准差的边界
lowerBound1 = flipud((meany - err));
upperBound1 = meany + err;
lowerBound2 = flipud((meany - 2 * err));
upperBound2 = meany + 2 * err;
lowerBound3 = flipud((meany - 3 * err));
upperBound3 = meany + 3 * err;
% 准备用于填充区域的数据
xconf1 = [x flipud(x')'];
yconf1 = [meany + err flipud((meany - err)')'];
xconf2 = [x flipud(x')'];
yconf2 = [meany + 2 * err flipud((meany - 2 * err)')'];
xconf3 = [x flipud(x')'];
yconf3 = [meany + 3 * err flipud((meany - 3 * err)')'];
% 选择图类型
type = 6;
% 创建图形
figure('Position', [476 356 1011 516]);
hold on;
% 根据选择的类型进行绘图
switch type
    case 1
        fHdl = fill(xconf1, yconf1, [0 1 0], 'EdgeColor', 'none', 'FaceAlpha', .2);
        plot(x, meany, 'Color', [0, 1, 0], 'LineStyle', '-', 'LineWidth', 2);
        
    case 2
        fHdl(1) = fill(xconf1, yconf1, [0 1 0], 'EdgeColor', 'none', 'FaceAlpha', .2);
        fHdl(2) = fill(xconf2, yconf2, [0 1 0], 'EdgeColor', 'none', 'FaceAlpha', .2);
        fHdl(3) = fill(xconf3, yconf3, [0 1 0], 'EdgeColor', 'none', 'FaceAlpha', .2);
        plot(x, meany, 'Color', [0, 1, 0], 'LineStyle', '-', 'LineWidth', 2);
    case 3
        plot(x,y,'.','color',[0.5,0.5,0.95]);
        plot(x,meany,'LineStyle','-','LineWidth',3,'Color',[0.5,0.5,0.95]);
        fHdl=fill(xconf1,yconf1,[0 0 0],'EdgeColor','none','FaceAlpha',.2);
    case 4
        dist = abs(y - meany);
        normDist = dist ./ max(dist);
        plot(x,meany,'LineStyle','-','LineWidth',2,'Color','k')
        scatter(repmat(x,1,row),reshape(y',1,row*col),[],reshape(normDist',1,row*col), 'filled',...
            'MarkerFaceAlpha',0.5,'MarkerEdgeColor','none','SizeData',30);
        fHdl=fill(xconf1,yconf1,[0 0 0],'EdgeColor','none','FaceAlpha',.2);
        c = colormap(jet(length(x)));
        colorbar
    case 5
        plot(x,meany,'LineStyle','-','LineWidth',6,'Color',[1,0,0])
        plot(x,meany,'o','MarkerSize',8,'MarkerFaceColor','w','MarkerEdgeColor',[1,0,0],'HandleVisibility', 'off')
        fHdl=fill(xconf1,yconf1,[0.5,0.25,0.25],'EdgeColor','none','FaceAlpha',.2);
        line(x, lowerBound1, 'Color', [1 0 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, upperBound1, 'Color', [1 0 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
    case 6
        fHdl(1)=fill(xconf1,yconf1,[0.9,0.25,0.25],'EdgeColor','none','FaceAlpha',.2);
        fHdl(2)=fill(xconf2,yconf2,[0.9,0.25,0.25],'EdgeColor','none','FaceAlpha',.2);
        fHdl(3)=fill(xconf3,yconf3,[0.9,0.25,0.25],'EdgeColor','none','FaceAlpha',.2);
        plot(x,meany,'LineStyle','-','LineWidth',6,'Color',[1,0,0])
        plot(x,meany,'o','MarkerSize',8,'MarkerFaceColor','w','MarkerEdgeColor',[1,0,0],'HandleVisibility', 'off')
        line(x, lowerBound1, 'Color', [1 0 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, upperBound1, 'Color', [1 0 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, lowerBound2, 'Color', [0 1 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, upperBound2, 'Color', [0 1 0 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, lowerBound3, 'Color', [0 0 1 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
        line(x, upperBound3, 'Color', [0 0 1 0.5], 'LineWidth', 3, 'LineStyle', ':','HandleVisibility', 'off');
end
% 配置图形属性
uistack(fHdl, 'bottom');
ax = gca;

ax.Box = 'on';
ax.XLabel.String = 'X';
ax.YLabel.String = 'Y';
ax.FontName = 'Times New Roman';
ax.GridLineStyle = '-.';
ax.GridColor = 'k';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.LineWidth = 1.5;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.TickDir = 'in';
ax.FontSize = 18;
texxlabel('\textbf{error bar}', 15);
texylabel('\frac{a_{1}}{a_{2}} = \sqrt{b_{1}^{n}}', 15);
% textitle('this is  \frac{a_{1}}{a_{2}} = \sqrt{b_{1}^{n}}', 15);


