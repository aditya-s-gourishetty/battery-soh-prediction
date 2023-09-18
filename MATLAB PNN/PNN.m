function [predictions] = PNN(data)

%num=size(data.x_train_f);
num_testset=height(data.x_train_f);
labels=table2array(data.y_train_f);
num_class=length(labels);

sigma=0.1;

%summation_layer=zeros(num_class);
summation_layer=[];
%predictions = zeros(num_testset);
predictions=[];
enumerate_x_test=[linspace(1,height(data.x_test_f),height(data.x_test_f))' , table2array(data.x_test_f)];
enumerate_x_train=[linspace(1,height(data.x_train_f),height(data.x_train_f))' , table2array(data.x_train_f)];

for i=1:height(data.x_test_f)
    summation_layer=[]
    for j=1:height(data.x_train_f)
        %i
        %j
        test_point=enumerate_x_train(j,2:end);
        %enumerate_x_train(i,2:end);
        summation_layer=[summation_layer ; pdf(test_point,enumerate_x_test(i,2:end),sigma)./3];
        %length(summation_layer)
    end
    [argvalue, argmax] = max(summation_layer);
    %length(summation_layer)
    predictions = [predictions ; labels(argmax)];
end


