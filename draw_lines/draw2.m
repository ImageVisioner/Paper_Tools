function [] = draw2(ir,vis,line_position)
    % 检查图像是否具有相同的尺寸
    if ~isequal(size(ir), size(vis))
        error('图像尺寸必须相同');
    end

    % 检查线位置是否在图像范围内
    if line_position < 1 || line_position > size(ir, 1)
        error('Line position is out of image bounds.');
    end

    % ir
    figure;
    subplot(1,3,1);
    imshow(ir);
    hold on;
    line([1, size(ir,2)], [line_position, line_position], 'Color', 'blue', 'LineWidth', 2);
    hold off;

    % vis
    subplot(1,3,2);
    imshow(vis);
    hold on;
    line([1, size(vis,2)], [line_position, line_position], 'Color', 'red', 'LineWidth', 2);
    hold off;

    % 显著值
    subplot(1,3,3);
    ir_row = ir(line_position,:);
    vis_row = vis(line_position,:);
    hold on;
    plot([1:length(ir_row)], double(ir_row)/255.0, 'Color', 'blue');
    plot([1:length(vis_row)], double(vis_row)/255.0, 'Color', 'red');
    hold off;
    legend({'IR','VIS'}, 'Location', 'northeast');

end

