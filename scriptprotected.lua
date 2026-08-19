-- Loader - Ito ang gagamitin mo sa Roblox
local function fetchAndRun(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if not success then
        warn("Failed to fetch: " .. tostring(result))
        return
    end
    local func, err = loadstring(result)
    if not func then
        warn("Failed to load: " .. tostring(err))
        return
    end
    print("✅ Script loaded! Executing...")
    local ok, execErr = pcall(func)
    if not ok then
        warn("❌ Runtime error: " .. tostring(execErr))
    else
        print("✅ Script executed successfully!")
    end
end

-- Palitan mo ng RAW link mo
fetchAndRun("https://raw.githubusercontent.com/ZhevVv/sie-y-hub/refs/heads/main/key.lua")
