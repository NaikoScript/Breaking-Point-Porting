-- Main Variables --
local LocalPlayer = game.Players.LocalPlayer
local UI = LocalPlayer.PlayerGui.ScreenGui or LocalPlayer.PlayerGui:WaitForChild('ScreenGui')
local SkinTypes = {Guns=1,Knifes=2,Chairs=3,Animations=4,Accessories=5,Effects=6}
local Rarities = {Common=Color3.fromRGB(255, 255, 255),Uncommon=Color3.fromRGB(255, 245, 184),Rare=Color3.fromRGB(25, 255, 190),Legendary=Color3.fromRGB(255, 79, 82),Divine=Color3.fromRGB(255, 204, 0),Exotic=Color3.fromRGB(255, 129, 59)}
local RarityOrder = {Exotic=-6,Divine = -5,Legendary = -4,Rare = -3,Uncommon = -2,Common = -1}

-- Configuration --
local SkinType = SkinTypes["Knifes"] -- Where it would be located in your inventory [Guns, Knifes, Chairs, Animations, Accessories, Effects]
local SkinName = "Skylight" -- Name of the skin
local Rarity = "Divine" -- The rarity of the skin [Common, Uncommon, Rare, Legendary, Divine, Exotic]
local SwapTheSkinLocally = true -- Determines if the skin will be swapped on your knife when you hold it or on your table

-- Image data --
local Images = {15853849163,15853849428,15853849758,15853850018,15853850210,15853850416,15853850814,15853851225,15853851456,15853851743,15853851992,15853853280,15853853633,15853853973,15853854263,15853854481,15853854905,15853855205,15853855461,15853863936,15853864303,15853864552}
local Data = {15829773585,15829773471,15829773380,15829773269,15829766107,15829766001,15829765894,15829765807,15829765670,15829765502,15829758227,15829758105,15829757970,15829757850,15829757750,15829757648,15829750409,15829750310,15829750219,15829750095,15829749987,15829749815}

-- Source code --
if UI.inv.sectionframes:GetChildren()[SkinType]:FindFirstChild("GridOrder") then
    if SwapTheSkinLocally == true then
        task.spawn(function()
        for i,v in Data do
            game:GetService("ContentProvider"):PreloadAsync({"rbxassetid://"..v})
        end
        end)
    end
    if #Images == 1 then
        table.insert(Images,Images[1])
    end
    if #Data == 1 then
        table.insert(Data,Data[1])
    end
    local invbut = game.ReplicatedStorage.model.invbut:Clone()
    local SkinWrap = false
    local CurrentImage,CurrentImage2 = 1,1
    local Connection
    task.spawn(function()
        while true do
            wait()
            if CurrentImage > #Images or CurrentImage == #Images then
                CurrentImage = 0
            end
            if CurrentImage2 > #Data or CurrentImage2 == #Data then
                CurrentImage2 = 0
            end
            CurrentImage += 1
            CurrentImage2 += 1
            invbut.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Images[CurrentImage]
            if SkinWrap == true and SwapTheSkinLocally == true then
                if SkinType == 1 then
                    if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("display_gun") then
                        LocalPlayer.Character:FindFirstChild("display_gun").TextureID = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                        if Connection == nil then
                            Connection = LocalPlayer.Character:FindFirstChild("display_gun"):GetPropertyChangedSignal("TextureID"):Once(function()
                                LocalPlayer.Character:FindFirstChild("display_gun").TextureID = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                                Connection = nil
                            end)
                            task.spawn(function()
                                wait()
                                Connection = nil
                            end)
                        end
                    end    
                elseif SkinType == 2 then
                if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("display_blade") and LocalPlayer.Character:FindFirstChild("display_blade"):FindFirstChildOfClass("SpecialMesh") then
                    LocalPlayer.Character:FindFirstChild("display_blade"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                    if Connection == nil then
                        Connection = LocalPlayer.Character:FindFirstChild("display_blade"):FindFirstChildOfClass("SpecialMesh"):GetPropertyChangedSignal("TextureId"):Once(function()
                            LocalPlayer.Character:FindFirstChild("display_blade"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                            Connection = nil
                        end)
                        task.spawn(function()
                            wait()
                            Connection = nil
                        end)
                    end
                end
                if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Tool") and LocalPlayer.Character:FindFirstChildOfClass("Tool").Name == "Blade" and LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle") and LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh") then
                    LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                    if Connection == nil then
                        Connection = LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh"):GetPropertyChangedSignal("TextureId"):Once(function()
                            LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                            Connection = nil
                        end)
                        task.spawn(function()
                            wait()
                            Connection = nil
                        end)
                    end
                end
                elseif SkinType == 3 then
                    if workspace:FindFirstChild("chairs") then
                for i,v in workspace:FindFirstChild("chairs"):GetChildren() do
                    if v:FindFirstChild("Value") and v.Value.Value == LocalPlayer.Name and v:FindFirstChild("MeshChair") and v:FindFirstChild("MeshChair"):FindFirstChildOfClass("SpecialMesh") then
                        v:FindFirstChild("MeshChair"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                        v:FindFirstChild("MeshChair"):FindFirstChildOfClass("SpecialMesh").VertexColor = Vector3.new(1.65,1.65,1.65)
                        if Connection == nil then
                            Connection = v:FindFirstChild("MeshChair"):FindFirstChildOfClass("SpecialMesh"):GetPropertyChangedSignal("TextureId"):Once(function()
                                v:FindFirstChild("MeshChair"):FindFirstChildOfClass("SpecialMesh").TextureId = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                                Connection = nil
                            end)
                            task.spawn(function()
                                wait()
                                Connection = nil
                            end)
                        end
                    end
                    if v:FindFirstChild("Value") and v.Value.Value == LocalPlayer.Name and v:FindFirstChild("skinchair") then
                        v:FindFirstChild("skinchair").TextureID = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                        if Connection == nil then
                            Connection = v:FindFirstChild("skinchair"):GetPropertyChangedSignal("TextureID"):Once(function()
                                v:FindFirstChild("skinchair").TextureID = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. Data[CurrentImage2]
                                Connection = nil
                            end)
                            task.spawn(function()
                                wait()
                                Connection = nil
                            end)
                        end
                    end
                end
                end
            end
            end
        end
    end)
    invbut.name.Text = SkinName
    invbut.type.Text = Rarity
    invbut.type.TextColor3 = Rarities[Rarity]
    invbut.LayoutOrder = RarityOrder[Rarity]
    if RarityOrder[Rarity] < -5 then
        invbut.ZIndex = 2
        invbut.type.ZIndex = 2
        invbut.name.ZIndex = 2
        invbut.BackgroundTransparency = 1
        local ButtonRe = Instance.new("ImageButton")
        ButtonRe.Size = UDim2.new(1,0,1,0)
        ButtonRe.Position = UDim2.new(0.5,0,0.5,0)
        ButtonRe.Image = "rbxassetid://1401978119"
        ButtonRe.ImageColor3 = Rarities[Rarity]
        ButtonRe.ImageTransparency = 0.525
        ButtonRe.AnchorPoint = Vector2.new(0.5,0.5)
        ButtonRe.BackgroundTransparency = 0.3
        ButtonRe.BackgroundColor3 = Color3.fromRGB(40,40,40)
        ButtonRe.ScaleType = Enum.ScaleType.Tile
        ButtonRe.TileSize = UDim2.new(3.5,0,0.4,0)
        ButtonRe.ZIndex = 1
        ButtonRe.Parent = invbut
        ButtonRe.BorderSizePixel = invbut.BorderSizePixel
        ButtonRe.BorderColor3 = Color3.fromRGB(255, 237, 93)
        invbut:GetPropertyChangedSignal("BorderSizePixel"):Connect(function()
        ButtonRe.BorderSizePixel = invbut.BorderSizePixel
        end)
    end
    invbut:GetPropertyChangedSignal("BorderSizePixel"):Connect(function()
        if invbut.BorderSizePixel == 0 then
            SkinWrap = false
        end
    end)
    invbut.Parent = UI.inv.sectionframes:GetChildren()[SkinType]
    invbut.MouseButton1Down:Connect(function()
        if invbut.BorderSizePixel == 0 then
            invbut.BorderSizePixel = 2
            SkinWrap = true
        for i,v in pairs(UI.inv.sectionframes:GetChildren()[SkinType].GridOrder:GetChildren()) do
            if v ~= invbut and v:IsA("ImageButton") then
                v.BorderSizePixel = 0
            end
        end
            else
                invbut.BorderSizePixel = 0
            end
            end)
        else
            error("Could not find grid order. Did you forget to run breaking plus?")
        end
