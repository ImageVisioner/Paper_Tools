clc 
clear all

close all

% 图像文件列表
images = {'1.png', '2.png', '3.png','4.png','5.png','6.png','7.png','8.png'}; % 替换为实际的文件路径和名称
numImages = length(images);

% 读取并显示第一张图像，用于交互式定义切割区域
I1 = imread(images{1});
figure;
imshow(I1);
h = drawrectangle;



% 设定线宽和颜色
h.LineWidth = 2;
h.Color = 'green'; % 设定颜色为红色

position = customWait(h); % 获取切割区域坐标clocl;


% 截取各图像的指定区域并存储
croppedImages = cell(1, numImages);
figureFolderPath = './figureImage';
if ~exist(figureFolderPath, 'dir')
    mkdir(figureFolderPath)
end

for i = 1:numImages
    I = imread(images{i});
    croppedImage = imcrop(I, position);
    croppedImages{i} = croppedImage;  % 保存裁剪的图片
    
    % 在各图像截取区域显示红框并保存到本地
    figure; imshow(I); hold on;
    rectangle('Position',position,...
              'EdgeColor','red',...
              'LineWidth', 2);
    set(gcf, 'ToolBar', 'none');
    
    hold off;
    
    % 将图像中带有红框的部分保存到新的文件夹
    F = getframe(gca);
    figureCropped = F.cdata;
    
    figureFilename = fullfile(figureFolderPath, sprintf('figure_%d.bmp', i));
    imwrite(figureCropped, figureFilename);
    close(gcf); 
end

numRows = floor(sqrt(numImages));
numCols = ceil(numImages / numRows);

figure;
for i = 1:numImages
    subplot(numRows, numCols, i);
    imshow(croppedImages{i});
    title(['Image ' num2str(i)]);
end

newFolderPath = './subImage'; 
if ~exist(newFolderPath, 'dir')
    mkdir(newFolderPath)
end

for i = 1 : numImages
    newFilename = fullfile(newFolderPath, sprintf('crop_%d.bmp', i));
    imwrite(croppedImages{i}, newFilename);
end

% customWait函数定义
function pos = customWait(hROI)
    l = addlistener(hROI,'ROIClicked',@(src, evt)clickCallback(src, evt));
    uiwait;
    pos = hROI.Position;
    delete(l);
end

% clickCallback函数定义
function clickCallback(~, evt)
    if strcmp(evt.SelectionType,'double')
        uiresume;
    end
end