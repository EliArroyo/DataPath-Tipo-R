/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module Unidad_control(
    input wire [5:0]  OPcode,
    output reg [5:0]  salida_control
);

//Salida control bits:
//5      RegWrite -> BR
//4 3 2  ALUcontrol
//1		 MemToWrite -> MemDatos
//0		 MemToReg	-> Multiplexor

always@(*) 
	begin
		case (OPcode)
			6'b000000:  salida_control = 6'b1_010_0_0;		// Opcode de instrucciones tipo R
			6'b000001:  salida_control = 6'b0_010_0_0;		// Opcode de instrucciones tipo R
			default: salida_control = 6'd0;       			// Por defecto, salida en 0
		endcase
	end
endmodule


