% This function reads from binary file to a variable, it is better to pass dimentions as [ rows, Inf] %

function data_read = readBinaryFile( fileName, dimensions, data_format )
	fprintf('\n');
	fprintf('*********************************\n');
	fprintf('* Reading data from binary file *\n');
	fprintf('*********************************\n');
	tic
	fid = fopen( fileName, 'r');
	data_read = fread( fid, dimensions, data_format )';
	fclose( fid );
	toc
end