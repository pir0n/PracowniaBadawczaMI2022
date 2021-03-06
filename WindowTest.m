imgFilename = 'KinFaceW-II/images/father-dau/fd_005_1.jpg';
TestImg = imread(imgFilename);
GrayImg = rgb2gray(TestImg);

y_max = -1000;

windowL = 16;
for kk = 1:250
    number_str = num2str(kk,'%03.f');
    imgFilename = sprintf('KinFaceW-II/images/father-dau/fd_%s_1.jpg', number_str);
    
    TestImg = imread(imgFilename);
    GrayImg = rgb2gray(TestImg);
    y_max = -1000;
    
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
    
    I = mat2gray(y_win);
    imwrite(uint8(y_win), sprintf('network_output/fd_%s_1.png', number_str))
    
    imgFilename = sprintf('KinFaceW-II/images/father-dau/fd_%s_2.jpg', number_str);
    
    TestImg = imread(imgFilename);
    GrayImg = rgb2gray(TestImg);
    y_max = -1000;
    
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
    
    imwrite(uint8(y_win), sprintf('network_output/fd_%s_2.png', number_str))
end

%imshow(y_win)
