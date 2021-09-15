@echo off

echo "Running TestGravity"
haxe -lib bullet -lib heaps --main TestGravity --hl compiled.hl
hl compiled.hl

echo "Running TestGroundCollision"
haxe -lib bullet -lib heaps --main TestGroundCollision --hl compiled.hl
hl compiled.hl

echo "Running TestLinearVelocity"
haxe -lib bullet -lib heaps --main TestLinearVelocity --hl compiled.hl
hl compiled.hl

echo "Running TestAngularVelocity"
haxe -lib bullet -lib heaps --main TestAngularVelocity --hl compiled.hl
hl compiled.hl