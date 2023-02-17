



.text
		addi s0, zero, 6 #Variable m
		addi s1, zero, 6 #Variable n
		addi s3, zero, 0 #Variable potencia
		addi t1, zero, 1 #Temporal para hacer calculos
	
	if:
		bne s1, zero, else
		addi t0, t0, 1
		jal exit
	else:
		mul t1, t1, s0
		addi s4, s4, 1
		bne s0, s4, else
		beq s0, s4, exit
	exit:
		add s3, s3, t1
		