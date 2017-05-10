import random, math, time

import mcpi.block as block
import mcpi.minecraft as minecraft
mc=minecraft.Minecraft.create()

mc.postToChat("by ice1000")

while 1:
    time.sleep(1.0)
    x = random.randint(-100,100)
    y = random.randint(-100,100)
    mc.player.setPos(x,mc.getHeight(x,y),y)
