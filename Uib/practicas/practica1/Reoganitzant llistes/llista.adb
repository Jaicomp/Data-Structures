
package body llista is

	-- Insert new element in the list
	procedure insert(l: in out list; x: in item) is
	r: pnode;
	begin
		r:= new node'(x, l.first);
		l.first:= r;
	end insert;

	procedure dis_order(l: in out list; x: in item) is
		fmp, iip, fip, imp, ffmp, p: pnode;

		-- We have 3 parts of the list (Minor, Equal and Major)
		-- [Minor][Equal = x][  Major  ]
		-- [  fmp][iip   fip][imp  ffmp]
		--
		-- fmp -> final minor pointer
		--
		-- iip -> initial equal pointer
		-- fip -> final equal pointer
		--
		-- imp -> initial major pointer
		-- ffmp -> final major pointer


	begin
		-- First we get the first pointer of the list
		p:= l.first;
		-- Traverse all the nodes of the list
		while p /= null loop

			-- if 'x' is major than item of actual point
			if p.x < x then
				if fmp = null then
					fmp:= p;
					l.first:= p;
					p:= p.next;
					fmp.next:= null;

					if iip /= null then
						fmp.next:= iip;
					end if;

				else
					fmp.next:= p;
					p:= p.next;
					fmp:= fmp.next;
					fmp.next:= null;

					if iip /= null then
						fmp.next:= iip;
					end if;
				end if;
				
			-- if 'x' is equal to the item of the actual point	
			elsif p.x = x then
				
				if iip = null then

					if fmp = null then
						l.first:= p;
					end if;
					iip:= p;
					fip:= p;
					p:= p.next;
					fip.next:= null;

					if imp /= null then
						fip.next:= imp;
					end if;		

					if fmp /= null then
						fmp.next:= iip;
					end if;

				else
					fip.next:= p;
					p:= p.next;
					fip:= fip.next;
					fip.next:= null;
			
					if imp /= null then
						fip.next:= imp;
					end if;

				end if;

			-- if 'x' is minor than the item of que actual point
			else

				if imp = null then
					if fmp = null and iip = null then
						l.first:= p;
					end if;

					ffmp:= p;
					imp:= p;
					p:= p.next;
					imp.next:= null;


					if fip /= null then
						fip.next:= imp;
					end if;

				else
					ffmp.next:= p;
					p:= p.next;
					ffmp:= ffmp.next;
					ffmp.next:= null;
					
				end if;
			end if;

		end loop;
	end dis_order;

	-- Return one item of the list in the position 'pos' (1 - first position)
	function get_item(l: in list; pos: in integer) return item is
		index: integer;
		p: pnode;
		i: item;
	begin
		index:= pos - 1;
		p:= l.first;
		while p /= null and then index /= 0 loop
			index:= index - 1;
			p:= p.next;
		end loop;

		if p /= null then
			return p.x;
		else
			return i;
		end if;

	end get_item;

	-- Return the size of the list
	function get_size(l: in list) return integer is
		size: integer;
		p: pnode;
	begin
		size:= 0;
		p:= l.first;
		while p /= null loop
			size:= size + 1;
			p:= p.next;
		end loop;
		
		return size;

	end get_size;


end llista;

