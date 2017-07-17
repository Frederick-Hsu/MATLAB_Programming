input_vector_range = [-1, 1;
                      -1, 1];
output_node_num = 1;
% Create a perception network
net = newp(input_vector_range, output_node_num)

train_samples = [0, 0, 1, 1;
                 0, 1, 0, 1];
            
expectation_output = [0, 1, 1, 1];
% Train the perception network
net = train(net, train_samples, expectation_output);
% Test data
test_sample1 = [  0;
                0.9];
prediction1  = sim(net, test_sample1)         
test_sample2 = [0.9, 0.9]';
prediction2  = sim(net, test_sample2)

train_samples_prediction = sim(net, train_samples)

% Generate the SimuLink model for this perception Neural-Network
net.gensim