-- Loader na gagamit ng Pastebin (para nakatago ang code)
local url = "https://pastebin.com/raw/LXE0EKY1"
                                                                 local function load_script()
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if success and result then
        local func, err = loadstring(result)                             if func then
            func()
        else
            warn("Load error: " .. tostring(err))
        end
    else                                                                 warn("Download error: " .. tostring(result))
    end
end
                                                                 load_script()
