clear;

ImgVector = zeros(2500,3457);
ImgVector_class = [3457];
for i = 1:119
    ImgVector_class(i) = 0;
end 
for i = 120:3457
    ImgVector_class(i) = 1;
end 
%load house_dataset;

for k = 1:3457

  number_str = num2str(k,'%04.f');
  imgFilename = sprintf('dataset/image%s.png', number_str);
  Img = imread(imgFilename);
  ImgVector(:,k) = Img(:);
end

%ImgVector
net = newfit(ImgVector,ImgVector_class,[3 5]);
nftool
%net=train(net,ImgVector,ImgVector_class);