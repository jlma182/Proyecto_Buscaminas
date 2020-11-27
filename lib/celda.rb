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
    def cambiar_estado_bandera()
        @estado_bandera=true
    end
    def cambiar_estado_bandera_a_origen()
        @estado_bandera=false
    end
    def setEstado_celda(estado_celda)
        @estado_celda=estado_celda
    end
    

    # def caracter_celda
    #     @caracter_celda
    # end
    # def caracter_celda=(c_c)
    #     @caracter_celda=c_c
    # end
    # def estado_celda
    #     @estado_celda
    # end
    # def estado_bandera
    #     @estado_bandera
    # end
    # def cambiar_estado_bandera()
    #     @estado_bandera=true
    # end
    # def cambiar_estado_bandera_a_origen()
    #     @estado_bandera=false
    # end
    # def cambiar_estado_celda()
    #     @estado_celda=true
    # end
end