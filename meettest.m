clear all;clc

x=0:1:25492;
%hr = randi([59 98],1,1001);

%ecg data start
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "HRBPM", "Var4", "Var5", "Var6", "Var7"];
opts.SelectedVariableNames = "HRBPM";
opts.VariableTypes = ["string", "string", "double", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var4", "Var5", "Var6", "Var7"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var4", "Var5", "Var6", "Var7"], "EmptyFieldRule", "auto");

% Import the data
HumanvitalsignsR = readtable("/Users/meetmakadiya/Downloads/SCS/MATLAB/Human_vital_signs_R_Low1.csv", opts)

A = readtable('Human_vital_signs_R_High.csv')
hr=A.HR_BPM_


%ecg data end

figure(1);hold all
xlabel('Blood Glucose per min') 
ylabel('Blood Glucose')
title('Blood Glucose Figure  - 70 to 100 mg/dL')
Dx=50;y1=60;y2=120;

for n=1:1:numel(x)
    if(hr(n) > 100)
        fig = uifigure;
         uialert(fig,'You need to contact your doctor','Alert Message');
        uialert(fig,'Your Blood Sugar is high then normal','Alert Message');
        break
    elseif(hr(n) < 70)
        fig = uifigure;
        uialert(fig,'You need to inject sugar or contact doctor','Alert Message');
        uialert(fig,'Your Blood Sugar is low then normal','Alert Message');
        break
    end
    
    plot(x,hr);axis([x(n) x(n+Dx) y1 y2]);drawnow
    pause(1);
end