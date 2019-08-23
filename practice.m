% this is a file to practice various Matlab programming structures %

%% Testing fread and fwrite to binary vs. fprintf to text file  

clear; clc;

data_format_write = 'int64';
data_format_write_read = '*int64';
data = int64([1:300000]);

fprintf('*******************************\n');
fprintf('* Writing data to binary file *\n');
fprintf('*******************************\n');
tic
fid = fopen( 'text.bin', 'w' );
fwrite( fid, data, data_format_write );
fclose( fid );
toc

fprintf('\n');
fprintf('*********************************\n');
fprintf('* Reading data from binary file *\n');
fprintf('*********************************\n');
tic
fid = fopen( 'text.bin', 'r');
data_read = fread( fid, [3 Inf], data_format_write_read )';
fclose( fid );
toc

fprintf('\n');
fprintf('*****************************\n');
fprintf('* Writing data to text file *\n');
fprintf('*****************************\n');
tic
fid = fopen( 'text.txt', 'w');
max = size(data);
for i=1:1:max(2)
	fprintf(fid, '%d ', data(i));
    if mod(i, 3) == 0
        fprintf(fid, '\n');
    end
end
fclose( fid );
toc

%% Test the effect of pre-allocation

clear; clc;

data_length = 100000000;

fprintf('\n');
fprintf('*********************************\n');
fprintf('* Testing without preallocation *\n');
fprintf('*********************************\n');
tic
x = 0;
progress = floor(0.1 * data_length);
fprintf('please wait');
for k = 2:data_length
   x(k) = x(k-1) + 5;
   if k == progress
      fprintf('.');
      progress = progress + floor(0.1*data_length);
   end
end
fprintf('\n');
toc

fprintf('\n');
fprintf('******************************\n');
fprintf('* Testing with preallocation *\n');
fprintf('******************************\n');
tic
x = zeros( 1, data_length, 'int32' );
for k = 2 : data_length
	x(k) = x(k-1) + 5;
end
toc