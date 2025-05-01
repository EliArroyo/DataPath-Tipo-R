/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module memOut(
	input  wire[31:0]dir,
	input  wire MemToWrite,
	input  wire[31:0] datoEsc,
	output reg [31:0] datoLec
);

reg [31:0]memrOut[0:31];

always@(*)
	begin
	//Escritura
	if(MemToWrite) 
	begin
		memrOut[dir] = datoEsc;
	end
	
	//Lectura
	if(!(MemToWrite))
	begin
		datoLec = memrOut[dir];
	end
end
endmodule
