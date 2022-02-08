clear;

ImgVector = zeros(100,3457);
ImgVector_class = [3457];
for i = 1:206
    ImgVector_class(i) = 0.0;
end 
for i = 207:3457
    ImgVector_class(i) = 1.0;
end 
%load house_dataset;

for k = 1:3457

  number_str = num2str(k,'%04.f');
  imgFilename = sprintf('dataset/image%s.png', number_str);
  Img = imread(imgFilename);
  ImgVector(:,k) = Img(:);
end

%ImgVector
%net = newfit(ImgVector,ImgVector_class,[50 50]);

%nftool
%net=train(net,ImgVector,ImgVector_class);

%net = network(50,2);
net = newff(ImgVector,ImgVector_class,[25 25]);
%nftool
net.trainParam.goal = 10^(-700);
net.trainParam.min_grad = 0.00000000001;
net.trainParam.max_fail= 100;
%net.trainParam.goal = 0.000001;
net = train(net,ImgVector,ImgVector_class);
y = sim(net,ImgVector);