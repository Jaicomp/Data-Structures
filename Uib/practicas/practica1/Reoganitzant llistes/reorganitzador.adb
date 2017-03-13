with Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;

with llista;

procedure reorganitzador is

	package llistaInteger is new llista(item => integer);
	use llistaInteger;

	-- Print all the elementos of a list
	procedure print_list(li: in list) is
		num: integer;
		size: integer;
	begin
		size:= get_size(li);
		for i in 1..size loop
			num:= get_item(li, i);
			put(num'img);
		end loop;
		put_line("");
	
	end print_list;

	li: list;
	num: integer;
	File: File_Type;

begin

	-- Open file
	Open (File => File,
				Mode => In_File,
				Name => "llista_init");

	-- Insert all elements in the list 
	loop
		exit when End_Of_File(File);
		get(File, num);
		insert(li, num);
	end loop;
	-- Close file
	Close(File);


	-- Open file 
	Open (File => File,
				Mode => In_File,
				Name => "llista_init");

	-- Sort and show the list using each element of the list at each time
	loop
		exit when End_Of_File(File);
		
		get(file, num);
		-- sort the list
		dis_order(li, num);

		put_line("Number to sort: "&num'img);
		print_list(li);
	end loop;

	-- Close file
	Close(File);

end reorganitzador;
