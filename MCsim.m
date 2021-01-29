set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth',2); 

clear all
close all

x=0; 
xp=0; 

yPos=0; 
Force=1; 
mass=1; 

dt=1; 
nt=1000;

np=1;
v= zeros(np,1); 
x=zeros(np,1); 
time=0; 

%re=0; 
re= -1.05; 




for i = 2:nt
    time(i)= time(i-1)+dt; 

    v(:,i) = v(:,i-1) + Force/(mass*dt); 
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + Force/(mass*dt)^2/2; 

    r = rand(np,1) < 0.05; 
    v(r,i) = re*v(r,i); 
    AveV(i,:) = mean(v,2); 

    subplot(3,1,1),plot(time,v,'-'); hold on 
    subplot(3,1,1),plot(time,AveV,'g'); 
    hold off; 

    xlabel('time')
    ylabel('v')
    title(['Average v:' num2str(AveV(i))])
    subplot(3,1,2),plot(x(1,:),v(1,:),'r-'); hold on 
    subplot(3,1,2),plot(x(1,:),AveV,'g'); 
    hold off; 
    xlabel('x')
    ylabel('y')

    subplot(3,1,3),plot(time,x,'-'); 
    xlabel('time')
    ylabel('x')

    pause(0.01)

end
display('Average V')
mean(v)