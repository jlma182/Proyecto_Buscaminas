class Jugador
    attr_accessor :nombre

    def initialize
        @nombre=" "
    end

    def obtener_nombre
        return @nombre
    end

    def ingresar_nombre(n)
        @nombre=n
    end
end