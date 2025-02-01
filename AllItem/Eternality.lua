-- Main Variables --
local LocalPlayer = game.Players.LocalPlayer
local UI = LocalPlayer.PlayerGui.ScreenGui or LocalPlayer.PlayerGui:WaitForChild('ScreenGui')
local SkinTypes = {Guns=1,Knifes=2,Chairs=3,Animations=4,Accessories=5,Effects=6}
local Rarities = {Common=Color3.fromRGB(255, 255, 255),Uncommon=Color3.fromRGB(255, 245, 184),Rare=Color3.fromRGB(25, 255, 190),Legendary=Color3.fromRGB(255, 79, 82),Divine=Color3.fromRGB(255, 204, 0),Exotic=Color3.fromRGB(255, 129, 59)}
local RarityOrder = {Exotic=-6,Divine = -5,Legendary = -4,Rare = -3,Uncommon = -2,Common = -1}

-- Configuration --
local SkinType = SkinTypes["Knifes"] -- Where it would be located in your inventory [Guns, Knifes, Chairs, Animations, Accessories, Effects]
local SkinName = "Eternality" -- Name of the skin
local Rarity = "Divine" -- The rarity of the skin [Common, Uncommon, Rare, Legendary, Divine, Exotic]
local SwapTheSkinLocally = true -- Determines if the skin will be swapped on your knife when you hold it or on your table

-- Image data --
local Images = {13365188693,13365190672,13365192817,13365195661,13365197749,13365199378,13365203255,13365204785,13365206486,13365209025,13365210815,13365213447,13365214961}
local Data = {14068625870,14068627896,14068628830,14068629908,14068631541,14068632561,14068633886,14068635038,14068636061,14068638127,14068645259,14068646536,14068647681,14068655204,14068656152,14068657317,14068658434,14068659576,14068660610,14068661928,14068662932,14068663782,14068664716,14068665665,14068666928,14068668070,14068669252,14068670934,14068673111,14068673956}

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
