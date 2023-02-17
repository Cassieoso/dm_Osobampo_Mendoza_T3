


.data 
		Vector_1: .word 1 2 3 4 5 6 7 8 9
		Vector_2: .word -1 2 -3 4 -5 6 -7 8 -9
		addi s1, zero, 0 #Variable i
		addi s2, zero, 0 #Variable resultado
		addi t0, zero, 0 #Variable temporal 0 usada para el beq
		addi t1, zero, 0 #Variable temporal 1 usada para sll
		addi t2, zero, 0 #Variable temporal para guardar la direccion a la que apuntamos para s3
		addi t3, zero, 0 #Variable temporal para guardar la direccion a la que apuntamos para s4
		addi t4, zero, 0 #Valor del arreglo cuando usamos la direccion a la que apuntamos en s3
		addi t5, zero, 0 #Valor del arreglo cuando usamos la direccion a la que apuntamos en s4
		addi t6, zero, 0 #Resultado de la multiplicacion entre t4 y t5
	
.text
		auipc s3, 64528 #Vector_1
		auipc s4, 64528 #Vector_2
		addi s4, s4, 32
	while:
		slti t0, s1, 9 #Es menor a 9?
		beq t0, zero, exit #Si no, termina
		slli t1, s1, 2 #Shift left para apuntar al siguiente espacio de memoria
		add t2, t1, s3 #Direccion del siguiente espacio del arreglo que necesitamos
		add t3, t1, s4
		lw t4, 0(t2) #Obtiene lo que hay en ese espacio
		lw t5, 0(t3)
		mul t6, t4, t5
		add s2, s2, t6 #Aqui tendremos el resultado final
		addi s1, s1, 1
		jal while
	exit:
		