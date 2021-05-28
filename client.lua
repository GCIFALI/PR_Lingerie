

--- IMPORTS ---
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
PR = Tunnel.getInterface("PR_Lingerie")


--------------------------------------
--- TECELAR TECIDO, ETAPA 1 ---
--------------------------------------

--- LOCAIS PARA TECELAR ---
local tecelar1X = 714.82
local tecelar1Y = -967.65
local tecelar1Z = 30.4

local tecelar2X = 714.83
local tecelar2Y = -969.88
local tecelar2Z = 30.4

local tecelar3X = 714.78
local tecelar3Y = -972.16
local tecelar3Z = 30.4

local tecelar4X = 716.13
local tecelar4Y = -962.49
local tecelar4Z = 30.4

local tecelar5X = 718.92
local tecelar5Y = -962.53
local tecelar5Z = 30.4

Citizen.CreateThread(function()
    while true do
        interval = 2000
        --- DEFINE O PED E X,Y,Z ---
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        --- DEFINE O PROCESSO COMO FALSE ---
        local processo = false 
        --- DISTANCE TECELAR 1 ---
        local bowz1,cdz1 = GetGroundZFor_3dCoord(tecelar1X,tecelar1Y,tecelar1Z)
        local distance1 = Vdist(tecelar1X,tecelar1Y,cdz1,x,y,z)
        --- DISTANCE TECELAR 2 ---
        local bowz2,cdz2 = GetGroundZFor_3dCoord(tecelar2X,tecelar2Y,tecelar2Z)
        local distance2 = Vdist(tecelar2X,tecelar2Y,cdz2,x,y,z)
        --- DISTANCE TECELAR 3 ---
        local bowz3,cdz3 = GetGroundZFor_3dCoord(tecelar3X,tecelar3Y,tecelar3Z)
        local distance3 = Vdist(tecelar3X,tecelar3Y,cdz3,x,y,z)
        --- DISTANCE TECELAR 4 ---
        local bowz4,cdz4 = GetGroundZFor_3dCoord(tecelar4X,tecelar4Y,tecelar4Z)
        local distance4 = Vdist(tecelar4X,tecelar4Y,cdz4,x,y,z)
        --- DISTANCE TECELAR 5 ---
        local bowz5,cdz5 = GetGroundZFor_3dCoord(tecelar5X,tecelar5Y,tecelar5Z)
        local distance5 = Vdist(tecelar5X,tecelar5Y,cdz5,x,y,z)

        --- TECELAR ---
        if distance1 <= 2 or distance2 <= 2 or distance3 <= 2 or distance4 <= 2 or distance5 <= 2 then
            interval = 1000
            SetTextComponentFormat('STRING');
            AddTextComponentString('Pressione ~r~E~w~ para iniciar o tecelamento do tecido');
            DisplayHelpTextFromStringLabel(0, false, true, -1);
            if not processo and IsControlJustPressed(0,38) then 
                local checarmochila = PR.checarmochila()
                if checarmochila then 
                    processo = true
                    local ped = PlayerPedId()
                    FreezeEntityPosition(ped, true)
                    vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                    Citizen.Wait(Config.TempoEtapa1)
                    PR.checartecido()
                    FreezeEntityPosition(ped, false)
                    vRP._stopAnim(false)
                    processo = false
                end 
            end
        end
       Wait(interval)
    end
end)

--------------------------------------
--- TROCA DO TECIDO, SEGUNDA ETAPA ---
--------------------------------------

--- lOCAL TROCA DO TECIDO ---

local TrocaTecidoX = -82.76
local TrocaTecidoY = -1398.99
local TrocaTecidoZ = 29.49

Citizen.CreateThread(function()
    while true do
        interval2 = 2000
        --- DEFINE O PED E X,Y,Z ---
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        --- DEFINE O PROCESSO COMO FALSE ---
        local processo2 = false 
        --- DISTANCE DO PLAYER ---
        local bowz,cdz = GetGroundZFor_3dCoord(TrocaTecidoX,TrocaTecidoY,TrocaTecidoZ)
        local distance = Vdist(TrocaTecidoX,TrocaTecidoY,cdz,x,y,z)

        if distance <= 2 then
            interval2 = 5
            SetTextComponentFormat('STRING');
            AddTextComponentString('Pressione ~r~E~w~ para trocar tecido por lingerie.');
            DisplayHelpTextFromStringLabel(0, false, true, -1);
            if not processo and IsControlJustPressed(0,38) then 
                local checaritem = PR.checaritem()
                if checaritem then
                    local checarmochila2 = PR.checarmochila2()
                    if checarmochila2 then 
                        processo2 = true
                        PR.PegarTecido()
                        local ped = PlayerPedId()
                        FreezeEntityPosition(ped, true)
                        vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                        Citizen.Wait(Config.TempoEtapa2)
                        PR.trocartecido()
                        FreezeEntityPosition(ped, false)
                        vRP._stopAnim(false)
                        processo2 = false
                    end
                end 
            end
        end
        Wait(interval2)
    end
end)

--------------------------------------
-- VENDA DO TECIDO, TERCEIRA PARTE ---
--------------------------------------

--- lOCAL VENDA DO TECIDO ---

local VendaTecidoX = -1336.34
local VendaTecidoY = -1276.69
local VendaTecidoZ = 4.89

Citizen.CreateThread(function()
    while true do
        interval3 = 2000
        --- DEFINE O PED E X,Y,Z ---
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        --- DEFINE O PROCESSO COMO FALSE ---
        local processo3 = false 
        --- DISTANCE DO PLAYER ---
        local bowz,cdz = GetGroundZFor_3dCoord(VendaTecidoX,VendaTecidoY,VendaTecidoZ)
        local distance = Vdist(VendaTecidoX,VendaTecidoY,cdz,x,y,z)

        if distance <= 2 then
            interval3 = 5
            SetTextComponentFormat('STRING');
            AddTextComponentString('Pressione ~r~E~w~ para vender lingerie.');
            DisplayHelpTextFromStringLabel(0, false, true, -1);
            if not processo and IsControlJustPressed(0,38) then 
                if PR.checaritem2() and PR.PegarLingerie() then 
                    PR.venderlingerie()
                end
            end
        end
        Wait(interval3)
    end
end)

--- BLIPS (SE ATIVO) ---
if Config.Blips then 
    local blips = {
        {title="Venda de Lingeries", colour=48, id=279, x = -1336.64, y = -1277.03, z = 4.89},
        {title="Tecelagem", colour=48, id=279, x = 718.23, y = -977.35, z = 24.31},
        {title="Trocar Tecido", colour=48, id=279, x = -82.76, y = -1398.99, z = 29.49}
    }
    Citizen.CreateThread(function()
        for _, info in pairs(blips) do
          info.blip = AddBlipForCoord(info.x, info.y, info.z)
          SetBlipSprite(info.blip, info.id)
          SetBlipDisplay(info.blip, 4)
          SetBlipScale(info.blip, 0.7)
          SetBlipColour(info.blip, info.colour)
          SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(info.title)
          EndTextCommandSetBlipName(info.blip)
        end
    end)
end





