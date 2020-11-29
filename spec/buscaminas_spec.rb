require "tablero"
require "celda"
require "jugador"
require "cronometro"

RSpec.describe Tablero do
    before {@tablero = Tablero.new()
            @celda=Celda.new
            @cronometro=Cronometro.new}

    it "Cuando creo el tablero deberia poder mandar y obtener
     valores de filas y columna" do

        @tablero.setFilas(8)
        @tablero.setColumnas(8)
        expect(@tablero.getFilas()).to eq 8
        expect(@tablero.getColumnas()).to eq 8        
    end

    it "Una celda deberia tener un estado y un caracter para comenzar" do
        expect(@celda.getCaracter_celda()).to eq ' '
        expect(@celda.getEstado_celda()).to be false
    end

    it "Al crear tablero del nivel basico y elegir una posicion se deberia mostrar espacio en blanco"do
        @tablero.generar_tablero_con_celda(8,8,10)
        expect(@tablero.getTablero_x_y(0,0).getCaracter_celda()).to eq ' '
    end
    
    it "Al asignar la minas definidas al tablero y escoger una de esas posiciones daria como resultado una mina "do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        expect(@tablero.getTablero_x_y(1,1).getCaracter_celda()).to eq '#'
    end

    it "Luego al querer cambiar el estado de una bandera" do#ojo
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.cambiar_estado_bandera(1,0)
        expect(@tablero.getTablero_x_y(1,0).getEstado_bandera()).to be true
    end
    it "Cuando creo tablero nivel basico deberia tener 10 banderas, 8 filas y 8 columnas" do#ojo
        @tablero.generar_tablero_con_celda(8,8,10)#arrange
        expect(@tablero.getCantidad_banderas()).to be 10 # assert
        expect(@tablero.getFilas()).to be 8
        expect(@tablero.getColumnas()).to be 8 
    end

    it "Cuando se pone una mina deberia disminuir su valor en uno" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.disminuir_cantidad_banderas_en_uno()
        expect(@tablero.getCantidad_banderas()).to be 9
    end
    it "Luego si se quita una bandera en el tablero deberia aumentar el valor en uno" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.disminuir_cantidad_banderas_en_uno()
        @tablero.aumentar_cantidad_banderas_en_uno()
        expect(@tablero.getCantidad_banderas()).to be 10
    end
    it "cambiar estado bandera a origen" do # ojo
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be false
        @tablero.cambiar_estado_bandera(2,4)
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be true
        @tablero.cambiar_estado_bandera_a_origen(2,4)
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be false
    end
    it "Mostrar y cambiar valores de la clase cronometro" do #ojo
        expect(@cronometro.getTiempo()).to eq "000"
        @cronometro.setTiempo(0.to_s+1.to_s+1.to_s)
        expect(@cronometro.getTiempo()).to eq "011"
    end

    #Inicio de la segunda iteracion
    # para que pasese estar pruebas se debe seguir el esquema de generar_tablero_con_minas_con_celda() 
    
    it "Despues de cargar el tablero con minas definidas al verificar una celda 
        a su lado izquierdo deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "
    end
    it "Al verificar una celda a su lado derecho deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"

    end
    it "Al verificar una celda a su lado interior deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "Al verificar una celda a su lado inferior derecho deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "Al verificar una celda a su lado inferior izquierdo deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "Al verificar una celda a su lado superior deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"
    end
    it "Al verificar una celda a su lado superior derecho deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end  
    it "Al verificar una celda a su lado superior izquierdo deberia aumentar en uno si encuentra una mina" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"

    end  

    it"Cuando se carga un tablero con minas al dar una posicion esta deberia verificar 
        y devolver si esta o no la mina"do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        expect(@tablero.verificar_mina(2,2)).to eq true
    end
    it "Al verificar un celda deberia verificar si hay minas y aumentar en 
        uno cada que encuentre uno el valor de la celda" do
        @tablero.generar_tablero_con_celda(8,8,10)
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_filas_x_columnas(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "3"

    end
    
    it "nombre jugador vacio" do#ojo
        nom=Jugador.new
        expect(nom.getNombre()).to eq " "
    end

    it "nombre jugador" do#ojo
        nom=Jugador.new
        nom.setNombre("pepito")
        expect(nom.getNombre()).to eq "pepito"
    end

    it "Cuando creamos un tablero intermedio este deberia tener 16 filas, 16 columnas y 40 banderas por defecto" do
        @tablero.generar_tablero_con_celda(16,16,40)
        expect(@tablero.getFilas()).to eq 16
        expect(@tablero.getColumnas()).to eq 16
        expect(@tablero.getCantidad_banderas()).to eq 40
    end
    it "Luego cada casilla deberia estar correctamente inicializado con los valores dados" do
        @tablero.generar_tablero_con_celda(16,16,40)
        expect(@tablero.getTablero_x_y(0,0).getEstado_bandera()).to eq false
        expect(@tablero.getTablero_x_y(0,0).getEstado_celda()).to eq false
        expect(@tablero.getTablero_x_y(0,0).getCaracter_celda()).to eq " "
    end
    it "Al ingresar la cantidad de filas y columnas y banderas deseadas por el jugador 
        el tablero deberia tener los valores introducidos por el jugador" do
        x=4
        y=4
        cantidad_banderas=5
        @tablero.generar_tablero_con_celda(x,y,cantidad_banderas)
        expect(@tablero.getFilas()).to eq 4
    end
end
