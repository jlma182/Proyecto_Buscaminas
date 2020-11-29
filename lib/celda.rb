class Celda

    def initialize()
        @caracter_celda=" "
        @estado_celda=false
        @estado_bandera=false
    end
    def getCaracter_celda()
        return @caracter_celda
    end
    def setCaracter_celda(c_c)
        @caracter_celda=c_c
    end
    def getEstado_celda()
        return @estado_celda
    end
    def getEstado_bandera()
        return @estado_bandera
    end
    def setEstado_bandera(estado_bandera)
        @estado_bandera=estado_bandera
    end
    def cambiar_estado_bandera_a_origen(estado_bandera)
        @estado_bandera=estado_bandera
    end
    def setEstado_celda(estado_celda)
        @estado_celda=estado_celda
    end
end