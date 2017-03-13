with Ada.Command_Line, Ada.Text_IO;
use Ada.Command_Line, Ada.Text_IO;

with dstack;

procedure main is

	package pilaInteger is new dstack(item => integer);
	use pilaInteger;
	pila: stack;

	function isOperator(text: String) return boolean is
		type type_operators is array (1 .. 5) of String(1..1);
		operators : type_operators := ("+", "-", "*", "/", "^");
	begin
		for i in operators'range loop
			if text = operators(i) then
				return True;
			end if;
		end loop;
		return false;
	end isOperator;

	function calculateOperation(operation: string; first: integer; second: integer) return integer is
		type type_operators is array (1 .. 5) of String(1..1);
		operators : type_operators := ("+", "-", "*", "/", "^");
	begin

		for i in operators'range loop
			if operation = operators(i) then
				--case operators(i) is
				--	when "+" =>
				--		return first + second;
				--	when "-" =>
				--		return first - second;
				--	when "*" =>
				--		return first * second;
				--	when "/" =>
				--		return first / second;
				--	when "^" =>
				--		return first**second;
				--end case;
				
				if operators(i) = "+" then
					return first + second;
				end if;
			end if;

		end loop;
		return 0;
	end calculateOperation;

	result : integer := 0;
	firstNum: integer;
	secondNum: integer;
	
begin
	-- Needs minimum 3 arguments (1 operator and 2 numbers)
	if Argument_Count < 3 then
		Put_Line("Error - Incorrect number of arguments!!");
		return;
	end if;

	for Arg in 1 .. Argument_Count loop
		if isOperator(Argument(Arg)) then

			firstNum := top(pila);
			pop(pila);
			secondNum := top(pila);
			pop(pila);

			result := result + calculateOperation(Argument(Arg), firstNum, secondNum);
		else -- Is Number
			push(pila, Integer'Value(Argument(Arg)));
			--put_line(top(pila)'img);
		end if;
	end loop;
	put_line("Result: "&result'img);
end main;
