with Text_IO;
use Text_IO;

with dbinarytree;

procedure main is
	
	package binaryTreeInteger is new dbinarytree(item => integer, first_item => 1, len => 8, "+" => "+", Image => Integer'Image);
	use binaryTreeInteger;

	tr: tree;


begin

	put_line("MMM");



end main;
