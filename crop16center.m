%https://www.mathworks.com/help/images/ref/imcrop.html

for k = 1:500

  number_str = num2str(k,'%04.f');
  imgFilename = sprintf('new3_dataset/image%s.png', number_str);
  Img_crop = imread(imgFilename);
  I2 = imcrop(Img_crop,[64 64 16 16]);
  ImgVector2(:,k) = I2(:);
end

