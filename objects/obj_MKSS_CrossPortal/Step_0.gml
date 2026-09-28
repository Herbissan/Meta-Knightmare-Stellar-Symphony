///@description Main

if (!localPause)
{
	#region Portal Animation
	portalScale = lerp(portalScale,portalScaleTarget,.05);
	
	if (portalScale <= .05) instance_destroy();
	#endregion
}