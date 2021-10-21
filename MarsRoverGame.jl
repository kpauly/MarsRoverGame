# game window dims
HEIGHT = 760
WIDTH = 760
# game window background
BACKGROUND = colorant"white"

# Globals to store the level actor properties
level = 1
rover_health = 1
dx1, dx2 = 3, 2
dy1, dy2 = 2, 3

# Start playing background music (uncomment at liberty)
# play_music("radetzky_ogg")

# Define game objects
# Actor positions are randomly initialized
satview = Actor("jezerocrater_small.jpg")

txt = TextActor("Level $level", "moonhouse")
txt.pos = (340,20)
txt2 = TextActor("Error : insufficient driver IQ !", "moonhouse")
txt2.pos = (180,180)
txt3 = TextActor("Close the window to restart the test", "moonhouse")
txt3.pos = (100,240)
txt4 = TextActor("You rock !", "moonhouse")
txt4.pos = (300,180)

target = Circle(rand(5:745), rand(5:745), 10)

rover = Actor("scratchrover_sprite_mars_rotate.png")
rover.pos = 400, 700

enemy_1 = Actor("dustdevil_small.png")
enemy_1.pos = rand(5:745), rand(5:745)
enemy_2 = Actor("dustdevil_small.png")
enemy_2.pos = rand(5:745), rand(5:745)

# The update function is called every frame. Within the function, we 
# * change the position of the enemy actors by their velocity
# * if the up/down/left/right keys are pressed, we move the rover actor accordingly
# * getting hit by an enemy actor results in sudden death
# * getting on target results in success 
function update(g::Game)
    global dx1, dy1, dx2, dy2, level, rover_health
    if g.keyboard.DOWN
        rover.y += 1
    elseif g.keyboard.UP
        rover.y += -1
    elseif g.keyboard.LEFT
        rover.x += -1
    elseif g.keyboard.RIGHT
        rover.x += 1
    end
    
    enemy_1.position.x += dx1
    enemy_1.position.y += dy1
    # enemy actor should bounce off the walls
    if enemy_1.x > 760-enemy_1.w || enemy_1.x < 2
        dx1 = -dx1
    end
    if enemy_1.y > 760-enemy_1.h || enemy_1.y < 2
        dy1 = -dy1
    end

    enemy_2.position.x += -dx2
    enemy_2.position.y += dy2
    if enemy_2.x > 760-enemy_2.w || enemy_2.x < 2
        dx2 = -dx2
    end
    if enemy_2.y > 760-enemy_2.h || enemy_2.y < 2
        dy2 = -dy2
    end

    if collide(rover, enemy_1) || collide(rover, enemy_2)
        rover_health = 0
    end
    
    if collide(rover, target)
        rover_health = 2
    end

end

# draw the Actors
function draw(g::Game)
    draw(satview)
    if rover_health == 1
        draw(txt)
        draw(target, colorant"red", fill = true)
        draw(rover)
        draw(enemy_1)
        draw(enemy_2)
    elseif rover_health == 0
        draw(txt2)
        draw(txt3)
    else
        draw(txt4)
        draw(txt3)
    end
end
