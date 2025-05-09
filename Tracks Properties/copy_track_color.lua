-- @description Copy track color (0xRRGGBB)
-- @author Wuzzmi
-- @version 1.1
-- @changelog Should now work on both window and unix systems
-- @about Copies the selected track's color as hex to clipboard. The hex format used is "0xRRGGBB". Made for translating track colors to sws auto color.

-- Get track color
local track = reaper.GetSelectedTrack(0, 0)
local deci_color = reaper.GetTrackColor(track)

-- decimal > hex
local hex = string.format("%x", deci_color):sub(2)
--check os
local os = package.config:sub(1,1)
--if windows reorder colors
if os == "\\" then
    local red = string.sub(hex, 5, 6)
    local green = string.sub(hex, 3, 4)
    local blue = string.sub(hex, 1, 2)
    hex = red .. green .. blue
end

-- Add prefix
local pre = "0x"
local formatted_hex = pre .. hex

-- Copy > clipboard
reaper.CF_SetClipboard(formatted_hex)
