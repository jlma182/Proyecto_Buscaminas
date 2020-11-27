class Jugador
    attr_accessor :nombre

    def initialize
        @nombre=" "
    end
    def getNombre()
        return @nombre
    end
    def setNombre(nombre)
        self.nombre=nombre
    end
end