///@description Camera - State - Follow Object

function scr_Camera_State_FollowObject()
{
	#region Camera Position
	if ((followingObject != -1) and (instance_exists(followingObject)))
	{
		var targetCameraX = followingObject.x - (global.gameWidth / 2) + xOffset - global.hudCameraXOffset;
		var targetCameraY = followingObject.y - (global.gameHeight / 2) + yOffset - global.hudCameraYOffset;
		
		cameraX = targetCameraX;
		cameraY = targetCameraY;
	}
	#endregion
	
	#region Set Camera
	cameraX = clamp(cameraX,min(0,xOffset),room_width + max(0,xOffset) - global.gameWidth) + shakeXFinal;
	cameraY = clamp(cameraY,min(0,yOffset),room_height + max(0,yOffset) - global.gameHeight) + shakeYFinal;
	
	if (cameraX1Limit != -1)
	{
		limitedXOffset1 = lerp(limitedXOffset1,cameraX1Limit,.05);
	}
	else
	{
		limitedXOffset1 = cameraX;
	}
	if (cameraX2Limit != -1)
	{
		limitedXOffset2 = lerp(limitedXOffset2,cameraX2Limit,.05);
	}
	else
	{
		limitedXOffset2 = cameraX + global.gameWidth;
	}
	if (cameraY1Limit != -1)
	{
		limitedYOffset1 = lerp(limitedYOffset1,cameraY1Limit,.05);
	}
	else
	{
		limitedYOffset1 = cameraY;
	}
	if (cameraY2Limit != -1)
	{
		limitedYOffset2 = lerp(limitedYOffset2,cameraY2Limit,.05);
	}
	else
	{
		limitedYOffset2 = cameraY + global.gameHeight;
	}
	
	if (cameraX1Limit != -1)
	{
		if (abs(cameraX1Limit - limitedXOffset1) <= .05)
		{
			limitedXOffset1 = cameraX1Limit;
		}
		cameraX = max(cameraX,limitedXOffset1);
	}
	if (cameraX2Limit != -1)
	{
		if (abs(cameraX2Limit - limitedXOffset2) <= .05)
		{
			limitedXOffset2 = cameraX2Limit;
		}
		cameraX = min(cameraX,limitedXOffset2 - global.gameWidth);
	}
	if (cameraY1Limit != -1)
	{
		if (abs(cameraY1Limit - limitedYOffset1) <= .05)
		{
			limitedYOffset1 = cameraY1Limit;
		}
		cameraY = max(cameraY,limitedYOffset1);
	}
	if (cameraY2Limit != -1)
	{
		if (abs(cameraY2Limit - limitedYOffset2) <= .05)
		{
			limitedYOffset2 = cameraY2Limit;
		}
		cameraY = min(cameraY,limitedYOffset2 - global.gameHeight);
	}
	
	camera_set_view_pos(mainView,cameraX,cameraY);
	#endregion
}