--- IMPORTS ---

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
PR = {}
Tunnel.bindInterface("PR_Lingerie",PR)

--- VERIFICA O ESPAÇO NA MOCHILA ---

function PR.checarmochila()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then 
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(Config.ItemTecido)*Config.QuantidadeEtapa1 > vRP.getInventoryMaxWeight(user_id) then
			TriggerClientEvent("Notify",source,"negado","Sua <b>mochila</b> esta cheia, desculpe.")
			return false
		else
			return true 
		end
	end
end

--- DÁ TECIDO APÓS O PROCESSO ---

function PR.checartecido()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(Config.ItemTecido)*Config.QuantidadeEtapa1 <= vRP.getInventoryMaxWeight(user_id) then
			TriggerClientEvent("Notify",source,"sucesso","Você teceu <b>"..Config.QuantidadeEtapa1.."</b> tecidos.") 
			vRP.giveInventoryItem(user_id,Config.ItemTecido,Config.QuantidadeEtapa1)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Sua <b>mochila</b> esta cheia, desculpe.")
			return false
		end
	end
end

--------------------------------------
--- SEGUNDA PARTE, TROCA DO TECIDO ---
--------------------------------------

--- CHECA SE HÁ ESPAÇO NA MOCHILA ---

function PR.checarmochila2()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then 
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(Config.ItemLingerie)*Config.QuantidadeEtapa2 > vRP.getInventoryMaxWeight(user_id) then
			TriggerClientEvent("Notify",source,"negado","Sua <b>mochila</b> esta cheia, desculpe.")
			return false
		else
			return true 
		end
	end
end

--- CHECA SE HÁ TECIDO NA MOCHILA ---

function PR.checaritem()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,Config.ItemTecido) >= 1 then
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui nenhum tecido em sua mochila para isso.") 
			return false
		end
	end

end

--- REMOVE O TECIDO DA MOCHILA ---

function PR.PegarTecido()
	local player = source
	local user_id = vRP.getUserId(player)
	if user_id then
		vRP.tryGetInventoryItem(user_id,Config.ItemTecido,1) 
	end
end

--- TROCA O TECIDO POR LINGERIE ---

function PR.trocartecido()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(Config.ItemTecido)*Config.QuantidadeEtapa1 <= vRP.getInventoryMaxWeight(user_id) then
			TriggerClientEvent("Notify",source,"sucesso","Você trocou <b>"..Config.QuantidadeRemoveEtapa2.."</b> tecidos por <b>"..Config.QuantidadeEtapa2.."<b> lingeries") 
			vRP.giveInventoryItem(user_id,Config.ItemLingerie,Config.QuantidadeEtapa2)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Sua <b>mochila</b> esta cheia, desculpe.")
			return false
		end
	end
end

--------------------------------------
-- TERCEIRA PARTE, VENDA DA LINGERIE -
--------------------------------------

--- CHECA SE HÁ TECIDO NA MOCHILA ---

function PR.checaritem2()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,Config.ItemLingerie) >= 1 then
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui nenhuma lingerie em sua mochila para isso.") 
			return false
		end
	end

end

--- REMOVE O TECIDO DA MOCHILA ---

function PR.PegarLingerie()
	local player = source
	local user_id = vRP.getUserId(player)
	if user_id then
		vRP.tryGetInventoryItem(user_id,Config.ItemLingerie,1) 
        return true
    else 
        return false
    end 
end

--- TROCA O TECIDO POR LINGERIE ---

function PR.venderlingerie()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
        if Config.SomAoVender then
            TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
        end
		TriggerClientEvent("Notify",source,"sucesso","Você vendeu <b> 1 </b> lingerie por <b>"..Config.ValorPorLingerie.."<b> doláres") 
		vRP.giveMoney(user_id,Config.ValorPorLingerie)
		return true
	end
end
