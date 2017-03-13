with Ada.Text_IO;
use Ada.Text_IO;

generic
	type item is private;
	with function "<"(first, second: item) return Boolean is <>;
	with function "="(first, second: item) return Boolean is <>;
	with function ">"(first, second: item) return Boolean is <>;

package llista is
	type list is limited private;
	
	-- Insert a new element
	procedure insert(l: in out list; x: in item);
	-- Sort the list
	procedure dis_order(l: in out list; x: in item);

	-- Return one element at the
	function get_item(l: in list; pos: in integer) return item;
	-- Return the size of the list
	function get_size(l: in list) return integer;

	private

	type node;
	type pnode is access node;

	type node is
		record
		x: item;
		next: pnode;
	end record;


	type list is
		record
		first: pnode;
	end record;

end llista;
