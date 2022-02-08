imgFilename = 'KinFaceW-II/images/father-dau/fd_001_1.jpg';
TestImg = imread(imgFilename);
GrayImg = rgb2gray(TestImg);

windowL = 10;
for ind = 1:2:length(GrayImg(:,1))-windowL+1 % set the end such that you don't index more than the length of the array E.
    Window = GrayImg(ind:ind+windowL-1, ind:ind+windowL-1,:); %pulled out section of E to be used 
    WinArray = Window(:);
end