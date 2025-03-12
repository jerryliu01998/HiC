function [map]=mlcolormap(data1,type)
%data1=data3;
%type=2;

%type: 1: count value; 2: difference between two neuron
if(type==1)
    %white+ red+ pink
    bw=0.01;
    mx=max(data1(:));
    mx=ceil(mx/bw);
    map=zeros(mx,3);
    map(1:(1/bw+1),1)=1;
    map(1:(1/bw+1),2)=-(-1/bw:0)*bw;
    map(1:(1/bw+1),3)=-(-1/bw:0)*bw;
    map((1/bw+2):mx,1)=1;
    map((1/bw+2):mx,2)=0;
    map((1/bw+2):mx,3)=(0:-(2+1/bw-mx))/(mx-1/bw-1);
    
    %white+gray+black
    bw=0.01;
    mx=max(data1(:));
    mx=ceil(mx/bw);
    map=zeros(mx,3);
    map(1:mx,1)=-(-(mx-1):0)/(mx-1);
    map(1:mx,2)=-(-(mx-1):0)/(mx-1);
    map(1:mx,3)=-(-(mx-1):0)/(mx-1);
    
    %10%-90%
%     bw=0.01;
%     mx=max(data1(:));
%     mx=ceil(mx/bw);
%     map=zeros(mx,3);
%     a1=quantile(data1(:),0.9);
%     a1=ceil(a1/bw);
%     map(a1:mx,1)=0;
%     map(a1:mx,2)=0;
%     map(a1:mx,3)=0;
%     
%     map(1:a1,1)=-(-(a1-1):0)/(a1-1);
%     map(1:a1,2)=-(-(a1-1):0)/(a1-1);
%     map(1:a1,3)=-(-(a1-1):0)/(a1-1);
%     
    
elseif(type==2)
    bw=0.01;
    mx=max(data1(:));
    mn=min(data1(:));
    mn=ceil(abs(mn/bw));
    mx=ceil(mx/bw);
    map=zeros((mx+mn+1),3);
    map(1:(mn+1),1)=(0:mn)/mn;
    map(1:(mn+1),2)=(0:mn)/mn;
    map(1:(mn+1),3)=1;
    map((mn+2):(mx+mn+1),1)=1;
    map((mn+2):(mx+mn+1),2)=-((1-mx):0)/mx;
    map((mn+2):(mx+mn+1),3)=-((1-mx):0)/mx;
end
    
    

