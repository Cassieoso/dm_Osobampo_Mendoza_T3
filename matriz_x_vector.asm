.data 
		vector: .word 1 2 3 4  
		row_0: .word 1 2 3 4  
		row_1: .word 5 6 7 8 
		row_2: .word 9 10 11 12 
		row_3: .word 13 14 15 16
		result: .word 0     
.text
		main:
		#Direcciones
		auipc s0, 64528 #Direccion Vector
		auipc s1, 64528
		addi s1, s1, 12 #Direccion row_0
		auipc s2, 64528
		addi s2, s2, 20 #Direccion row_1
		auipc s3, 64528
		addi s3, s3, 28 #Direccion row_2
		auipc s4, 64528
		addi s4, s4, 36 #Direccion row_3
		auipc s5, 64528
		addi s5, s5, 44 #Direccion vector result
		
		#Valores de matriz y vectores
		addi t0, zero, 0 #Temporal para guardar el resultado de slti
		addi t2, zero, 0 #Temporal donde guardamos valores de row_0
		addi t3, zero, 0 #Temporal donde guardamos valores de row_1
		addi t4, zero, 0 #Temporal donde guardamos valores de row_2
		addi t5, zero, 0 #Temporal donde guardamos valores de row_3
		addi t6, zero, 0 #Temporal donde guardamos valores de vector
		addi s8, zero, 0 #Temporal donde guardamos valores de vector resultado
		
		#Temporales para iteraciones
		addi s6, zero, 0 #Temporal i para iterar vector
		addi s10, zero, 0 #Temporal para iterar la matriz
		addi s11, zero, 0 #Temporal para iterar resultado
		addi a0, zero, 0 #Resultado de shift left para matriz
		addi a1, zero, 0 #Variable utilizada para shift left de resultado
		addi t1, zero, 0 #Variable temporal 1 usada para sll de vector
		
	while:
	if:
		slti t0, s6, 4 #Es menor a 4?
		beq t0, zero, else #Si no, ve a else
		slli t1, s6, 2 #Shift left para apuntar al siguiente espacio de memoria del vector
		slli a0, s10, 2 #Shift left para apuntar al siguiente espacio de memoria de la matriz
		add t2, a0, s1 #Direccion del siguiente espacio de la matriz empezando por row_0
		lw t2, 0(t2) #Valor que hay guardado en ese espacio del row_x
		add  t6, t1, s0 #Direccion del siguiente espacio del vector
		lw t6, 0(t6) #Valor que hay guardado en ese espacio del vector
		add s8, s5, a1 #Direccion donde guardaremos el resultado en el vector resultado
		lw s9, 0(s8) #Valor que hay guardado en ese espacio de resultado
		mul s7, t2, t6 #Multiplicacion matriz por vector
		add s9, s9, s7 #Va sumando resultados
		sw s9, 0(s8) #Lo guarda en resultado
		addi s6, s6, 1 #Aumenta contadores
		addi s10, s10, 1
		jal while
	else:
		addi s11, s11, 1 #Aumenta contador para iterar resultado
		slt s6, s6, zero #Reinicia el contador para iterar el vector de nuevo
		slli a1, s11, 2 #Shift left para ir al siguiente valor de resultado
		slti t0, s11, 4 #Lo hara 4 veces
		beq t0, zero, exit #Termina
		jal while
	exit: