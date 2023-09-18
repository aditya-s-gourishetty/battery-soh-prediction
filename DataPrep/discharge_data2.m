function V2= discharge_data2(discharge_t,discharge_V)
discharge_t%x.cycle(2).data.Time;
discharge_V%x.cycle(2).data.Voltage_measured;
V2=discharge_V(end);
%plot(discharge_t,discharge_V);
end
