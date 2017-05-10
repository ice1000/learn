import random, math, time

import mcpi.block as block
import mcpi.minecraft as minecraft
mc=minecraft.Minecraft.create()

mc.postToChat("Coded by ice1000")
mc.postToChat("Nether Wolrd!")
mc.postToChat("Wait for the God!!")
dis = 3

(x1,y1,z1) = mc.player.getPos()
x = x1-dis
z = z1-dis
height = y1-dis
while height <= y1:
    z = z1-dis
    while z <= (z1+dis):
        x = x1-dis
        while x <= (x1+dis):
            if mc.getBlock(x,height,z) != 0:
                mc.setBlock(x,height,z,block.Block(87))
            x += 1
        z += 1
    height += 1

height -= 1
x = 0
z = 0
while x < 4:
    mc.setBlock(x1-2+x,height  ,z1,block.OBSIDIAN)
    mc.setBlock(x1-2+x,height+4,z1,block.OBSIDIAN)
    x += 1
while z < 3:
    mc.setBlock(x1-2,height+1+z,z1,block.OBSIDIAN)
    mc.setBlock(x1+1,height+1+z,z1,block.OBSIDIAN)
    z += 1

xGate = x1 - 1
yGate = height + 1
zGate = z1

mc.postToChat("Remember the location of the Entrance!")

x = 0
z = 0
blo = 0
get = 0

mc.postToChat("Lava time!Run fast to the begin place!")
time.sleep(7)
mc.postToChat("Now get you location.")
(x1,y1,z1) = mc.player.getPos()
mc.postToChat("5!")
time.sleep(1)
mc.postToChat("4!")
time.sleep(1)
mc.postToChat("3!")
time.sleep(1)
mc.postToChat("2!")
time.sleep(1)
mc.postToChat("1!")
time.sleep(1)
(x2,y2,z2) = mc.player.getPos()
mc.setBlocks(x1,y1-1,z1,x2,y2-1,z2,block.LAVA_STATIONARY)

mc.postToChat("Build time!")
time.sleep(3)
mc.postToChat("go into the Obsidian Gate to put an End to this!")

print xGate
print yGate
print zGate

fuck = 1
while fuck:
    (x1,y1,z1) = mc.player.getPos()
    if (x1 <= xGate + 0.5 and x1 >= xGate -1.5) and (y1 >= yGate and y1 <= yGate + 1.5) and (z1 >= zGate - 0.6 and z1 <= zGate + 0.6):
        fuck = 0
    x = x1-1
    z = z1-1
    height = y1-2
    while height <= y1:
        z = z1-1
        while z <= (z1+1):
            x = x1-1
            while x <= (x1+1):
                get = mc.getBlock(x,height,z)
                if get != 0: 
                    if get == 2 or get == 3 or get == 12 or get == 24 or get == 5 or get == 17 or get == 18 or get == 87 or get == 35:
                        mc.setBlock(x,height,z,block.Block(87))
                    elif get == 49 or get == 246 or get == 7 or get == 10 or get == 11:
                        mc.setBlock(x,height,z,block.Block(get))
                    elif get == 37 or get == 38:
                        mc.setBlock(x,height,z,block.MUSHROOM_BROWN)
                    elif get == 8 or get == 9:
                        mc.setBlock(x,height,z,block.Block(get+2))
                    else:
                        mc.setBlock(x,height,z,block.GLOWSTONE_BLOCK)
                x += 1
            z += 1
        height += 1

mc.postToChat("Enjoy the nether world!")
mc.postToChat("Created by ice1000!")