@echo off

echo "Running TestGravity"
haxe -lib hl-bullet -lib heaps --main TestGravity --hl testgravity.hl
hl testgravity.hl

echo "Running TestGroundCollision"
haxe -lib hl-bullet -lib heaps --main TestGroundCollision --hl testgroundcollision.hl
hl testgroundcollision.hl

echo "Running TestLinearVelocity"
haxe -lib hl-bullet -lib heaps --main TestLinearVelocity --hl compiled.hl
hl compiled.hl

echo "Running TestAngularVelocity"
haxe -lib hl-bullet -lib heaps --main TestAngularVelocity --hl compiled.hl
hl compiled.hl