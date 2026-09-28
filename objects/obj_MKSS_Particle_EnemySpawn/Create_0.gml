///@description Create

#region Initialize Variables
sound = scr_PlaySfx(snd_MKSS_EnemySpawner_Ready);
audio_sound_pitch(sound,random_range(.85,1.15));

portalScale = .2;
portalScaleTarget = 1;

particleTimer = 0;
particleTimerMax = 5;
destroyTimer = -1;
#endregion

#region Create Portal
portal = instance_create_depth(x,y,depth + 1,obj_MKSS_CrossPortal);
#endregion