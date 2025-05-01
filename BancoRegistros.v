/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

module BancoRegistros(
	input  wire[4:0]dirLect1,
	input  wire[4:0]dirLect2,
	input  wire[4:0]dirEscritura,
	input  wire RegEn,
	input  wire[31:0] datoEsc,
	output reg [31:0] datoLect1,
	output reg [31:0] datoLect2
);

reg [31:0]BRin[0:31];

always@(*)
	begin
	//Procedimiento de lectura de datos
	datoLect1 = BRin[dirLect1];
	datoLect2 = BRin[dirLect2];
	
	if(RegEn)
	begin
		BRin[dirEscritura] = datoEsc;
	end
	
end
endmodule
