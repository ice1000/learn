from mcpi import minecraft
from time import sleep
import mcpi.block as block
mc = minecraft.Minecraft.create()
mc.postToChat("By SD")
x, y, z = mc.player.getPos()
mc.setBlocks(x+10, y+10, z+10, x+30, y+10, z+30, block.TNT, 1)
print mc.getBlock(x,y-1,z)
# Prepare
mc.postToChat("Game will start in 20 sec......")
sleep(5)
mc.postToChat("Game will start in 15 sec......")
sleep(5)
mc.postToChat("Game will start in 10 sec......")
sleep(5)
mc.postToChat("Game will start in 5 sec......")
sleep(1)
mc.postToChat("Game will start in 4 sec......")
sleep(1)
mc.postToChat("Game will start in 3 sec......")
sleep(1)
mc.postToChat("Game will start in 2 sec......")
sleep(1)
mc.postToChat("Game will start in 1 sec......")
sleep(1)
mc.postToChat("Allons-y!")

block_beneath = mc.getBlock(x, y-1, z)  # block ID
if block_beneath == 0:
    mc.setBlock(x, y, z, 0)
else:
    mc.setBlock(x, y-1, z, 0)
sleep(0.1)
