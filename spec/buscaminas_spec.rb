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
        expect(@celda.caracter_celda).to eq ' '
        expect(@celda.estado_celda).to be false
    end

    it "Vericar el atributo estado de celda y cambiar dicho estado del atributo" do
        expect(@celda.estado_celda).to be false
        @celda.cambiar_estado_celda()
        expect(@celda.estado_celda).to be true
    end

    it "Crear tablero con clase celda "do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.tablero[0][0].caracter_celda).to eq ' '
    end
    
    it "Cargar minas en tablero con clase celda"do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.generar_tablero_con_minas_con_celda()
        expect(@tablero.tablero[1][1].caracter_celda).to eq '#'
    end

    it "Crear usuario verificado" do
        @jugador=Jugador.new
        expect(@jugador.nombre).to eq "Jugador_1"
    end
    it "Crear usuario verificado" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.cambiar_estado_celda(1,0)
        expect(@tablero.tablero[1][0].estado_celda).to be true
    end
    it "Crear bandera" do
        @tablero.generar_tablero_con_celda_nivel_basico()
        expect(@tablero.tablero[1][0].estado_bandera).to be false
    end
    it "cambiar el estado de la variable estado_bandera " do
       
        @tablero.generar_tablero_con_celda_nivel_basico()
        @tablero.cambiar_estado_bandera(1,0)
        expect(@tablero.tablero[1][0].estado_bandera).to be true
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
        expect(@tablero.tablero[2][4].estado_bandera).to be false
        @tablero.cambiar_estado_bandera(2,4)
        expect(@tablero.tablero[2][4].estado_bandera).to be true
        @tablero.cambiar_estado_bandera_a_origen(2,4)
        expect(@tablero.tablero[2][4].estado_bandera).to be false
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

end
