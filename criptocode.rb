class Criptocode

    def encriptar
        puts "Que tal, qué mensaje quieres encriptar?"
        cadena = gets.chomp
    
        cadena_llave = []
        cadena.each_byte do |letra|
            cadena_llave.push encriptar_letra(letra)
        end
        puts "tu mensaje encriptado es: #{cadena_llave}"
        mensajeDescifrado = desencriptar(cadena_llave)
        puts "tu mensaje desencriptado es: #{mensajeDescifrado}"
    end    
    
    def encriptar_letra(letra)
        letra_binario = letra.to_s(2)
        cadena_modificada = {}
        letra_binario.each_byte do |bite|
            rand = Random.rand(11)
            while (cadena_modificada.key?(rand)) do
                rand = rand + 1
            end
            cadena_modificada[rand] = (bite+rand)
        end
        return cadena_modificada
    end

    def desencriptar(cadena)
        mensaje = ""
        cadena.each do |linea|
            letraBin = ""
            linea.each do |key,value|
                letraBin << value-key
            end
            mensaje << letraBin.to_i(2).chr
        end
        return mensaje
    end

end

encript = Criptocode.new
encript.encriptar