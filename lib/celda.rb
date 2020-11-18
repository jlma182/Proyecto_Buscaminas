class Celda

    def initialize()
        @caracter_celda=" "
        @estado_celda=false
        @estado_bandera=false
    end
    def caracter_celda
        @caracter_celda
    end
    def caracter_celda=(c_c)
        @caracter_celda=c_c
    end
    def estado_celda
        @estado_celda
    end
    def estado_bandera
        @estado_bandera
    end
    def cambiar_estado_bandera()
        @estado_bandera=true
    end
    def cambiar_estado_bandera_a_origen()
        @estado_bandera=false
    end
    def cambiar_estado_celda()
        @estado_celda=true
    end
    
end