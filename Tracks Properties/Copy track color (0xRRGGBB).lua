-- @description Copy track color (0xRRGGBB)
-- @author Wuzzmi
-- @version 1.0
-- @about Copies the selected track's color as hex to clipboard. The hex format used is "0xRRGGBB". Made for translating track colors to sws auto color.


-- Get track color
local track = reaper.GetSelectedTrack( 0, 0 )
local deci_color = reaper.GetTrackColor( track )

-- decimal > hex
local hex = string.format("%x", deci_color):sub(2)
local red = string.sub( hex, 5, 6 )
local green = string.sub( hex, 3, 4 )
local blue = string.sub( hex, 1, 2 )
local conv_hex = red .. green .. blue

-- Add prefix 
local pre = "0x"
local formated_hex = pre .. conv_hex

-- Copy > clipboard
reaper.CF_SetClipboard( formated_hex )

