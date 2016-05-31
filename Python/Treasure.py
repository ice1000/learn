import random, math, time

import mcpi.block as block
import mcpi.minecraft as minecraft
mc=minecraft.Minecraft.create()

v_height=0

while v_height <= 0:
    (tx, tz)=(random.randint(-125,125), random.randint(-125,125))
    v_height=mc.getHeight(tx, tz)

mc.setBlock(tx, v_height-2, tz, block.DIAMOND_BLOCK)

vdistance = math.sqrt(math.pow(mc.player.getTilePos().x-tx, 2) + math.pow(mc.player.getTilePos().z-tz, 2))

while mc.getBlock(tx, v_height-2, tz)!=0:

    vnewdistance=math.sqrt(math.pow(mc.player.getTilePos().x-tx,2)+math.pow(mc.player.getTilePos().z-tz, 2))

    if vnewdistance <= 1: mc.postToChat("Dig!")
    elif vdistance > vnewdistance: mc.postToChat("Nearer!")
    elif vdistance < vnewdistance: mc.postToChat("Farthur!")
    else: mc.postToChat("Move!")

    vdistance=vnewdistance

    time.sleep(2)

mc.postToChat("Treasure found... And destroyed!")
mc.postToChat("Congratulations!")