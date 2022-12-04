function [F] = pendulum
m=1;
g=9.8;

% This values for the linspace here give the different patterns.
% The middle first 2 are the start and end times, final parameter is the
% number of points
tVec=linspace(0,80,15000);
tDiff=tVec(2)-tVec(1);

Theta(1)=-pi/10;
Phi(1)=-pi/20;
ThetaDash(1)=0;
PhiDash(1)=0;
ThetaDoubleDash(1)=m*g*sin(Theta(1));
PhiDoubleDash(1)=m*g*cos(Phi(1));
    
L=1;
for i=2:length(tVec)
    ThetaDash(i)=ThetaDash(i-1)+(tDiff*ThetaDoubleDash(i-1));
    PhiDash(i)=PhiDash(i-1)+(tDiff*PhiDoubleDash(i-1));

    Theta(i)=Theta(i-1)+(tDiff*ThetaDash(i-1));
    Phi(i)=Phi(i-1)+(tDiff*PhiDash(i-1));
    
    ThetaDoubleDash(i)=m*g*sin(Theta(i));
    PhiDoubleDash(i)=m*g*sin(Phi(i));
end

for i=1:length(Theta)
    x(i)=L*sin(Phi(i))*cos(Theta(i));
    y(i)=L*sin(Phi(i))*sin(Theta(i));
end

for i=1:length(x)
    figure(1)
%     plot([0,x(i)],[0,y(i)])
%     scatter(x(i),y(i))
    plot(x(1:i),y(1:i))

    xlim([-1.5 1.5])
    ylim([-1.5 1.5])
%     hold on
%     plot(x(1:i),y(1:i))
    F(i)=getframe(figure(1))
end
    

end
