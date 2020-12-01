require './lib/celda'
class Tablero
    
    attr_accessor :filas, :columnas, :tablero, :cantidad_banderas, :total_casillas_descubiertas, :cantidad_minas
    def getTotal_casillas_descubiertas()
        return @total_casillas_descubiertas
    end
    def setTotal_casillas_descubiertas(total_casillas_descubiertas)
        self.total_casillas_descubiertas=total_casillas_descubiertas
    end
    def getFilas()
        return filas
    end
    def setFilas(fila)
        @filas=fila
    end
    def getColumnas()
        return @columnas
    end
    def setColumnas(columna)
        @columnas=columna
    end
    def getTablero()
        return @tablero
    end
    def getTablero_x_y(x,y)
        return @tablero[x][y]
    end
    def setTablero(tablero)
        self.tablero=tablero
    end
    def setTablero_x_y()
        self.tablero=tablero
    end
    def getCantidad_banderas()
        return @cantidad_banderas
    end
    def setCantidad_banderas(cantidad_bandera)
        @cantidad_banderas=cantidad_bandera
    end 
    def getCantidad_minas()
        return @cantidad_banderas
    end
    def setCantidad_minas(cantidad_mina)
        @cantidad_minas=cantidad_mina
    end 
    def generar_tablero_con_celda(x,y,cantidad_bandera,cantidad_mina)  
        @total_casillas_descubiertas=0
        @cantidad_banderas=cantidad_bandera
        @cantidad_minas=cantidad_mina
        @filas=x
        @columnas=y
        @tablero= Array.new(filas) { Array.new(columnas) {celda=Celda.new}}
    end
    def generar_tablero_con_minas_con_celda()   
        @tablero[0][0].setCaracter_celda("#")
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
        @tablero[posicion_x][posicion_y].setEstado_celda(true)
    end

    def cambiar_estado_bandera(posicion_x,posicion_y) 
        @tablero[posicion_x][posicion_y].setEstado_bandera(true)
    end
    def cambiar_estado_bandera_a_origen(posicion_x,posicion_y) 
        @tablero[posicion_x][posicion_y].setEstado_bandera(false)
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
        return x>=0 && x<@filas && y>=0 && y<@columnas
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
    def insert_minas_aleatoreamente()
        i=0
        c=@cantidad_minas
        while i<c
                x=aleatorio_por_filas()
                y=aleatorio_por_columnas()
                if verificar_mina(x,y)
                        c=c+1
                else
                        @tablero[x][y].setCaracter_celda("#")
                end
                i+=1
        end
        
    end
    def verificar_mina(x,y)
        return  @tablero[x][y].getCaracter_celda()=="#"
    end
    
    def aumentar_total_casillas_descubiertas_en_uno()
        @total_casillas_descubiertas=@total_casillas_descubiertas+1
    end
    def tablero_descubierto_sin_minas()
        return @total_casillas_descubiertas==((@filas*@columnas)-@cantidad_minas)
    end
end