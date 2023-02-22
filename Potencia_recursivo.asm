



.text
	main:
		addi a1, zero, 6 #Variable m
		addi a2, zero, 6 #Variable n
		addi a0, zero, 0 #Variable potencia
		jal potencia
		jal exit
	potencia:
		slti t0, a2, 1 #Es n menor a 1?
		beq t0, zero, loop #Si no es menor a 1, ve a loop
		addi a0, zero, 1 #Si si es menor a 1, asignar 1 a la variable potencia
		jr ra #Regresa adonde te encontrabas
	loop:
		addi sp, sp, -4 #Decrementar el stack pointer para guardar los nuevos datos
		sw ra, 0(sp) #Guarda la direccion de retorno de este momento en el stack pointer
		addi a2, a2, -1 #Decrementamos n en -1
		jal potencia #Volvemos a potencia para checar si n sigue siendo mayor a 1
		lw ra, 0(sp) #Carga el valor de ra que se tenia en el stack a la variable ra
		addi sp, sp, 4 #Aumentamos el stack pointer para obtener valores pasados
		mul a0, a1, a0 #Multiplicacion de potencia
		jr ra #Retorna a donde indica ra
	exit:
		
		
	

