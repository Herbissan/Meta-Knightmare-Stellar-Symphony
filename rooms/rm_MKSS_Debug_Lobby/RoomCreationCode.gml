///@description Room Creation Code

#region Music
audio_stop_sound(global.musicPlaying);
#endregion
/*
#region Spawner Test
with (instance_create_layer(40,40,"Enemies",obj_EnemySpawner))
{
	spawnTimer = 60;
	enemyHasSpawner = false;
	
	dirX = -1;
	enemyObject = obj_MKSS_Enemy_WaddleDee;
	enemyAISetup = scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup;
	
	spawnParticleScript = scr_MKSS_ParticleSet_EnemySpawn;
	spawnParticleScriptArgs = [x,y,spawnTimer];
}
#endregion