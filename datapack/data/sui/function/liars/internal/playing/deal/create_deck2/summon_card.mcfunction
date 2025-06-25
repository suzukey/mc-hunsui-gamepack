$loot spawn ~ ~ ~ loot sui:liars/deck/$(card_type)
data modify storage temp:item_display item set from entity @e[type=item,sort=nearest,limit=1] Item
summon item_display ~ ~ ~ {Tags:["liars.noset"]}
data modify entity @e[type=item_display,limit=1,tag=liars.noset] item set from storage temp:item_display
kill @e[type=item,sort=nearest,limit=1]
