/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module UnidadControl(
    input wire [5:0]  OPcode,
    output reg [5:0]  outControl
);

always@(*) 
	begin
		case (OPcode)
			6'b000000:  outControl = 6'b1_010_0_0;		// Opcode de instrucciones tipo R
			6'b000001:  outControl = 6'b0_010_0_0;		// Opcode de instrucciones tipo R
			default: outControl = 6'd0;       			// Por defecto, salida en 0
		endcase
	end
endmodule

/* Descripción de las señales de control por bits
Bit 5       : RegWrite — Habilita la escritura en el banco de registros
Bits 4-2    : ALUcontrol — Determina la operación que ejecuta la ALU
Bit 1       : MemWrite — Activa la escritura en la memoria de datos
Bit 0       : MemToReg — Controla si el dato a escribir en el registro proviene de la memoria o de la ALU */
