class Cronometro
    def initialize()
        @tiempo="000"
        @estado_cronometro=true
    end
    def getTiempo()
        return @tiempo
    end
    def setTiempo(t)
        @tiempo=t
    end
    def setEstado_conometro(estado)
        @estado_cronometro=estado
    end

    def cronometro()
        i=0
        u=0
        d=0
        c=0
        while i< 10 do 
            if estado_cronometro
                u=u+1
                if(d==10)
                    d=d+1
                else
                
                end
            else
                
            end
            i=i+1
        end
    end
end