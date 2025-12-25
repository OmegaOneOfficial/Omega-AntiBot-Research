-- 🛡️ 0mega Code: Hybrid Bot-Scanner v1.0
-- Developed by 0mega-One
-- Logic: Chat Analysis + Robotic Movement Patterns

game.Players.PlayerAdded:Connect(function(player)
    local suspicionScore = 0
    local lastPosition = nil
    
    -- --- PARTE 1: ESCÁNER DE CHAT ---
    player.Chatted:Connect(function(message)
        local bypassKeywords = {".com", ".gg", "robux", "v e n t a", "c0m", "link"}
        
        for _, word in pairs(bypass_keywords) do
            if string.find(message:lower(), word) then
                suspicionScore = suspicionScore + 2
                warn("⚠️ 0mega Code: Palabras de bot detectadas en " .. player.Name)
            end
        end
        
        -- Si el mensaje es muy largo y tiene símbolos raros
        if #message > 50 and string.find(message, "[%p%s]") then
            suspicionScore = suspicionScore + 1
        end
    end)

    -- --- PARTE 2: ESCÁNER DE MOVIMIENTO (FÍSICO) ---
    player.CharacterAdded:Connect(function(character)
        local root = character:WaitForChild("HumanoidRootPart")
        
        task.spawn(function()
            while character and character.Parent do
                local currentPos = root.Position
                
                if lastPosition then
                    local distance = (currentPos - lastPosition).Magnitude
                    
                    -- Regla 0mega-One: Si el bot está perfectamente quieto mientras spamea
                    if distance < 0.1 then
                        -- El jugador no se ha movido nada (posible bot estático)
                        -- No sumamos puntos todavía, solo marcamos sospecha
                    end
                end
                
                lastPosition = currentPos
                task.wait(5) -- Analizamos cada 5 segundos para no forzar tu Celeron
                
                -- --- CONCLUSIÓN ---
                if suspicionScore >= 3 then
                    player:Kick("\n🛡️ [0mega Code: Protocol 0mega-One]\nTu comportamiento coincide con un BOT de spam.\nAcceso denegado.")
                    break
                end
            end
        end)
    end)
end)
