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
			3'b010:	// Instrucciones tipo R
				case (Function)
					6'b100000: OpALUout = 3'b010;  // Operación de suma (add)
					6'b100010: OpALUout = 3'b110;  // Operación de resta (sub)
					6'b100100: OpALUout = 3'b000;  // Operación lógica AND
					6'b100101: OpALUout = 3'b001;  // Operación lógica OR
					6'b101010: OpALUout = 3'b111;  // Comparación: set on less than (SLT)
				endcase
			3'b001: OpALUout = 3'd0;   // Instrucciones tipo J: la ALU permanece inactiva
			3'b000: OpALUout = 3'd0;   // Instrucciones tipo I: operación por defecto o sin uso de la ALU
			default: OpALUout = 3'd0;  // Valor por defecto: la salida de la ALU se establece en cero
		endcase
	end
endmodule
