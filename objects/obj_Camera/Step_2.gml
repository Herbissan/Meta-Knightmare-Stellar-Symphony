///@description End Step

#region Shake
scr_Camera_Shake();
#endregion

#region Camera Setup
if (isActive)
{
	if (cameraState != -1) script_execute(cameraState);
}
#endregion

#region Background Control
if (backgroundState != -1) script_execute(backgroundState);
#endregion