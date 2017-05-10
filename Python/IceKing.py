import random, math, time

import mcpi.block as block
import mcpi.minecraft as minecraft
mc=minecraft.Minecraft.create()

mc.postToChat("by ice1000")
mc.postToChat("Everyone Should afraid Camus!")
while 1 == 1:
    (x1,y1,z1) = mc.player.getPos()
    x = x1-1
    z = z1-1
    height = y1-1
    while height <= y1:
        z = z1-1
        while z <= (z1+1):
            x = x1-1
            while x <= (x1+1):
                mc.setBlock(x,height,z,block.ICE)
                x += 1
            z += 1
        time.sleep(0.3)
        height += 1