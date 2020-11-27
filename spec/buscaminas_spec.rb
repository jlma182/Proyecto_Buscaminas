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

    it "cambiar el estado de la variable estado_bandera " do
       
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.cambiar_estado_bandera(1,0)
        expect(@tablero.getTablero_x_y(1,0).getEstado_bandera()).to be true
    end
    it "Cuando creo tablero nivel basico deberia tener 10 banderas" do
        @tablero.generar_tablero_con_celda_nivel_basico()#arrange
        expect(@tablero.getCantidad_banderas()).to be 10 # assert 
    end

    it "Crear aumento y disminucion de la variable cantidad_banderas" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.setCantidad_banderas(10)
        @tablero.disminuir_cantidad_banderas_en_uno()
        expect(@tablero.getCantidad_banderas()).to be 9
        @tablero.aumentar_cantidad_banderas_en_uno()
        expect(@tablero.getCantidad_banderas()).to be 10
    end
    it "cambiar estado bandera a origen" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be false
        @tablero.cambiar_estado_bandera(2,4)
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be true
        @tablero.cambiar_estado_bandera_a_origen(2,4)
        expect(@tablero.getTablero_x_y(2,4).getEstado_bandera()).to be false
    end
    it "Mostrar y cambiar valores de la clase cronometro" do
        expect(@cronometro.getTiempo()).to eq "000"
        @cronometro.setTiempo(0.to_s+1.to_s+1.to_s)
        expect(@cronometro.getTiempo()).to eq "011"
    end
    #it "Inicar cronometro con limite 111" do 
     #   estado=false
      #  @cronometro.cronometro()
       # @cronometro.setEstado_conometro(estado)
        #expect(@cronometro.cronometro()).to eq "001"
    #end

    #Inicio de la segunda iteracion
    # para que pasese estar pruebas se debe seguir el esquema de generar_tablero_con_minas_con_celda() 
    it "verificar si hay mina lado izquierdo" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "
    end
    it "verificar si hay mina lado derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"

    end
    it "verificar si hay mina lado inferior" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado inferior derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado inferior izquierdo" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado superior" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"
    end
    it "verificar si hay mina lado superior derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq " "

    end  
    it "verificar si hay mina lado superior izquierdo" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"

    end  
    it "verificar si hay mina lado derecho,lado superior izquierdo y superior segun el tablero precargado con posiciones fijas" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_derecho(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "1"
        @tablero.verificar_lado_superior(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "2"
        @tablero.verificar_lado_superior_izquierdo(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "3"
    end
    
    it"Verificar si en la posicion hay mina "do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        expect(@tablero.verificar_mina(2,2)).to eq true
    end
    it "Verificar minas y saber cuantas hay al rededor" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_filas_x_columnas(2,1)
        expect(@tablero.getTablero_x_y(2,1).getCaracter_celda()).to eq "3"

    end
    
    it "nombre jugador vacio" do
        nom=Jugador.new
        expect(nom.getNombre()).to eq " "
    end

    it "nombre jugador" do
        nom=Jugador.new
        nom.setNombre("pepito")
        expect(nom.getNombre()).to eq "pepito"
    end

    it "Creacion de tablero intermedio" do
        @tablero.generar_tablero_con_celda_nivel_intermedio()
        expect(@tablero.getFilas()).to eq 16
        expect(@tablero.getColumnas()).to eq 16
        expect(@tablero.getCantidad_banderas()).to eq 40
        expect(@tablero.getTablero_x_y(0,0).getEstado_bandera()).to eq false
        expect(@tablero.getTablero_x_y(0,0).getEstado_celda()).to eq false
        expect(@tablero.getTablero_x_y(0,0).getCaracter_celda()).to eq " "
    end

    it "Creacion del tablero personalizado" do
    x=4
    y=4
    cantidad_banderas=5
    @tablero.generar_tablero_con_celda_nivel_personalizado(x,y,cantidad_banderas)
    expect(@tablero.getFilas()).to eq 4

    end
end
