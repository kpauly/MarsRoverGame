# MarsRoverGame
A naive Julia implementation of the NASA JPL mars rover coding game using the zero overhead GameZero.jl package (https://github.com/aviks/GameZero.jl).

## How to run
1. Download and unzip (or clone) this repository
2. Download and install Julia from http://julialang.org/downloads (for Windows 10 users, I highly recommend installing through the Windows store instead)
3. Open a Julia REPL, and change the working directory to this one (where the MarsRoverGame.jl, Project.toml, and Manifest.toml files reside) by typing `julia> cd("C:\\path\\to\\game\\MarsRoverGame\\MarsRoverGame.jl")`. (Note: Windows users can copy the path from the Explorer address bar preceded by `raw` to avoid having to type double backslashes: `cd(raw"C:\path\to\game\MarsRoverGame\MarsRoverGame.jl")` )
4. In the Julia REPL, type `]` to go into the (awesome built-in) `Pkg` Package manager
5. Do the following to create a local environment and reproduce the setup. Only the necessary dependencies in their correct version will be brought in.
```
pkg> activate .
pkg> instantiate
```
and hit backspace to exit `Pkg`

6. Then, upon the first use in the active REPL, do `julia> using GameZero`
7. Finally, run the game by typing `julia> rungame("C:\\path\\to\\game\\MarsRoverGame\\MarsRoverGame.jl")`
(Windows users: right-click the `.jl` file in the folder and choose `copy as path`, then paste into the REPL as `rungame(raw"C:\path\to\game\MarsRoverGame\MarsRoverGame.jl")` )

## How to play
As soon as the game window opens, move the mars rover to avoid the roaming dust devils by using the arrow keys (the rover moves as long as an arrow key is held down, but you can only go in one cardinal direction at a time). If a dust devil hits the rover, you lost and the game is over. If you manage to reach the target (the red dot), you win and the game is over. When the game is over, close the window (and redo step 7 above in the still active REPL to restart the game. The target position and initial dust devil positions will change randomly for each game). 

## Notes
Levels are still to be implemented.
