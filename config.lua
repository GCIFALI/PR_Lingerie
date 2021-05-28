-----------------------------------------------------------------------------------------------
-- CRIADOR DO SCRIPT: Paulo Ricardo -----------------------------------------------------------
-- DISCORD DO CRIADOR: PR#0001 ----------------------------------------------------------------
-- GITHUB: https://github.com/PauloRicardoctt -------------------------------------------------
-- NÃO VENDA ESTE SCRIPT! ---------------------------------------------------------------------
-- TODOS CRÉDITOS AO CRIADOR! -----------------------------------------------------------------
-----------------------------------------------------------------------------------------------

Config = {}

--- BLIPS MAPA ---
Config.Blips = true -- True = Mostra no mapa cada local do processo. | False = Não mostra nenhum processo no mapa.

--- PRIMEIRO PROCESSO ---
Config.ItemTecido = "tecido" -- Nome do item que o player receberá na primeira etapa.
Config.QuantidadeEtapa1 = 1 -- Quntidade do item que o player receberá na primeira etapa.
Config.TempoEtapa1 = 5000 -- Delay de produção do tecido na primeira etapa (MILISEGUNDOS, 1 SEGUNDO = 1000 MILISEGUNDOS). 

--- SEGUNDO PROCESSO ---
Config.ItemLingerie = "lingerie" -- Nome do item que o player receberá após trocar o da primeira etapa (EX: 1 tecido por 1 lingerie).
Config.QuantidadeRemoveEtapa2 = 1 -- Quantidade necessária do item da primeira etapa para trocar para o item da segunda.
Config.QuantidadeEtapa2 = 1 -- Quantidade do item que o player receberá na troca do item da primeira etapa pelo segundo.
Config.TempoEtapa2 = 5000 -- Delay da troca do tecido pela lingerie (MILISEGUNDOS, 1 SEGUNDO = 1000 MILISEGUNDOS). 

--- TERCEIRO PROCESSO --- 
Config.ValorPorLingerie = 500 -- Valor que o player receberá de CADA lingerie 
Config.SomAoVender = true -- True = Toca um som quando o usuário vende uma lingerie. | False = Não toca nenhum som.

return Config
