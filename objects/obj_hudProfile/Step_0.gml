profileTextMove = lerp(profileTextMove, 20, 0.05);

kd = global.kill_count / global.death_count;

#region //metering

interval++;
if(interval >= 60){
	interval = 0;
	
	//fps
	fpsreal = floor(fps_real);

}
#endregion