clear;

ImgVector = zeros(2500,3457)

for k = 1:3457

  number_str = num2str(k,'%04.f');
  imgFilename = sprintf('dataset/image%s.png', number_str);
  Img = imread(imgFilename);
  ImgVector(:,k) = Img(:);
end