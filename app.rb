require 'sinatra'
require './lib/tablero'
require './lib/jugador'

tablero_juego=Tablero.new
jugador=Jugador.new
get '/' do
    erb :pantallainicio
end

post '/escogerNivel' do

    erb :escogerNivel
end

post '/formato' do
    # @JugadorX=jugador.getNombre()
    # erb:condicion
    jugador=Jugador.new
    # @juga1=jugador.setNombre((params[:nombre]))
    # @juga2=params[:nombre]
    erb:condicion
end
post '/formato2' do
    # @JugadorX=jugador.getNombre()
    # erb:condicion
    jugador=Jugador.new
    # @juga1=jugador.setNombre((params[:nombre]))
    # @juga2=params[:nombre]
    erb:condicion2
end
post '/formatoP' do
    # @JugadorX=jugador.getNombre()
    # erb:condicion
    jugador=Jugador.new
    # @juga1=jugador.setNombre((params[:nombre]))
    # @juga2=params[:nombre]
    erb:condicionP
end
get '/juego' do
    
    @nombre_usuario=params[:nombre]
    #jugador.setNombre(@nombre_usuario)
    #tablero_juego.generar_tablero_numerico()
    tablero_juego.generar_tablero_con_celda_nivel_basico()
    #tablero_juego.generar_tablero_con_minas_con_celda()
    tablero_juego.insert_minas_aleatoreamente(10)
    tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    
    erb :tablero
end

post '/obteneryandx' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_celda(x-1,y-1)
    #tablero_juego.verificar_filas_x_columnas(x,y)
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
    tablero_juego.cambiar_estado_bandera(x-1,y-1)
    tablero_juego.disminuir_cantidad_banderas_en_uno()
    @mostrar_tablero=tablero_juego.tablero
    erb :tablero
end

get '/formato2juego' do
    @nombre_usuario=params[:nombre]
    tablero_juego.generar_tablero_con_celda_nivel_intermedio()
    tablero_juego.insert_minas_aleatoreamente(40)
    tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    
    erb :tablero
end

post '/formatoPjuego' do
    @nombre_usuario=params[:nombre]
    @filas=params[:fila]
    @columnas=params[:columna]
    @minas=params[:mina]
    @banderas=params[:bandera]
    #tablero_juego.generar_tablero_con_celda_nivel_intermedio()
    #tablero_juego.insert_minas_aleatoreamente(40)
    #tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    
    erb :tablero
end