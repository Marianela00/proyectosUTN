Proceso CajaPizzeria
	menu();
FinProceso

SubProceso menu()
	Definir nombre, mozo Como Cadena;
	Definir opcion,terminar,vuelto,sepaga,tipo Como Entero;
	Definir pc,pj,pf,precioctotal,preciojtotal,precioftotal,total,totalCierre,caja Como Real;
	Definir cierrepc,cierrepj,cierrepf,cierreA,cierreCE,cierreG Como Real;
	Definir dividendo,cont,cont2,opc1 Como Entero;
	
	definir aguaMineral,Cerveza,Gaseosa,precioAtotal,precioCEtotal,precioGtotal Como Real;
	Definir arreglo,num Como cadena;
	Definir arreglototal Como Real;
	dimension arreglototal[50];
	Dimension arreglo[50];
	Definir ce Como Entero;
	Definir k Como Entero;
	Definir l Como Real;
	
	Definir cantmesas,tables,comensales Como Entero;
	
	cont <- 0;
	k<-0;
	l<-0;
	Definir pxu1,pxu2,pxu3 Como Entero;
	pxu1 <- 400;
	pxu2 <- 600;
	pxu3 <- 500;
	
	sepaga<-0;
	vuelto<-0;
	terminar<-0;
	caja<-1000;
	//ciclo de pedido
	Repetir
		pc<-0;
		pj<-0;
		pf<-0;
		aguaMineral<-0;
		Cerveza<-0;
		Gaseosa<-0;
		cierrepc<-0;
		cierrepj<-0;
		cierrepf<-0;
		cierreA<-0;
		cierreCE<-0;
		cierreG<-0;
		totalCierre<-0;
		
		precioctotal<-0;
		preciojtotal<-0;
		precioftotal<-0;
		precioAtotal<-0;
		precioCEtotal<-0;
		precioGtotal<-0;
		Limpiar Pantalla;
		Escribir "     ******************************";
		Escribir "     *****PIZZERIA CODE_PEOPLE*****";
		Escribir "     ******************************";
		Escribir "";
		Escribir " Ingrese el pedido del cliente";
		Escribir "";
		Escribir " Ingrese nombre del cliente: " Sin Saltar;
		//Llaman al subproceso cliente y mozo 
		cliente(nombre);
		seleccion(mozo);
		//Se guarde el nombre del cliente para el cierre de caja
		k<-k+1;
		arreglo[k]<- nombre;
		ce<-k;
		//PERMITE ELGIR DONDE COMER
		lugarComer(mesa,matriz); // linea 129
		Limpiar Pantalla;
		//Sub procesos de menus
		pizzaMenu();
		bebidasMenu();
		total<-0;
		total <- precioctotal+preciojtotal+precioftotal+precioAtotal+precioCEtotal+precioGtotal;//suma del total del pedido de pizza y gaseosa
		Escribir " El total de su compra es: $ ",total;
		//se guarda lo que gasto cada cliente para el cierre de caja
		vuelto<-0;
		metodoDePago(total,vuelto,caja);
		l<-l+1;
		arreglototal[l]<- total;
		//escribimos el tiket
		Limpiar Pantalla;
		ticket(nombre, mozo);
 	Hasta que terminar = 5
	Limpiar Pantalla;
	//Cierre de caja
	close(caja,total,arregloTotal,totalCierre,cierrepc,cierrepj,cierrepf,cierreA,cierreCE,cierreG,arreglo,ce,arreglototal);
FinSubProceso

//subproceso del calculo de comesale para las mesas
SubProceso close(caja,total,arregloTotal,totalCierre,cierrepc,cierrepj,cierrepf,cierreA,cierreCE,cierreG,arreglo,ce,arreglototal)
	Definir totalCierreTarj,ganancia Como Real;
	Definir precioCostoTotal Como Real;
	precioCostoTotal<-0;
	ganancia<-0;
	totalCierreTarj<-0;
	Escribir "                CIERRE DE CAJA ";
	Escribir "";
	Escribir " Apertura de caja: $ 1000 pesos            ";
	Escribir " Cierre de caja en efectivo: $  ",caja;
	caja<-caja-1000;
	Escribir " Venta en efectivo: $ ",caja;
	totalCierreTarj<-totalCierre-caja;
	Escribir " Cierre de caja de tajeta: $ ",totalCierreTarj;
	Escribir "";
	Escribir " Productos que se vendieron y precio costo en total:";
	Escribir "";
	Escribir " Pizzas clásica:               ",cierrepc,"  ",sumapreciocAlCosto(cierrepc);
	Escribir " Pizzas de jamón:              ",cierrepj,"  ",sumapreciojAlcosto(cierrepj);
	Escribir " Pizzas de fugazzetta:         ",cierrepf,"  ",sumapreciofAlCosto(cierrepf);
	Escribir " Agua mineral:                 ",cierreA ,"  ",sumaprecioAAlCosto(cierreA);
	Escribir " Cerveza:                      ",cierreCE,"  ",sumaprecioCEAlCosto(cierreCE);
	Escribir " Gaseosa:                      ",cierreG ,"  ",sumaprecioGAlCosto(cierreG);
	precioCostoTotal<-sumapreciocAlCosto(cierrepc)+sumapreciojAlcosto(cierrepj)+sumapreciofAlCosto(cierrepf)+sumaprecioAAlCosto(cierreA)+sumaprecioCEAlCosto(cierreCE)+sumaprecioGAlCosto(cierreG);
	Escribir " Precio de costo total $: ",precioCostoTotal;
	// Ganancia
	ganancia<-totalCierre-precioCostoTotal;
	Escribir " La ganancia es $: ",ganancia;
	Escribir "";
	Escribir " Clientes que compraron:";
	Escribir "";
	imprimirArreglo(arreglo,ce,arreglototal);
	Escribir " Total de ventas del dia $ ",totalCierre;
FinSubProceso
// Elegir donde comer
SubProceso lugarComer(mesa,matriz)
	Definir tipo Como Entero;
	Repetir 
		Escribir " Elija el tipo de Orden";
		Escribir " 1. Para llevar";
		Escribir " 2. Para comer aquí";
		Leer tipo;
	Hasta Que tipo <= 2
	Segun tipo Hacer
		1:
			
		2://aca se elige las mesas de una matriz del 1 al 9 y las ocupadas estan en 0
			mesa(tables,comensales);
			Limpiar Pantalla;
			Escribir "";
			Escribir " Ustede puede seleccionar: ",tables, " Mesas";
			Escribir " Nuestras mesas";
			//muestra la ubicación de las mesas en una matriz
			// Matriz mesas 
			matriz(tables);
			Escribir "";
	FinSegun
FinSubProceso

SubProceso ticket (nombre, mozo)
	
	Escribir ' PIZZERIA CODE_PEOPLE';
	Escribir '';
	Escribir ' El cliente es: ',nombre;
	Escribir ' Usted fue atendido por: ',mozo; 
	Escribir '';
	Escribir Sin Saltar        "               Precio/u  ","Cant","  Total";
	Escribir '';
	Si pc >0 Entonces
		Escribir " Pizza clásica       ","  ",pxu1,"    ",pc,"    ",precioctotal;
	FinSi
	Si pj > 0 Entonces
		Escribir " Pizza con jamón    ","  ",pxu2,"    ",pj,"    ", preciojtotal;
	FinSi
	Si pf > 0 Entonces
		Escribir " Pizza fugazzetta   ","  ",pxu3,"    ",pf,"    ",precioftotal;
	FinSi
	Si aguaMineral >0 Entonces
		Escribir " Agua mineral       ","  ",pxu1,"    ",aguaMineral,"    ",precioAtotal;
	FinSi
	Si Cerveza > 0 Entonces
		Escribir " Cerveza            ","  ",pxu2,"    ",Cerveza,"    ", precioCEtotal;
	FinSi
	Si Gaseosa > 0 Entonces
		Escribir " Gaseosa            ","   ",pxu3,"    ",Gaseosa,"    ",precioGtotal;
	FinSi
	Escribir "";
	Escribir ' Total de la orden:    ',total;
	Escribir " El vuelto es:         ",vuelto;
	Escribir "";
	Escribir " Para cierre de caja precione 5";//sale del ciclo de caja y hace un cierre de caja
	Escribir " Para continuar con mas ventas precione ENTER";
	totalCierre<-totalCierre+total;
	Leer terminar;
FinSubProceso

SubProceso mesa(tables Por Referencia,comensales Por Referencia)
	Definir lugares,meza Como Entero;
	Escribir "| Cuatro personas por mesa |";
	Escribir " ¿Cuantas personas son? ";
	Leer lugares;
	// 1 mesa = hasta 4 comensales
	// 2 mesas = de 5 hasta 8
	// 3 mesas= mas de 8 hasta 12
	Si lugares <= 4 Entonces 
		meza <- 1;
	SiNo
		Si lugares >= 5 Y lugares <= 8 Entonces
			meza <- 2;
		SiNo
			Si lugares >= 9 y lugares <= 12 Entonces
				meza <- 3;
			FinSi
		FinSi	
	FinSi
	tables <- meza;
	comensales <- lugares; 
FinSubProceso

SubProceso pizzaMenu()
	Repetir
		Escribir "---------------------------------";
		Escribir ' -------- MENÚ DE PIZZAS ------- ';
		Escribir "|                               |";
		Escribir '| 1. Pizza clásica         $400 |';
		Escribir "|                               |"; 
		Escribir '| 2. Pizza de jamón        $600 |';
		Escribir "|                               |";
		Escribir '| 3. Pizza fugazzetta      $500 |';
		Escribir "|                               |';
		Escribir '| 4. Ir al menú de Bebidas      |';
		Escribir " ------------------------------- ";
		Escribir ' SELECCIONE SU PIZZA ' Sin Saltar;
		Leer opcion;
		Segun opcion  Hacer
			1:
				Escribir ' Cantidad ' Sin Saltar;
				Leer pc;
				precioctotal <- sumaprecioc(pc);//llama al subproceso del calculo de precio de pizza comun
			2:
				Escribir ' Cantidad ' Sin Saltar;
				Leer pj;
				preciojtotal <- sumaprecioj(pj);//llama al subproceso del calculo de precio de pizza con jamon
			3:
				Escribir ' Cantidad ' Sin Saltar;
				Leer pf;
				precioftotal <- sumapreciof(pf);//llama al subproceso del calculo de precio de pizza fugaceta
			4:
			De Otro Modo:
				Escribir ' Volver a intentar ';
		FinSegun
	Hasta Que opcion=4
	//suma de las unidades de las variedades de pizza para el cierre de caja		
	cierrepc<-cierrepc+pc;
	cierrepj<-cierrepj+pj;
	cierrepf<-cierrepf+pf;			
FinSubProceso

SubProceso bebidasMenu()
	Repetir
		Escribir "---------------------------------";
		Escribir ' -------- MENÚ DE BEBIDAS ------ ';
		Escribir "|                               |";
		Escribir '| 1. Agua mineral       $400    |';
		Escribir "|                               |";
		Escribir '| 2. Cerveza            $600    |';
		Escribir "|                               |";
		Escribir '| 3. Gaseosa            $500    |';
		Escribir "|                               |";
		Escribir '| 4. Terminar pedido.           |';
		Escribir " ------------------------------- ";
		Escribir ' SELECCIONE SU BEBIDA ' Sin Saltar;
		Leer opcion;
		Segun opcion  Hacer
			1:
				Escribir ' Cantidad de bebidas ' Sin Saltar;
				Leer aguaMineral;
				precioAtotal <- sumaprecioA(aguaMineral);//llama al subproceso del calculo de precio de agua mineral
			2:
				Escribir ' Cantidad de bebidas ' Sin Saltar;
				Leer Cerveza;
				precioCEtotal <- sumaprecioCE(Cerveza);//llama al subproceso del calculo de precio de cerveza
			3:
				Escribir ' Cantidad de bebidas ' Sin Saltar;
				Leer Gaseosa;
				precioGtotal <- sumaprecioG(Gaseosa);//llama al subproceso del calculo de precio de gaseosa
			4:
			De Otro Modo:
				Escribir ' Volver a intentar ';
		FinSegun
	Hasta Que opcion=4
	//suma de las unidades de las variedades de pizza para el cierre de caja		
	cierreA<-cierreA+aguaMineral;
	cierreCE<-cierreCE+Cerveza;
	cierreG<-cierreG+Gaseosa;
FinSubProceso

//funcion para agregar nombre del cliente y cuanto gasto

funcion   imprimirArreglo(arreglo Por Referencia,ce por valor,arreglototal por referencia)
	Definir i Como Entero;
	Para i<-1 Hasta ce con paso 1 Hacer
		Escribir  " El cliente: ",arreglo[i], " gasto: ",arreglototal[i];
		FinPara
FinFuncion

SubProceso metodoDePago(total Por Referencia,vuelto Por Referencia,caja Por Referencia)
	Definir formaDePago, opc,sepaga Como Entero;
	// Definimos los metodos de pago
	Escribir "   Seleccione la forma de pago";
	Escribir "  1. Pago en efectivo";
	Escribir "  2. Tarjeta de crédito";
	Escribir "  3. Tarjeta de Debito";
	Escribir "  4. Mercado pago";
	// Seleccionamos la forma de pago
	Leer formaDePago;
	Limpiar Pantalla;
	Segun formaDePago Hacer
		1:
			Escribir " Pago con Efectivo";
			Escribir ' Total $: ',total;
			Repetir
				Escribir "   Ingrese con cuanto va a pagar $: ";
				Leer sepaga;
				vuelto<-sepaga-total;
				si sepaga < total Entonces
					Escribir " ¡El monto insuficiente!";
				FinSi
			Hasta Que sepaga >= total
			caja<-caja+total;
		2:	
			tarjetaCredito(total);
		3:
			tarjetaDebito(total);
		4:
			mercadoPago(total);
		De Otro Modo:
			Escribir "";
	FinSegun
FinSubProceso

SubProceso tarjetaCredito(total Por Referencia)
	Definir numTarjeta, i,j,e,opc,x como Entero;
	Definir Interes Como Real;
	Definir nom_ape, dni, dni2 Como Caracter;
	
	Dimension numTarjeta[4,4];
	Escribir " Pago con tarjeta de crédito";
	Escribir "   Deslice su tarjeta";
	Para i<-0 Hasta 3 Hacer
		Para j <- 0 Hasta 3 Hacer
			numTarjeta[i,j] <- azar (9)+1;
		FinPara
	FinPara
	Esperar 1 Segundos;
	e <- 3;
	dni<-"        ";
	dni2<-"";
	Escribir Sin Saltar "   Espere por favor";
	Mientras e = 3 Hacer
		Repetir
			Esperar 800 Milisegundos;
			Escribir Sin Saltar ".";
			e <- e - 1;
		Hasta que e = 0
		e <- e + 1;
	FinMientras
	Escribir " ";
	Esperar 900 Milisegundos;
	Para i<-0 Hasta 3 Hacer
		Para j <- 0 Hasta 3 Hacer
			Escribir Sin Saltar numTarjeta[i,j];
		FinPara
		Escribir Sin Saltar " ";
	FinPara
	Escribir " ";
	Escribir "   Enter para continuar ->";
	Esperar Tecla;
	Repetir
		Escribir "   Ingrese su DNI ";
		Leer dni2;
	Hasta Que Longitud(dni2) = Longitud(dni) 
	Escribir "   Ingrese su nombre y apellido";
	Leer nom_ape;
	
	Escribir "    Seleccione una opción";
	Escribir "   1. En una cuota 0% de interes";
	Escribir "   2. En 3 cuotas 15% de interes";
	Escribir "   3. En 6 cuotas 18% de interes";
	Leer opc;
	Segun opc Hacer
		1:
			interes <- total;
		2:
			interes <- total+total*0.15;
		3:
			interes <- total+total*0.20;
	FinSegun
	Escribir " Su compra fue realizada con exito por un total de $", interes;
	total<-interes;
FinSubProceso

SubProceso tarjetaDebito(total Por Referencia)
	Definir numTarjeta, i,j,e,opc como Entero;
	Definir descuento Como Real;
	Definir nom_ape,dni,dni2,cvv,cvv2 Como Caracter;
	Dimension numTarjeta[4,4];
	Escribir " Pago con tarjeta de debito";
	Escribir "   Deslice su tarjeta";
	Para i<-0 Hasta 3 Hacer
		Para j <- 0 Hasta 3 Hacer
			numTarjeta[i,j] <- azar (9)+1;
		FinPara
	FinPara
	Esperar 1 Segundos;
	e <- 3;
	dni<-"        ";
	dni2<-"";
	cvv<-"    ";
	cvv2<-"";
	Escribir Sin Saltar "   Espere por favor";
	Repetir
		Esperar 800 Milisegundos;
		Escribir Sin Saltar ".";
		e <- e - 1;
	Hasta que e = 0
	Escribir " ";
	Esperar 900 Milisegundos;
	Para i<-0 Hasta 3 Hacer
		Para j <- 0 Hasta 3 Hacer
			Escribir Sin Saltar numTarjeta[i,j];
		FinPara
		Escribir Sin Saltar " ";
	FinPara
	Escribir " ";
	Escribir "   Enter para continuar ->";
	Esperar Tecla;
	Repetir
		Escribir "   Ingrese su DNI ";
		Leer dni2;
	Hasta Que Longitud(dni2) = Longitud(dni)
	
	Escribir "   Ingrese su nombre y apellido";
	Leer nom_ape;
	
	Repetir
		Escribir "   Ingrese el CVV ";
		Leer cvv2;
	Hasta Que Longitud(cvv2) = Longitud(cvv)
	Escribir Sin Saltar "   Espere por favor";
	Esperar 1 Segundos;
	e <- 3;
	Repetir
		Esperar 800 Milisegundos;
		Escribir Sin Saltar ".";
		e <- e - 1;
	Hasta que e = 0
	Esperar 2 Segundos;
	Escribir " ";
	Escribir " ¡Listo! Su compra se realizo con exito.";
	Escribir " La compra fue de $ ",total;
	Si total >= 1000 Entonces 
		descuento <- total * 0.15; //tarjeta debito
		total <- total - descuento;
		Escribir " Con un descuento del 15% de $ ",descuento; 
		Escribir " Total pagado $ ",total;
	SiNo
		Esperar 2 Segundos;
		Escribir " ¡Listo! Su compra se realizo con exito.";
	FinSi
	Escribir " Enter para continuar ->";
	Esperar Tecla;
FinSubProceso

SubProceso mercadoPago(total Por Referencia)
	Definir e Como Entero;
	Definir descuento Como Real;
	Escribir " Pago con mercado pago";
	Esperar 1 Segundos;
	e <- 3;
	Escribir Sin Saltar "   Espere por favor";
	Repetir
		Esperar 800 Milisegundos;
		Escribir Sin Saltar ".";
		e <- e - 1;
	Hasta que e = 0
	Escribir " ";
	Escribir "   Escanee el código QR";
	Esperar 2 Segundos;
	Escribir " ";
	Escribir "                0808006888087  708084587    7080808080808               ";    
	Escribir "                80        70      87580     78         80               ";    
	Escribir "                08 788888 78     700  877   70  88808  08               ";
	Escribir "                80 780808 78     08707 107  78  88088  88               ";
	Escribir "                88        107   87  48880   787        88               ";
	Escribir "                480888888888  08  07  0  91  088808080889               ";
	Escribir "                              80   1   90                               ";
	Escribir "                88  808  85   80  87 778  8087 78  87  80               ";
	Escribir "                              80808 01   80     08 787                  ";
	Escribir "                080808088888       9     88  0  8087   08               ";
	Escribir "                80        707    7888  1089     08     80               ";
	Escribir "                08  88089 78       980808088888080888                   ";
	Escribir "                88  88080 78   78 88 78    07 58   78  08               ";
	Escribir "                80        707        70  80 780888     88               ";
	Escribir "                8888088888087 08 7080    0801    781   88               ";
	Esperar 2 Segundos;
	Escribir " ¡Listo! Su compra se realizo con exito.";
	Escribir " La compra fue de $ ",total;
	Si total >= 1000 Entonces
		descuento <- total * 0.20;
		total <- total - descuento;
		Escribir " Con un descuento del 20% de $ ",descuento; 
		Escribir " Total pagado $ ",total;
	SiNo
		Esperar 2 Segundos;
		Escribir " ¡Listo! Su compra se realizo con exito.";
	FinSi
	Escribir " Enter para continuar ->";
	Esperar Tecla;
	Limpiar Pantalla;
FinSubProceso
//Sub proceso para que el nombre del cliente en el ticket aparezca la primera con mayuscula
SubProceso cliente(nombre Por Referencia)
	Definir  i Como Entero;
	Definir people como cadena;
	i <- 0;
	Leer nombre;
	people <- ""; 
	//Transformamos el primer caracter a Mayusculas
	people <- Concatenar(people, Mayusculas(Subcadena(nombre,0,0)));
	i <- 1;
	Mientras i<Longitud(nombre) Hacer
		Si Subcadena(nombre,i,i) <> ' ' Entonces
			people <- Concatenar(people,Subcadena(nombre,i,i));
			i <- i + 1;
		FinSi
	FinMientras
	nombre <- people;
FinSubProceso
SubProceso seleccion(mozo Por Referencia)
	Definir i Como Entero;
	Definir name como cadena;
	i<-0;
	Repetir
		Escribir " Atendido por: ";
		Escribir "            - Leon";
		Escribir "            - Ana";
		Leer mozo;
		name <- ""; 
		//Transformamos el primer caracter a Mayusculas
		name <- Concatenar(name, Mayusculas(Subcadena(mozo,0,0)));
		i <- 1;
		Mientras i<Longitud(mozo) Hacer
			Si Subcadena(mozo,i,i) <> ' ' Entonces
				name <- Concatenar(name,Subcadena(mozo,i,i));
				i <- i + 1;
			FinSi
		FinMientras
		mozo <- name;
	Hasta Que mozo = "Leon" o mozo = "Ana"
	Mientras i< Longitud(mozo) Hacer
		name<-"";
		//si Subcadena(frase,i,i) <> " " Entonces
		//almacenar la palabra completa dentro de la variable palabra
		Mientras  i<Longitud(mozo) Hacer
			name<-Concatenar(name,Subcadena(mozo,i,i));
			i<-i+1;
		FinMientras
		si name = "Leon" Entonces
			Escribir " Su mozo es Leon";
		SiNo
			si name = "Ana" Entonces
				Escribir "Su mozo es Ana";
				
			FinSi
		FinSi
		Mientras i<Longitud(mozo) Hacer
			i<-i+1;
		FinMientras
	FinMientras
FinSubProceso
SubProceso matriz(tables)
	Definir i,j,cont,cont2,opc,opc1 Como Entero;
	Definir num Como Caracter;
	Dimension num[3,3];
	num[0,0]<-"1";
	num[0,1]<-"2";
	num[0,2]<-"3";
	num[1,0]<-"4";
	num[1,1]<-"5";
	num[1,2]<-"6";
	num[2,0]<-"7";
	num[2,1]<-"8";
	num[2,2]<-"9";
	cont <- 0;
	Escribir " ********";
	Para i<-0 Hasta 2 Hacer
		Para j<-0 Hasta 2 Hacer
			Escribir Sin Saltar " ", num[i,j]," ";
		FinPara
		Escribir " ";
	FinPara
	Escribir " ********";
	Repetir 
		Escribir "  Elegir mesa";
		Leer cont;
		Segun cont Hacer
			1:
				num[0,0]<-" ";
			2:
				num[0,1]<-" ";
			3:
				num[0,2]<-" ";
			4:
				num[1,0]<-" ";
			5:
				num[1,1]<-" ";
			6:
				num[1,2]<-" ";
			7:
				num[2,0]<-" ";
			8:
				num[2,1]<-" ";
			9:
				num[2,2]<-" ";
		FinSegun
		tables<- tables-1;
	Hasta Que tables = 0
	Escribir " Mesas Ocupadas";
	
	Escribir " ********";
	Para i<-0 Hasta 2 Hacer
		Para j<-0 Hasta 2 Hacer
			Escribir Sin Saltar " ", num[i,j]," ";
		FinPara
		Escribir " ";
	FinPara
	Escribir " ********";
	//aca se puede elegir si se desocupo una mesa
	Escribir " ¿Se desocuparon mesas?";
	Escribir " 1 = Si";
	Escribir " 2 = No";
	Leer opc1;
	Repetir
		Segun opc1 Hacer
			1:  escribir " Elija la mesa desocupada";
				Leer cont2;
				Segun cont2 Hacer
					1:
						num[0,0]<-"1";
					2:
						num[0,1]<-"2";
					3:
						num[0,2]<-"3";
					4:
						num[1,0]<-"4";
					5:
						num[1,1]<-"5";
					6:
						num[1,2]<-"6";
					7:
						num[2,0]<-"7";
					8:
						num[2,1]<-"8";
					9:
						num[2,2]<-"9";
				FinSegun
				Para i<-0 Hasta 2 Hacer
					Para j<-0 Hasta 2 Hacer
						Escribir Sin Saltar num[i,j]," ";
					FinPara
					Escribir " ";
				FinPara
			De Otro Modo:
				Escribir "";
		FinSegun
	Hasta Que cont = cont
FinSubProceso
//llama al subproceso del calculo de precio de pizza comun
SubProceso precioc <- sumaprecioc(pc)
	Definir precioc Como Real;
	precioc <- pc*400;
FinSubProceso
// costo 
SubProceso precioc <- sumapreciocAlCosto(cierrepc)
	Definir precioc Como Real;
	precioc <- cierrepc*150;
FinSubProceso
//subproceso del calculo de precio de pizza jamon
SubProceso precioj <- sumaprecioj(pj)
	Definir precioj Como Real;
	precioj <- pj*600;
FinSubProceso

SubProceso preciojAlcosto <- sumapreciojAlcosto(cierrepj)
	Definir preciojAlcosto Como Real;
	preciojAlcosto <- cierrepj*200;
FinSubProceso
// subproceso del calculo de precio de pizza fugaceta
SubProceso preciof <- sumapreciof(pf)
	Definir preciof Como Real;
	preciof <- pf*500;
FinSubProceso
SubProceso preciof <- sumapreciofAlCosto(cierrepf)
	Definir preciof Como Real;
	preciof <- cierrepf*250;
FinSubProceso

//llama al subproceso del calculo de precio de agua mineral
SubProceso precioc <- sumaprecioA(aguaMineral)
	Definir precioc Como Real;
	precioc <- aguaMineral*400;
FinSubProceso
SubProceso precioc <- sumaprecioAAlCosto(cierreA)
	Definir precioc Como Real;
	precioc <- cierreA*150;
FinSubProceso
//subproceso del calculo de precio de cerveza
SubProceso precioj <- sumaprecioCE(Cerveza)
	Definir precioj Como Real;
	precioj <-Cerveza *600;
FinSubProceso
SubProceso precioj <- sumaprecioCEAlCosto(cierreCE)
	Definir precioj Como Real;
	precioj <-cierreCE *200;
FinSubProceso
// subproceso del calculo de precio de  Gaseosa
SubProceso preciof <- sumaprecioG(Gaseosa)
	Definir preciof Como Real;
	preciof <- Gaseosa*500;
FinSubProceso
SubProceso preciof <- sumaprecioGAlCosto(cierreG)
	Definir preciof Como Real;
	preciof <- cierreG*250;
FinSubProceso
	