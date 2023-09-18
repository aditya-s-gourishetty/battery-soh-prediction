function [del_V] = charge_data(charge_t,charge_V)
charge_t;%x.cycle(1).data.Time;
charge_V;%=x.cycle(1).data.Voltage_measured;
%plot(charge_t,charge_V);
for i=2: length(charge_V)-1
    diff1=abs(charge_V(i+1)-charge_V(i));
    diff2=abs(charge_V(i)-charge_V(i-1));
    if(diff1<0.0003&diff2<0.0003)
        del_t=charge_t(i);
        break;
    end
end
peak_V=0;
for j=100: length(charge_V)-1
    if((charge_V(j)-charge_V(j+1))>0.05)
        peak_V=charge_V(j);
        break;
    end
end
if(peak_V~=0)
    del_V=peak_V-charge_V(length(charge_V));
else
    peak_V=charge_V(100)
    del_V=;
end


end