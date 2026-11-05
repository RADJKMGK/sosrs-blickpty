-- Senior Hub • Sources De-obfuscator
-- Discord https://discord.gg/CaDQtHqZxA
-- Tool: LuaObfuscator

local v1 = game:GetService("TweenService")
local v2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("Lighting")
local v6
do
    pcall(function()
        v6 = game:GetService("VirtualInputManager")
    end)
end
while not game:GetService("Players").LocalPlayer do
    task.wait(0.1)
end
print("[NOA HUB] adım 1/7: servisler + LocalPlayer hazır")
local v7 = v2.LocalPlayer
local v8
do
    local v29
    local v30
    v29, v30 = pcall(function()
        return gethui and gethui()
    end)
    if (v29 and v30) then
    else
        print("[NOA HUB] gethui yok, PlayerGui bekleniyor (en fazla 15 sn)")
        if not v7:WaitForChild("PlayerGui", 15) then
            local v31
            local v32
            v31, v32 = pcall(function()
                return game:GetService("CoreGui")
            end)
            if (v31 and v32) then
            else
                v8 = v7:WaitForChild("PlayerGui")
            end
        end
    end
end
print("[NOA HUB] adım 2/7: UI hedefi hazır")
do
    pcall(function()
        if _G.NoaHubConnection then
            _G.NoaHubConnection:Disconnect()
            _G.NoaHubConnection = nil
        end
        if _G.NoaHubCleanup then
            _G.NoaHubCleanup()
        end
        if v8:FindFirstChild("Noa_Ultimate_Menu") then
            v8.Noa_Ultimate_Menu:Destroy()
        end
    end)
end
print("[NOA HUB] ·· çift enjeksiyon temizliği tamam")
local v9 = Color3.fromRGB(255, 15, 45)
local v10 = Color3.fromRGB(0, 255, 120)
local v11 = Color3.fromRGB(0, 170, 255)
local v12 = Color3.fromRGB(255, 60, 90)
local function v13(v33, v34, v35)
    local v36
    v36 = Instance.new(v33)
    for v37, v38 in pairs(v34) do
        local v39
        v39 = pcall(function()
            v36[v37] = v38
        end)
        if not v39 then
            pcall(function()
                warn("[NOA HUB] geçersiz property: " .. v33 .. "." .. tostring(v37))
            end)
        end
    end
    if v35 then
        v36.Parent = v35
    end
    return v36
end
local function v14(v40, v41, v42, v43, v44)
    local v45
    local v46
    v45 = TweenInfo.new(v42 or 0.25, v43 or Enum.EasingStyle.Quart, v44 or Enum.EasingDirection.Out)
    v46 = v1:Create(v40, v45, v41)
    v46:Play()
    return v46
end
local function v15(v47)
    local v48
    local v49
    v48 = nil
    v49 = nil
    v48 = {}
    if (v47:IsA("TextLabel") or v47:IsA("TextBox") or v47:IsA("TextButton")) then
        v48.TextTransparency = v47.TextTransparency
        v47.TextTransparency = 1
    end
    if v47:IsA("GuiObject") then
        v48.BackgroundTransparency = v47.BackgroundTransparency
        v47.BackgroundTransparency = 1
    end
    v49 = v47:FindFirstChildOfClass("UIStroke")
    if v49 then
        v48.StrokeObj = v49
        v48.StrokeVal = v49.Transparency
        v49.Transparency = 1
    end
    return v48
end
local function v16(v50, v51, v52)
    task.delay(v52, function()
        local v53
        if not v50.Parent then
        end
        v53 = {}
        if (v51.TextTransparency ~= nil) then
            v53.TextTransparency = v51.TextTransparency
        end
        if (v51.BackgroundTransparency ~= nil) then
            v53.BackgroundTransparency = v51.BackgroundTransparency
        end
        if next(v53) then
            v14(v50, v53, 0.34999999999990905)
        end
        if v51.StrokeObj then
            v14(v51.StrokeObj, {Transparency = v51.StrokeVal}, 0.35)
        end
    end)
end
local function v17(v54)
    local v55
    v55 = v13("UIScale", {Scale = 1}, v54)
    v54.MouseEnter:Connect(function()
        v14(v55, {Scale = 1.04}, 0.12)
    end)
    v54.MouseLeave:Connect(function()
        v14(v55, {Scale = 1}, 0.15)
    end)
    v54.MouseButton1Down:Connect(function()
        v14(v55, {Scale = 0.96}, 0.08)
    end)
    v54.MouseButton1Up:Connect(function()
        v14(v55, {Scale = 1.04}, 0.09999999999990905)
    end)
end
local function v18(v56)
    v56.InputBegan:Connect(function(v57)
        if ((v57.UserInputType == Enum.UserInputType.MouseButton1) and v56.Parent) then
            local v58
            local v59
            v58 = v13("Frame", {Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0.5, -5, 0.5, -5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.55, BorderSizePixel = 0, ZIndex = v56.ZIndex + (2)}, v56)
            v59 = math.max(v56.AbsoluteSize.X, v56.AbsoluteSize.Y)
            v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v58)
            v14(v58, {Size = UDim2.new(0, v59 * (1.6), 0, v59 * (1.6)), Position = UDim2.new(0.5, -v59 * (0.8), 0.5, -v59 * (0.8)), BackgroundTransparency = 1}, 0.45)
            task.delay(0.5, function()
                v58:Destroy()
            end)
        end
    end)
end
local v19 = function()
    print("[NOA HUB] 1/4 V32 çekirdeği başlıyor")
    local v60 = tostring(v7.UserId)
    local v61 = {
        UI = {Open = true, Key = Enum.KeyCode.Insert, Language = "EN"},
        Aimbot = {Enabled = false, WallCheck = false, TeamCheck = false, ShowFOV = false, FOV = 250, MaxDistance = 1000, Smoothness = 0.15, ActivationMode = "Automatic", AimOnMouse2 = false, HoldKey = Enum.KeyCode.E, HitPart = "Head", PredictionMs = 0, TargetInfo = false, Priority = "Closest (Screen)", TargetFilter = "Everyone", Humanize = true},
        Triggerbot = {Enabled = false, Delay = 15, VisibilityCheck = false},
        Visuals = {Enabled = false, Box = false, BoxStyle = "Normal", BoxThickness = 1, TextSize = 13, HealthBar = false, HealthText = false, NameESP = false, InfoLine = false, TeamColors = false, TeamCheck = false, Chams = false, Skeleton = false, Tracer = false, HeadDot = false, VisibilityCheck = false, OffscreenArrows = false, GameCompat = true, MaxDistance = 250},
        Movement = {WalkSpeed = 16, EnableSpeed = false, JumpPower = 50, EnableJump = false, InfiniteJump = false, Noclip = false, Fly = false, FlySpeed = 60},
        World = {Fullbright = false, NoFog = false, AntiAFK = false, FPSBoost = false},
    }
    local v62 = {}
    local function v63(v177)
        table.insert(v62, v177)
        return v177
    end
    local v64 = {}
    local v65 = {KeyCode = Enum.KeyCode}
    pcall(function()
        local v178
        v178 = {"NoaHub_Profiles.txt", "NoaHub_Lang.txt", "NoaHub_" .. v60 .. "_Lang.txt", "NoaHubProf_" .. v60 .. "_last.txt"}
        for v179, v180 in ipairs(v178) do
            if isfile(v180) then
                pcall(delfile, v180)
            end
        end
        if listfiles then
            local v181
            local v182
            v181, v182 = pcall(listfiles)
            if (v181 and (type(v182) == "table")) then
                for v183, v184 in ipairs(v182) do
                    if (type(v184) == "string") then
                        local v185
                        v185 = (v184:match("[^/\\]+$") or v184):match("^NoaHubProf_(.+)%.[%w]+$")
                        if (((v184:match("[^/\\]+$") or v184):match("^NoaHubProf_(.+)%.[%w]+$")) and not v185:match("^%d+_")) then
                            pcall(delfile, v184)
                        end
                    end
                end
            end
        end
    end)
    local v66 = {["🎯 COMBAT"] = "🎯 SAVAŞ", ["👁 VISUALS"] = "👁 GÖRSELLER", ["🏃 MOVEMENT"] = "🏃 HAREKET", ["🌐 WORLD"] = "🌐 DÜNYA", ["⚙ SETTINGS"] = "⚙ AYARLAR", ["AIMBOT — LOCK"] = "AIMBOT — KİLİTLEME", ["TARGET SELECTION"] = "HEDEF SEÇİMİ", ["FILTERS & PROTECTION"] = "FİLTRELER & KORUMA", ["FOV & KEYS"] = "FOV & TUŞLAR", ["TRIGGERBOT (AUTO FIRE)"] = "TRIGGERBOT (OTO TETİK)", ["ESP — CORE"] = "ESP — ÇEKİRDEK", ["ESP — INFO"] = "ESP — BİLGİLER", ["ESP — EXTRA LAYERS"] = "ESP — EKSTRA KATMANLAR", ["ESP — ADVANCED"] = "ESP — GELİŞMİŞ", CHARACTER = "KARAKTER", ["ADVANCED MOVEMENT"] = "GELİŞMİŞ HAREKET", ["WORLD & LIGHT"] = "DÜNYA & IŞIK", PROFILES = "PROFİLLER", ["SAVED PROFILES"] = "KAYITLI PROFİLLER", ["LANGUAGE & MENU"] = "DİL & MENÜ", ["GETTING STARTED"] = "NASIL KULLANILIR", ["Toggle Aimbot"] = "Aimbot Aç/Kapa", ["Lock Mode"] = "Kilit Modu", ["Aim Part (Hitbox)"] = "Kilitlenecek Bölge (Hitbox)", Smoothness = "Yumuşaklık (Smoothness)", ["Forward Prediction"] = "İleri Bakış (Prediction)", ["Target Priority"] = "Hedef Önceliği", ["Target Filter"] = "Hedef Filtresi", ["Wall Check (Skip Behind Walls)"] = "Wall Check (Duvar Arkasını Atla)", ["Team Check (Skip Teammates)"] = "Team Check (Takım Arkadaşını Atla)", ["Target Indicator"] = "Hedef Göstergesi", ["Show FOV Circle"] = "FOV Çemberini Göster", ["FOV Radius"] = "FOV Yarıçapı", ["Aimbot Max Distance"] = "Aimbot Maks Mesafe", ["Aim Key (Hold)"] = "Nişan Tuşu (Basılı Tut)", Triggerbot = "Triggerbot", ["Fire Delay"] = "Tetik Gecikmesi", ["Only Fire When Visible"] = "Sadece Görünürken Ateşle", ["ESP Master"] = "ESP Master", Box = "Kutu (Box)", ["Box Style"] = "Kutu Stili", ["Health Bar"] = "Can Barı", ["Health Percent"] = "Can Yüzdesi", Name = "İsim", ["Distance • HP • Weapon"] = "Mesafe • Can • Silah", ["Team Colors"] = "Takım Renkleri", ["Hide Teammates (Team Check)"] = "Takım Arkadaşını Gizle (Team Check)", ["Chams (Box Fill)"] = "Chams (Kutu içinde dolgu)", ["Skeleton (Bones)"] = "Skeleton (iskelet çizgileri)", ["Tracer (Bottom Line)"] = "Tracer (alt çizgi)", ["Head Dot"] = "Kafa Noktası", ["ESP Max Distance"] = "ESP Maks Mesafe", ["Box Thickness"] = "Kutu Kalınlığı", ["Text Size"] = "Yazı Boyutu", ["Only Draw Visible Players"] = "Yalnız Görünenleri Çiz", ["Off-Screen Arrows"] = "Ekran Dışı Ok İşaretleri", ["Game Compat (BRM5 rigs)"] = "Oyun Uyum Modu (BRM5)", ["WalkSpeed Toggle"] = "WalkSpeed Aç", ["JumpPower Toggle"] = "JumpPower Aç", ["Infinite Jump"] = "Sonsuz Zıplama", ["Noclip (Pass Through Walls)"] = "Noclip (Duvarlardan Geç)", Fly = "Uçuş (Fly)", ["Fly Speed"] = "Uçuş Hızı", ["Fullbright (Light Everything)"] = "Fullbright (Her şeyi Aydınlat)", ["Remove Fog"] = "Sisi Kaldır", ["FPS Boost (Lag Fix)"] = "FPS Boost (Kasma Fixi)", ["Anti-AFK (No Idle Kick)"] = "Anti-AFK (Idle Atmaz)", ["Type a profile name..."] = "profil adı yaz...", ["-- no profiles yet — save one above"] = "-- henüz profil yok — yukarıdan kaydet", ["💾 Save Profile"] = "💾 Profil Kaydet", Load = "Yükle", Delete = "Sil", ["Menu Open/Close Key"] = "Menü Aç/Kapa Tuşu", ["🧹 Clear ESP Cache"] = "🧹 ESP Önbelleğini Temizle", ["🗑 Quit Hub"] = "🗑 HUB'ı Kapat", Automatic = "Otomatik", ["Right Click"] = "Sağ Tık", ["Key (E)"] = "Tuş (E)", Corner = "Köşeli", Filled = "Dolu", Everyone = "Herkes", ["Players Only"] = "Sadece Oyuncular", ["Closest (Screen)"] = "En Yakın (Ekran)", ["Lowest HP"] = "En Az Can", ["Closest (World)"] = "Mesafeye En Yakın", Torso = "Gövde", Nearest = "En Yakın Parça"}
    local v67 = {}
    local function v68(v186)
        if (v61.UI.Language == "TR") then
            return v66[v186] or v186
        end
        return v186
    end
    local function v69(v187, v188)
        pcall(function()
            if v187:IsA("TextBox") then
                v187.PlaceholderText = v68(v188)
            else
                v187.Text = v68(v188)
            end
        end)
        table.insert(v67, {obj = v187, key = v188})
    end
    local function v70(v189, v190)
        table.insert(v67, {obj = v189, get = v190})
    end
    local function v71()
        for v191, v192 in ipairs(v67) do
            pcall(function()
                if v192.get then
                    v192.obj.Text = v68(v192.get())
                elseif v192.obj:IsA("TextBox") then
                    v192.obj.PlaceholderText = v68(v192.key)
                else
                    v192.obj.Text = v68(v192.key)
                end
            end)
        end
    end
    local function v72()
        local v193
        v193 = {}
        for v194, v195 in pairs(v61) do
            if (type(v195) == "table") then
                for v196, v197 in pairs(v195) do
                    if (not ((v194 == "UI") and (v196 == "Open")) and not ((v194 == "UI") and (v196 == "Language"))) then
                        local v198
                        v198 = type(v197)
                        if ((v198 == "boolean") or (v198 == "number") or (v198 == "string")) then
                            table.insert(v193, v194 .. "." .. v196 .. "=" .. tostring(v197))
                        elseif (v198 == "EnumItem") then
                            table.insert(v193, v194 .. "." .. v196 .. "=EnumItem:" .. v197.EnumType.Name .. ":" .. v197.Name)
                        end
                    end
                end
            end
        end
        return table.concat(v193, "\n")
    end
    local function v73(v199)
        local v200 = 0
        for v201 in string.gmatch(tostring(v199), "[^\r\n]+") do
            local v202, v203, v204 = v201:match("^([%w_]+)%.([%w_]+)=(.+)$")
            if (v202 and v203 and v204 and (#v204 > 0) and not ((v202 == "UI") and (v203 == "Language"))) then
                local v205
                v205 = v61[v202]
                if ((type(v205) == "table") and (v205[v203] ~= nil)) then
                    if (v204:sub(1, 9) == "EnumItem:") then
                        local v206
                        local v207
                        local v208
                        local v209
                        local v210
                        v206, v207 = v204:match("^EnumItem:(%w+):(.+)$")
                        v208 = (v206 and v65[v206]) or nil
                        v209, v210 = pcall(function()
                            return (v208 and v208[v207]) or nil
                        end)
                        if (v209 and v210) then
                            v205[v203] = v210
                            v200 = v200 + (1)
                        end
                    elseif (v204 == "true") then
                        v205[v203] = true
                        v200 = v200 + (1)
                    elseif (v204 == "false") then
                        v205[v203] = false
                        v200 = v200 + (1)
                    elseif tonumber(v204) then
                        v205[v203] = tonumber(v204)
                        v200 = v200 + (1)
                    else
                        v205[v203] = v204
                        v200 = v200 + 1
                    end
                end
            end
        end
        return v200
    end
    local v74 = {}
    local function v75()
        for v211, v212 in ipairs(v74) do
            pcall(v212)
        end
    end
    local function v76(v213)
        return (v213 or ""):gsub("[^%w%-_]", "")
    end
    local function v77(v214)
        return "NoaHubProf_" .. v60 .. "_" .. v214 .. ".txt"
    end
    local function v78()
        local v215
        v215 = {}
        pcall(function()
            if (readfile and isfile and isfile(v747)) then
                for v216 in string.gmatch(readfile(v747) or "", "[^\r\n]+") do
                    local v217
                    v217 = v76(v216)
                    if (#(v76(v216)) > (0)) then
                        table.insert(v215, v217)
                    end
                end
            end
        end)
        return v215
    end
    local function v79(v218)
        pcall(function()
            if writefile then
                writefile(v747, table.concat(v218, "\n"))
            end
        end)
    end
    local function v80(v219)
        local v220 = v76(v219)
        if ((#v220 == 0) or (writefile == nil)) then
            warn("[NOA HUB] profil adı geçersiz ya da executor writefile desteklemiyor")
            return false
        end
        local v221 = pcall(function()
            writefile(v77(v220), v72())
        end)
        if not v221 then
            warn("[NOA HUB] profile yazılamadı: " .. v220)
            return false
        end
        local v222 = v78()
        local v223 = false
        for v224, v225 in ipairs(v222) do
            if (v225 == v220) then
                v223 = true
                break
            end
        end
        if not v223 then
            table.insert(v222, v220)
            v79(v222)
        end
        v75()
        print("[NOA HUB] 💾 profil kaydedildi: " .. v220)
        return true
    end
    local function v81(v226)
        local v227
        local v228
        v227 = v76(v226)
        v228 = false
        pcall(function()
            if (readfile and isfile and isfile(v77(v227))) then
                v73(readfile(v77(v227)) or "")
                for v229, v230 in ipairs(v64) do
                    pcall(v230)
                end
                v71()
            end
        end)
        if v228 then
            v75()
            print("[NOA HUB] 📂 profil yüklendi: " .. v227 .. " — ayarlar menüye işlendi")
        else
            warn("[NOA HUB] profil bulunamadı: " .. v227)
        end
        return v228
    end
    local function v82(v231)
        local v232
        local v233
        local v234
        local v235
        local v236
        v232 = v76(v231)
        v233 = false
        pcall(function()
            if (delfile and isfile and isfile(v77(v232))) then
                delfile(v77(v232))
            end
        end)
        v234 = v78()
        v235, v236 = {}, false
        for v237, v238 in ipairs(v234) do
            if (v238 == v232) then
                v236 = true
            else
                table.insert(v235, v238)
            end
        end
        if v236 then
            v79(v235)
        end
        v75()
        if (v233 or v236) then
            print("[NOA HUB] 🗑 profil silindi: " .. v232)
        else
            print("[NOA HUB] 🗑 silincek profil bulunamadı: " .. v232)
        end
    end
    local function v83()
        if (v748 and v748.Parent) then
            return v748
        end
        v748 = Instance.new("Folder")
        v748.Name = "NoaChamHolder"
        pcall(function()
            v748.Parent = v8
        end)
        return v748
    end
    pcall(function()
        v4.WindowFocused:Connect(function()
        end)
        v4.WindowFocusReleased:Connect(function()
            v749 = os.clock()
        end)
    end)
    local function v84(v239)
        if v239 then
            v750 = {}
            pcall(function()
                local v240
                v240 = v751:FindFirstChildOfClass("Terrain")
                if (v751:FindFirstChildOfClass("Terrain")) then
                    v750.terrain = v240
                    v750.wave = v240.WaterWaveSize
                    v750.waveSp = v240.WaterWaveSpeed
                    v750.refl = v240.WaterReflectance
                    v750.trans = v240.WaterTransparency
                    v240.WaterWaveSize = 0
                    v240.WaterWaveSpeed = 0
                    v240.WaterReflectance = 0
                    v240.WaterTransparency = 0
                end
            end)
            pcall(function()
                local v241
                local v242
                v241, v242 = pcall(function()
                    return settings().Rendering.QualityLevel
                end)
                if (v241 and (v242 ~= nil)) then
                    v750.quality = v242
                end
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)
            print("[NOA HUB] FPS Boost ON: grafik kalitesi + su/dünya efektleri indirildi")
        elseif v750 then
            pcall(function()
                local v243
                v243 = v750.terrain
                if (v243 and v243.Parent) then
                    v243.WaterWaveSize = v750.wave
                    v243.WaterWaveSpeed = v750.waveSp
                    v243.WaterReflectance = v750.refl
                    v243.WaterTransparency = v750.trans
                end
                if (v750.quality ~= nil) then
                    settings().Rendering.QualityLevel = v750.quality
                end
            end)
            v750 = nil
            print("[NOA HUB] FPS Boost OFF: grafik ayarları eski haline döndü")
        end
    end
    _G.NoaHubCleanup = function()
        for v244, v245 in ipairs(v62) do
            pcall(function()
                v245:Disconnect()
            end)
        end
        v62 = {}
        pcall(function()
            if v752 then
                v5.Brightness = v752.Brightness
                v5.ClockTime = v752.ClockTime
                v5.GlobalShadows = v752.GlobalShadows
                v5.OutdoorAmbient = v752.OutdoorAmbient
            end
            if v753 then
                v5.FogEnd = v753.FogEnd
                v5.FogStart = v753.FogStart
                v5.FogColor = v753.FogColor
            end
            pcall(function()
                local v246
                v246 = v7.Character
                if v246 and v246:FindFirstChildOfClass("Humanoid") then
                    if (v754 and (v754 >= (1))) then
                        (v246 and v246:FindFirstChildOfClass("Humanoid")).WalkSpeed = v754
                    else
                        (v246 and v246:FindFirstChildOfClass("Humanoid")).WalkSpeed = 16
                    end
                    if (v755 and (v755 >= (1))) then
                        (v246 and v246:FindFirstChildOfClass("Humanoid")).JumpPower = v755
                    else
                        (v246 and v246:FindFirstChildOfClass("Humanoid")).JumpPower = 50
                    end
                end
            end)
            pcall(function()
                v84(false)
            end)
            pcall(function()
                if v748 then
                    v748:Destroy()
                end
            end)
        end)
    end
    local v85 = Drawing.new("Circle")
    Drawing.new("Circle").Thickness = 1.6
    v85.NumSides = 96
    v85.Radius = 250
    v85.Filled = false
    v85.Color = v9
    v85.Visible = false
    local v86 = Drawing.new("Circle")
    Drawing.new("Circle").Thickness = 2
    v86.NumSides = 40
    v86.Radius = 16
    v86.Filled = false
    v86.Color = v10
    v86.Visible = false
    local v87 = Drawing.new("Text")
    Drawing.new("Text").Size = 12
    v87.Center = true
    v87.Outline = true
    v87.Color = v10
    v87.Text = ""
    v87.Visible = false
    local v88 = {}
    local function v89(v247)
        local v248
        v248 = v88[v247]
        if not v248 then
            v248 = Drawing.new("Triangle")
            v248.Thickness = 1.6
            v248.Filled = true
            v88[v247] = v248
        end
        return v248
    end
    local function v90(v249, v250, v251)
        local v252
        local v253
        local v254
        local v255
        local v256
        local v257
        local v258
        local v259
        local v260
        local v261
        local v262
        local v263
        local v264
        local v265
        local v266
        v756 = v89(v249)
        v252 = v757.ViewportSize
        v253, v254 = v252.X / (2), v252.Y / (2)
        v255, v256 = v250.X - v253, v250.Y - v254
        if ((v250.Z or 0) <= (0)) then
            v255, v256 = -v255, -v256
        end
        v257 = math.sqrt((v255 * v255) + (v256 * v256))
        if (v257 < (1)) then
            v257 = 1
        end
        v255, v256 = v255 / v257, v256 / v257
        v258 = (v252.X / (2)) - (46)
        v259 = (v252.Y / (2)) - (46)
        v260 = ((math.abs(v255) > (0.00009999999997489795)) and (v258 / math.abs(v255))) or math.huge
        v261 = ((math.abs(v256) > (0.0001)) and (v259 / math.abs(v256))) or math.huge
        v262 = math.min(v260, v261)
        v263 = v253 + (v255 * v262)
        v264 = v254 + (v256 * v262)
        v265 = nil
        if (math.abs(v255) < 0.001) then
            v265 = ((v256 > (0)) and (math.pi / 2)) or (-math.pi / (2))
        else
            v265 = math.atan(v256 / v255)
            if (v255 < (0)) then
                v265 = v265 + math.pi
            end
        end
        v266 = 15
        v756.PointA = Vector2.new(v263 + (math.cos(v265) * v266), v264 + (math.sin(v265) * v266))
        v756.PointB = Vector2.new(v263 + (math.cos(v265 + 2.5) * v266 * 0.85), v264 + (math.sin(v265 + 2.5) * v266 * 0.85))
        v756.PointC = Vector2.new(v263 + (math.cos(v265 - (2.5)) * v266 * (0.85)), v264 + (math.sin(v265 - (2.5)) * v266 * 0.85))
    end
    local function v91()
        for v267 = 1, v758 do
            local v268
            v268 = v88[v267]
            if v268 then
                pcall(function()
                    v268.Visible = false
                end)
            end
        end
    end
    local v92 = {}
    local v93 = function()
    end
    local v94 = v13("Frame", {Name = "Main", Size = UDim2.new(0, 960, 0, 640), Position = UDim2.new(0.5, -480, 0.5, -320), BackgroundColor3 = Color3.fromRGB(9, 9, 13), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 100}, (v13("ScreenGui", {Name = "Noa_Ultimate_Menu", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 9990, ZIndexBehavior = Enum.ZIndexBehavior.Sibling}, v8)))
    v13("UICorner", {CornerRadius = UDim.new(0, 14)}, (v13("Frame", {Name = "Main", Size = UDim2.new(0, 960, 0, 640), Position = UDim2.new(0.5, -480, 0.5, -320), BackgroundColor3 = Color3.fromRGB(9, 9, 13), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 100}, (v13("ScreenGui", {Name = "Noa_Ultimate_Menu", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 9990, ZIndexBehavior = Enum.ZIndexBehavior.Sibling}, v8)))))
    local v95 = v13("UIStroke", {Color = v9, Thickness = 1.4, Transparency = 1}, v94)
    local v96 = v13("UIScale", {Scale = 0.9}, v94)
    local function v97(v269, v270, v271, v272, v273, v274)
        local v275
        v275 = v13("Frame", {Name = "Blob" .. v274, Size = UDim2.new(0, v269, 0, v269), Position = UDim2.new(v272, 0, v273, 0), BackgroundColor3 = v270, BackgroundTransparency = v271, BorderSizePixel = 0, ZIndex = 100}, v94)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v275)
        return v275
    end
    local v98 = {v97(380, v9, 0.9300000000000637, -0.18, -0.22, "1"), v97(320, Color3.fromRGB(70, 25, 110), 0.8999999999999773, 0.82, 0.68, "2"), v97(260, Color3.fromRGB(120, 20, 45), 0.8799999999999955, 0.6, -0.12000000000000455, "3")}
    task.spawn(function()
        while v759.Parent do
            for v276, v277 in ipairs(v98) do
                pcall(function()
                    v14(v277, {Position = UDim2.new(math.random(), 0, math.random(), 0)}, math.random(7, 11), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                end)
            end
            task.wait(math.random(7, 11))
        end
    end)
    local v99 = v13("Frame", {Name = "TitleBar", Size = UDim2.new(1, 0, 0, 56), BackgroundColor3 = Color3.fromRGB(13, 13, 18), BorderSizePixel = 0, Active = true, ZIndex = 101}, v94)
    v13("UICorner", {CornerRadius = UDim.new(0, 14)}, (v13("Frame", {Name = "TitleBar", Size = UDim2.new(1, 0, 0, 56), BackgroundColor3 = Color3.fromRGB(13, 13, 18), BorderSizePixel = 0, Active = true, ZIndex = 101}, v94)))
    local v100 = v13("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, v9), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 90, 110)), ColorSequenceKeypoint.new(1, v9)}), Offset = Vector2.new(-1, 0)}, (v13("Frame", {Name = "TitleGlow", Position = UDim2.new(0, 0, 1, -2), Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 102}, v99)))
    task.spawn(function()
        while v759.Parent do
            pcall(function()
                v14(v100, {Offset = Vector2.new(1, 0)}, 3.2, Enum.EasingStyle.Linear)
            end)
            task.wait(3.2)
            pcall(function()
                v100.Offset = Vector2.new(-1, 0)
            end)
            task.wait(1.4000000000000057)
        end
    end)
    local v101 = v13("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, v9), ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, v9)}), Offset = Vector2.new(-1, 0)}, (v13("TextLabel", {Name = "Logo", BackgroundTransparency = 1, Position = UDim2.new(0, 18, 0, 4), Size = UDim2.new(0, 300, 0, 28), Font = Enum.Font.GothamBlack, TextSize = 22, TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left, Text = "NOA.HUB", ZIndex = 103}, v99)))
    task.spawn(function()
        while v759.Parent do
            pcall(function()
                v14(v101, {Offset = Vector2.new(1, 0)}, 2.4, Enum.EasingStyle.Linear)
            end)
            task.wait(2.4000000000000004)
            pcall(function()
                v101.Offset = Vector2.new(-1, 0)
            end)
            task.wait(1.2000000000000455)
        end
    end)
    v13("TextLabel", {Name = "Subtitle", BackgroundTransparency = 1, Position = UDim2.new(0, 18, 0, 32), Size = UDim2.new(0, 420, 0, 14), Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = Color3.fromRGB(130, 130, 145), TextXAlignment = Enum.TextXAlignment.Left, Text = "", ZIndex = 103}, v99)
    local v102 = v13("TextLabel", {Name = "UserBadge", BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -180, 0, 12), Size = UDim2.new(0, 130, 0, 16), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = Color3.fromRGB(215, 215, 225), TextXAlignment = Enum.TextXAlignment.Right, Text = "👤 @" .. v7.Name, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 103}, v99)
    local v103 = v13("TextLabel", {Name = "FpsBadge", BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -46, 0, 12), Size = UDim2.new(0, 60, 0, 16), Font = Enum.Font.Code, TextSize = 11, TextColor3 = v10, TextXAlignment = Enum.TextXAlignment.Right, Text = "FPS 60", ZIndex = 103}, v99)
    local v104 = v13("TextButton", {Name = "MinBtn", Size = UDim2.new(0, 26, 0, 26), Position = UDim2.new(1, -108, 0, 15), BackgroundColor3 = Color3.fromRGB(22, 22, 27), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(160, 160, 175), Text = "–", BorderSizePixel = 0, ZIndex = 103}, v99)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, (v13("TextButton", {Name = "MinBtn", Size = UDim2.new(0, 26, 0, 26), Position = UDim2.new(1, -108, 0, 15), BackgroundColor3 = Color3.fromRGB(22, 22, 27), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(160, 160, 175), Text = "–", BorderSizePixel = 0, ZIndex = 103}, v99)))
    v17(v104)
    local v105 = v13("TextButton", {Name = "CloseBtn", Size = UDim2.new(0, 26, 0, 26), Position = UDim2.new(1, -36, 0, 15), BackgroundColor3 = Color3.fromRGB(24, 12, 16), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(255, 90, 100), Text = "✕", BorderSizePixel = 0, ZIndex = 103}, v99)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, (v13("TextButton", {Name = "CloseBtn", Size = UDim2.new(0, 26, 0, 26), Position = UDim2.new(1, -36, 0, 15), BackgroundColor3 = Color3.fromRGB(24, 12, 16), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(255, 90, 100), Text = "✕", BorderSizePixel = 0, ZIndex = 103}, v99)))
    v17(v105)
    v105.MouseEnter:Connect(function()
        v14(v105, {BackgroundColor3 = v9}, 0.2)
    end)
    v105.MouseLeave:Connect(function()
        v14(v105, {BackgroundColor3 = Color3.fromRGB(24, 12, 16)}, 0.2)
    end)
    do
        local v278
        local v279
        local v280
        v279, v280 = nil
        v63(v99.InputBegan:Connect(function(v281)
            if ((v281.UserInputType == Enum.UserInputType.MouseButton1) or (v281.UserInputType == Enum.UserInputType.Touch)) then
                v279 = v281.Position
                v280 = v94.Position
            end
        end))
        v63(v99.InputEnded:Connect(function(v282)
        end))
        v63(v4.InputChanged:Connect(function(v283)
            if (v278 and ((v283.UserInputType == Enum.UserInputType.MouseMovement) or (v283.UserInputType == Enum.UserInputType.Touch))) then
                local v284
                v284 = v283.Position - v279
                v94.Position = v280 + UDim2.new(0, v284.X, 0, v284.Y)
            end
        end))
    end
    v13("UIGradient", {Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.1), NumberSequenceKeypoint.new(1, 1)})}, (v13("Frame", {Name = "Scan", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(0, 90, 0, 1), BackgroundColor3 = v9, BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 102}, (v13("Frame", {Name = "Divider", Position = UDim2.new(0, 0, 0, 56), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = Color3.fromRGB(38, 38, 48), BorderSizePixel = 0, ZIndex = 101}, v94)))))
    task.spawn(function()
        while v759.Parent do
            v14(v760, {Position = UDim2.new(1, 0, 0.5, 0)}, 2.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(2.75)
            if not v759.Parent then
                break
            end
            v14(v760, {Position = UDim2.new(0, 0, 0.5, 0)}, 2.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(2.75)
        end
    end)
    local v106 = function(v285)
        v61.UI.Open = v285
        v94.Visible = true
        if v285 then
            v4.MouseIconEnabled = true
            v4.MouseBehavior = Enum.MouseBehavior.Default
            v14(v96, {Scale = 1}, 0.4500000000000455, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            v14(v94, {BackgroundTransparency = 0.08}, 0.35)
            v14(v95, {Transparency = 0.35}, 0.4)
        else
            v14(v96, {Scale = 0.9}, 0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            v14(v94, {BackgroundTransparency = 1}, 0.2)
            v14(v95, {Transparency = 1}, 0.2)
            task.delay(0.24, function()
                if not v61.UI.Open then
                    v94.Visible = false
                end
            end)
        end
    end
    v104.MouseButton1Click:Connect(function()
        v106(false)
    end)
    v106(true)
    local v107 = v13("Frame", {Name = "Sidebar", Position = UDim2.new(0, 14, 0, 70), Size = UDim2.new(0, 198, 1, -144), BackgroundColor3 = Color3.fromRGB(13, 13, 18), BorderSizePixel = 0, ZIndex = 101}, v94)
    v13("UICorner", {CornerRadius = UDim.new(0, 12)}, (v13("Frame", {Name = "Sidebar", Position = UDim2.new(0, 14, 0, 70), Size = UDim2.new(0, 198, 1, -144), BackgroundColor3 = Color3.fromRGB(13, 13, 18), BorderSizePixel = 0, ZIndex = 101}, v94)))
    v13("UIStroke", {Color = Color3.fromRGB(40, 40, 50), Thickness = 1}, v107)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, (v13("Frame", {Name = "Glider", Size = UDim2.new(0, 3, 0, 42), Position = UDim2.new(0, 0, 0, 6), BackgroundColor3 = v9, BorderSizePixel = 0, ZIndex = 104}, v107)))
    v13("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, (v13("Frame", {Name = "TabHolder", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ZIndex = 102}, v107)))
    local v108 = v13("Frame", {Name = "Content", Position = UDim2.new(0, 226, 0, 70), Size = UDim2.new(1, -244, 1, -84), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 101}, v94)
    local v109 = {}
    local v110 = {}
    local function v111(v286, v287)
        local v288 = v13("TextButton", {Name = "Tab_" .. v286, Size = UDim2.new(1, 0, 0, 48), BackgroundColor3 = Color3.fromRGB(16, 16, 22), BackgroundTransparency = (v287 and (0.12000000000000455)) or 0.85, Text = "    " .. v68(v286), TextColor3 = (v287 and Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(140, 140, 155), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false, ZIndex = 102}, v761)
        v13("UICorner", {CornerRadius = UDim.new(0, 12)}, v288)
        v70(v288, function()
            return "    " .. v68(v286)
        end)
        local v289 = v13("UIStroke", {Color = (v287 and v9) or Color3.fromRGB(40, 40, 50), Transparency = (v287 and 0.25) or (0.8)}, v288)
        local v290 = v13("ScrollingFrame", {Name = "Page_" .. v286, Size = UDim2.new(1, 0, 1, 0), Position = (v287 and UDim2.new(0, 0, 0, 0)) or UDim2.new(0, 30, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 4, ScrollBarImageColor3 = v9, ScrollBarImageTransparency = 0.6, CanvasSize = UDim2.new(0, 0, 0, 0), Visible = v287, ZIndex = 102}, v108)
        local v291 = v13("Frame", {Name = "LeftCol", Size = UDim2.new(0.48, 0, 1, 0), BackgroundTransparency = 1, ZIndex = 102}, v290)
        local v292 = v13("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 14)}, v291)
        local v293 = v13("Frame", {Name = "RightCol", Size = UDim2.new(0.4800000000000182, 0, 1, 0), Position = UDim2.new(0.5199999999999818, 0, 0, 0), BackgroundTransparency = 1, ZIndex = 102}, v290)
        local v294 = v13("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 14)}, v293)
        local function v295()
            local v298
            local v299
            v298 = v292.AbsoluteContentSize.Y
            v299 = v294.AbsoluteContentSize.Y
            v290.CanvasSize = UDim2.new(0, 0, 0, math.max(v298, v299, 1))
        end
        v292:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v295)
        v294:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v295)
        local v296 = #v109 + (1)
        v288.LayoutOrder = v296
        table.insert(v109, {Btn = v288, Page = v290, Stroke = v289})
        local function v297()
            local v300
            for v301, v302 in ipairs(v109) do
                if v302.Page.Visible then
                    v302.Page.Visible = false
                    v302.Page.Position = UDim2.new(0, 30, 0, 0)
                end
                v14(v302.Btn, {BackgroundTransparency = 0.85, TextColor3 = Color3.fromRGB(140, 140, 155)}, 0.2)
                v14(v302.Stroke, {Color = Color3.fromRGB(40, 40, 50), Transparency = 0.8}, 0.2)
            end
            v14(v288, {BackgroundTransparency = 0.12, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.20000000000004547)
            v14(v289, {Color = v9, Transparency = 0.25}, 0.2)
            v290.Visible = true
            v14(v290, {Position = UDim2.new(0, 0, 0, 0)}, 0.2999999999999545)
            v14(v762, {Position = UDim2.new(0, 0, 0, ((v296 - (1)) * (56)) + 2 + 4)}, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            v300 = v110[v290]
            if v300 then
                for v303, v304 in ipairs(v300) do
                    local v305
                    v305 = v304:FindFirstChildOfClass("UIStroke")
                    task.delay((v303 - 1) * 0.045, function()
                        if v304.Parent then
                            v14(v304, {BackgroundTransparency = 0.25}, 0.25)
                            if v305 then
                                v14(v305, {Transparency = 0.599999999999909}, 0.25)
                            end
                        end
                    end)
                end
            end
        end
        v288.MouseButton1Click:Connect(v297)
        v288.MouseEnter:Connect(function()
            if not v290.Visible then
                v14(v288, {BackgroundTransparency = 0.6199999999998909}, 0.15000000000009095)
            end
        end)
        v288.MouseLeave:Connect(function()
            if not v290.Visible then
                v14(v288, {BackgroundTransparency = 0.85}, 0.2)
            end
        end)
        if v287 then
            task.delay(0.1, v297)
        end
        return v291, v293
    end
    local function v112(v306, v307)
        local v308
        local v309
        local v310
        local v311
        local v312
        local v313
        local v314
        v308 = v13("Frame", {Name = "Card_" .. v307, Size = UDim2.new(1, 0, 0, 0), BackgroundColor3 = Color3.fromRGB(14, 14, 19), BackgroundTransparency = 0.25, ZIndex = 103}, v306)
        v13("UICorner", {CornerRadius = UDim.new(0, 12)}, v308)
        v763 = v13("UIStroke", {Color = Color3.fromRGB(40, 40, 52), Transparency = 0.6}, v308)
        v309 = v306.Parent
        if v309 then
            v110[v309] = v110[v309] or {}
            table.insert(v110[v309], v308)
        end
        v310 = v13("TextLabel", {Name = "CardTitle", Size = UDim2.new(1, -24, 0, 30), Position = UDim2.new(0, 12, 0, 6), BackgroundTransparency = 1, Text = "///  " .. v68(v307), TextColor3 = v9, Font = Enum.Font.GothamBlack, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 103}, v308)
        v70(v310, function()
            return "///  " .. v68(v307)
        end)
        v311 = v13("Frame", {Name = "CardDivider", Size = UDim2.new(1, -24, 0, 1), Position = UDim2.new(0, 12, 0, 40), BackgroundColor3 = Color3.fromRGB(35, 35, 46), BorderSizePixel = 0, ZIndex = 103}, v308)
        v312 = v13("Frame", {Name = "CardAccent", Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = v9, BorderSizePixel = 0, ZIndex = 103}, v311)
        v14(v312, {Size = UDim2.new(0.3, 0, 1, 0)}, 0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        v313 = v13("Frame", {Name = "CardContent", Size = UDim2.new(1, -24, 0, 0), Position = UDim2.new(0, 12, 0, 52), BackgroundTransparency = 1, ZIndex = 103}, v308)
        v314 = v13("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 12)}, v313)
        v314:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            v313.Size = UDim2.new(1, -24, 0, v314.AbsoluteContentSize.Y)
            v308.Size = UDim2.new(1, 0, 0, v314.AbsoluteContentSize.Y + 12 + 52)
        end)
        return v313
    end
    local function v113(v315, v316, v317, v318)
        local v319
        local v320
        local v321
        local v322
        local v323
        local v324
        v319 = v13("TextButton", {Name = "T_" .. v318, Size = UDim2.new(1, 0, 0, 31), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 104}, v315)
        v320 = v13("TextLabel", {Name = "Label", Size = UDim2.new(1, -64, 1, 0), BackgroundTransparency = 1, Text = v68(v316), TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamMedium, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 104}, v319)
        v69(v320, v316)
        v321 = v13("Frame", {Name = "Switch", Size = UDim2.new(0, 44, 0, 22), Position = UDim2.new(1, -44, 0.5, -11), BackgroundColor3 = (v61[v317][v318] and v9) or Color3.fromRGB(32, 32, 42), BorderSizePixel = 0, ZIndex = 105}, v319)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v321)
        v322 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70), Transparency = 0.4}, v321)
        v323 = v13("Frame", {Name = "Knob", Size = UDim2.new(0, 16, 0, 16), Position = (v61[v317][v318] and UDim2.new(0, 25, 0.5, -8)) or UDim2.new(0, 3, 0.5, -8), BackgroundColor3 = (v61[v317][v318] and Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(95, 95, 110), BorderSizePixel = 0, ZIndex = 106}, v321)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v323)
        v324 = nil
        function v324()
            local v325
            v325 = v61[v317][v318]
            v14(v323, {Position = (v325 and UDim2.new(0, 25, 0.5, -8)) or UDim2.new(0, 3, 0.5, -8)}, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            v14(v321, {BackgroundColor3 = (v325 and v9) or Color3.fromRGB(32, 32, 42)}, 0.2)
            v14(v323, {BackgroundColor3 = (v325 and Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(95, 95, 110)}, 0.2)
        end
        table.insert(v64, v324)
        v319.MouseButton1Click:Connect(function()
            v61[v317][v318] = not v61[v317][v318]
            v324()
        end)
        v319.MouseEnter:Connect(function()
            v14(v322, {Color = v9, Transparency = 0.2999999999999545}, 0.15)
        end)
        v319.MouseLeave:Connect(function()
            v14(v322, {Color = Color3.fromRGB(55, 55, 70), Transparency = 0.4}, 0.2)
        end)
        v18(v319)
        return v324
    end
    local function v114(v326, v327, v328, v329, v330, v331, v332, v333)
        local v334
        local v335
        local v336
        local v337
        local v338
        local v339
        local v340
        local v341
        local v342
        local v343
        local v344
        v334 = v13("Frame", {Name = "S_" .. v329, Size = UDim2.new(1, 0, 0, 54), BackgroundTransparency = 1, ZIndex = 104}, v326)
        v335 = v13("TextLabel", {Name = "Label", Size = UDim2.new(1, -60, 0, 17), BackgroundTransparency = 1, Text = v68(v327), TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamMedium, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 104}, v334)
        v69(v335, v327)
        v336 = v13("Frame", {Name = "ValChip", Size = UDim2.new(0, 52, 0, 18), Position = UDim2.new(1, -52, 0, 0), BackgroundColor3 = Color3.fromRGB(26, 26, 34), BorderSizePixel = 0, ZIndex = 104}, v334)
        v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v336)
        v764 = v13("TextLabel", {Name = "ValText", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, TextColor3 = v9, Font = Enum.Font.GothamBold, TextSize = 10, ZIndex = 105}, v336)
        v337 = v13("TextButton", {Name = "Track", Size = UDim2.new(1, 0, 0, 6), Position = UDim2.new(0, 0, 0, 34), BackgroundColor3 = Color3.fromRGB(22, 22, 30), Text = "", AutoButtonColor = false, ZIndex = 105}, v334)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v337)
        v338 = nil
        function v338(v345)
            if not v333 then
                return math.floor(v345 + 0.5)
            end
            return math.floor((v345 / v333) + 0.5) * v333
        end
        v339 = math.clamp((v61[v328][v329] - v330) / (v331 - v330), 0, 1)
        v340 = v13("Frame", {Name = "Fill", Size = UDim2.new(v339, 0, 1, 0), BackgroundColor3 = v9, BorderSizePixel = 0, ZIndex = 106}, v337)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v340)
        v13("UIGradient", {Color = ColorSequence.new(v9, Color3.fromRGB(255, 85, 110))}, v340)
        v341 = v13("Frame", {Name = "Thumb", Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(v339, -7, 0.5, -7), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.3499999999999943, BorderSizePixel = 0, ZIndex = 107}, v337)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v341)
        v764.Text = (v332 and v332(v61[v328][v329])) or tostring(v61[v328][v329])
        v342 = nil
        function v342()
            local v346 = tonumber(v61[v328][v329]) or v330
            local v347 = math.clamp((v346 - v330) / (v331 - v330), 0, 1)
            v14(v340, {Size = UDim2.new(v347, 0, 1, 0)}, 0.1)
            v14(v341, {Position = UDim2.new(v347, -7, 0.5, -7)}, 0.09999999999990905)
            v764.Text = (v332 and v332(v346)) or tostring(v346)
        end
        table.insert(v64, v342)
        v343 = false
        v344 = nil
        function v344(v348)
            local v349
            local v350
            local v351
            v349 = math.clamp((v348.Position.X - v337.AbsolutePosition.X) / v337.AbsoluteSize.X, 0, 1)
            v350 = v338(v330 + ((v331 - v330) * v349))
            v61[v328][v329] = v350
            v351 = math.clamp((v350 - v330) / (v331 - v330), 0, 1)
            v14(v340, {Size = UDim2.new(v351, 0, 1, 0)}, 0.06)
            v14(v341, {Position = UDim2.new(v351, -7, 0.5, -7)}, 0.06)
            v764.Text = (v332 and v332(v350)) or tostring(v350)
        end
        v337.InputBegan:Connect(function(v352)
            if (v352.UserInputType == Enum.UserInputType.MouseButton1) then
                v344(v352)
            end
        end)
        v63(v4.InputEnded:Connect(function(v353)
        end))
        v63(v4.InputChanged:Connect(function(v354)
            if (v343 and ((v354.UserInputType == Enum.UserInputType.MouseMovement) or (v354.UserInputType == Enum.UserInputType.Touch))) then
                v344(v354)
            end
        end))
        v337.MouseEnter:Connect(function()
            v14(v341, {BackgroundTransparency = 0}, 0.12)
            v14(v337, {Size = UDim2.new(1, 0, 0, 8)}, 0.12)
        end)
        v337.MouseLeave:Connect(function()
            if not v343 then
                v14(v341, {BackgroundTransparency = 0.35}, 0.2)
                v14(v337, {Size = UDim2.new(1, 0, 0, 6)}, 0.2)
            end
        end)
    end
    local v115 = v13("Frame", {Name = "DropdownLayer", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = false, ZIndex = 300}, v94)
    local function v116(v355, v356, v357, v358, v359)
        local v360 = v13("Frame", {Name = "D_" .. v358, Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 104}, v355)
        local v361 = v13("TextLabel", {Name = "Label", Size = UDim2.new(1, -124, 1, 0), BackgroundTransparency = 1, Text = v68(v356), TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamMedium, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 104}, v360)
        v69(v361, v356)
        local v362 = false
        local v363 = nil
        local v364 = nil
        local v365 = (#v359 * 24) + (12)
        local v366 = v13("TextButton", {Name = "DropBtn", Size = UDim2.new(0, 112, 0, 24), Position = UDim2.new(1, -112, 0, 3), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(235, 235, 240), Text = v68(tostring(v61[v357][v358])), AutoButtonColor = false, ZIndex = 105}, v360)
        v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v366)
        local v367 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v366)
        v70(v366, function()
            return tostring(v61[v357][v358])
        end)
        local function v368()
            v366.Text = v68(tostring(v61[v357][v358]))
        end
        table.insert(v64, v368)
        local function v369(v371)
            v362 = false
            if v364 then
                v364:Destroy()
                v364 = nil
            end
            if v363 then
                v14(v363, {Size = UDim2.new(0, 112, 0, 0)}, (v371 and (0.12)) or (0.2), Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            end
        end
        local function v370()
            if not v363 then
                v363 = v13("Frame", {Name = "DropList_" .. v358, AnchorPoint = Vector2.new(1, 0), Size = UDim2.new(0, 112, 0, 0), BackgroundColor3 = Color3.fromRGB(18, 18, 26), BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 302}, v115)
                v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v363)
                v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70), Transparency = 0.3}, v363)
                v13("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder}, v363)
                v13("UIPadding", {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6)}, v363)
                for v374, v375 in ipairs(v359) do
                    local v376
                    v376 = v13("TextButton", {Name = "Opt", Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = Color3.fromRGB(170, 170, 185), Text = v68(tostring(v375)), AutoButtonColor = false, LayoutOrder = v374, ZIndex = 303}, v363)
                    v69(v376, tostring(v375))
                    v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v376)
                    v376.MouseEnter:Connect(function()
                        v14(v376, {BackgroundColor3 = Color3.fromRGB(34, 14, 20), TextColor3 = Color3.new(1, 1, 1)}, 0.12)
                    end)
                    v376.MouseLeave:Connect(function()
                        v14(v376, {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(170, 170, 185)}, 0.2)
                    end)
                    v376.MouseButton1Click:Connect(function()
                        v61[v357][v358] = v375
                        v366.Text = v68(tostring(v375))
                        v369(true)
                    end)
                end
            end
            local v372 = v366.AbsolutePosition - v115.AbsolutePosition
            local v373 = v372.X + v366.AbsoluteSize.X
            if ((v372.Y + v366.AbsoluteSize.Y + (2) + v365) > v115.AbsoluteSize.Y) then
                v363.AnchorPoint = Vector2.new(1, 1)
                v363.Position = UDim2.fromOffset(v373, v372.Y - (4))
            else
                v363.AnchorPoint = Vector2.new(1, 0)
                v363.Position = UDim2.fromOffset(v373, v372.Y + v366.AbsoluteSize.Y + 2)
            end
            if v364 then
                v364:Destroy()
                v364 = nil
            end
            v364 = v13("TextButton", {Name = "ClickAway", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 301}, v115)
            v364.MouseButton1Click:Connect(function()
                v369(false)
            end)
            v14(v363, {Size = UDim2.new(0, 112, 0, v365)}, 0.26, Enum.EasingStyle.Quad)
            v362 = true
        end
        v366.MouseButton1Click:Connect(function()
            if v362 then
                v369(true)
            else
                v370()
            end
        end)
        v366.MouseEnter:Connect(function()
            v14(v367, {Color = v9, Transparency = 0.2}, 0.15)
        end)
        v366.MouseLeave:Connect(function()
            v14(v367, {Color = Color3.fromRGB(55, 55, 70), Transparency = 0}, 0.2)
        end)
    end
    local function v117(v377, v378, v379, v380)
        local v381 = v13("Frame", {Name = "K_" .. v380, Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 104}, v377)
        local v382 = v13("TextLabel", {Name = "Label", Size = UDim2.new(1, -112, 1, 0), BackgroundTransparency = 1, Text = v68(v378), TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamMedium, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 104}, v381)
        v69(v382, v378)
        local v383 = v13("TextButton", {Name = "KeyBtn", Size = UDim2.new(0, 100, 0, 24), Position = UDim2.new(1, -100, 0.5, -12), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(215, 215, 225), Text = v61[v379][v380].Name, AutoButtonColor = false, ZIndex = 105}, v381)
        v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v383)
        local v384 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v383)
        local function v385()
            pcall(function()
                v383.Text = v61[v379][v380].Name
            end)
        end
        table.insert(v64, v385)
        local v386 = false
        v383.MouseButton1Click:Connect(function()
            local v387
            v383.Text = ". . ."
            v383.TextColor3 = v9
            v14(v384, {Color = v9}, 0.2)
            task.spawn(function()
                while v386 do
                    v14(v384, {Transparency = 0.15}, 0.4)
                    task.wait(0.4)
                    if not v386 then
                        break
                    end
                    v14(v384, {Transparency = 0.7}, 0.39999999999997726)
                    task.wait(0.4)
                end
            end)
            v387 = v4.InputBegan:Connect(function(v388)
                if (v388.UserInputType == Enum.UserInputType.Keyboard) then
                    v61[v379][v380] = v388.KeyCode
                    v383.Text = v388.KeyCode.Name
                    v383.TextColor3 = Color3.fromRGB(215, 215, 225)
                    v14(v384, {Color = Color3.fromRGB(55, 55, 70), Transparency = 0}, 0.2)
                    v387:Disconnect()
                end
            end)
        end)
        v17(v383)
        v18(v383)
    end
    local function v118(v389, v390, v391)
        local v392
        local v393
        v392 = v13("TextButton", {Name = "Btn", Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(215, 215, 225), Text = v68(v390), AutoButtonColor = false, ZIndex = 105}, v389)
        v69(v392, v390)
        v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v392)
        v393 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v392)
        v392.MouseButton1Click:Connect(function()
            v14(v393, {Color = v9}, 0.12)
            task.delay(0.25, function()
                if v393.Parent then
                    v14(v393, {Color = Color3.fromRGB(55, 55, 70)}, 0.3)
                end
            end)
            pcall(v391)
        end)
        v17(v392)
        v18(v392)
    end
    local function v119(v394, v395)
        local v396
        local v397
        local v398
        local v399
        v396 = v13("Frame", {Name = "TxBox_" .. v395, Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 104}, v394)
        v397 = v13("TextBox", {Name = "Box", Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Text = "", PlaceholderText = v68(v395), PlaceholderColor3 = Color3.fromRGB(120, 120, 135), ClearTextOnFocus = false, Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = Color3.fromRGB(230, 230, 240), TextXAlignment = Enum.TextXAlignment.Left, ClipsDescendants = true, ZIndex = 105}, v396)
        v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v397)
        v13("UIPadding", {PaddingLeft = UDim.new(0, 8)}, v397)
        v398 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v397)
        v63(v397.Focused:Connect(function()
            v14(v398, {Color = v9}, 0.15)
        end))
        v63(v397.FocusLost:Connect(function()
            v14(v398, {Color = Color3.fromRGB(55, 55, 70)}, 0.2)
        end))
        v69(v397, v395)
        v399 = nil
        function v399()
            pcall(function()
                v397.PlaceholderText = v68(v395)
            end)
        end
        table.insert(v64, v399)
        return v397
    end
    local function v120()
        pcall(function()
            v93()
        end)
        pcall(function()
            _G.NoaHubCleanup()
        end)
        pcall(function()
            v85:Remove()
        end)
        pcall(function()
            v86:Remove()
        end)
        pcall(function()
            v87:Remove()
        end)
        for v400 = 1, v758 do
            local v401
            v401 = v88[v400]
            if v401 then
                pcall(function()
                    v401:Remove()
                end)
            end
        end
        pcall(function()
            v759:Destroy()
        end)
        print("[NOA HUB] kapatıldı")
    end
    local v121, v122 = v111("🎯 COMBAT", true)
    local v123 = v112(v121, "AIMBOT — LOCK")
    v113(v112(v121, "AIMBOT — LOCK"), "Toggle Aimbot", "Aimbot", "Enabled")
    v116(v123, "Lock Mode", "Aimbot", "ActivationMode", {"Automatic", "Right Click", "Key (E)"})
    v116(v123, "Aim Part (Hitbox)", "Aimbot", "HitPart", {"Head", "Torso", "Nearest"})
    v114(v123, "Smoothness", "Aimbot", "Smoothness", 0.01, 0.6, function(v402)
        return string.format("%.2f", v402)
    end, 0.01)
    v114(v123, "Forward Prediction", "Aimbot", "PredictionMs", 0, 200, function(v403)
        return string.format("%d ms", v403)
    end)
    local v124 = v112(v121, "TARGET SELECTION")
    v116(v112(v121, "TARGET SELECTION"), "Target Priority", "Aimbot", "Priority", {"Closest (Screen)", "Lowest HP", "Closest (World)"})
    v116(v124, "Target Filter", "Aimbot", "TargetFilter", {"Everyone", "Players Only"})
    local v125 = v112(v122, "FILTERS & PROTECTION")
    v113(v112(v122, "FILTERS & PROTECTION"), "Wall Check (Skip Behind Walls)", "Aimbot", "WallCheck")
    v113(v125, "Team Check (Skip Teammates)", "Aimbot", "TeamCheck")
    v113(v125, "Target Indicator", "Aimbot", "TargetInfo")
    local v126 = v112(v122, "FOV & KEYS")
    v113(v112(v122, "FOV & KEYS"), "Show FOV Circle", "Aimbot", "ShowFOV")
    v114(v126, "FOV Radius", "Aimbot", "FOV", 20, 1000)
    v114(v126, "Aimbot Max Distance", "Aimbot", "MaxDistance", 100, 5000)
    v117(v126, "Aim Key (Hold)", "Aimbot", "HoldKey")
    local v127 = v112(v122, "TRIGGERBOT (AUTO FIRE)")
    v113(v112(v122, "TRIGGERBOT (AUTO FIRE)"), "Triggerbot", "Triggerbot", "Enabled")
    v114(v127, "Fire Delay", "Triggerbot", "Delay", 5, 500, function(v404)
        return string.format("%d ms", v404)
    end)
    v113(v127, "Only Fire When Visible", "Triggerbot", "VisibilityCheck")
    local v128, v129 = v111("👁 VISUALS", false)
    local v130 = v112(v128, "ESP — CORE")
    v113(v112(v128, "ESP — CORE"), "ESP Master", "Visuals", "Enabled")
    v113(v130, "Box", "Visuals", "Box")
    v116(v130, "Box Style", "Visuals", "BoxStyle", {"Normal", "Corner", "Filled"})
    v113(v130, "Health Bar", "Visuals", "HealthBar")
    v113(v130, "Health Percent", "Visuals", "HealthText")
    local v131 = v112(v128, "ESP — INFO")
    v113(v112(v128, "ESP — INFO"), "Name", "Visuals", "NameESP")
    v113(v131, "Distance • HP • Weapon", "Visuals", "InfoLine")
    v113(v131, "Team Colors", "Visuals", "TeamColors")
    v113(v131, "Hide Teammates (Team Check)", "Visuals", "TeamCheck")
    local v132 = v112(v129, "ESP — EXTRA LAYERS")
    v113(v112(v129, "ESP — EXTRA LAYERS"), "Chams (Box Fill)", "Visuals", "Chams")
    v113(v132, "Skeleton (Bones)", "Visuals", "Skeleton")
    v113(v132, "Tracer (Bottom Line)", "Visuals", "Tracer")
    v113(v132, "Head Dot", "Visuals", "HeadDot")
    local v133 = v112(v129, "ESP — ADVANCED")
    v114(v112(v129, "ESP — ADVANCED"), "ESP Max Distance", "Visuals", "MaxDistance", 50, 2000, function(v405)
        return string.format("%d m", v405)
    end)
    v114(v133, "Box Thickness", "Visuals", "BoxThickness", 1, 5, function(v406)
        return string.format("%d px", v406)
    end)
    v114(v133, "Text Size", "Visuals", "TextSize", 9, 20, function(v407)
        return string.format("%d pt", v407)
    end)
    v113(v133, "Only Draw Visible Players", "Visuals", "VisibilityCheck")
    v113(v133, "Off-Screen Arrows", "Visuals", "OffscreenArrows")
    v113(v133, "Game Compat (BRM5 rigs)", "Visuals", "GameCompat")
    local v134, v135 = v111("🏃 MOVEMENT", false)
    local v136 = v112(v134, "CHARACTER")
    v113(v112(v134, "CHARACTER"), "WalkSpeed Toggle", "Movement", "EnableSpeed")
    v114(v136, "WalkSpeed", "Movement", "WalkSpeed", 16, 250, function(v408)
        return string.format("%d", v408)
    end)
    v113(v136, "JumpPower Toggle", "Movement", "EnableJump")
    v114(v136, "JumpPower", "Movement", "JumpPower", 50, 400, function(v409)
        return string.format("%d", v409)
    end)
    local v137 = v112(v135, "ADVANCED MOVEMENT")
    v113(v112(v135, "ADVANCED MOVEMENT"), "Infinite Jump", "Movement", "InfiniteJump")
    v113(v137, "Noclip (Pass Through Walls)", "Movement", "Noclip")
    v113(v137, "Fly", "Movement", "Fly")
    v114(v137, "Fly Speed", "Movement", "FlySpeed", 20, 400, function(v410)
        return string.format("%d", v410)
    end)
    local v138, v139 = v111("🌐 WORLD", false)
    local v140 = v112(v138, "WORLD & LIGHT")
    v113(v112(v138, "WORLD & LIGHT"), "Fullbright (Light Everything)", "World", "Fullbright")
    v113(v140, "Remove Fog", "World", "NoFog")
    v113(v140, "FPS Boost (Lag Fix)", "World", "FPSBoost")
    v113(v140, "Anti-AFK (No Idle Kick)", "World", "AntiAFK")
    v69(v13("TextLabel", {Name = "WldHint", Size = UDim2.new(1, 0, 0, 64), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = Color3.fromRGB(150, 150, 165), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = v68("- The aimbot lock range is the FOV circle\n- Profiles + language live in the ⚙ SETTINGS tab\n- F8 = panic key: everything off + world restored")}, (v112(v139, "GETTING STARTED"))), "- The aimbot lock range is the FOV circle\n- Profiles + language live in the ⚙ SETTINGS tab\n- F8 = panic key: everything off + world restored")
    local v141, v142 = v111("⚙ SETTINGS", false)
    local v143 = v112(v141, "PROFILES")
    local v144 = v119((v112(v141, "PROFILES")), "Type a profile name...")
    v118(v143, "💾 Save Profile", function()
        v80(v144.Text)
        v144.Text = ""
    end)
    local v145 = v112(v141, "SAVED PROFILES")
    do
        local function v411()
            pcall(function()
                for v413, v414 in ipairs(v145:GetChildren()) do
                    if not v414:IsA("UIListLayout") then
                        v414:Destroy()
                    end
                end
                local v412 = v78()
                if (#(v78()) == (0)) then
                    v69((v13("TextLabel", {Name = "P_Empty", Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = Color3.fromRGB(120, 120, 135), TextXAlignment = Enum.TextXAlignment.Left, Text = v68("-- no profiles yet — save one above")}, v145)), "-- no profiles yet — save one above")
                end
                for v415, v416 in ipairs(v412) do
                    local v417
                    local v418
                    local v419
                    v417 = v13("Frame", {Name = "P_" .. v416, Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, LayoutOrder = v415, ZIndex = 104}, v145)
                    v13("TextLabel", {Name = "PLbl", Size = UDim2.new(1, -172, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.fromRGB(225, 225, 235), TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = v416}, (v13("Frame", {Name = "P_" .. v416, Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, LayoutOrder = v415, ZIndex = 104}, v145)))
                    v418 = v13("TextButton", {Name = "PLoad", Size = UDim2.new(0, 80, 0, 24), Position = UDim2.new(1, -164, 0.5, -12), BackgroundColor3 = Color3.fromRGB(18, 30, 22), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = v10, Text = v68("Load"), AutoButtonColor = false, ZIndex = 105}, v417)
                    v69(v13("TextButton", {Name = "PLoad", Size = UDim2.new(0, 80, 0, 24), Position = UDim2.new(1, -164, 0.5, -12), BackgroundColor3 = Color3.fromRGB(18, 30, 22), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = v10, Text = v68("Load"), AutoButtonColor = false, ZIndex = 105}, v417), "Load")
                    v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v418)
                    v419 = v13("TextButton", {Name = "PDel", Size = UDim2.new(0, 78, 0, 24), Position = UDim2.new(1, -78, 0.5, -12), BackgroundColor3 = Color3.fromRGB(30, 16, 20), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = v9, Text = v68("Delete"), AutoButtonColor = false, ZIndex = 105}, v417)
                    v69(v13("TextButton", {Name = "PDel", Size = UDim2.new(0, 78, 0, 24), Position = UDim2.new(1, -78, 0.5, -12), BackgroundColor3 = Color3.fromRGB(30, 16, 20), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = v9, Text = v68("Delete"), AutoButtonColor = false, ZIndex = 105}, v417), "Delete")
                    v13("UICorner", {CornerRadius = UDim.new(0, 6)}, v419)
                    v418.MouseButton1Click:Connect(function()
                        v81(v416)
                    end)
                    v419.MouseButton1Click:Connect(function()
                        v82(v416)
                    end)
                    v17(v418)
                    v17(v419)
                    v18(v418)
                    v18(v419)
                end
            end)
        end
        table.insert(v74, v411)
        task.defer(v411)
    end
    local v146 = v112(v142, "LANGUAGE & MENU")
    v118(v112(v142, "LANGUAGE & MENU"), "🌐 English (EN)", function()
        v61.UI.Language = "EN"
        v71()
        for v420, v421 in ipairs(v74) do
            pcall(v421)
        end
        print("[NOA HUB] 🌐 language = EN")
    end)
    v118(v146, "🌐 Türkçe (TR)", function()
        v61.UI.Language = "TR"
        v71()
        for v422, v423 in ipairs(v74) do
            pcall(v423)
        end
        print("[NOA HUB] 🌐 dil = TR")
    end)
    v117(v146, "Menu Open/Close Key", "UI", "Key")
    v118(v146, "🧹 Clear ESP Cache", function()
        v93()
    end)
    v118(v146, "🗑 Quit Hub", function()
        v120()
    end)
    v63(v4.InputBegan:Connect(function(v424, v425)
        if (not v425 and (v424.KeyCode == v61.UI.Key)) then
            v106(not v61.UI.Open)
        end
    end))
    v63(v4.InputBegan:Connect(function(v426, v427)
    end))
    v63(v4.InputEnded:Connect(function(v428)
    end))
    v63(v4.InputBegan:Connect(function(v429, v430)
        if (not v430 and (v429.KeyCode == Enum.KeyCode.Space) and v61.Movement.InfiniteJump) then
            local v431
            v431 = v7.Character
            if v431 and v431:FindFirstChildOfClass("Humanoid") then
                (v431 and v431:FindFirstChildOfClass("Humanoid")):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end))
    v63(v7.CharacterAdded:Connect(function()
        v93()
    end))
    v63(v4.InputBegan:Connect(function(v432, v433)
        if (v432.KeyCode == Enum.KeyCode.F8) then
            print("[NOA HUB] 🆘 PANİK: tüm modüller kapatıldı, dünya eski hale getirildi")
            pcall(function()
                local v434
                v61.Aimbot.Enabled = false
                v61.Triggerbot.Enabled = false
                v61.Visuals.Enabled = false
                v61.Movement.EnableSpeed = false
                v61.Movement.EnableJump = false
                v61.Movement.InfiniteJump = false
                v61.Movement.Noclip = false
                v61.Movement.Fly = false
                v61.World.Fullbright = false
                v61.World.NoFog = false
                v61.World.FPSBoost = false
                v61.World.AntiAFK = false
                v84(false)
                v434 = v7.Character
                if v434 and v434:FindFirstChildOfClass("Humanoid") then
                    if (v754 and (v754 >= 1)) then
                        (v434 and v434:FindFirstChildOfClass("Humanoid")).WalkSpeed = v754
                    else
                        (v434 and v434:FindFirstChildOfClass("Humanoid")).WalkSpeed = 16
                    end
                    if (v755 and (v755 >= 1)) then
                        (v434 and v434:FindFirstChildOfClass("Humanoid")).JumpPower = v755
                    else
                        (v434 and v434:FindFirstChildOfClass("Humanoid")).JumpPower = 50
                    end
                end
            end)
            v93()
        end
    end))
    do
        local v435, v436 = pcall(function()
            return game:GetService("VirtualUser")
        end)
        v63(v7.Idled:Connect(function()
            if (v61.World.AntiAFK and v435 and v436) then
                pcall(function()
                    v436:CaptureController()
                    v436:ClickButton2(Vector2.new())
                end)
            end
        end))
    end
    print("[NOA HUB] ·· menü çatısı kuruldu, ESP + aimbot motoru kuruluyor")
    local function v147(v437)
        local v438
        v438 = v92[v437]
        if v438 then
            for v439, v440 in ipairs({"BoxOutline", "Box", "HealthBg", "HealthFill", "HealthPct", "NameTxt", "InfoTxt", "Snapline", "HeadDot"}) do
                local v441
                v441 = v438[v440]
                if v441 then
                    pcall(function()
                        v441.Visible = false
                        v441:Remove()
                    end)
                end
            end
            for v442, v443 in ipairs(v438.CornerLines or {}) do
                pcall(function()
                    v443.Visible = false
                    v443:Remove()
                end)
            end
            for v444, v445 in ipairs(v438.SkelLines or {}) do
                pcall(function()
                    v445.Visible = false
                    v445:Remove()
                end)
            end
            if v438.Highlight then
                pcall(function()
                    v438.Highlight:Destroy()
                end)
            end
            v92[v437] = nil
        end
    end
    function v93()
        for v446 in pairs(v92) do
            v147(v446)
        end
        pcall(function()
            v86.Visible = false
            v87.Visible = false
        end)
        pcall(v91)
    end
    local function v148(v447)
        if not v92[v447] then
            local v448
            v448 = {
                BoxOutline = Drawing.new("Square"),
                Box = Drawing.new("Square"),
                HealthBg = Drawing.new("Square"),
                HealthFill = Drawing.new("Square"),
                NameTxt = Drawing.new("Text"),
                InfoTxt = Drawing.new("Text"),
                Snapline = Drawing.new("Line"),
                CornerLines = {},
                SkelLines = {},
            }
            v448.BoxOutline.Thickness = 3
            v448.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
            v448.BoxOutline.Filled = false
            v448.Box.Thickness = 1.4
            v448.Box.Filled = false
            v448.HealthBg.Thickness = 1
            v448.HealthBg.Color = Color3.fromRGB(15, 15, 20)
            v448.HealthBg.Filled = true
            v448.HealthFill.Thickness = 1
            v448.HealthFill.Filled = true
            v448.NameTxt.Size = 13
            v448.NameTxt.Color = Color3.new(1, 1, 1)
            v448.NameTxt.Center = true
            v448.NameTxt.Outline = true
            v448.InfoTxt.Size = 11
            v448.InfoTxt.Color = Color3.fromRGB(225, 225, 235)
            v448.InfoTxt.Center = true
            v448.InfoTxt.Outline = true
            v448.HealthPct = Drawing.new("Text")
            v448.HealthPct.Size = 10
            v448.HealthPct.Color = Color3.new(1, 1, 1)
            v448.HealthPct.Center = true
            v448.HealthPct.Outline = true
            v448.Snapline.Thickness = 1
            v448.Snapline.Color = v9
            v92[v447] = v448
        end
        return v92[v447]
    end
    local function v149(v449, v450)
        local v451
        v451 = v449.CornerLines[v450]
        if not v451 then
            v451 = Drawing.new("Line")
            v451.Thickness = 2
            v449.CornerLines[v450] = v451
        end
        return v451
    end
    local function v150(v452, v453)
        local v454
        v454 = v452.SkelLines[v453]
        if not v454 then
            v454 = Drawing.new("Line")
            v454.Thickness = 1
            v452.SkelLines[v453] = v454
        end
        return v454
    end
    local function v151(v455)
        local v456
        if not v455 then
            return nil
        end
        v456 = {"Head", "head", "Hitbox", "FakeHead", "Brain", "UpperTorso", "HumanoidRootPart"}
        for v457, v458 in ipairs(v456) do
            local v459
            v459 = v455:FindFirstChild(v458)
            if (v459 and v459:IsA("BasePart")) then
                return v459
            end
        end
        return v455:FindFirstChildOfClass("BasePart")
    end
    local function v152()
        local v460
        local v461
        v460 = v7.Character
        if v460 then
            local v462
            v462 = v460:FindFirstChild("HumanoidRootPart") or v460:FindFirstChild("Head") or v460:FindFirstChild("Torso") or v460:FindFirstChild("UpperTorso") or v151(v460)
            if v462 then
                return v462.Position
            end
        end
        v461 = v751.CurrentCamera or v757
        if v461 then
            return v461.CFrame.Position
        end
        return Vector3.new(0, 0, 0)
    end
    local function v153(v463)
        if (v463 and v463:IsA("BasePart")) then
            return v463
        end
        return nil
    end
    local function v154(v464)
        local v465
        local v466
        if not v464 then
            return true
        end
        if (v464.Health <= (0)) then
            return true
        end
        v465, v466 = pcall(function()
            return v464:GetState()
        end)
        if (v465 and (v466 == Enum.HumanoidStateType.Dead)) then
            return true
        end
        return false
    end
    local function v155(v467)
        local v468
        local v469
        local v470
        if not v467 then
            return nil, false
        end
        v468 = v467:FindFirstChildOfClass("Humanoid")
        if v468 then
            return v468, true
        end
        v469, v470 = pcall(function()
            return v467:FindFirstChildWhichIsA("Humanoid", true)
        end)
        if (v469 and v470) then
            return v470, false
        end
        return nil, false
    end
    local v156 = {Male = true, Female = true, NPCS = true}
    local function v157(v471)
        if not v61.Visuals.GameCompat then
            return false
        end
        if (not v471 or not v471:IsA("Model")) then
            return false
        end
        return v156[v471.Name] == true
    end
    local function v158(v472)
        local v473
        local v474
        local v475
        if (not v472 or not v472:IsA("Model") or (v472 == v7.Character) or not v472.Parent) then
            return false
        end
        v473, v474 = v155(v472)
        v475 = v151(v472)
        if (not v473 or not v475) then
            return false
        end
        if (v474 and v154(v473)) then
            return false
        end
        return true
    end
    local function v159(v476)
        local v477
        local v478
        local v479
        local v480
        if (not v476 or not v476:IsA("Model") or (v476 == v7.Character) or not v476.Parent) then
            return false
        end
        if v476:FindFirstChildOfClass("Humanoid") then
            return false
        end
        v477 = v151(v476)
        if not v477 then
            return false
        end
        v478 = 0
        for v481, v482 in ipairs(v476:GetChildren()) do
            if v482:IsA("BasePart") then
                v478 = v478 + 1
                if (v478 >= 2) then
                    break
                end
            end
        end
        if (v478 < (2)) then
            return false
        end
        v479, v480 = pcall(function()
            return v476:GetExtentsSize()
        end)
        if (not v479 or (v480.Magnitude > (40))) then
            return false
        end
        return true
    end
    local function v160()
        local v483
        local v484
        local v485
        v483 = os.clock()
        if (v765 and ((v483 - v766) < v767)) then
            return v765
        end
        v766 = v483
        if (not v61.Visuals.Enabled and not v61.Aimbot.Enabled and not v61.Triggerbot.Enabled) then
            v765 = {}
            return v765
        end
        v484 = {}
        v485 = {}
        for v486, v487 in ipairs(v2:GetPlayers()) do
            local v488
            v488 = v487.Character
            if ((v487 ~= v7) and v488 and not v485[v488] and (v158(v488) or v159(v488) or v157(v488))) then
                v485[v488] = true
                table.insert(v484, v488)
            end
        end
        v765 = v484
        return v484
    end
    local function v161(v489)
        local v490
        local v491
        local v492
        local v493
        v490 = v2:GetPlayerFromCharacter(v489)
        if v490 then
            return "@" .. v490.Name
        end
        v491 = v155(v489)
        v492, v493 = pcall(function()
            return v491 and v491.DisplayName
        end)
        if (v492 and v493 and (v493 ~= "")) then
            return tostring(v493)
        end
        return v489.Name
    end
    local v162 = {"Team", "TeamName", "TeamId", "Faction", "Squad", "Gang", "Clan"}
    local v163 = {}
    local function v164(v494, v495)
        pcall(function()
            for v496, v497 in ipairs(v162) do
                local v498 = v494:GetAttribute(v497)
                if (((v494:GetAttribute(v497)) ~= nil) and (tostring(v498) ~= "")) then
                    v495["attr:" .. v497 .. ":" .. tostring(v498)] = true
                end
                local v499 = v494:FindFirstChild(v497)
                if (v494:FindFirstChild(v497)) then
                    if (v499:IsA("StringValue") or v499:IsA("IntValue") or v499:IsA("NumberValue")) then
                        if (tostring(v499.Value) ~= "") then
                            v495["val:" .. v497 .. ":" .. tostring(v499.Value)] = true
                        end
                    elseif (v499:IsA("ObjectValue") and v499.Value) then
                        v495["val:" .. v497 .. ":" .. v499.Value.Name] = true
                    end
                end
            end
        end)
    end
    local function v165(v500, v501)
        for v502 in pairs(v500) do
            if v501[v502] then
                return true
            end
        end
        return false
    end
    local function v166(v503)
        return ((v503.R > (0.92)) and (v503.G > (0.9199999999999875)) and (v503.B > (0.92))) or ((v503.R < (0.08)) and (v503.G < (0.08)) and (v503.B < (0.08)))
    end
    local function v167(v504, v505)
        local v506
        local v507
        local v508
        v506, v507, v508 = v504.R - v505.R, v504.G - v505.G, v504.B - v505.B
        return math.sqrt((v506 * v506) + (v507 * v507) + (v508 * v508))
    end
    local function v168(v509)
        if not v509 then
            return nil
        end
        for v510, v511 in ipairs(v509:GetDescendants()) do
            if v511:IsA("BillboardGui") then
                local v512
                v512 = v511:FindFirstChildWhichIsA("TextLabel", true)
                if (v512 and v512.TextColor3 and not v166(v512.TextColor3)) then
                    return v512.TextColor3
                end
            end
        end
        return nil
    end
    local function v169(v513)
        local v514
        local v515
        local v516
        local v517
        v514 = v2:GetPlayerFromCharacter(v513)
        if not v514 then
            return false
        end
        if (v514 == v7) then
            return true
        end
        v515 = v163[v514.UserId]
        v516 = os.clock()
        if (v515 and ((v516 - v515.t) < (2))) then
            return v515.v
        end
        v517 = false
        if (not v514.Neutral and not v7.Neutral and v7.Team and v514.Team and (v514.Team == v7.Team) and (v514.TeamColor == v7.TeamColor) and (#v7.Team:GetPlayers() < #v2:GetPlayers())) then
            v517 = true
        end
        if not v517 then
            local v518
            local v519
            v518, v519 = {}, {}
            v164(v7, v518)
            v164(v7.Character, v518)
            v164(v514, v519)
            v164(v513, v519)
            v517 = v165(v518, v519)
        end
        if not v517 then
            local v520
            v520 = v168(v7.Character)
            if v520 then
                local v521
                v521 = v168(v513)
                if (v521 and (v167(v521, v520) < (0.25))) then
                    v517 = true
                end
            end
        end
        v163[v514.UserId] = {t = v516, v = v517}
        return v517
    end
    local function v170(v522, v523)
        local v524
        local v525
        v524, v525 = pcall(function()
            local v526
            local v527
            local v528
            local v529
            v526 = RaycastParams.new()
            RaycastParams.new().FilterType = Enum.RaycastFilterType.Exclude
            v527 = {}
            if v7.Character then
                table.insert(v527, v7.Character)
                for v530, v531 in ipairs(v7.Character:GetDescendants()) do
                    table.insert(v527, v531)
                end
            end
            v526.FilterDescendantsInstances = v527
            v526.IgnoreWater = true
            v528 = v523.Position - v757.CFrame.Position
            v529 = v751:Raycast(v757.CFrame.Position, v528, v526)
            if v529 then
                if not v529.Instance:IsDescendantOf(v522) then
                    return false
                end
            end
            return true
        end)
        if v524 then
            return v525
        end
        return false
    end
    local function v171(v532, v533)
        if (v61.Visuals.TeamColors and v169(v532)) then
            return v11
        end
        if v170(v532, v533) then
            return v10
        end
        return v12
    end
    local v172 = setmetatable({}, {__mode = "k"})
    local function v173(v534)
        if (v61.Aimbot.HitPart == "Head") then
            local v539
            v539 = v153(v534:FindFirstChild("Head"))
            if v539 then
                return v539
            end
            return v151(v534)
        elseif (v61.Aimbot.HitPart == "Torso") then
            for v540, v541 in ipairs({"Torso", "UpperTorso", "HumanoidRootPart"}) do
                local v542 = v153(v534:FindFirstChild(v541))
                if v542 then
                    return v542
                end
            end
            return v151(v534)
        end
        local v535 = {}
        for v543, v544 in ipairs({"Head", "UpperTorso", "Torso", "HumanoidRootPart", "LowerTorso"}) do
            local v545
            v545 = v534:FindFirstChild(v544)
            if (v545 and v545:IsA("BasePart")) then
                table.insert(v535, v545)
            end
        end
        if (#v535 == (0)) then
            return v151(v534)
        end
        local v536 = v757.ViewportSize / (2)
        local v537, v538 = v535[1], math.huge
        for v546, v547 in ipairs(v535) do
            local v548
            local v549
            v548 = v757:WorldToViewportPoint(v547.Position)
            v549 = (Vector2.new(v548.X, v548.Y) - v536).Magnitude
            if (v549 < v538) then
                v537 = v547
                v538 = v549
            end
        end
        return v537
    end
    local function v174(v550, v551)
        local v552
        local v553
        local v554
        if (not v551 or not v551:IsA("BasePart")) then
            return false
        end
        v552 = (v551.Position - v152()).Magnitude
        if (v552 > v61.Aimbot.MaxDistance) then
            return false
        end
        v553, v554 = v757:WorldToViewportPoint(v551.Position)
        if (not v554 or (v553.Z <= (0))) then
            return false
        end
        if ((Vector2.new(v553.X, v553.Y) - (v757.ViewportSize / 2)).Magnitude > v61.Aimbot.FOV) then
            return false
        end
        if (v61.Aimbot.TeamCheck and v169(v550)) then
            return false
        end
        if (v61.Aimbot.WallCheck and not v170(v550, v551)) then
            return false
        end
        return true
    end
    local function v175(v555)
        local v556, v557, v558 = nil, nil, math.huge
        local v559 = v757.ViewportSize / (2)
        local v560 = v61.Aimbot.Priority or "Closest (Screen)"
        local v561 = v61.Aimbot.TargetFilter or "Everyone"
        for v562, v563 in ipairs(v555 or v160()) do
            local v564
            local v565
            v564 = v2:GetPlayerFromCharacter(v563) ~= nil
            v565 = (v561 == "Everyone") or ((v561 == "Players Only") and v564)
            if v565 then
                local v566
                v566 = v173(v563)
                if v174(v563, v566) then
                    local v567
                    local v568
                    local v569
                    v567 = v757:WorldToViewportPoint(v566.Position)
                    v568 = (Vector2.new(v567.X, v567.Y) - v559).Magnitude
                    v569 = v568
                    if (v560 == "Lowest HP") then
                        local v570
                        local v571
                        local v572
                        v570, v571 = v155(v563)
                        v572 = 500
                        if (v570 and (v571 or (v570.Health > (0)))) then
                            v572 = v570.Health
                        end
                        v569 = (v572 * (100000)) + v568
                    elseif (v560 == "Closest (World)") then
                        local v573
                        v573 = (v566.Position - v152()).Magnitude
                        v569 = (v573 * 10) + (v568 * (0.05))
                    end
                    if (v569 < v558) then
                        v558 = v569
                        v556 = v566
                        v557 = v563
                    end
                end
            end
        end
        if v556 then
            return {Part = v556, Model = v557}
        end
        return nil
    end
    local function v176()
        local v574
        local v575
        v574 = v7:GetMouse()
        v575 = v574.Target
        if (v575 and v575.Parent and (v158(v575.Parent) or v157(v575.Parent))) then
            if not (v61.Aimbot.TeamCheck and v169(v575.Parent)) then
                if (not v61.Triggerbot.VisibilityCheck or v170(v575.Parent, v575)) then
                    if ((v575.Position - v152()).Magnitude <= v61.Aimbot.MaxDistance) then
                        if ((tick() - v768) >= ((v61.Triggerbot.Delay / (1000)) * (0.75 + (math.random() * (0.5))))) then
                            v768 = tick() - (math.random() * (0.03))
                            task.spawn(function()
                                if mouse1press then
                                    mouse1press()
                                    task.wait(math.random(18, 60) / (1000))
                                    mouse1release()
                                elseif v6 then
                                    v6:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                                    task.wait(math.random(18, 60) / (1000))
                                    v6:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                                else
                                    local v576
                                    v576 = v7.Character and v7.Character:FindFirstChildOfClass("Tool")
                                    if v576 then
                                        v576:Activate()
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end
    end
    task.spawn(function()
        while v759.Parent do
            task.wait(1)
            v103.Text = "FPS " .. tostring(v769)
        end
    end)
    print("[NOA HUB] ·· tüm motorlar hazır, ana döngü bağlanıyor")
    _G.NoaHubConnection = v63(v3.RenderStepped:Connect(function()
        local v577
        local v578
        v577, v578 = pcall(function()
            if (v751.CurrentCamera ~= v757) then
                v757 = v751.CurrentCamera
            end
            v769 = v769 + 1
            v771 = v771 + 1
            os.clock()
            if v772 then
                if (((os.clock()) - v772 > (0)) and ((os.clock()) - v772 < 1)) then
                    v773 = (v773 * 0.85) + (((os.clock()) - v772) * (0.15))
                end
            end
            if v61.UI.Open then
                v4.MouseBehavior = Enum.MouseBehavior.Default
            end
            v85.Position = v757.ViewportSize / 2
            v85.Radius = v61.Aimbot.FOV
            v85.Visible = not v61.UI.Open and v61.Aimbot.Enabled and v61.Aimbot.ShowFOV
            local v579 = v160()
            v176()
            if (not v61.UI.Open and v61.Aimbot.Enabled) then
                local v581
                if (v61.Aimbot.ActivationMode == "Automatic") then
                elseif (v61.Aimbot.ActivationMode == "Right Click") then
                else
                    v581 = (v61.Aimbot.HoldKey ~= nil) and v4:IsKeyDown(v61.Aimbot.HoldKey)
                end
                if v581 then
                    local v582 = v175((v160()))
                    if (v175((v160()))) then
                        local v583
                        v583 = v582.Part.Position
                        if (v61.Aimbot.PredictionMs > 0) then
                            pcall(function()
                                v583 = v583 + (v582.Part.AssemblyLinearVelocity * (v61.Aimbot.PredictionMs / 1000))
                            end)
                        end
                        pcall(function()
                            local v584, v585 = v757:WorldToViewportPoint(v583)
                            if v585 then
                                local v586
                                local v587
                                local v588
                                v586 = Vector2.new(v757.ViewportSize.X / 2, v757.ViewportSize.Y / 2)
                                v587 = (Vector2.new(v584.X, v584.Y) - v586) * v61.Aimbot.Smoothness
                                if v61.Aimbot.Humanize then
                                    v587 = Vector2.new((v587.X * ((0.94) + (math.random() * (0.12)))) + ((math.random() - 0.5) * (0.39999999999997726)), (v587.Y * ((0.94) + (math.random() * (0.12)))) + ((math.random() - (0.5)) * (0.4)))
                                end
                                v588 = math.sqrt((v587.X * v587.X) + (v587.Y * v587.Y))
                                if (v588 > (0.5)) then
                                    if mousemoverel then
                                        mousemoverel(v587.X, v587.Y)
                                    elseif v6 then
                                        local v589
                                        v589 = v7:GetMouse()
                                        v6:SendMouseMoveEvent(v7:GetMouse().X + v587.X, v589.Y + v587.Y, game)
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            if (v61.Aimbot.TargetInfo and v61.Aimbot.Enabled and not v61.UI.Open and v774) then
                local v590
                v590 = v757:WorldToViewportPoint(v774.Part.Position + Vector3.new(0, 0.4, 0))
                if (v590.Z > (0)) then
                    v86.Position = Vector2.new(v590.X, v590.Y)
                    v86.Radius = 18
                    v86.Visible = true
                    v87.Text = "TARGET • " .. v161(v774.Model)
                    v87.Position = Vector2.new(v590.X, (v590.Y - v86.Radius) - 14)
                    v87.Visible = true
                else
                    v86.Visible = false
                    v87.Visible = false
                end
            else
                v86.Visible = false
                v87.Visible = false
            end
            if not v61.Visuals.Enabled then
                v93()
            elseif (((v771 - (1)) % v775) == (0)) then
                local v591 = {}
                for v592, v593 in ipairs(v579) do
                    local v594, v595 = v155(v593)
                    local v596 = (v594 ~= nil) and (v595 or (v594.Health > 0))
                    if ((((v594 ~= nil) and ((v595 and not v154(v594)) or not v595)) or ((v594 == nil) and v157(v593))) and v593.Parent and not (v61.Visuals.TeamCheck and v169(v593))) then
                        local v597
                        v597 = v151(v593)
                        if ((v153(v593:FindFirstChild("Root")) or v153(v593:FindFirstChild("HumanoidRootPart")) or v153(v593:FindFirstChild("Torso")) or v153(v593:FindFirstChild("UpperTorso")) or v153(v593:FindFirstChild("RootPart")) or v151(v593)) and (v151(v593))) then
                            if (((v153(v593:FindFirstChild("Root")) or v153(v593:FindFirstChild("HumanoidRootPart")) or v153(v593:FindFirstChild("Torso")) or v153(v593:FindFirstChild("UpperTorso")) or v153(v593:FindFirstChild("RootPart")) or v151(v593)).Position - (v152())).Magnitude <= v61.Visuals.MaxDistance) then
                                local v598, v599 = v757:WorldToViewportPoint((v153(v593:FindFirstChild("Root")) or v153(v593:FindFirstChild("HumanoidRootPart")) or v153(v593:FindFirstChild("Torso")) or v153(v593:FindFirstChild("UpperTorso")) or v153(v593:FindFirstChild("RootPart")) or v151(v593)).Position)
                                local v600 = v757:WorldToViewportPoint(v597.Position + Vector3.new(0, 0.4, 0))
                                if v61.Visuals.VisibilityCheck then
                                    local v601
                                    v601 = v172[v593]
                                    if (v601 and ((tick() - v601.t) < v776)) then
                                        v777 = v601.v
                                    else
                                        v172[v593] = {t = tick(), v = (v170(v593, v597))}
                                    end
                                end
                                if (v777 and v599 and (v598.Z > (0))) then
                                    v591[v593] = true
                                    local v602 = v148(v593)
                                    local v603 = tonumber(v61.Visuals.TextSize) or (13)
                                    local v604 = math.abs(v600.Y - v757:WorldToViewportPoint((v153(v593:FindFirstChild("Root")) or v153(v593:FindFirstChild("HumanoidRootPart")) or v153(v593:FindFirstChild("Torso")) or v153(v593:FindFirstChild("UpperTorso")) or v153(v593:FindFirstChild("RootPart")) or v151(v593)).Position - Vector3.new(0, 2.7999999999999545, 0)).Y)
                                    local v605 = v598.X - (v604 / (1.8) / (2))
                                    local v606 = v600.Y
                                    if (v148(v593).Highlight and not v61.Visuals.Chams) then
                                        pcall(function()
                                            v602.Highlight:Destroy()
                                        end)
                                        v602.Highlight = nil
                                    end
                                    if v61.Visuals.Chams then
                                        local v607 = v602.Highlight
                                        if ((v607 == nil) or not v607.Parent) then
                                            local v608
                                            local v609
                                            v608, v609 = pcall(function()
                                                local v610 = Instance.new("Highlight")
                                                Instance.new("Highlight").Name = "NoaCham"
                                                v610.FillTransparency = 0.5
                                                v610.OutlineTransparency = 0
                                                v610.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                                v610.Adornee = v593
                                                v610.Parent = v83()
                                                return v610
                                            end)
                                            if (v608 and v609) then
                                                v602.Highlight = v609
                                            end
                                        end
                                        if v607 then
                                            pcall(function()
                                                v607.FillColor = v778
                                                v607.OutlineColor = v778
                                                v607.Enabled = true
                                            end)
                                        end
                                    end
                                    if v61.Visuals.Box then
                                        local v611
                                        v611 = tonumber(v61.Visuals.BoxThickness) or 1
                                        v602.BoxOutline.Thickness = v611 + (1.599999999999909)
                                        v602.BoxOutline.Size = Vector2.new(v604 / (1.8), v604)
                                        v602.BoxOutline.Position = Vector2.new(v605, v606)
                                        v602.BoxOutline.Visible = v61.Visuals.BoxStyle ~= "Filled"
                                        v602.Box.Thickness = v611
                                        v602.Box.Size = Vector2.new(v604 / (1.8), v604)
                                        v602.Box.Position = Vector2.new(v605, v606)
                                        v602.Box.Color = (v171(v593, v597))
                                        v602.Box.Filled = v61.Visuals.BoxStyle == "Filled"
                                        v602.Box.Visible = true
                                        if (v61.Visuals.BoxStyle == "Filled") then
                                            pcall(function()
                                                v602.Box.Transparency = 0.75
                                            end)
                                        end
                                        if (v61.Visuals.BoxStyle == "Corner") then
                                            local v612
                                            v612 = {
                                                {v605, v606, v605 + math.min(v604 / (1.8), v604) * 0.28, v606},
                                                {v605, v606, v605, v606 + math.min(v604 / (1.8), v604) * 0.28},
                                                {(v605 + v604 / (1.8)) - math.min(v604 / (1.8), v604) * 0.28, v606, v605 + v604 / (1.8), v606},
                                                {v605 + v604 / (1.8), v606, v605 + v604 / (1.8), v606 + math.min(v604 / (1.8), v604) * 0.28},
                                                {v605, (v606 + v604) - math.min(v604 / (1.8), v604) * 0.28, v605, v606 + v604},
                                                {v605, v606 + v604, v605 + math.min(v604 / (1.8), v604) * 0.28, v606 + v604},
                                                {v605 + v604 / (1.8), (v606 + v604) - math.min(v604 / (1.8), v604) * 0.28, v605 + v604 / (1.8), v606 + v604},
                                                {(v605 + v604 / (1.8)) - math.min(v604 / (1.8), v604) * 0.28, v606 + v604, v605 + v604 / (1.8), v606 + v604},
                                            }
                                            for v613, v614 in ipairs(v612) do
                                                v779 = v149(v602, v613)
                                                v149(v602, v613).From = Vector2.new(v614[1], v614[2])
                                                v779.To = Vector2.new(v614[3], v614[4])
                                                v779.Thickness = math.max(1, v611)
                                            end
                                            for v615 = 9, #v602.CornerLines do
                                                pcall(function()
                                                    v602.CornerLines[v615].Visible = false
                                                end)
                                            end
                                        else
                                            for v616 = 1, #v602.CornerLines do
                                                pcall(function()
                                                    v602.CornerLines[v616].Visible = false
                                                end)
                                            end
                                        end
                                    else
                                        v602.BoxOutline.Visible = false
                                        v602.Box.Visible = false
                                        for v617 = 1, #v602.CornerLines do
                                            pcall(function()
                                                v602.CornerLines[v617].Visible = false
                                            end)
                                        end
                                    end
                                    if (v61.Visuals.HealthBar and v596) then
                                        local v618 = (v594.MaxHealth and (v594.MaxHealth > (0)) and v594.MaxHealth) or (100)
                                        local v619 = math.clamp(v594.Health, 0, v618)
                                        local v620 = math.clamp(v619 / v618, 0, 1)
                                        local v621 = math.max(2, v604 * (math.clamp(v619 / v618, 0, 1)))
                                        v602.HealthBg.Size = Vector2.new(4, v604)
                                        v602.HealthBg.Position = Vector2.new(v605 - 7, v606)
                                        v602.HealthBg.Visible = true
                                        v602.HealthFill.Size = Vector2.new(2, (math.max(2, v604 * (math.clamp(v619 / v618, 0, 1)))))
                                        v602.HealthFill.Position = Vector2.new(v605 - 6, v606 + (v604 - v621))
                                        v602.HealthFill.Color = Color3.fromRGB(math.floor((255) - (v620 * (255))), math.floor(v620 * 255), 0)
                                        v602.HealthFill.Visible = true
                                    else
                                        v602.HealthBg.Visible = false
                                        v602.HealthFill.Visible = false
                                    end
                                    if (v61.Visuals.HealthText and v596) then
                                        local v622
                                        local v623
                                        v622 = (v594.MaxHealth and (v594.MaxHealth > (0)) and v594.MaxHealth) or 100
                                        v623 = math.clamp(math.clamp(v594.Health, 0, v622) / v622, 0, 1)
                                        v602.HealthPct.Size = math.max(9, v603 - (3))
                                        v602.HealthPct.Text = tostring(math.floor((v623 * 100) + 0.5)) .. "%"
                                        v602.HealthPct.Position = Vector2.new(v605 - (5), v606 + v604 + (2))
                                        v602.HealthPct.Color = ((v623 > 0.5) and Color3.new(1, 1, 1)) or Color3.fromRGB(255, 90, 110)
                                        v602.HealthPct.Visible = true
                                    elseif v602.HealthPct then
                                        v602.HealthPct.Visible = false
                                    end
                                    if v61.Visuals.NameESP then
                                        v602.NameTxt.Size = v603
                                        v602.NameTxt.Text = v161(v593)
                                        v602.NameTxt.Position = Vector2.new(v598.X, v600.Y - (v603 + 7))
                                        v602.NameTxt.Visible = true
                                    else
                                        v602.NameTxt.Visible = false
                                    end
                                    if v61.Visuals.InfoLine then
                                        local v624
                                        local v625
                                        v602.InfoTxt.Size = math.max(9, v603 - 2)
                                        v624 = {tostring(math.floor(((v153(v593:FindFirstChild("Root")) or v153(v593:FindFirstChild("HumanoidRootPart")) or v153(v593:FindFirstChild("Torso")) or v153(v593:FindFirstChild("UpperTorso")) or v153(v593:FindFirstChild("RootPart")) or v151(v593)).Position - (v152())).Magnitude)) .. "m"}
                                        if v596 then
                                            table.insert(v624, tostring(math.floor(v594.Health + (0.5))) .. " HP")
                                        end
                                        v625 = v593:FindFirstChildOfClass("Tool")
                                        if (v593:FindFirstChildOfClass("Tool")) then
                                            table.insert(v624, v625.Name)
                                        end
                                        v602.InfoTxt.Text = table.concat(v624, " • ")
                                        v602.InfoTxt.Position = Vector2.new(v598.X, v780.Y + 4)
                                        v602.InfoTxt.Visible = true
                                    else
                                        v602.InfoTxt.Visible = false
                                    end
                                    if v61.Visuals.Tracer then
                                        v602.Snapline.From = Vector2.new(v757.ViewportSize.X / (2), v757.ViewportSize.Y)
                                        v602.Snapline.To = Vector2.new(v598.X, v780.Y)
                                        v602.Snapline.Color = v778
                                        v602.Snapline.Visible = true
                                    else
                                        v602.Snapline.Visible = false
                                    end
                                    if v61.Visuals.HeadDot then
                                        v602.HeadDot = v602.HeadDot or Drawing.new("Circle")
                                        v602.HeadDot.Thickness = 1.5
                                        v602.HeadDot.NumSides = 32
                                        v602.HeadDot.Filled = true
                                        v602.HeadDot.Color = v778
                                        v602.HeadDot.Radius = math.max(3, v604 * 0.05)
                                        v602.HeadDot.Position = Vector2.new(v598.X, v600.Y)
                                        v602.HeadDot.Visible = true
                                    elseif v602.HeadDot then
                                        v602.HeadDot.Visible = false
                                    end
                                    if v61.Visuals.Skeleton then
                                        local v626
                                        for v627, v628 in ipairs(v593:GetDescendants()) do
                                            if (v628:IsA("Motor6D") and v628.Part0 and v628.Part1) then
                                                local v629
                                                local v630
                                                v629 = v757:WorldToViewportPoint(v628.Part0.Position)
                                                v630 = v757:WorldToViewportPoint(v628.Part1.Position)
                                                if ((v629.Z > 0) and (v630.Z > 0)) then
                                                    v626 = v626 + 1
                                                    v781 = v150(v602, v626)
                                                    v150(v602, v626).From = Vector2.new(v629.X, v629.Y)
                                                    v781.To = Vector2.new(v630.X, v630.Y)
                                                end
                                            end
                                        end
                                        for v631 = v626 + (1), #v602.SkelLines do
                                            pcall(function()
                                                v602.SkelLines[v631].Visible = false
                                            end)
                                        end
                                    else
                                        for v632 = 1, #v602.SkelLines do
                                            pcall(function()
                                                v602.SkelLines[v632].Visible = false
                                            end)
                                        end
                                    end
                                else
                                    local v633
                                    v633 = v92[v593]
                                    if v633 then
                                        for v634, v635 in ipairs({"BoxOutline", "Box", "HealthBg", "HealthFill", "HealthPct", "NameTxt", "InfoTxt", "Snapline", "HeadDot"}) do
                                            if v633[v635] then
                                                v633[v635].Visible = false
                                            end
                                        end
                                        for v636, v637 in ipairs(v633.CornerLines or {}) do
                                        end
                                        for v638, v639 in ipairs(v633.SkelLines or {}) do
                                        end
                                    end
                                    if (v61.Visuals.OffscreenArrows and (v782 < v758)) then
                                        v782 = v782 + 1
                                        v90(v782, v598, v171(v593, v597))
                                    end
                                end
                            else
                                v147(v593)
                            end
                        else
                            v147(v593)
                        end
                    else
                        v147(v593)
                    end
                end
                for v640 = v782 + 1, v758 do
                    local v641
                    v641 = v88[v640]
                    if v641 then
                        pcall(function()
                            v641.Visible = false
                        end)
                    end
                end
                for v642 in pairs(v92) do
                    if not v591[v642] then
                        v147(v642)
                    end
                end
            end
            local v580 = v7.Character
            if (v580 and v580:FindFirstChildOfClass("Humanoid")) then
                local v643
                v643 = v580.Humanoid
                if v61.Movement.EnableSpeed then
                    local v644
                    local v645
                    if not v754 then
                        v754 = v643.WalkSpeed
                    end
                    v644 = v61.Movement.WalkSpeed
                    if ((v644 > 120) and not v783) then
                        warn("[NOA HUB] 🧯 WalkSpeed 120+ ban riski yüksek -> güvenli tavan (120) uygulandı")
                    end
                    v644 = math.min(v644, 120)
                    v645 = v643.WalkSpeed
                    if (math.abs(v644 - v645) > (0.049999999999954525)) then
                        v643.WalkSpeed = v645 + ((v644 - v645) * 0.12)
                    end
                elseif v754 then
                    v643.WalkSpeed = v754
                end
                if v61.Movement.EnableJump then
                    local v646
                    local v647
                    if not v755 then
                        v755 = v643.JumpPower
                    end
                    v646 = math.min(v61.Movement.JumpPower, 300)
                    v647 = v643.JumpPower
                    if (math.abs(v646 - v647) > (0.05)) then
                        v643.JumpPower = v647 + ((v646 - v647) * 0.15)
                    end
                elseif v755 then
                    v643.JumpPower = v755
                end
            end
            if (v61.Movement.Noclip and v580) then
                for v648, v649 in ipairs(v580:GetDescendants()) do
                    if v649:IsA("BasePart") then
                        v649.CanCollide = false
                    end
                end
            elseif (v784 and v580) then
                for v650, v651 in ipairs(v580:GetDescendants()) do
                    if v651:IsA("BasePart") then
                        v651.CanCollide = true
                    end
                end
            end
            if v61.Movement.Fly then
                if v580 and v580:FindFirstChild("HumanoidRootPart") then
                    local v652
                    local v653
                    v652 = v757.CFrame
                    if v4:IsKeyDown(Enum.KeyCode.W) then
                        v653 = (Vector3.new()) + v652.LookVector
                    end
                    if v4:IsKeyDown(Enum.KeyCode.S) then
                        v653 = v653 - v652.LookVector
                    end
                    if v4:IsKeyDown(Enum.KeyCode.A) then
                        v653 = v653 - v652.RightVector
                    end
                    if v4:IsKeyDown(Enum.KeyCode.D) then
                        v653 = v653 + v652.RightVector
                    end
                    if v4:IsKeyDown(Enum.KeyCode.Space) then
                        v653 = v653 + Vector3.new(0, 1, 0)
                    end
                    if v4:IsKeyDown(Enum.KeyCode.LeftControl) then
                        v653 = v653 - Vector3.new(0, 1, 0)
                    end
                    pcall(function()
                        if (v653.Magnitude > (0)) then
                        else
                            v785.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end
                    end)
                end
            end
            if (v61.World.Fullbright and not v752) then
                v752 = {Brightness = v5.Brightness, ClockTime = v5.ClockTime, GlobalShadows = v5.GlobalShadows, OutdoorAmbient = v5.OutdoorAmbient}
                pcall(function()
                    v5.Brightness = 2
                    v5.ClockTime = 14
                    v5.GlobalShadows = false
                    v5.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
                end)
            elseif (not v61.World.Fullbright and v752) then
                pcall(function()
                    v5.Brightness = v752.Brightness
                    v5.ClockTime = v752.ClockTime
                    v5.GlobalShadows = v752.GlobalShadows
                    v5.OutdoorAmbient = v752.OutdoorAmbient
                end)
            end
            if (v61.World.NoFog and not v753) then
                v753 = {FogEnd = v5.FogEnd, FogStart = v5.FogStart, FogColor = v5.FogColor}
                pcall(function()
                    v5.FogEnd = 999999
                    v5.FogStart = 999998
                end)
            elseif (not v61.World.NoFog and v753) then
                pcall(function()
                    v5.FogEnd = v753.FogEnd
                    v5.FogStart = v753.FogStart
                    v5.FogColor = v753.FogColor
                end)
            end
            v84(v61.World.FPSBoost)
        end)
        if v577 then
        else
            v786 = v786 + 1
            if ((v786 <= (3)) or ((v786 % (60)) == (0))) then
                warn("[NOA HUB] render karesi hatası: " .. tostring(v578))
            end
            if (v786 >= (600)) then
                warn("[NOA HUB] 600 kare ÜST ÜSTE hata -> ana döngü güvenli kapatıldı")
                _G.NoaHubConnection:Disconnect()
            end
        end
    end))
    print("[NOA HUB] ·· ana döngü bağlandı")
    task.spawn(function()
        v4.MouseIconEnabled = true
        v4.MouseBehavior = Enum.MouseBehavior.Default
        local v654 = function(v657, v658)
            v16(v657, (v15(v657)), v658)
        end
        v14(v94, {BackgroundTransparency = 0.08000000000004093}, 0.35)
        v14(v95, {Transparency = 0.35}, 0.4)
        v14(v96, {Scale = 1}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        v654(v787, 0.15)
        v654(v102, 0.2)
        v654(v103, 0.23999999999996363)
        v654(v104, 0.27999999999992725)
        v654(v105, 0.31999999999992723)
        v654(v762, 0.3699999999999272)
        for v659, v660 in ipairs(v109) do
            v654(v660.Btn, v788)
            v788 = v788 + 0.05
        end
        local v655 = v121.Parent
        local v656 = v110[v655]
        if v656 then
            for v661, v662 in ipairs(v656) do
                local v663
                local v664
                local v665
                v663 = v662:FindFirstChildOfClass("UIStroke")
                v664 = ((v662:FindFirstChildOfClass("UIStroke")) and v663.Transparency) or (0.6)
                v665 = v662.BackgroundTransparency
                v662.BackgroundTransparency = 0.65
                if v663 then
                    v663.Transparency = 0.85
                end
                task.delay(v788 + (v661 * (0.05)), function()
                    if v662.Parent then
                        v14(v662, {BackgroundTransparency = v665}, 0.3)
                        if v663 then
                            v14(v663, {Transparency = v664}, 0.2999999999999545)
                        end
                    end
                end)
            end
        end
        v654(v789, v788 + (0.2999999999999545))
    end)
    print("[NOA HUB] 2/4 menü inşa edildi")
    print("[NOA HUB] 3/4 ESP (+oklar/oyun-uyum/görünürlük) + AIMBOT (+öncelik/filtre) aktif")
    print("[NOA HUB] 4/4 hazır • profiller + dil menüsü ⚙ sekmesinde • menü tuşu: " .. v61.UI.Key.Name)
end
local v20 = {
    GetKeyURL = "https://linkvertise.com/3601903/RAYjp5C0VXV7",
    DiscordURL = "https://discord.gg/CaDQtHqZxA",
    LocalKeys = {"HUMANOID-UNLIMITED-2026"},
    MaxAttempts = 5,
    Cooldown = 30,
}
local v21 = Color3.fromRGB(255, 200, 60)
local v22 = Color3.fromRGB(150, 150, 165)
local v23 = Color3.fromRGB(255, 60, 90)
local function v24()
    if getgenv then
        return getgenv()
    end
    return _G
end
local function v25(v666)
    local v667
    v667 = pcall(function()
        if setclipboard then
            setclipboard(v666)
        elseif toclipboard then
            toclipboard(v666)
        elseif ((typeof(syn) == "table") and syn.write_clipboard) then
            syn.write_clipboard(v666)
        end
    end)
    return v667
end
local function v26(v668)
    return (v668:gsub("^%s*(.-)%s*$", "%1"))
end
local function v27(v669)
    local v670
    if (not v669 or (#v669 < 4)) then
        return false, "Password too short"
    end
    v670 = v26(v669)
    if (#v670 == (0)) then
        return false, "Password empty"
    end
    for v671, v672 in ipairs(v20.LocalKeys) do
        if (v26(v672):lower() == v670:lower()) then
            return true
        end
    end
    return false, "Wrong password! Check the Linkvertise page again."
end
local function v28()
    if v8:FindFirstChild("Noa_Key_System") then
        v8.Noa_Key_System:Destroy()
    end
    local v673 = v13("ScreenGui", {Name = "Noa_Key_System", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999999}, v8)
    local v674 = v13("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 200}, v673)
    for v705 = 1, 3 do
        local v706 = v13("Frame", {Name = "Blob" .. v705, Size = UDim2.new(0, math.random(240, 340), 0, math.random(240, 340)), Position = UDim2.new(math.random(1, 7) / (10), 0, math.random(1, 6) / 10, 0), BackgroundColor3 = v9, BackgroundTransparency = 0.92, BorderSizePixel = 0, ZIndex = 200}, v674)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v706)
        task.spawn(function()
            while v706.Parent do
                v14(v706, {Position = UDim2.new(math.random(1, 8) / 10, 0, math.random(1, 7) / (10), 0), Size = UDim2.new(0, math.random(220, 360), 0, math.random(220, 360))}, math.random(4, 7), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(math.random(4, 7))
            end
        end)
    end
    task.spawn(function()
        while v673.Parent do
            local v707
            v707 = v13("Frame", {Name = "Particle", Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6)), Position = UDim2.new(math.random(), 0, 1.0499999999999545, 0), BackgroundColor3 = ((math.random() > (0.35)) and v9) or Color3.fromRGB(255, 255, 255), BackgroundTransparency = math.random(2, 5) / 10, BorderSizePixel = 0, ZIndex = 200}, v674)
            v13("UICorner", {CornerRadius = UDim.new(1, 0)}, (v13("Frame", {Name = "Particle", Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6)), Position = UDim2.new(math.random(), 0, 1.0499999999999545, 0), BackgroundColor3 = ((math.random() > (0.35)) and v9) or Color3.fromRGB(255, 255, 255), BackgroundTransparency = math.random(2, 5) / 10, BorderSizePixel = 0, ZIndex = 200}, v674)))
            v14(v707, {Position = UDim2.new(v707.Position.X.Scale + ((math.random() - (0.5)) * (0.15)), 0, -0.09999999999999432, 0), BackgroundTransparency = 1}, math.random(3, 6), Enum.EasingStyle.Linear)
            task.delay(6, function()
                v707:Destroy()
            end)
            task.wait(math.random(2, 5) / (10))
        end
    end)
    local v675 = v13("Frame", {Size = UDim2.new(0, 430, 0, 372), Position = UDim2.new(0.5, -215, 0.5, -186), BackgroundColor3 = Color3.fromRGB(10, 10, 15), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 201}, v673)
    v13("UICorner", {CornerRadius = UDim.new(0, 16)}, v675)
    local v676 = v13("UIStroke", {Color = v9, Thickness = 1.8, Transparency = 1}, v675)
    local v677 = v13("UIScale", {Scale = 0.7000000000000455}, v675)
    local v678 = v13("Frame", {Size = UDim2.new(0, 56, 0, 56), Position = UDim2.new(0.5, -28, 0, 16), BackgroundColor3 = Color3.fromRGB(20, 10, 14), BorderSizePixel = 0, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v678)
    local v679 = v13("UIStroke", {Color = v9, Thickness = 1.6, Transparency = 0.3}, v678)
    local v680 = v13("TextLabel", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "🔐", TextSize = 26, ZIndex = 203}, v678)
    task.spawn(function()
        while v678.Parent do
            v14(v678, {Size = UDim2.new(0, 60, 0, 60), Position = UDim2.new(0.5, -30, 0, 14)}, 1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.2)
            v14(v678, {Size = UDim2.new(0, 56, 0, 56), Position = UDim2.new(0.5, -28, 0, 16)}, 1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.2)
        end
    end)
    local v681 = v13("TextLabel", {Size = UDim2.new(1, 0, 0, 26), Position = UDim2.new(0, 0, 0, 78), BackgroundTransparency = 1, RichText = true, Text = "<font color='#ff0f2d'>NOA</font><font color='#ffffff'>.HUB</font> <font size='9' color='#888899'>// PASSWORD</font>", Font = Enum.Font.GothamBlack, TextSize = 18, ZIndex = 202}, v675)
    pcall(function()
        local v708
        v708 = v13("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 130, 140)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 140))}), Offset = Vector2.new(-1, 0)}, v681)
        task.spawn(function()
            while v681.Parent do
                v14(v708, {Offset = Vector2.new(1, 0)}, 2.2, Enum.EasingStyle.Linear)
                task.wait(2.25)
                v708.Offset = Vector2.new(-1, 0)
            end
        end)
    end)
    local v682 = v13("TextLabel", {Size = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 0, 104), BackgroundTransparency = 1, Text = "PASSWORD ACCESS  //  V32", TextColor3 = Color3.fromRGB(110, 110, 125), Font = Enum.Font.GothamBold, TextSize = 10, ZIndex = 202}, v675)
    local v683 = v13("TextLabel", {Size = UDim2.new(1, -40, 0, 20), Position = UDim2.new(0, 20, 0, 130), BackgroundTransparency = 1, Text = "", TextColor3 = v22, Font = Enum.Font.GothamMedium, TextSize = 12, TextWrapped = true, ZIndex = 202}, v675)
    local v684 = v13("Frame", {Size = UDim2.new(1, -40, 0, 3), Position = UDim2.new(0, 20, 0, 152), BackgroundColor3 = Color3.fromRGB(35, 18, 24), BorderSizePixel = 0, Visible = false, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v684)
    local v685 = v13("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = v9, BorderSizePixel = 0, ZIndex = 203}, v684)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v685)
    local v686 = v13("TextBox", {Size = UDim2.new(1, -40, 0, 42), Position = UDim2.new(0, 20, 0, 164), BackgroundColor3 = Color3.fromRGB(16, 16, 22), PlaceholderText = "ENTER PASSWORD", PlaceholderColor3 = Color3.fromRGB(90, 90, 105), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 13, ClearTextOnFocus = false, ClipsDescendants = true, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(0, 10)}, v686)
    local v687 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70), Thickness = 1.4}, v686)
    local v688 = v13("TextButton", {Size = UDim2.new(1, -40, 0, 40), Position = UDim2.new(0, 20, 0, 216), BackgroundColor3 = v9, Text = "VERIFY PASSWORD", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBlack, TextSize = 13, AutoButtonColor = false, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(0, 10)}, v688)
    local v689 = v13("UIStroke", {Color = Color3.fromRGB(255, 90, 110), Transparency = 0.6}, v688)
    local v690 = v13("Frame", {Size = UDim2.new(1, -40, 0, 3), Position = UDim2.new(0, 20, 0, 264), BackgroundColor3 = Color3.fromRGB(25, 25, 34), BorderSizePixel = 0, Visible = false, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v690)
    local v691 = v13("Frame", {Size = UDim2.new(0.25, 0, 1, 0), BackgroundColor3 = v9, BorderSizePixel = 0, ZIndex = 203}, v690)
    v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v691)
    local v692 = v13("TextButton", {Size = UDim2.new(0.5, -25, 0, 36), Position = UDim2.new(0, 20, 0, 276), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Text = "🔑 Password Link", TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamBold, TextSize = 12, AutoButtonColor = false, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(0, 8)}, v692)
    local v693 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v692)
    local v694 = v13("TextButton", {Size = UDim2.new(0.5, -25, 0, 36), Position = UDim2.new(0.5, 5, 0, 276), BackgroundColor3 = Color3.fromRGB(18, 18, 24), Text = "💬 Discord", TextColor3 = Color3.fromRGB(215, 215, 225), Font = Enum.Font.GothamBold, TextSize = 12, AutoButtonColor = false, ZIndex = 202}, v675)
    v13("UICorner", {CornerRadius = UDim.new(0, 8)}, v694)
    local v695 = v13("UIStroke", {Color = Color3.fromRGB(55, 55, 70)}, v694)
    local v696 = {}
    for v709 = 1, v20.MaxAttempts do
        local v710
        v710 = v13("Frame", {Size = UDim2.new(0, 8, 0, 8), Position = UDim2.new(1, -(16 + ((v20.MaxAttempts - v709) * 13)), 0, 20), BackgroundColor3 = Color3.fromRGB(45, 45, 55), BorderSizePixel = 0, ZIndex = 202}, v675)
        v13("UICorner", {CornerRadius = UDim.new(1, 0)}, v710)
        v696[v709] = v710
    end
    local function v697()
        for v711 = 1, v20.MaxAttempts do
            local v712
            v712 = v696[v711]
            if v712 then
                v14(v712, {BackgroundColor3 = ((v711 <= v790) and v23) or Color3.fromRGB(45, 45, 55)}, 0.2)
            end
        end
    end
    local function v698()
        local v713
        v713 = {v9, v10, Color3.fromRGB(255, 255, 255), v21}
        for v714 = 1, 26 do
            local v715
            local v716
            local v717
            v715 = v13("Frame", {Size = UDim2.new(0, math.random(4, 8), 0, math.random(4, 8)), Position = UDim2.new(0.5, -4, 0.35, 0), BackgroundColor3 = v713[math.random(1, #v713)], BorderSizePixel = 0, Rotation = math.random(0, 360), ZIndex = 300}, v675)
            v13("UICorner", {CornerRadius = UDim.new(0, ((math.random() > (0.5)) and 999) or (2))}, v715)
            v716 = math.rad(math.random(0, 360))
            v717 = math.random(100, 200)
            v14(v715, {Position = UDim2.new(0.5, (math.cos(v716) * v717) - (4), 0.35, math.sin(v716) * v717), Rotation = v715.Rotation + math.random(-180, 180), BackgroundTransparency = 1}, math.random(60, 95) / (100), Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            task.delay(1.05, function()
                v715:Destroy()
            end)
        end
    end
    local function v699()
        task.spawn(function()
            for v718 = 1, 3 do
                v14(v675, {Position = UDim2.new(0.5, -208, 0.5, -186)}, 0.04)
                task.wait(0.04000000000000625)
                v14(v675, {Position = UDim2.new(0.5, -222, 0.5, -186)}, 0.04)
                task.wait(0.04)
            end
            v14(v675, {Position = UDim2.new(0.5, -215, 0.5, -186)}, 0.08)
        end)
    end
    local v700, v701
    local v702 = 0
    function v700(v719, v720, v721)
        local v722
        v702 = v702 + 1
        v722 = v702
        v683.TextColor3 = v720 or v22
        if v721 then
            v683.Text = v719
        end
        v683.Text = ""
        task.spawn(function()
            for v723 = 1, #v719 do
                if ((v722 ~= v702) or not v683.Parent) then
                    return
                end
                v683.Text = string.sub(v719, 1, v723)
                task.wait(0.012)
            end
        end)
    end
    function v701(v724)
        local v725
        local v726
        local v727
        local v728
        local v729
        local v730
        if (tick() < v792) then
            v700(("Too many wrong attempts! Wait %d s"):format(math.ceil(v792 - tick())), v9, true)
        end
        v725 = (v724 and v26(tostring(v724))) or ""
        v686.Text = v725
        v791 = true
        v688.Text = "VERIFYING"
        v690.Visible = true
        v691.Position = UDim2.new(-0.25, 0, 0, 0)
        v700("Verifying password", v22, true)
        task.spawn(function()
            local v731
            while v791 do
                v731 = v731 + (1)
                v700("Verifying password" .. string.rep(".", v731 % 4), v22, true)
                v14(v691, {Position = UDim2.new(0.75, 0, 0, 0)}, 1.1999999999999886, Enum.EasingStyle.Linear)
                task.wait(1.25)
                v691.Position = UDim2.new(-0.25, 0, 0, 0)
            end
        end)
        print("[NOA HUB] şifre kontrolü başladı")
        v726, v727, v728 = pcall(v27, v725)
        if not v726 then
            warn("[NOA HUB] şifre kontrol hatası: " .. tostring(v727))
            v727, v728 = false, tostring(v727)
        end
        v729, v730 = v727, v728
        print("[NOA HUB] şifre kontrolü bitti -> " .. tostring(v729))
        v791 = false
        v690.Visible = false
        if v729 then
            v790 = 0
            v697()
            v24().NoaHub_KeyValid = true
            v700("Correct password! Loading hub...", v10)
            v688.Text = "✔ VERIFIED"
            v14(v688, {BackgroundColor3 = v10}, 0.25)
            v14(v676, {Color = v10, Transparency = 0.04999999999999716}, 0.25)
            v14(v679, {Color = v10}, 0.25)
            v698()
            task.wait(1.1)
            v14(v674, {BackgroundTransparency = 1}, 0.4)
            v14(v677, {Scale = 1.08}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            v14(v675, {BackgroundTransparency = 1}, 0.4)
            task.wait(0.4)
            v673:Destroy()
            v19()
        end
        v790 = v790 + 1
        v697()
        if (v790 >= v20.MaxAttempts) then
            v792 = tick() + v20.Cooldown
            v790 = 0
            v697()
            v684.Visible = true
            v685.Size = UDim2.new(1, 0, 1, 0)
            v14(v685, {Size = UDim2.new(0, 0, 1, 0)}, v20.Cooldown, Enum.EasingStyle.Linear)
            task.spawn(function()
                while v673.Parent and (tick() < v792) do
                    v700(("Too many wrong attempts! %d s left"):format(math.ceil(v792 - tick())), v9, true)
                    task.wait(1)
                end
                if v673.Parent then
                    v684.Visible = false
                    v700("You can try again", v22, true)
                end
            end)
        else
            v700((v730 or "Wrong password!") .. string.format("  (%d/%d)", v790, v20.MaxAttempts), v9)
        end
        v699()
        v688.Text = "VERIFY PASSWORD"
    end
    v686.Focused:Connect(function()
        v14(v687, {Color = v9, Thickness = 1.8}, 0.2)
    end)
    v686.FocusLost:Connect(function(v732)
        v14(v687, {Color = Color3.fromRGB(55, 55, 70), Thickness = 1.4}, 0.2)
        if v732 then
            v701(v686.Text)
        end
    end)
    v688.MouseButton1Click:Connect(function()
        v701(v686.Text)
    end)
    v692.MouseButton1Click:Connect(function()
        local v733
        v733 = v25(v20.GetKeyURL)
        if v733 then
            v700("Password link copied! Open it in your browser to get the password.", v10)
        else
            v700("Couldn't copy, link: " .. v20.GetKeyURL, v21)
        end
        v14(v693, {Color = v9}, 0.15)
        task.wait(0.25)
        v14(v693, {Color = Color3.fromRGB(55, 55, 70)}, 0.3)
    end)
    v694.MouseButton1Click:Connect(function()
        local v734
        v734 = v25(v20.DiscordURL)
        if v734 then
            v700("Discord invite copied! Join the server for support.", v10)
        else
            v700("Couldn't copy, link: " .. v20.DiscordURL, v21)
        end
        v14(v695, {Color = v9}, 0.15000000000009095)
        task.wait(0.25)
        v14(v695, {Color = Color3.fromRGB(55, 55, 70)}, 0.3)
    end)
    v17(v688)
    v17(v692)
    v17(v694)
    v18(v688)
    v18(v692)
    v18(v694)
    local v703 = {
        {v678, nil},
        {v681, nil},
        {v682, nil},
        {v683, nil},
        {v686, v687},
        {v688, v689},
        {v692, v693},
        {v694, v695},
    }
    local v704 = {}
    for v735, v736 in ipairs(v703) do
        local v737
        local v738
        local v739
        v737, v738 = v736[1], v736[2]
        v739 = v15(v737)
        if v738 then
            v739.SepStroke = v738
            v739.SepStrokeVal = v738.Transparency
            v738.Transparency = 1
        end
        v704[v735] = v739
    end
    for v740 = 1, v20.MaxAttempts do
        v696[v740].BackgroundTransparency = 1
    end
    v14(v674, {BackgroundTransparency = 0.45}, 0.35)
    v14(v675, {BackgroundTransparency = 0.029999999999972715}, 0.4)
    v14(v677, {Scale = 1}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    v14(v676, {Transparency = 0.25}, 0.5)
    for v741, v742 in ipairs(v704) do
        local v743
        local v744
        v743 = v703[v741][1]
        v744 = v703[v741][2]
        v16(v743, v742, 0.15 + (v741 * (0.05000000000001137)))
        if v744 then
            local v745
            v745 = v742.SepStrokeVal
            task.delay(0.15 + (v741 * (0.05)), function()
                if v744.Parent then
                    v14(v744, {Transparency = v745}, 0.35)
                end
            end)
        end
    end
    task.delay(0.6, function()
        for v746 = 1, v20.MaxAttempts do
            if v696[v746] then
                v14(v696[v746], {BackgroundTransparency = 0}, 0.3000000000000007)
            end
        end
    end)
    task.delay(1, function()
        while v673.Parent do
            v14(v676, {Transparency = 0.55}, 1.1)
            task.wait(1.1000000000000227)
            v14(v676, {Transparency = 0.25}, 1.1)
            task.wait(1.099999999999909)
        end
    end)
    task.spawn(function()
        task.wait(1.2999999999999545)
        if v673.Parent then
            v700("Enter your password to continue • Get it from 🔑 Password Link", v22)
        end
    end)
end
print("[NOA HUB] adım 3/7: boot başladı, oyun yüklenmesi kontrol ediliyor")
if not game:IsLoaded() then
    print("[NOA HUB] adım 3/7: oyun henüz yüklü değil, bekleniyor...")
    game.Loaded:Wait()
end
task.wait(0.4)
print("[NOA HUB] adım 4/7: oyun yüklendi")
print("[NOA HUB] V32 başlıyor")
if v24().NoaHub_KeyValid then
    print("[NOA HUB] adım 5/7: şifre doğrulanmış, hub direkt başlıyor")
    v19()
else
    v28()
end

-- Senior Hub • Sources De-obfuscator | https://discord.gg/CaDQtHqZxA