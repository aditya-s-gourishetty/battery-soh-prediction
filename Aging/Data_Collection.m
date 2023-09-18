load('B0005.mat');
BData=B0005;
Data_del_V=[];
Data_V=[];
Data_T=[];
SOH=[];
for i=1:length(BData.cycle)
    i
    if(strcmp(BData.cycle(i).type,'charge'))
        Data_del_V=[Data_del_V;charge_data(BData.cycle(i).data.Time,BData.cycle(i).data.Voltage_measured)];
        Data_T=[Data_T;Del_T(BData.cycle(i).data.Current_measured,BData.cycle(i).data.Time)];
    end
    
    if(strcmp(BData.cycle(i).type,'discharge'))
        Data_V=[Data_V;discharge_data(BData.cycle(i).data.Time,BData.cycle(i).data.Voltage_measured)];
        SOH=[SOH;BData.cycle(i).data.Capacity];
    end
end
m=min(length(Data_del_V),length(Data_V));
Data=[Data_del_V(1:m) Data_V(1:m) Data_T(1:m) SOH(1:m)];