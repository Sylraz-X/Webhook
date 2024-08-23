local webhookURL = "https://discordapp.com/api/webhooks/1275797443014950965/9EeI2e0VH8ur9fdqMO-nhgAeSmqOL_4zEynO2fBF-wOYQrozFFXfmTKF9xkwc4Qkp7dl"

local bb = game:service('VirtualUser')
game:service('Players').LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new(0,0))
end)


local function sendToWebhook(url, payload)
    local HttpService = game:GetService("HttpService")
    http_request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode(payload)
    })
end


local embeds = {
    {
        ["title"] = "This user has run the script.",
        ["color"] = 255,
        ["fields"] = {
            {["name"] = "Username", ["value"] = game.Players.LocalPlayer.Name, ["inline"] = true},
            {["name"] = "Place Id", ["value"] = game.PlaceId, ["inline"] = true},
        },
        ["footer"] = {["text"] = "Time Executed"},
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
}

local message = {
    ["username"] = "Grand Piece",
    ["embeds"] = embeds
}


sendToWebhook(getgenv().Webhook, message)
