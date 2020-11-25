require "tablero"
require "celda"
require "jugador"
require "cronometro"

RSpec.describe Tablero do
    before {@tablero = Tablero.new()
            @celda=Celda.new
            @cronometro=Cronometro.new}

    it "establecer tablero 8*8" do

        @tablero.filas=8
        @tablero.columnas=8

        expect(@tablero.filas).to eq 8
        expect(@tablero.columnas).to eq 8        
    end
    
    it "Generar tablero 8*8" do

        @tablero.filas=8
        @tablero.columnas=8
        @tablero.generar_tablero_numerico()
        expect(@tablero.tablero)
        
    end

    it "Deberia crear y mostrar mina" do
        expect(@tablero.generar_mina()).to eq '#'    
    end
    
    it "Genera tablero numerico con minas" do
       
        @tablero.filas=8
        @tablero.columnas=8
        @tablero.generar_tablero_numerico()
        @tablero.generar_tablero_con_minas()
        expect(@tablero.tablero[6][7]).to eq 0

    end

    it "Crear clase celda y verificar los atributos" do
        expect(@celda.getCaracter_celda()).to eq ' '
        expect(@celda.getEstado_celda()).to be false
    end

    it "Vericar el atributo estado de celda y cambiar dicho estado del atributo" do
        expect(@celda.getEstado_celda()).to be false
        @celda.cambiar_estado_celda()
        expect(@celda.getEstado_celda()).to be true
    end

    it "Crear tablero con clase celda "do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.tablero[0][0].getCaracter_celda()).to eq ' '
    end
    
    it "Cargar minas en tablero con clase celda"do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        expect(@tablero.tablero[1][1].getCaracter_celda()).to eq '#'
    end

    it "Crear usuario verificado" do
        @jugador=Jugador.new
        @jugador.setNombre("Jugador_1")
        expect(@jugador.getNombre()).to eq "Jugador_1"
    end
    it "Crear usuario verificado" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.cambiar_estado_celda(1,0)
        expect(@tablero.tablero[1][0].getEstado_celda()).to be true
    end
    it "Crear bandera" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.tablero[1][0].getEstado_bandera()).to be false
    end
    it "cambiar el estado de la variable estado_bandera " do
       
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.cambiar_estado_bandera(1,0)
        expect(@tablero.tablero[1][0].getEstado_bandera()).to be true
    end
    it "Verificar cantidad disponibles y crear banderas"do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.cantidad_banderas).to be 10
        expect(@tablero.generar_bandera()).to eq 'B'
    end
    it "Crear aumento y disminucion de la variable cantidad_banderas" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.disminuir_cantidad_banderas_en_uno()
        expect(@tablero.cantidad_banderas).to be 9
        @tablero.aumentar_cantidad_banderas_en_uno()
        expect(@tablero.cantidad_banderas).to be 10
    end
    it "cambiar estado bandera a origen" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.tablero[2][4].getEstado_bandera()).to be false
        @tablero.cambiar_estado_bandera(2,4)
        expect(@tablero.tablero[2][4].getEstado_bandera()).to be true
        @tablero.cambiar_estado_bandera_a_origen(2,4)
        expect(@tablero.tablero[2][4].getEstado_bandera()).to be false
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
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq " "
    end
    it "verificar si hay mina lado derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_derecho(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "1"

    end
    it "verificar si hay mina lado inferior" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado inferior derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_derecho(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado inferior izquierdo" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_inferior_izquierdo(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq " "

    end
    it "verificar si hay mina lado superior" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "1"
    end
    it "verificar si hay mina lado superior derecho" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_derecho(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq " "

    end  
    it "verificar si hay mina lado superior izquierdo" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_superior_izquierdo(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "1"

    end  
    it "verificar si hay mina lado derecho,lado superior izquierdo y superior segun el tablero precargado con posiciones fijas" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        @tablero.verificar_lado_derecho(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "1"
        @tablero.verificar_lado_superior(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "2"
        @tablero.verificar_lado_superior_izquierdo(2,1)
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "3"
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
        expect(@tablero.tablero[2][1].getCaracter_celda()).to eq "3"

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
end
