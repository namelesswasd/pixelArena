hp--;
global.combo++;
for(var i = 0; i <= 2; i++)part_particles_create(global.partSystem, random_range(x-10,x+10), y, global.ptHit, 1);
