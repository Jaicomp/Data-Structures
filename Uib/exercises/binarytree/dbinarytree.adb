

package body dbinarytree is


		procedure insert(t: in out tree; x: in item) is

		begin
			put_line("OK");
		end insert;

		function is_path_sum(t: in tree; x: in item) return boolean is
		begin
			return true;
		end is_path_sum;

		begin

			for i in ms'range loop
				ms(i):= first_item;
			end loop;




end dbinarytree;
