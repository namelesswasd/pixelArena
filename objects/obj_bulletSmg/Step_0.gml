if(!obj_camera.is_paused) speed = 25;
else speed = 0;

if(place_meeting(x, y, obj_arena)) instance_destroy();
else if(x > room_width + 500 or x < -500 or y > room_height + 500 or y < -500) instance_destroy();

part_particles_create(global.partSystem, x, y, global.ptBullet, 1);	