tool
extends Node

export (bool) var Generate = false setget onGenerate

export (bool) var DisableFilter = false

export var tileSize = 16
export var tileCountX = 0
export var tileCountY = 0
export var margin = 1
export (Texture) var spritesheet


func _ready():
    pass

func onGenerate(isTriggered):
	if(isTriggered):
		Generate = false
		var yPoint = 0
		for y in range(tileCountY):
			var xPoint = 0
			for x in range(tileCountX):
				var positionVect = Vector2(xPoint,yPoint)
				var sizeVect = Vector2(tileSize, tileSize)
				var tileRegion = Rect2(positionVect, sizeVect)
				
				var tile = Sprite.new()
				add_child(tile)
				tile.set_owner(self)
				tile.set_name(str(x)+"-"+str(y))
				tile.set_texture(spritesheet)
				tile.set_region(true)
				tile.set_region_rect(tileRegion)
				tile.position = Vector2(xPoint + tileSize / 2, yPoint + tileSize / 2)
				
				if(DisableFilter):
					tile.get_texture().set_flags(0)
				
				xPoint += tileSize + margin
			yPoint += tileSize + margin