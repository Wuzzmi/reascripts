-- @description Copy track color(0xrrggbb)
-- @author Wuzzmi
-- @version 1.0
-- @about Copies the selected track's color as hex to clipboard. The hex format used is prefixed with "0x".


-- Get track color
track = reaper.GetSelectedTrack( 0, 0 )
deci_color = reaper.GetTrackColor( track )

-- decimal > hex
hex = string.format("%x", deci_color):sub(2)
red = string.sub( hex, 5, 6 )
green = string.sub( hex, 3, 4 )
blue = string.sub( hex, 1, 2 )
conv_hex = red .. green .. blue

-- Add prefix 
pre = "0x"
formated_hex = pre .. conv_hex

-- Copy > clipboard
reaper.CF_SetClipboard( formated_hex )

