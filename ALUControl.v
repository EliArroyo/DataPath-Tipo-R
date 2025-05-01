/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module ALUControl(
    input wire [5:0]  Function,
    input wire [2:0]  ALUOpin,
    output reg [2:0]  OpALUout
);

always@(*) 
	begin
		case (ALUOpin)
			3'b010:									// Instrucciones tipo R
				case (Function)
					6'b100000: OpALUout = 3'b010;		//Suma
					6'b100010: OpALUout = 3'b110;		//Resta
					6'b100100: OpALUout = 3'b000;		//AND
					6'b100101: OpALUout = 3'b001;		//OR
					6'b101010: OpALUout = 3'b111;		//SLT
				endcase
			3'b001: OpALUout = 3'd0;        			// Instrucciones tipo J
			3'b000: OpALUout = 3'd0;       			// Instrucciones tipo I
			default: OpALUout = 3'd0;       			// Por defecto, salida en 0
		endcase
	end
endmodule
