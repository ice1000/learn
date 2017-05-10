import random, math, time

import mcpi.block as block
import mcpi.minecraft as minecraft
mc=minecraft.Minecraft.create()

limit = 20
(x,z) = ( 120,120 ) 
height = -5
mc.postToChat("by ice1000")

while z >= -95:
    mc.postToChat("Line Generated.")
    while x >= -95:
        height = -5
        limit = random.randint(5,30)
        x -= random.randint(20,29)
        while height <= limit:
            mc.setBlock(x-1,height,z-1,block.OBSIDIAN)
            mc.setBlock(x-1,height,z,  block.OBSIDIAN) 
            mc.setBlock(x-1,height,z+1,block.OBSIDIAN)
            mc.setBlock(x,  height,z-1,block.OBSIDIAN)
            mc.setBlock(x,  height,z,  block.OBSIDIAN)
            mc.setBlock(x,  height,z+1,block.OBSIDIAN)
            mc.setBlock(x+1,height,z-1,block.OBSIDIAN)
            mc.setBlock(x+1,height,z,  block.OBSIDIAN)
            mc.setBlock(x+1,height,z+1,block.OBSIDIAN)
            height += 1
        mc.setBlock(x,height,z,block.GLOWING_OBSIDIAN)
    z -= random.randint(20,29)
    x = 120

mc.postToChat("Welcom to the EndLand!")