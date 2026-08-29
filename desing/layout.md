# Portrait Layout

|--------------|-----|
  (O)  -          -
                  X
 Oponent Points   P
                  B
       +          +
|--------------|-----|
| ↓ | X   (T)  Y | ↑ | 
|-----|--------------|
   +         +
   X
   P    Player Points
   B
   -         -   (O)
|-----|--------------|

# Landscape Layout

|--------------|-----|--------------|
  (O)   -         ↓     -  XP Bar + 
               |-----|--------------|
 Oponent Points   X         +        
                 (T)         
       +          Y    Player Points
|--------------|-----|
  +  XP Bar -     ↑         -   (O)
|--------------|-----|--------------|

# Notes
- Oponent and Player points are integer positive values starting at 0
- XP bars are integer values starting at 0
- Match points are integer values represented as X - Y where X is the oponent score and Y is the player score.
- Match points are increased with the arrows and require a dialog confirmation.
- In this document the arrow down represent scoring for the oponent and arrow up scores for the player respectively.
- (T) is for a chronometer displayed in a circle always in the middle of the board, a single click/tap start/stop the chronometer, and a double click/tap reset the chronometer to 0.
- The chronometer start stopped when the page loads.
- The time in T is displayed as MM:SS, MM is minutes and SS is seconds.
- The text for the opponent components (points, xp bar and match points) is showed "upside down" meaning it is rotated 180 degrees, to facilitate the reading for the opponent.
- The timer text is oriented normally as every other player components.
- (O) Represent options for the each player, for now it would only be used to change colors, 8 total colors to choose from; yellow, purple, blue, red, green, orange (inspire yourself in the riftbound [runes](/image.png)), black and white.
- The initial colors for the player should lean towards yellow while the oponent colors should lean towards purple (make this simple to change by some constants file or something).
- Ideally players should not be able to choose the same color.
