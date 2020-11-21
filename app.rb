require 'sinatra'
require 'tablero.rb'
require 'jugador.rb'

tablero_juego=Tablero.new

get '/' do
    erb :pantallainicio
end

post '/escogerNivel' do

    erb :escogerNivel
end

post '/formato' do
    jugador=Jugador.new
    @JugadorX=jugador.nombre
    erb:condicion
end

get '/juego' do
    
    @nombre_usuario=params[:Usuario]
    #tablero_juego.generar_tablero_numerico()
    tablero_juego.generar_tablero_con_celda_nivel_basico()
    tablero_juego.generar_tablero_con_minas_con_celda()
    @mostrar_tablero=tablero_juego.tablero
    
    erb :tablero
end

post '/obteneryandx' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_celda(x,y)
    # if(verificar_caracter==false)    
    @mostrar_tablero=tablero_juego.tablero
    erb :tablero 
    # else
    # erb :fin_juego(nombre_j,tiempo) 
end

post '/disminuir_contador_bandera' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_bandera(x,y)
    tablero_juego.disminuir_cantidad_banderas_en_uno()
    @mostrar_tablero=tablero_juego.tablero
    erb :tablero
  end