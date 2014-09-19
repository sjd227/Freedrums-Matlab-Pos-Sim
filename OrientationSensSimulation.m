function OrientationSensSimulation()
%Simulates position error as a function of accelerometer noise and time


accuracy = [.01 .1 .5 1 2 4 10]; %accuracy of orientation [deg]
err = sin(accuracy*pi/180)*9.8; %max error [m/s^2]
tend = 10*60; %simulated time span [s]
dt= 0.1; %time step[s]

time= 0:dt: tend;

runs= struct('s',[],'t',[],'r',[]);

%run for each upper-bound error value...
close all
c = 'rygbcmk';
for i= 1:length(err)
    r = err(i)/2 * time.^2;
    semilogy(time/60,r*1000,c(i),'LineWidth',1.5)
    hold on
end
title('Orientation Accuracy on Upper-bound Position Error vs. Time');
ylabel('Error [mm]');
xlabel('Time [min]');
t= cell(1,length(accuracy));
for i= 1:length(t);
    t{i} = sprintf('%.3g deg',accuracy(i));
end
legend(t)

grid on
hold off



