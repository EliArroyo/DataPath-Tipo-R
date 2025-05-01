/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module multiplexor(
    input wire[31:0]in1mux,
    input wire[31:0]in2mux,
    input wire muxsel,
    output reg[31:0]outmux
);

always@(*) 
	begin
		if(muxsel)
		begin
			outmux = in1mux;  // La salida toma el valor de la entrada 1.
		end
		
		else
		begin
			outmux = in2mux;  // La salida toma el valor de la entrada 2.
		end
	end
endmodule
