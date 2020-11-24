require './lib/celda'
class Tablero
    
    attr_accessor :filas, :columnas, :tablero, :cantidad_banderas

    def generar_tablero_numerico()
        #columnas = Array.new(@columnas)
        #@tablero =Array.new(@filas){|i| columnas}
        @tablero= Array.new(filas) { Array.new(columnas) {0} }
    end 

    def generar_tablero_con_celda_nivel_basico()
        @cantidad_banderas=10
        @filas=8
        @columnas=8
        @tablero= Array.new(filas) { Array.new(columnas) {celda=Celda.new} }
    end 

    def generar_mina()
        return '#'
    end

    def generar_bandera()
        return'B'
    end
    def generar_tablero_con_minas()   
        @tablero[0][0]=generar_mina()
        @tablero[0][1]="2"
        @tablero[0][2]="0"
        @tablero[1][0]="2"
        @tablero[1][1]="#"
        @tablero[2][2]="#"
        @tablero[3][3]="#"
        @tablero[4][4]="#"
        @tablero[7][7]="#"
        @tablero[5][3]="#"
        @tablero[2][1]="#"
        @tablero[3][4]="#"
        @tablero[1][7]="#"
    end
    def generar_tablero_con_minas_con_celda()   
        @tablero[0][0].setCaracter_celda(generar_mina())
        @tablero[0][1].setCaracter_celda("#")
        @tablero[0][2].setCaracter_celda("#")
        @tablero[1][0].setCaracter_celda("#")
        @tablero[1][1].setCaracter_celda("#")
        @tablero[2][2].setCaracter_celda("#")
        @tablero[3][3].setCaracter_celda("#")
        @tablero[4][4].setCaracter_celda("#")
        @tablero[7][7].setCaracter_celda("#")
        @tablero[5][3].setCaracter_celda("#")
        @tablero[2][5].setCaracter_celda("#")
        @tablero[3][4].setCaracter_celda("#")
        @tablero[1][7].setCaracter_celda("#")
    end

    def cambiar_estado_celda(posicion_x,posicion_y) 
        @tablero[posicion_x][posicion_y].cambiar_estado_celda()
    end

    def cambiar_estado_bandera(posicion_x,posicion_y) 
        @tablero[posicion_x][posicion_y].cambiar_estado_bandera()
    end
    def cambiar_estado_bandera_a_origen(posicion_x,posicion_y) 
        @tablero[posicion_x][posicion_y].cambiar_estado_bandera_a_origen()
    end
    def disminuir_cantidad_banderas_en_uno()
        if(@cantidad_banderas>0 && @cantidad_banderas<=10)
            @cantidad_banderas=@cantidad_banderas-1
        end
    end
    def aumentar_cantidad_banderas_en_uno()
        if(@cantidad_banderas>0 && @cantidad_banderas<=10)
            @cantidad_banderas=@cantidad_banderas+1
        end
    end
    #Segunda iteración
    def verificar_lado_derecho(x,y)
        if verificar_dentro_rango(x,y+1)          
            if @tablero[x][y+1].getCaracter_celda()=="#"
                verificar_contenido(x,y)
            end
        end
    end
    def verificar_lado_inferior(x,y)
        if verificar_dentro_rango(x+1,y)     
            if @tablero[x+1][y].getCaracter_celda()=="#"
                verificar_contenido(x,y)
            end
        end
    end
    def verificar_lado_izquierdo(x,y)
        if verificar_dentro_rango(x,y-1)     
                if @tablero[x][y-1].getCaracter_celda()=="#"
                    verificar_contenido(x,y)
                end
        end
    end
    def verificar_lado_superior(x,y)
        if verificar_dentro_rango(x-1,y)   
            if @tablero[x-1][y].getCaracter_celda()=="#"
                verificar_contenido(x,y)
            end
        end
    end
    def verificar_lado_superior_derecho(x,y)
        if verificar_dentro_rango(x-1,y+1)   
                if @tablero[x-1][y+1].getCaracter_celda()=="#"
                    verificar_contenido(x,y)
                end
        end
    end
    def verificar_lado_superior_izquierdo(x,y)
        if verificar_dentro_rango(x-1,y-1)   
            if @tablero[x-1][y-1].getCaracter_celda()=="#" 
                verificar_contenido(x,y)
            end
        end
    end
    def verificar_lado_inferior_derecho(x,y)
        if verificar_dentro_rango(x+1,y+1)     
                if @tablero[x+1][y+1].getCaracter_celda()=="#"
                    verificar_contenido(x,y)
                end
        end
    end
    def verificar_lado_inferior_izquierdo(x,y)
        if verificar_dentro_rango(x+1,y-1)     
                if @tablero[x+1][y-1].getCaracter_celda()=="#"
                    verificar_contenido(x,y)
                end
        end
    end

    def verificar_dentro_rango(x,y)
        return x>=0 && x<@columnas && y>=0 && y<@filas
    end 
    def verificar_contenido(x,y)
        if @tablero[x][y].getCaracter_celda()!="#" #&& @tablero[x][y].caracter_celda!="B"
            a=@tablero[x][y].getCaracter_celda().to_i+1
            @tablero[x][y].setCaracter_celda(a.to_s )
        end
    end 
    def verificar_filas_x_columnas(x,y)
        verificar_lado_superior_izquierdo(x,y)
        verificar_lado_superior(x,y)
        verificar_lado_superior_derecho(x,y)
        verificar_lado_izquierdo(x,y)
        verificar_lado_derecho(x,y)
        verificar_lado_inferior_izquierdo(x,y)
        verificar_lado_inferior(x,y)
        verificar_lado_inferior_derecho(x,y)
    end  
    
    def precargar_numeros()
        i=0
        j=0
        while i<filas do
            while j <columnas do
                # puts(i.to_s+"-"+j.to_s)
                verificar_filas_x_columnas(i,j)
                j+=1
            end
            j=0
            i+=1
        end
    end

    def aleatorio_por_filas()
        return rand(@filas)
    end
    def aleatorio_por_columnas()
        return rand(@columnas)
    end
    def insert_minas_aleatoreamente(cant_minas)
        i=0
        c=cant_minas
        while i<c
                x=aleatorio_por_filas()
                y=aleatorio_por_columnas()
                if verificar_mina(x,y)
                        c=c+1
                else
                        @tablero[x][y].setCaracter_celda(generar_mina())
                end
                i+=1
        end
        
    end
    def verificar_mina(x,y)
        return  @tablero[x][y].getCaracter_celda()=="#"
    end
    
end