/*Elizabeth Arroyo
Humberto Peña
Rebeca Hernandez
Arquitectura de Computadoras
Ernesto Lopez
27/04/2025
UdeG CUCEI ICOM*/

`timescale 1ns/1ns

module DPTR(
	input   [31:0]instruccionTR
);

//Definimos registros para las conexiones.
wire [31:0] r1;				//Dato escritura BR y salida multiplexor
wire [31:0] r2;				//Salida de Read Data 1 y entrada de OP1 de la ALU
wire [31:0] r3;				//Salida de Read Data 2, entrada de OP2 de la ALU y dato escritura de memoria.
wire [2:0]  r4;				//Salida de ALU control y entrada de ALUop
wire [31:0] r5;			    //Direccion de memoria de datos, entrada 2 de mux y salida de ALU
wire [31:0] r6;				//Dato entrada 1 demux y dato de lectura.
wire [5:0]  outControl;	//Salida de la unidad de control, se separa en varios bits.

//Definición de todas las instancias que se van a utilizar.
BancoRegistros 		instBR(.dirLect1(instruccionTR[25:21]), .dirLect2(instruccionTR[20:16]), .dirEscritura(instruccionTR[15:11]), .RegEn(outControl[5]), .datoEsc(r1), .datoLect1(r2), .datoLect2(r3));
memOut  			instMemoria(.dir(r5), .MemToWrite(outControl[1]), .datoEsc(r3), .datoLec(r6));
ALU      			instALU(.A(r2), .B(r3), .ALUSel(r4), .R(r5));
multiplexor    		instMux(.in1mux(r6), .in2mux(r5), .muxsel(outControl[0]), .outmux(r1));
UnidadControl		instControl(.OPcode(instruccionTR[31:26]), .outControl(outControl));
ALUControl			instALUControl(.Function(instruccionTR[5:0]), .ALUOpin(outControl[4:2]), .OpALUout(r4));
endmodule

module DPTR_TB();

reg   [31:0]instruccion;

DPTR instTB(.instruccionTR(instruccion));

// Banco de pruebas.
// Formato de codificación para instrucciones tipo R:
// Bits 31-26 : Opcode (siempre 000000 en este tipo de instrucciones)
// Bits 25-21 : Registro fuente (rs)
// Bits 20-16 : Segundo registro fuente (rt)
// Bits 15-11 : Registro destino (donde se almacena el resultado)
// Bits 10-6  : Shamt (desplazamiento; no se utiliza en instrucciones R estándar)
// Bits 5-0   : Código de función (especifica la operación a realizar)

initial
	begin
		$readmemb("datos.txt", instTB.instBR.BRin);
		instruccion = 32'b000000_00000_00001_00010_00000_100010;	//Resta aritmética: $0 $1 $3
		#100;
		$stop;
	end
endmodule
