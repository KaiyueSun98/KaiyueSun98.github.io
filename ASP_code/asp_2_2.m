%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.2 stochastic processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.2.2
M=4;
N=1000;
y1=rp1(M,N);
y1_avg1=sum(y1(1,:))*1/N;
y1_std1=std(y1(1,:));

y1_avg2=sum(y1(2,:))*1/N;
y1_std2=std(y1(2,:));

y1_avg3=sum(y1(3,:))*1/N
y1_std3=std(y1(3,:));

y1_avg4=sum(y1(4,:))*1/N
y1_std4=std(y1(4,:));

y2=rp2(M,N);
y2_avg1=sum(y2(1,:))*1/N;
y2_std1=std(y2(1,:));

y2_avg2=sum(y2(2,:))*1/N;
y2_std2=std(y2(2,:));

y2_avg3=sum(y2(3,:))*1/N
y2_std3=std(y2(3,:));

y2_avg4=sum(y2(4,:))*1/N
y2_std4=std(y2(4,:));



y3=rp3(M,N);
y3_avg1=sum(y3(1,:))*1/N;
y3_std1=std(y3(1,:));

y3_avg2=sum(y3(2,:))*1/N;
y3_std2=std(y3(2,:));

y3_avg3=sum(y3(3,:))*1/N
y3_std3=std(y3(3,:));

y3_avg4=sum(y3(4,:))*1/N
y3_std4=std(y3(4,:));