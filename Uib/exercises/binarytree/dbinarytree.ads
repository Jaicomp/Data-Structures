with Ada.Text_IO;
use Ada.Text_IO;

generic
	type item is private;
	first_item: item; -- neutral element of item's type, if its a name will be 0.
	len: integer;
	with function "+"(a, b: in item) return item;
	with function Image(a: in item) return String;

	package dbinarytree is
		
		type tree is limited private;
		procedure insert(t: in out tree; x: in item);
		function is_path_sum(t: in tree; x: in item) return boolean;


		private

			subtype drange is integer range 1..len;

			type mem_space is array (drange) of item;

			type tree is
				record
				ms: mem_space;
				free: drange := drange'First;

			end record;
end dbinarytree;
