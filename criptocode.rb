class Criptocode

    def encriptar
        puts "Que tal, qué mensaje quieres encriptar?"
        cadena = gets.chomp
    
        cadena_llave = []
        cadena.each_byte do |letra|
            cadena_llave.push encriptar_letra(letra)
        end
    end    
    
    def encriptar_letra(letra)
        letra_binario = letra.to_s(2)
        cadena_modificada = {}
        puts letra_binario
        letra_binario.each_byte do |bite|
            rand = Random.rand(11)
            while (cadena_modificada.key?(rand)) do
                rand = rand + 1
            end
            cadena_modificada[rand] = (bite+rand)
        end
        return cadena_modificada
    end
end

encript = Criptocode.new
encript.encriptar