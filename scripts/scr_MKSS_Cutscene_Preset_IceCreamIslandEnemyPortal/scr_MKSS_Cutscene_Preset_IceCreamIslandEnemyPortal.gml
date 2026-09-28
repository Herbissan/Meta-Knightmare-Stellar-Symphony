///@description MKSS - Cutscene - Preset - Ice Cream Island Enemy Portal

function scr_MKSS_Cutscene_Preset_IceCreamIslandEnemyPortal()
{
	#region Setup
	canBePaused = false;
	
	cameraOffset = 0;
	cameraOffsetTarget = 120;
	cameraOffsetOld = global.camera.xOffset;
	spawnedEnemyID = -1;
	
	instance_create_depth(0,0,0,obj_MKSS_CameraOffsetController);
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		#region Update Environments & Camera
		with (obj_MKSS_CameraOffsetController) targetXOffset = other.cameraOffset;
		#endregion
		
		if (!localPause)
		{
			#region Camera
			cameraOffset = lerp(cameraOffset,cameraOffsetTarget,.05);
			#endregion
		}
	};
	#endregion
	
	#region Phase Setup Scripts
	phaseSetupScript = 
	[
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			with (obj_Player) clampToView = false;
			
			phaseTimer = 60;
		},
		function()
		{
			spawnedEnemyID = instance_create_layer(176,168,"Enemies",obj_EnemySpawner);
			with (spawnedEnemyID)
			{
				spawnTimer = 60;
				
				enemyHasSpawner = false;
				
				dirX = -1;
				enemyObject = obj_MKSS_Enemy_WaddleDee;
				enemyAISetup = scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup;
				
				spawnParticleScript = scr_MKSS_ParticleSet_EnemySpawn;
				spawnParticleScriptArgs = [x,y,spawnTimer];
			}
			
			phaseTimer = 120;
		},
		function()
		{
			cameraOffsetTarget = cameraOffsetOld;
			
			phaseTimer = 60;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (spawnedEnemyID == -1)
			{
				spawnedEnemyID = instance_create_layer(176,168,"Enemies",obj_EnemySpawner);
				
				with (spawnedEnemyID)
				{
					spawnTimer = 60;
					
					enemyHasSpawner = false;
					
					dirX = -1;
					enemyObject = obj_MKSS_Enemy_WaddleDee;
					enemyAISetup = scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup;
				}
			}
			
			with (spawnedEnemyID)
			{
				spawnTimer = 0;
			}
			
			cameraOffsetTarget = cameraOffsetOld;
			cameraOffset = cameraOffsetOld;
			
			with (obj_MKSS_CameraOffsetController)
			{
				if (other.isSkipped)
				{
					xOffset = other.cameraOffset;
					scr_Camera_UpdateOffsets(xOffset,yOffset);
				}
				targetXOffset = other.cameraOffset;
			}
			
			with (obj_Player)
			{
				clampToView = true;
				
				scr_MKSS_Player_SetTutorialText("[XIcon] Slash",300);
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}