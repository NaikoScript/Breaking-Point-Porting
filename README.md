# Breaking Point Porting
### How to use this?  
**1)** execute **[breaking plus](https://github.com/NaikoScript/Breaking-Plus)**  
**2)** run one of the scripts within one of the item folders

> [!WARNING]
> **THIS IS VISUAL SO ONLY YOU WILL BE ABLE TO SEE IT AND ONCE YOU REJOIN THEY WILL BE GONE**

## Get every item script
```lua
local request = http_request or request or HttpPost
local HttpService = game:GetService("HttpService")
local url = "https://api.github.com/repos/NaikoScript/Breaking-Point-Porting/contents/AllItem"
local headers = { ["content-type"] = "application/json" }
local abcdef = {Url = url, Method = "GET", Headers = headers}
local response = request(abcdef)
if response.StatusCode == 200 then
    local content = HttpService:JSONDecode(response.Body)
    for i, item in pairs(content) do
        task.spawn(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/main/AllItem/"..item.name))()
        end)
    end
else
    error("Failed to get the items. Status code: " .. response.StatusCode)
end

```

## Update Changelogs
**1)** Now you will be able to equip the skins and see them in game  
**2)** Code readability is way better
