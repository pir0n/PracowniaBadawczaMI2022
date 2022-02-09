clear;

ImgVector = zeros(256,5203);
ImgVector_class = [5203];

for i = 1:3338
    ImgVector_class(i) = 1.0;
end 

for i = 3338:5203
    ImgVector_class(i) = 0.0;
end 

%load house_dataset;

for k = 1:5203

  number_str = num2str(k,'%04.f');
  imgFilename = sprintf('new2_dataset/image%s.png', number_str);
  Img = imread(imgFilename);
  ImgVector(:,k) = Img(:);
end

%imshow(Img)
%pause

%ImgVector
%net = newfit(ImgVector,ImgVector_class,[50 50]);

%nftool
%net=train(net,ImgVector,ImgVector_class);

%net = network(50,2);
net = newff(ImgVector,ImgVector_class,[15 10]);
%nftool
%net.trainParam.goal = 10^(-700);
%net.trainParam.min_grad = 0.00000000001;
net.trainParam.max_fail= 20;
%net.trainParam.goal = 0.000001;
net = train(net,ImgVector,ImgVector_class);
y = sim(net,ImgVector);

% Wczytanie zdjęć twarzy do testowania

imgFilename = 'KinFaceW-II/images/father-dau/fd_001_1.jpg';
TestImg = imread(imgFilename);
GrayImg = rgb2gray(TestImg);

y_max = -1000;

windowL = 16;
for ii = 1:2:length(GrayImg(:,1))-windowL+1 % set the end such that you don't index more than the length of the array E.
    for jj = 1:2:length(GrayImg(1,:))-windowL+1
        Window = GrayImg(ii:ii+windowL-1, jj:jj+windowL-1,:); %pulled out section of E to be used 
        WinArray = Window(:);
        y_test = sim(net,double(WinArray)/255);

        %imshow(Window)
        %pause
        if y_test > y_max
            y_max = y_test;
            y_win = Window;
        end
    end
end

imshow(y_win)

% Iteracja oknem przesuwnym po zdjęciach - zapis do tablicy wszystkich macierzy z danego zdjęcia/wszystkich zdjęć


% Przerobienie wszysatkich macierzy wycinków na tablice

% 