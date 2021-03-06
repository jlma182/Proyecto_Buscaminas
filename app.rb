require 'sinatra'
require './lib/tablero'

tablero_juego=Tablero.new
get '/' do
    erb :pantallainicio
end

post '/escogerNivel' do

    erb :escogerNivel
end

post '/formato' do
    erb:condicion
end
post '/formato2' do
    erb:condicion2
end
post '/formatoP' do
    erb:condicionP
end
get '/juego' do
    
    @nombre_usuario=params[:nombre]
    tablero_juego.generar_tablero_con_celda(8,8,10,10)
    tablero_juego.insert_minas_aleatoreamente()
    tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    
    erb :tablero
end
get '/formato2juego' do
    @nombre_usuario=params[:nombre]
    tablero_juego.generar_tablero_con_celda(16,16,40,40)
    tablero_juego.insert_minas_aleatoreamente()
    tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    erb :tablero_intermedio
end

get '/formatoPjuego' do
    @nombre_usuario=params[:nombre]
    filas=params[:fila].to_i
    columnas=params[:columna].to_i
    minas=params[:mina].to_i
    banderas=params[:bandera].to_i
    tablero_juego.generar_tablero_con_celda(filas,columnas,banderas,minas)
    tablero_juego.insert_minas_aleatoreamente()
    tablero_juego.precargar_numeros()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    erb :tablero_personalizado
end
post '/obteneryandx' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    if (!tablero_juego.verificar_mina(x-1,y-1))
        tablero_juego.cambiar_estado_celda(x-1,y-1)
        tablero_juego.aumentar_total_casillas_descubiertas_en_uno()
        @mostrar_tablero=tablero_juego.tablero
        @banderas_disponibles=tablero_juego.getCantidad_banderas()
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        erb :tablero 
        
    else
        @I=x
        @J=y
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        @mostrar_tablero=tablero_juego.getTablero()
        @nombre_usuario
        erb :perdio
    end
end
post '/obteneryandx_I' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    if (!tablero_juego.verificar_mina(x-1,y-1))
        tablero_juego.cambiar_estado_celda(x-1,y-1)
        @mostrar_tablero=tablero_juego.tablero
        @banderas_disponibles=tablero_juego.getCantidad_banderas()
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        erb :tablero_intermedio
    else
        @I=x
        @J=y
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        @mostrar_tablero=tablero_juego.getTablero()
        @nombre_usuario
        erb :perdio
    end
end
post '/obteneryandx_P' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    if (!tablero_juego.verificar_mina(x-1,y-1))
        tablero_juego.cambiar_estado_celda(x-1,y-1)
        tablero_juego.aumentar_total_casillas_descubiertas_en_uno()
        @mostrar_tablero=tablero_juego.tablero
        @banderas_disponibles=tablero_juego.getCantidad_banderas()
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        erb :tablero_personalizado
        
    else
        @I=x
        @J=y
        @X=tablero_juego.getFilas()
        @Y=tablero_juego.getColumnas()
        @mostrar_tablero=tablero_juego.getTablero()
        @nombre_usuario
        erb :perdio
    end
end
post '/disminuir_contador_bandera' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_bandera(x-1,y-1)
    tablero_juego.disminuir_cantidad_banderas_en_uno()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    erb :tablero
end
post '/disminuir_contador_bandera_2' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_bandera(x-1,y-1)
    tablero_juego.disminuir_cantidad_banderas_en_uno()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    erb :tablero_intermedio
end
post '/disminuir_contador_bandera_P' do
    x=params[:X].to_i
    y=params[:Y].to_i
    @nombre_usuario=params[:Usuario]
    tablero_juego.cambiar_estado_bandera(x-1,y-1)
    tablero_juego.disminuir_cantidad_banderas_en_uno()
    @mostrar_tablero=tablero_juego.tablero
    @banderas_disponibles=tablero_juego.getCantidad_banderas()
    @X=tablero_juego.getFilas()
    @Y=tablero_juego.getColumnas()
    erb :tablero_personalizado
end

