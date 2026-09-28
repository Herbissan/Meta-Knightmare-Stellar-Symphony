///@description Draw

#region Create Surface
if (!instance_exists(obj_MKSS_Surface_Planetarium)) instance_create_depth(0,0,0,obj_MKSS_Surface_Planetarium);
#endregion

#region Portal
if (surface_exists(obj_MKSS_Surface_Planetarium.drawSurface))
{
	var portalScaleFinal = portalScale + (random_range(-.025,.025));
	
	scr_DrawMask_Begin();
	
	scr_DrawMask_Mask(spr_MKSS_CrossPortal,,,,portalScaleFinal,portalScaleFinal);
	
	draw_surface(obj_MKSS_Surface_Planetarium.drawSurface,x - 64,y - 64);
	
	scr_DrawMask_End();
}
#endregion