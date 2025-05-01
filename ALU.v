/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module ALU(
    input wire [31:0] A, B,
    input wire [2:0]  ALUSel,
    output reg [31:0] R
);

always@(*) 

	begin
		case (ALUSel)
			3'b000: R = A&B;        				
			3'b001: R = A|B;        				
			3'b010: R = A+B;       				
			3'b110: R = A-B;        				
			3'b111: R =(A<B) ? 32'd1 : 32'd0; 		
			default: R = 32'd0;       				
		endcase
	end
	
endmodule

