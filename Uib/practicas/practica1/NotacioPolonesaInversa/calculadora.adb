with Ada.Command_Line, Ada.Text_IO;
use Ada.Command_Line, Ada.Text_IO;

with dstack;

procedure calculadora is

  -- We declare a dstack package with maximum size of 100 elements
 	package stackInteger is new dstack(max => 100);
	use stackInteger;

	-- This function check if the string parameter is an operator
	function isOperator(text: String) return boolean is
		type type_operators is array (1 .. 5) of String(1..1);
		operators : type_operators := ("+", "-", "x", "/", "^");
	begin
		-- Search in a list of operators to see if some operator match
		for i in operators'range loop

			if text = operators(i) then
				return True;
			end if;

		end loop;

		return false;
	end isOperator;

	-- This function combine an operator and two numbers and return the result
	function calculateOperation(operation: string; leftNum: integer; rightNum: integer) return integer is
		type type_operators is array (1 .. 5) of String(1..1);
		operators : type_operators := ("+", "-", "x", "/", "^");
	begin

		-- Search in the list of operators and return the result of the operation
		for i in operators'range loop
			if operation = operators(i) then
				
				if operators(i) = "+" then
					return leftNum + rightNum;
				elsif operators(i) = "-" then
					return 	leftNum - rightNum;
				elsif operators(i) = "x" then
					return leftNum * rightNum;
				elsif operators(i) = "/" then
					return leftNum / rightNum;
				elsif operators(i) = "^" then
					return leftNum ** rightNum;	
				end if;
			end if;

		end loop;
		-- In case that the operator doesn't exist, it return 0
		return 0;
	end calculateOperation;

	-- Declaration of variables
	pila: stack;
	leftNum: integer; -- left number in operation
	rightNum: integer; -- right number in operation
	
	errorEmptyStack : exception;
begin
	-- Needs minimum 3 arguments (1 operator and 2 numbers)
	if Argument_Count < 3 then
		Put_Line("Error - Incorrect number of arguments!!");
		return;
	end if;
	empty(pila);
	for Arg in 1 .. Argument_Count loop
		-- If its an operator
		if isOperator(Argument(Arg)) then

			if not is_empty(pila) then
				rightNum := top(pila);
				pop(pila);
			else
				raise errorEmptyStack;
			end if;
					
			if not is_empty(pila) then
				leftNum := top(pila);
				pop(pila);
			else
				raise errorEmptyStack;
			end if;

			-- Push the result of the operation	
			push(pila, calculateOperation(Argument(Arg), leftNum, rightNum));
		else -- If its a number
			push(pila, Integer'Value(Argument(Arg)));
		end if;
	end loop;

	-- When we finish all operations, we show the result
	put_line("Result: "&top(pila)'img);
end calculadora;
