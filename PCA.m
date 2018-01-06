clc
clear all
%%%1,image read
file_path =  '.\images4\';% ???????  
img_path_list = dir(strcat(file_path,'*.bmp'));%?????????jpg?????  
img_num = length(img_path_list);%???????  
image = cell(1,img_num);
if img_num > 0 %????????  
        for j = 1:img_num %??????  
            image_name = img_path_list(j).name;% ???  
            image{j} =  rgb2gray(imread(strcat(file_path,image_name)));  
          
             
        end  
end 
%%
Image = [];
for i = 1:222
    for j = 0:359
        Image((240*j+1):240*(j+1),i)=image{i}(:,j+1);
    
    end
end

%%
C = cov(Image);
M = mean(Image);
[V,D] = eigs(C);
% V = V';
% D = D';

k = 6;
P = V(:,1:k);

%%
Image1 = zeros(86400,222);
I = ones(86400,1);
Image1 = Image-I*M;
Y = Image1*P;

D=Y*(Y'*Image);
N = floor(mapminmax(D,0,255));
N = N - Image;

Image_mean = mean(Image'); 
Image_mean = Image_mean';
Image2 = Image - Image_mean*ones(1,222);

image_new = cell(1,222);
for i = 1:222
    for j = 0:359
        image_new{i}(:,j+1) = Image2((240*j+1):240*(j+1),i);
        for k=1:240
           if image_new{i}(k,j+1) <90
               image_new{i}(k,j+1)=0;
           else
               image_new{i}(k,j+1)=255;
           end
        end
    end
end

for i = 1:222
    imshow(mat2gray(image_new{i}));
end
% for i = 1:222
%     D(:,i) = Y*Y'*Image(:,i);
% end

