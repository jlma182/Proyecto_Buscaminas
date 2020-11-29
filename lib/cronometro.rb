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
            else
                if(d==10)
                    u=0
                    d=0
                    c=c+1
                else
                    if(c==10)
                        u=9
                        d=9
                        c=9
        
                    end
                end
            end
            i=i+1
        end
    end
end