part_particles_create(global.partSystem, x + random_range(-sprite_width / 2 + 20, sprite_width / 2 - 20), y + sprite_height / 2 - 5, global.partPanelParticle, 1);

if(swayTog){
	sway = lerp(sway, -0.1, 0.01);
	if(sway <= -0.09) swayTog = 0;
} else {
	sway = lerp(sway, 0.1, 0.01);
	if(sway >= 0.09) swayTog = 1;
}
y += sway;

