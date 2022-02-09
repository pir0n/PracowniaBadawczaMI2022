imgFilename = 'KinFaceW-II/images/father-dau/fd_001_1.jpg';
TestImg = imread(imgFilename);
GrayImg = rgb2gray(TestImg);

y_max = -1000;

windowL = 25;
for ii = 1:5:length(GrayImg(:,1))-windowL+1 % set the end such that you don't index more than the length of the array E.
    for jj = 1:5:length(GrayImg(1,:))-windowL+1
        Window = GrayImg(ii:ii+windowL-1, jj:jj+windowL-1,:); %pulled out section of E to be used 
        WinArray = Window(:);
        %y_test = sim(net,double(WinArray)/255);

        imshow(Window)
        %pause
    end
    %if y_test > y_max
     %   y_max = y_test;
      %  y_win = Window;
    %end
end

imshow(y_win)
