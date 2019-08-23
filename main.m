% this is a file to practice various Matlab programming structures %

%% Function parctice

clear; clc;
data_format = '*double';

data = [1:30000000];

writeBinaryFile( data, 'test.bin' );

data_read = readBinaryFile( 'test.bin', [3 Inf], data_format);