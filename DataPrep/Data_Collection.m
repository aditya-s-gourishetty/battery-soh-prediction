%load('B0005.mat');
BData=B0018;
Data_del_V=[];
Data_V=[];
Data_T=[];
SOH=[];
for i=1:length(BData.cycle)
    i
    if(strcmp(BData.cycle(i).type,'charge'))
        [x , y] = charge_data2(BData.cycle(i).data.Time,BData.cycle(i).data.Current_measured,BData.cycle(i).data.Voltage_measured);
        Data_del_V=[Data_del_V;y];
        Data_T=[Data_T;x];
    end
    
    if(strcmp(BData.cycle(i).type,'discharge'))
        Data_V=[Data_V;discharge_data2(BData.cycle(i).data.Time,BData.cycle(i).data.Voltage_measured)];
        SOH=[SOH;BData.cycle(i).data.Capacity];
    end
end
m=min(length(Data_del_V),length(Data_V));
Data=[Data_del_V(1:m) Data_V(1:m) Data_T(1:m) SOH(1:m)];