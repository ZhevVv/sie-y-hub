-- [[ CASCADE PROTECTION ACTIVATED ]]

-- [Layer 1: Environment Map]
local jaHmhptI = (getfenv and getfenv() or _ENV or _G)
local XECOdIh = jaHmhptI["\115\116\114\105\110\103"]
local UxiMmWr = jaHmhptI["\116\97\98\108\101"]

-- [Layer 2: Decoding Matrix]
local RstEtVrQqx = function(val, key)
    local res, b = 0, 1
    while val > 0 or key > 0 do
        local m1, m2 = val % 2, key % 2
        if m1 ~= m2 then res = res + b end
        val, key, b = (val - m1) / 2, (key - m2) / 2, b * 2
    end
    return XECOdIh["\99\104\97\114"](res)
end

-- [Layer 3: Encrypted Stack Space]
local zvFVGZoDa = { (69-39), (9-7), (53-51), (54-48), (25-20), (93-17), (127-38), (97-8), (58-54), (46-23), (42-41), (116-28), (56-39), (40-9), (19-17), (44-14), (51-48), (46-26), (27-24), (43-38), (59-40), (27-23), (71-50), (71-46), (76-52), (30-28), (57-38), (67-43), (13-11), (142-54), (72-51), (52-27), (58-31), (137-48), (70-26), (68-38), (51-32), (47-47), (59-27), (23-23), (118-29), (37-32), (46-15), (38-19), (104-13), (53-38), (127-36), (70-40), (39-36), (38-18), (140-51), (26-22), (64-45), (64-48), (33-28), (106-17), (82-52), (39-20), (30-7), (35-17), (40-35), (99-10), (55-28), (41-18), (70-39), (40-16), (107-18), (51-22), (58-39), (24-9), (140-52), (61-35), (53-50), (36-13) }
local VxDprtVm = {}

-- [Layer 4: Cascade Processing Stream]
for hEKuK = 1, #zvFVGZoDa do
    VxDprtVm[hEKuK] = RstEtVrQqx(zvFVGZoDa[hEKuK], 118)
end

-- [Layer 5: Safe Execution Pipeline]
local SExbdQijh = assert(jaHmhptI["\108\111\97\100\115\116\114\105\110\103"] or jaHmhptI["\108\111\97\100"], "Execution Refused")
SExbdQijh(UxiMmWr["\99\111\110\99\97\116"](VxDprtVm))()
