/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module mem_out(
	input  wire[31:0]dir,
	input  wire MemToWrite,
	input  wire[31:0] datoEscritura,
	output reg [31:0] datoLectura
);

reg [31:0]memr_out[0:31];

always@(*)
	begin
	//Escritura
	if(MemToWrite) 
	begin
		memr_out[dir] = datoEscritura;
	end
	
	//Lectura
	if(!(MemToWrite))
	begin
		datoLectura = memr_out[dir];
	end
end
endmodule
