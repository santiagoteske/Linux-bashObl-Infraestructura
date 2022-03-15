# Autores: Alejandro Durán - 176652 - Santiago Teske - 188160 -
#!/bin/bash

menuPrincipal(){
echo -e "\e[33m 1) Probar Fortaleza.(Prueba la fortaleza de una contraseña) \e[0m"
echo -e "\e[33m 2) Obtener las palabras que finalizan con la letra 'a'\e[0m"
echo -e "\e[33m 3) Guardar informe\e[0m"
echo -e "\e[33m 4) Salir\e[0m"
}

OPCION=0
while [ $OPCION -eq 0 ]; do
menuPrincipal
read menuvalor
if [ $menuvalor = 1 ]; then
        echo -e "\e[32m Ingrese password: \e[0m"
        read string
        check=${#string}
        if [ $check -ge 3 ]; then 		
		if [[ $string =~ [0-9]  ]]; then			
                        string=${string//[0-9]/} #Le quita los numeros al string
                        if grep -Fxq -i "$string" ./diccionario.txt ;then #Si la palabra se encuentra en diccionario
                        echo -e "\e[31m \n NO ES UNA OPCIÓN VÁLIDA\e[1;31m\e[0m\e[1;31m, la palabra \e[0m\e[31m$string\e[1;31m se encuentra en el diccionario.\n \e[0m"
                        else
                        echo -e "\e[32m \n Contraseña \e[1;32m fuerte. \n \e[0m"                        
                        fi	
		else echo -e "\e[31m \n NO ES UNA OPCIÓN VÁLIDA,\e[1;31m\e[0m\e[1;31m debe contener números \n \e[0m"
		fi	
	else echo -e "\e[31m \n NO ES UNA OPCIÓN VÁLIDA\e[1;31m\e[0m\e[1;31m, la contraseña es demasiado corta \n \e[0m"	
	fi
elif [ $menuvalor = 2 ]; then
        echo -e "\e[32m Palabras que terminan con a: \n \e[0m"
        cat ./diccionario.txt | grep -E '\a$'
elif [ $menuvalor = 3 ]; then
        if test -d ./informes ; then #Si la carpeta informes fue creada previamente elimina el txt existente
                rm ./informes/letras_a.txt               
                date +"%d / %B / %Y / %r " >> ./informes/letras_a.txt
                cat ./diccionario.txt | grep -E '\a$' >> ./informes/letras_a.txt 
        else 
                mkdir -m 777 informes #Si no existe la carpeta informes, la crea
                date +"%d / %B / %Y / %r " >> ./informes/letras_a.txt
                cat ./diccionario.txt | grep -E '\a$' >> ./informes/letras_a.txt                
        fi
        echo -e "\e[32m Informe generado con exito. \n \e[0m"
elif [ $menuvalor = 4 ]; then exit
fi
done