% import data
j=1;
start=1;
length=1000;
data1=load(strcat('E:/UNC/Hi-C/Paper Preparation/Code_Ocean/ch',num2str(j),'new_',num2str(start),'_',num2str(start+length-1),'.mat')).data1;
data2=load(strcat('E:/UNC/Hi-C/Paper Preparation/Code_Ocean/ch',num2str(j),'new_',num2str(start),'_',num2str(start+length-1),'.mat')).data2;


% Normalization for single window:
a=data1';
a(logical(eye(size(a))))=0;
data1=data1+a;
data1=log10(data1+1);

a=data2';
a(logical(eye(size(a))))=0;
data2=data2+a;
data2=log10(data2+1);
    
CN=data1(:);
CG=data2(:);
CN=CN(CN~=0);
CG=CG(CG~=0);


if median(CG(:))<median(CN(:))
    data1=data1+median(CG(:))-median(CN(:));
    data1(data1<0)=0;
else
    data2=data2+median(CN(:))-median(CG(:));
    data2(data2<0)=0;
end



bw=2;

functionpath='E:/UNC/Hi-C/Paper Preparation/Code_Ocean/';
addpath(genpath(functionpath))

[i1,j1]=sssHiC(data1,bw);
[i2,j2]=sssHiC(data2,bw);

lw=1.5;
h=0.6;
s=4;
subplot(1,2,1)
imagesc(data1)
map=mlcolormap(data1,1);
colormap(map);
colorbar
hold on
scatter(i1,j1,s,'r','filled')
hold on
title('Neuron','position',[-100,-20],'FontWeight','bold')

set(gca,'position',[0.10 0.15 h*0.5 h],'FontSize',13);

subplot(1,2,2)
imagesc(data2)
map=mlcolormap(data2,1);
colormap(map);
colorbar
hold on
scatter(i2,j2,s,'r','filled')
hold on
title('Glia','position',[-100,-20],'FontWeight','bold')

set(gca,'position',[0.55 0.15 h*0.5 h],'FontSize',13);
figname=strcat(functionpath,'Example');
print(figname,'-dpng','-r300');

