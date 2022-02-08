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

% Wczytanie zdjęć twarzy do testowania

imgFilename = 'KinFaceW-II/images/father-dau/fd_001_1.jpg';
TestImg = imread(imgFilename);
GrayImg = rgb2gray(TestImg);

windowL = 10;
for ind = 1:2:length(GrayImg(:,1))-windowL+1 % set the end such that you don't index more than the length of the array E.
    Window = GrayImg(ind:ind+windowL-1, ind:ind+windowL-1,:); %pulled out section of E to be used 
    WinArray = Window(:);
    y_test = sim(net,WinArray);
    
    if y_test > 0.5
        y_win = Window;
    end
end

imshow(y_win)

% Iteracja oknem przesuwnym po zdjęciach - zapis do tablicy wszystkich macierzy z danego zdjęcia/wszystkich zdjęć


% Przerobienie wszysatkich macierzy wycinków na tablice

% 