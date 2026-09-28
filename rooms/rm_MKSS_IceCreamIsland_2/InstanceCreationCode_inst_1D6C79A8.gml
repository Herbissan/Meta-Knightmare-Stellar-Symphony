spawnTimer = 60;

enemyHasSpawner = false;

dirX = -1;
enemyObject = obj_MKSS_Enemy_WaddleDee;
enemyAISetup = scr_MKSS_Enemy_WaddleDee_AI_Idle_Setup;

spawnParticleScript = scr_MKSS_ParticleSet_EnemySpawn;
spawnParticleScriptArgs = [x,y,spawnTimer];