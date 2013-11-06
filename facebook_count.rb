require 'fb_graph'
require 'twitter'
require './twitter_auth'

pages = ["apuntesdelviajero", "somosviajerosblog", "ViajeConEscalas", "unmundodeexperiencias", "Unmundopara3", "LaMaletaDeCarla", "pepeponttravel", "BabiloniasTravelcom", "companysdeviatge", "viajares.es", "heyheyworld", "unavidaenmilviajes", "Meridiano180com", "ViajandoconunCasioazul", "DontStopTravelling", "quadernsdebitacola", "Tienenojos", "Outteresting", "cometeelmundo.net", "equipatgedema", "viajablog", "ahoratocaviajar", "ViajarCuesteLoQueCueste", "www.tusdestinos.net", "viajarcomeryamar", "viajandopor", "sempreviaggiando", "Madaboutravel", "diariodeabordoblog", "soniatravelguides", "adictosalosviajes", "barcelonando01", "VacacionesPorEuropa", "Pasionescorrerviajar", "fotografiandoyviajando", "TravelPills", "ViajarCodeVeronica", "dondetemetes.net", "MyFamilyPassport", "tailandiasinplaya", "viajamosjuntos.net", "viajaraucrania"]

twitters = ["v_caleidoscopio", "apuntesviajero", "somosviajeros", "viajecescalas", "unmundopara3", "larabrito", "monica_catalan", "carla_llamas", "bptraveller", "pepepont", "kaldorana", "babiloniasT", "companysviatge", "PlanetaDunia", "xixerone_", "viajes180grados", "davidmonfil", "MarinaPorqueno", "raponchii", "Jorgebonilla11", "BeatrizLizana", "dosdeviatge", "_cometeelmundo_", "equipatgedema", "viajablog", "ahoratocaviajar", "bleid248", "vanessavolandoy", "adictos_viajes", "travelpills", "dondetemetes", "cientounvidas", "MyFamPassport"]


ids = []
twitters.each do |username|
	puts "#{username} #{Twitter.followers(username)}"
end

puts "total followers on twitter: #{ids.size()}"
exit

total = 0
pages.each do |pageName|
	page = FbGraph::Page.fetch(pageName)
	if page.like_count
		total += page.like_count 
		puts "page #{pageName} with likes #{page.like_count}"
	end
end

puts "total likes on facebook: #{total}"

