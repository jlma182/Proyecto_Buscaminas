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
        @tablero[0][0].caracter_celda=generar_mina()
        @tablero[0][1].caracter_celda="2"
        @tablero[0][2].caracter_celda="0"
        @tablero[1][0].caracter_celda="2"
        @tablero[1][1].caracter_celda="#"
        @tablero[2][2].caracter_celda="#"
        @tablero[3][3].caracter_celda="#"
        @tablero[4][4].caracter_celda="#"
        @tablero[7][7].caracter_celda="#"
        @tablero[5][3].caracter_celda="#"
        @tablero[2][1].caracter_celda="#"
        @tablero[3][4].caracter_celda="#"
        @tablero[1][7].caracter_celda="#"
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
end