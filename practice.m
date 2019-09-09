% this is a file to practice various Matlab programming structures %

%% Testing fread and fwrite to binary vs. fprintf to text file  

clear; clc;

data_format = 'int32';
data_format_read = [data_format, '=>', data_format];
data_length = 300000;

data = zeros( 1, data_length, data_format );

for i=1:1:numel(data)
	data(i) = randi( 100, data_format );
end

fprintf('*******************************\n');
fprintf('* Writing data to binary file *\n');
fprintf('*******************************\n');
tic
fid = fopen( 'text.bin', 'w' );
fwrite( fid, data, data_format );
fclose( fid );
toc

fprintf('\n');
fprintf('*********************************\n');
fprintf('* Reading data from binary file *\n');
fprintf('*********************************\n');
tic
fid = fopen( 'text.bin', 'r');
data_read = fread( fid, [3 Inf], data_format_read )';
fclose( fid );
toc

fprintf('\n');
fprintf('*****************************\n');
fprintf('* Writing data to text file *\n');
fprintf('*****************************\n');
tic
fid = fopen( 'text.txt', 'w');
for i=1:1:data_length
	fprintf(fid, '%d ', data(i));
    if mod(i, 3) == 0
        fprintf(fid, '\n');
    end
end
fclose( fid );
toc

fprintf('\n');
fprintf('*****************************\n');
fprintf('* Reading data from text file *\n');
fprintf('*****************************\n');
tic
fid = fopen( 'text.txt', 'r');
max = size(data);
data_read = fscanf(fid, '%d');
data_read = reshape( data_read, data_length/3, 3 );
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