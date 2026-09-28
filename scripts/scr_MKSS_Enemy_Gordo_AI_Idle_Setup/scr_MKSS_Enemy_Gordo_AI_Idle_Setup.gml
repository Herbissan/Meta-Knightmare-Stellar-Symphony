///@description MKSS - Enemy - Gordo - AI - Idle - Setup

function scr_MKSS_Enemy_Gordo_AI_Idle_Setup()
{
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Gordo_AI_Idle_Step;
	#endregion
	
	#region Visual Variables
	dirXEffectDraw = false;
	dirYEffectDraw = false;
	drawDirX = dirX;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Gordo_Palette_Normal;
	#endregion
}