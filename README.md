# Breaking Point Porting
### How to use this?  
**1)** execute **[breaking plus](https://github.com/NaikoScript/Breaking-Plus)**  
**2)** run one of the scripts within one of the item folders or the one below

> [!WARNING]
> **THIS IS VISUAL SO ONLY YOU WILL BE ABLE TO SEE IT AND ONCE YOU REJOIN THEY WILL BE GONE**

# Get every item script
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/main/AllItem/"..item.name))()
    end
else
    error("Failed to get the items. Status code: " .. response.StatusCode)
end

```

## Update Changelogs
**1)** A lot of new items  
**2)** Instead of allitempreviews its now formatted base on the item  
**3)** Duplicate items will have their item type on the right of their name (ex. Red Gun,Red Knife) (NOT IN GAME)  
