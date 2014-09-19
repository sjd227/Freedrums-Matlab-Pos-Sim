function AccelerometerSensSimulation()
%Simulates position error as a function of accelerometer noise and time


sensitivity= logspace(-6,-1,6); %sensitivity of accelerometer [g]
sensitivity= [sensitivity(1:2) 0.061/1000 sensitivity(3:end)];
err = sensitivity/2; %max error
%dt= 1/100000; %standard mode sampling [s]
%dt= 1/400000; %fast mode sampling [s]
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
title('Accelerometer Sensitivity on Upper-bound Position Error vs. Time');
ylabel('Error [mm]');
xlabel('Time [min]');
t= cell(1,length(sensitivity));
for i= 1:length(t);
    t{i} = sprintf('%.3g mg',sensitivity(i)*1000);
end
legend(t)

grid on
hold off



