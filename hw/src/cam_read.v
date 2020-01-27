`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:22 12/02/2019 
// Design Name: 
// Module Name:    cam_read 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cam_read #(
		parameter AW = 17, // Cantidad de bits  de la dirección 
		parameter DW = 8
		)(
		input pclk,
		input rst,
		input vsync,
		input href,
		input [7:0] px_data,

		output reg [AW-1:0] mem_px_addr=0,
		output reg [7:0]  mem_px_data=0,
		output reg px_wr=1
   );
	

/********************************************************************************

Por favor colocar en este archivo el desarrollo realizado por el grupo para la 
captura de datos de la camara 

debe tener en cuenta el nombre de las entradas  y salidad propuestas 

********************************************************************************/






//***********************************************************************
// modulo de captura de datos generado por estudiantes
//***********************************************************************

// Registros necesarios para el modulo captura de datos

reg  fb=0;
reg  [1:0]d=0;
reg  fila=0;
reg  [DW-1:0] f_data_in565=0;
reg  [(2*DW)-1:0] s_data_in565=0;


// Modulo que nos permite recivir los bytes (RGB 565) que genera la camara
// y guardar en la ram (RGB 332)

always @ (posedge pclk)
begin
//Guardamos 1 byte y damos paso a el registro del segundo byte 
//por medio de un contador (fb)
if (fb==0 && href==1)
begin
f_data_in565<=px_data;
fb<=fb+1;
px_wr<=1; //activa la señal de permiso de escritura
end
//Guardamos el 2do byte y lo contatenamos para tener el registro 
//del pixel en formato RGB 565.
//Inmediatamente extraemos los bits mas significativos para tener 
//el pixel en formato RGB 332 y lo enviamos a la ram
if (fb==1 && href==1)
begin
s_data_in565 = {f_data_in565,px_data};
mem_px_data = {s_data_in565 [14:12],s_data_in565 [9:7], s_data_in565 [4:3]};
fb=0;

end
end

//********************************************************************************

// Modulo que controla la direccion de escritura

always @ (negedge pclk)begin
if (href==1)begin
d=d+1;
end
// Cuando la camara envia la señal Vsync 
//la direccion de escritura es el pixel cero
if (vsync==1 && href==0)begin
mem_px_addr<=0;
end
//Cada 2 pulsos de Pclk la direccion aumenta en 1.
if (href==1 && d==2 )begin
mem_px_addr<=mem_px_addr+1;
d=0;
px_wr=0; //desactiva la señal de permiso de escritura
end
end



//***********************************************************************
//***********************************************************************
//***********************************************************************


endmodule
