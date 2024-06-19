% 图像文件列表
images = {'1.jpg', '2.jpg', '3.jpg','4.jpg','5.jpg','6.jpg','7.jpg','8.jpg','9.jpg'}; % 替换为实际的文件路径和名称
numImages = length(images);

% 读取并显示第一张图像，用于交互式定义切割区域
I1 = imread(images{1});
figure;
imshow(I1);
h = drawrectangle;
position = customWait(h); % 获取切割区域坐标

% 截取各图像的指定区域并存储
croppedImages = cell(1, numImages);
for i = 1:numImages
    I = imread(images{i});
    croppedImages{i} = imcrop(I, position);
end

% 各截取图像并排显示
figure;
for i = 1:numImages
    subplot(1, numImages, i);
    imshow(croppedImages{i});
    title(['Method ' num2str(i)]);
end

% customWait函数定义
function pos = customWait(hROI)
    l = addlistener(hROI,'ROIClicked',@(src, evt)clickCallback(src, evt));
    uiwait;
    pos = hROI.Position;
end

function clickCallback(~, evt)
    if strcmp(evt.SelectionType,'double')
        uiresume;
    end
end