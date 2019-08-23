% This function accepts data array, checks type and writes a binary file that contains values of the same data type as data array. Data is written in one continious column %

function [data_format_write] = writeBinaryFile( data, fileName )
	if isa( data(1), 'char')
		data_format_write = 'char';
	elseif isa( data(1), 'int8');
		data_format_write = 'int8';
	elseif isa( data(1), 'int16');
		data_format_write = 'int16';
	elseif isa( data(1), 'int32');
		data_format_write = 'int32';
	elseif isa( data(1), 'int64');
		data_format_write = 'int64';
	elseif isa( data(1), 'uint8');
		data_format_write = 'uint8';
	elseif isa( data(1), 'uint16');
		data_format_write = 'uint16';
	elseif isa( data(1), 'uint32');
		data_format_write = 'uint32';
	elseif isa( data(1), 'uint64');
		data_format_write = 'uint64';
	elseif isa( data(1), 'logical');
		data_format_write = 'logical';
	elseif isa( data(1), 'single');
		data_format_write = 'single';
	elseif isa( data(1), 'double');
		data_format_write = 'double';
	else
		data_format_write = -1;
		error('Invalid variable type');
	end

	fprintf('*******************************\n');
	fprintf('* Writing data to binary file *\n');
	fprintf('*******************************\n');
	fprintf('Data format is %s\n', data_format_write );

	tic
	fid = fopen( fileName, 'w' );
	fwrite( fid, data, data_format_write );
	fclose( fid );
	toc
end