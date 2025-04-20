-- Get the color of the selected track in decimal format(default)
track = reaper.GetSelectedTrack( 0, 0 )
deci_color = reaper.GetTrackColor( track )

-- Convert the decimal color to hex
hex = string.format("%x", deci_color):sub(2)
red = string.sub( hex, 5, 6 )
green = string.sub( hex, 3, 4 )
blue = string.sub( hex, 1, 2 )
conv_hex = red .. green .. blue

-- Add 0x signing 
sign = "0x"
formated_hex = sign .. conv_hex

-- Copy the Hex color to clipboard
reaper.CF_SetClipboard( formated_hex )

