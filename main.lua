local PlayerData              = {}
local nbrDisplaying = 1
ESX                           = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob') 
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

CreateThread(function()
	RegisterFontFile('firesans') 
	fontId = RegisterFontId('Fire Sans') 
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	if target ~= 1 then
      local playerPed = PlayerPedId()
      local targetPed = GetPlayerPed(target)
      local playerCoords = GetEntityCoords(playerPed)
      local targetCoords = GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
          TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
      end
   end
end)
RegisterNetEvent('esx_rpchat:trychat')
AddEventHandler('esx_rpchat:trychat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)
        
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 10 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:rgba(220, 173, 17, 1.0); font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> TRY</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:localchat')
AddEventHandler('esx_rpchat:localchat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:rgba(16, 115, 155 , 1.0); font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> L-OOC</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:mechat')
AddEventHandler('esx_rpchat:mechat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:#182add; font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 4.0px; padding-top: 2.5px; padding-right: 4.0px;border-radius: 0px;"> <b> ME</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:doktorchat')
AddEventHandler('esx_rpchat:doktorchat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:#182add; font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 4.0px; padding-top: 2.5px; padding-right: 4.0px;border-radius: 0px;"> <b> DOKTOR</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:dochat')
AddEventHandler('esx_rpchat:dochat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 10 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:rgba(220, 173, 17, 1.0); font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> DO</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:docchat')
AddEventHandler('esx_rpchat:docchat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:rgba(220, 173, 17, 1.0); font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> DOC</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)

RegisterNetEvent('esx_rpchat:stavchat')
AddEventHandler('esx_rpchat:stavchat', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -0.5px black;">             <font style="background-color:rgba(220, 173, 17, 1.0); font-size: 12px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> STAV</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
          args = { title, message }
      })
		end
	end
end)




Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me',   'Popisuje animaci, která postava nemůže znázornit/vykonat ve hře.',   { { name = 'zpráva', help = 'Zpráva/Animace' } } )
	TriggerEvent('chat:addSuggestion', '/do',   'Vyvolává interakce s ostatnímy hráči, či předměty.',   { { name = 'zpráva', help = 'Zpráva/Interakce' } } )
  TriggerEvent('chat:addSuggestion', '/doktor',   'Erpení passivního doktora',   { { name = 'zpráva', help = 'Zpráva' } } )
	TriggerEvent('chat:addSuggestion', '/police', 'Oznámení pro PD! (Smí použít poze PD)',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  	TriggerEvent('chat:addSuggestion', '/ambulance*', 'Oznámení pro záchranou službu (Smí použít pouze EMS)',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/doc', 'Napíše za vás proces, napřiklad /do 1/10 (max 25)', { { name = 'pocet', help = 'pocet opakovani' } } )
	TriggerEvent('chat:addSuggestion', '/stav', 'Zobrazí váš stav postavy po dobu 60 -s', { { name = 'zpráva', help = 'Zpráva/Interakce/Stav' } })
	TriggerEvent('chat:addSuggestion', '/try', 'Rozhodné za vás automaticky, zda /do Ano či /do Ne' )
  --TriggerEvent('chat:addSuggestion', '/sheriff', 'Ozn�menie Sheriff - pro sheriffy!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )	
  TriggerEvent('chat:addSuggestion', '/bm',   'Odešle zprávu v režimu "BlackMarket", kterou PD nevidí!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    
  TriggerEvent('chat:removeSuggestion', '/adhesive_cdnKey')
  TriggerEvent('chat:removeSuggestion', '/banner_connecting')
  TriggerEvent('chat:removeSuggestion', '/banner_detail')
  TriggerEvent('chat:removeSuggestion', '/citizen_dir')
  TriggerEvent('chat:removeSuggestion', '/cmdlist')
  TriggerEvent('chat:removeSuggestion', '/con_disableNonTTYReads')
  TriggerEvent('chat:removeSuggestion', '/endpoint_add_tcp')
  TriggerEvent('chat:removeSuggestion', '/endpoint_add_udp')
  TriggerEvent('chat:removeSuggestion', '/ensure')
  TriggerEvent('chat:removeSuggestion', '/exec')
  TriggerEvent('chat:removeSuggestion', '/fileserver_add')
  TriggerEvent('chat:removeSuggestion', '/fileserver_list')
  TriggerEvent('chat:removeSuggestion', '/fileserver_remove')
  TriggerEvent('chat:removeSuggestion', '/gamename')
  TriggerEvent('chat:removeSuggestion', '/gametype')
  TriggerEvent('chat:removeSuggestion', '/heartbeat')
  TriggerEvent('chat:removeSuggestion', '/load_server_icon')
  TriggerEvent('chat:removeSuggestion', '/locale')
  TriggerEvent('chat:removeSuggestion', '/mapname')
  TriggerEvent('chat:removeSuggestion', '/net_tcpConnLimit')
  TriggerEvent('chat:removeSuggestion', '/netlib')
  TriggerEvent('chat:removeSuggestion', '/netPort')
  TriggerEvent('chat:removeSuggestion', '/onesync')
  TriggerEvent('chat:removeSuggestion', '/onesync_automaticResend')
  TriggerEvent('chat:removeSuggestion', '/onesync_clearArea')
  TriggerEvent('chat:removeSuggestion', '/onesync_distanceCulling')
  TriggerEvent('chat:removeSuggestion', '/onesync_distanceCullVehicles')
  TriggerEvent('chat:removeSuggestion', '/onesync_enableBeyond')
  TriggerEvent('chat:removeSuggestion', '/onesync_enabled')
  TriggerEvent('chat:removeSuggestion', '/onesync_enableInfinity')
  TriggerEvent('chat:removeSuggestion', '/onesync_forceMigration')
  TriggerEvent('chat:removeSuggestion', '/onesync_logFile')
  TriggerEvent('chat:removeSuggestion', '/onesync_population')
  TriggerEvent('chat:removeSuggestion', '/onesync_radiusFrequency')
  TriggerEvent('chat:removeSuggestion', '/onesync_showObjectIds')
  TriggerEvent('chat:removeSuggestion', '/onesync_workaround763185')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_getinfo_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_getinfo_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_http_info_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_http_info_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommand_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommand_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommandFlood_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommandFlood_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEvent_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEvent_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventFlood_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventFlood_rate')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventSize_burst')
  TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventSize_rate')
  TriggerEvent('chat:removeSuggestion', '/rcon_password')
  TriggerEvent('chat:removeSuggestion', '/refresh')
  TriggerEvent('chat:removeSuggestion', '/restart')
  TriggerEvent('chat:removeSuggestion', '/set')
  TriggerEvent('chat:removeSuggestion', '/seta')
  TriggerEvent('chat:removeSuggestion', '/setr')
  TriggerEvent('chat:removeSuggestion', '/sets')
  TriggerEvent('chat:removeSuggestion', '/start')
  TriggerEvent('chat:removeSuggestion', '/steam_webApiKey')
  TriggerEvent('chat:removeSuggestion', '/stop')
  TriggerEvent('chat:removeSuggestion', '/sv_authMaxVariance')
  TriggerEvent('chat:removeSuggestion', '/sv_authMinTrust')
  TriggerEvent('chat:removeSuggestion', '/sv_endpointPrivacy')
  TriggerEvent('chat:removeSuggestion', '/sv_endpoints')
  TriggerEvent('chat:removeSuggestion', '/sv_enforceGameBuild')
  TriggerEvent('chat:removeSuggestion', '/sv_enhancedHostSupport')
  TriggerEvent('chat:removeSuggestion', '/sv_entityLockdown')
  TriggerEvent('chat:removeSuggestion', '/sv_forceIndirectListing')
  TriggerEvent('chat:removeSuggestion', '/sv_hostname')
  TriggerEvent('chat:removeSuggestion', '/sv_icon')
  TriggerEvent('chat:removeSuggestion', '/sv_infoVersion')
  TriggerEvent('chat:removeSuggestion', '/sv_lan')
  TriggerEvent('chat:removeSuggestion', '/sv_licenseKey')
  TriggerEvent('chat:removeSuggestion', '/sv_licenseKeyToken')
  TriggerEvent('chat:removeSuggestion', '/sv_listingHostOverride')
  TriggerEvent('chat:removeSuggestion', '/sv_listingIpOverride')
  TriggerEvent('chat:removeSuggestion', '/sv_master1')
  TriggerEvent('chat:removeSuggestion', '/sv_master2')
  TriggerEvent('chat:removeSuggestion', '/sv_master3')
  TriggerEvent('chat:removeSuggestion', '/sv_maxClients')
  TriggerEvent('chat:removeSuggestion', '/sv_projectDesc')
  TriggerEvent('chat:removeSuggestion', '/sv_projectName')
  TriggerEvent('chat:removeSuggestion', '/sv_registerMulticastDns')
  TriggerEvent('chat:removeSuggestion', '/sv_requestParanoia')
  TriggerEvent('chat:removeSuggestion', '/sv_scriptHookAllowed')
  TriggerEvent('chat:removeSuggestion', '/sv_tebexSecret')
  TriggerEvent('chat:removeSuggestion', '/sv_threadedClientHttp')
  TriggerEvent('chat:removeSuggestion', '/sv_useAccurateSends')
  TriggerEvent('chat:removeSuggestion', '/svgui')
  TriggerEvent('chat:removeSuggestion', '/svgui_disable')
  TriggerEvent('chat:removeSuggestion', '/tags')
  TriggerEvent('chat:removeSuggestion', '/toggle')
  TriggerEvent('chat:removeSuggestion', '/version')
  TriggerEvent('chat:removeSuggestion', '/vstr')
  TriggerEvent('chat:removeSuggestion', '/Website')
  TriggerEvent('chat:removeSuggestion', '/wait')
  TriggerEvent('chat:removeSuggestion', '/web_baseUrl')
  TriggerEvent('chat:removeSuggestion', '/+vstr')
  TriggerEvent('chat:removeSuggestion', '/-vstr')
  TriggerEvent('chat:removeSuggestion', '/_crash')
  end)

  AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
    TriggerEvent('chat:removeSuggestion', '/bm')
    TriggerEvent('chat:removeSuggestion', '/nazada')
    TriggerEvent('chat:removeSuggestion', '/narameno')
    TriggerEvent('chat:removeSuggestion', '/givecar')
    TriggerEvent('chat:removeSuggestion', '/givecarplate')
		TriggerEvent('chat:removeSuggestion', '/gps')
	end
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offsetme = 2.04 + (nbrDisplaying*0.15)
    DisplayMe(GetPlayerFromServerId(source), text, offsetme)
end)

RegisterNetEvent('3ddoktor:triggerDisplay')
AddEventHandler('3ddoktor:triggerDisplay', function(text, source)
    local offsetdoktor = 2.05 + (nbrDisplaying*0.15)
    DisplayDoktor(GetPlayerFromServerId(source), text, offsetdoktor)
end)

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    local offsetdo = 2.34 + (nbrDisplaying*0.15)
    DisplayDo(GetPlayerFromServerId(source), text, offsetdo)
end)


RegisterNetEvent('3dstav:triggerDisplay')
AddEventHandler('3dstav:triggerDisplay', function(text, source)
    local offsetstav = 2.34 + (nbrDisplaying*0.15)
    DisplayStav(GetPlayerFromServerId(source), text, offsetstav)
end)



RegisterNetEvent('3ddoa:triggerDisplay')
AddEventHandler('3ddoa:triggerDisplay', function(text, source)
    local offsetdoa = 2.34 + (nbrDisplaying*0.15)
    DisplayDoa(GetPlayerFromServerId(source), text, offsetdoa)
end)

function DisplayMe(mePlayer, text, offsetme)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Dme(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetme-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end


function DisplayDo(mePlayer, text, offsetdo)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(4000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdo-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayDoktor(mePlayer, text, offsetdo)
  local displaying = true

  Citizen.CreateThread(function()
      Wait(4000)
      displaying = false
  end)

  Citizen.CreateThread(function()
      nbrDisplaying = nbrDisplaying + 1
      while displaying do
          Wait(0)
          local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
          local coords = GetEntityCoords(PlayerPedId(), false)
          local dist = Vdist2(coordsMe, coords)
          if dist < 500 then
               DrawText3Ddoktor(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdo-1.250, text)
          end
      end
      nbrDisplaying = nbrDisplaying - 1
  end)
end


function DisplayStav(mePlayer, text, offsetstav)
  local displaying = true

  Citizen.CreateThread(function()
      Wait(90000)
      displaying = false
  end)

  Citizen.CreateThread(function()
      nbrDisplaying = nbrDisplaying + 1
      while displaying do
          Wait(0)
          local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
          local coords = GetEntityCoords(PlayerPedId(), false)
          local dist = Vdist2(coordsMe, coords)
          if dist < 500 then
               DrawText3Dstav(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetstav-1.250, text)
          end
      end
      nbrDisplaying = nbrDisplaying - 1
  end)
end

function DisplayDoa(mePlayer, text, offsetdoa)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(1900)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdoa-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3Dme(x,y,z, text)
  RegisterFontFile('firesans')
  fontId = RegisterFontId('Fire Sans') 
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.32)
    RegisterFontFile('firesans') 
    fontId = RegisterFontId('Fire Sans') 
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(24, 42, 221, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end




function DrawText3Ddo(x,y,z, text)
  RegisterFontFile('firesans') 
  fontId = RegisterFontId('Fire Sans') 
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.32)
    RegisterFontFile('firesans') 
    fontId = RegisterFontId('Fire Sans') 
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(232, 185, 32, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end

function DrawText3Ddoktor(x,y,z, text)
  RegisterFontFile('firesans') 
  fontId = RegisterFontId('Fire Sans') 
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.32)
    RegisterFontFile('firesans') 
    fontId = RegisterFontId('Fire Sans') 
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(232, 185, 32, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end

function DrawText3Ddoa(x,y,z, text)
  RegisterFontFile('firesans') 
  fontId = RegisterFontId('Fire Sans')
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.35)
    RegisterFontFile('firesans')
    fontId = RegisterFontId('Fire Sans') 
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(232, 185, 32, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end

function DrawText3Dstav(x,y,z, text)
  RegisterFontFile('firesans')
  fontId = RegisterFontId('Fire Sans') 
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.35)
    RegisterFontFile('firesans') 
    fontId = RegisterFontId('Fire Sans')
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(232, 185, 32, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end

RegisterNetEvent("zde:update")
AddEventHandler("zde:update",function(newCedulky)
	cedulky = newCedulky
	for k,v in ipairs(cedulky) do
		Citizen.CreateThread(function()
			local a = tostring(cedulky)
			while a==tostring(cedulky) do
				Wait(0)
				local pos = GetEntityCoords(PlayerPedId())
				if #(pos-v.pos)<15.0 then
					DrawText3Dzde(v.pos.x, v.pos.y, v.pos.z, 'ZDE: ' .. v.text)
				else
					Wait(500)
				end
			end
			collectgarbage()
		end)
	end
	collectgarbage()
end)

Citizen.CreateThread(function()
	while true do
		Wait(60000)
		TriggerServerEvent("zde:giveme")
	end
end)

function DrawText3Dzde(x,y,z, text)
  RegisterFontFile('firesans') 
  fontId = RegisterFontId('Fire Sans') 
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100

	local font = fontId
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.35, 0.32)
    RegisterFontFile('firesans') 
    fontId = RegisterFontId('Fire Sans') 
    SetTextFont(font)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 300
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
    end
end

RegisterCommand('kocka', function(source, args, rawCommand)
  local number = math.random(1,6)
  ExecuteCommand('me Hadze kockou')
  Citizen.Wait(600)
  ExecuteCommand('do Spadlo ' ..number)
end)