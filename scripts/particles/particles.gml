gml_pragma("global", "particles()");

randomize();

#region //bullet particles

var _p = part_type_create();

part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 5, 20);

part_type_color2(_p, c_yellow, c_black);
part_type_scale(_p, 2.5, 2.5);
part_type_gravity(_p, 0.1, 270);
part_type_alpha2(_p, 1, 0);

global.ptBullet = _p;

#endregion

#region //player particles (experimental)

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 0, 50);

part_type_color2(_p, c_white, c_gray);
part_type_alpha2(_p, 0.5, 0);
part_type_gravity(_p, 0.03, 90);
part_type_scale(_p, 1, 1);
part_type_direction(_p, 90, 90, 0, 0);
part_type_speed(_p, 2, 4, 0, 0);

global.ptPlayer = _p;

#endregion

#region //enemy hit blood

var _p = part_type_create();
part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 20, 50);

part_type_scale(_p, 5, 5);
part_type_color1(_p, c_red);
part_type_direction(_p, 0, 180, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);
part_type_speed(_p, 2, 2, 0, 0);
part_type_alpha2(_p, 1, 0);

global.ptHit = _p;

#endregion

#region //enemy death

var _p = part_type_create();
part_type_shape(_p, pt_shape_explosion);
part_type_life(_p, 10, 30);

part_type_scale(_p, 1, 1);
part_type_color1(_p, c_red);
part_type_orientation(_p, 0, 360, 0, 0, true);
part_type_alpha2(_p, 1, 0);

global.ptDeathEnemy = _p;

#endregion

#region //player hit

var _p = part_type_create();
part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 10, 30);

part_type_scale(_p, 5, 5);
part_type_color1(_p, c_red);
part_type_direction(_p, 0, 360, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);
part_type_speed(_p, 2, 2, 0, 0);
part_type_alpha2(_p, 1, 0);
part_type_gravity(_p, 0.05, 270);

global.ptPlayerHit = _p;

#endregion

#region //summoning

var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 20, 50);

part_type_gravity(_p, 0.05, 90);
part_type_orientation(_p, 90, 90, 0, 0, false);
part_type_scale(_p, 0.3, 0.3);
part_type_alpha2(_p , 1, 0);
part_type_color1(_p, c_red);

global.partEWorm = _p;

#endregion

#region //rain (experimental)

var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 50, 100);

//part_type_gravity(_p, 0.1, point_direction(mouse_x, mouse_y, 734, 367));
part_type_direction(_p, point_direction(mouse_x, mouse_y, 734, 367), point_direction(mouse_x, mouse_y, 734, 367), 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);
part_type_speed(_p, 20, 30, 0, 0);
part_type_color1(_p, c_navy);
part_type_alpha1(_p, 0.5);
part_type_scale(_p, 0.1, 0.1);

global.partRain = _p;
#endregion

#region //player dash

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 10, 30);

part_type_scale(_p, 0.15, 0.15);
part_type_color1(_p, c_white);
part_type_alpha2(_p, 0.5, 0);
part_type_orientation(_p, 0, 360, 2, 0, false);

global.partDash = _p

#endregion

#region //lazer destroy

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 10, 70);

part_type_scale(_p, 0.2, 0.2);
part_type_color1(_p, c_red);
part_type_alpha2(_p, 1, 0);
part_type_gravity(_p, 0.1, 90);
part_type_orientation(_p, 0, 360, 0.5, 0, false);

global.partLazer = _p;

#endregion

#region //player death

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 50, 200);

part_type_scale(_p, 1, 1);
part_type_color2(_p, c_white, c_gray);
part_type_alpha2(_p, 1, 0);
part_type_direction(_p, 0, 360, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);
part_type_speed(_p, 1, 1, 1, 0);


global.partPlayerDeath = _p;

#endregion

#region //menu logo

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 10, 50);

part_type_scale(_p, 0.2, 0.2);
part_type_color1(_p, c_white);
part_type_alpha2(_p, 1, 0);
part_type_direction(_p, 180, 180, 0, 0);
part_type_orientation(_p, 0, 360, 2, 0, true);
part_type_speed(_p, 3, 5, 0, 0);


global.partMenuLogo = _p;

#endregion

#region //menu lines

var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 50, 150);

part_type_scale(_p, 0.3, 0.3);
part_type_color1(_p, c_white);
part_type_alpha2(_p, 0.3, 0);
part_type_direction(_p, 90, 90, 0, 0);
part_type_orientation(_p, 90, 90, 0, 0, false);
part_type_speed(_p, 10, 20, 0, 0);

global.partMenuLines = _p;

#endregion

#region //ammo part

var _p = part_type_create();
part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 10, 50);

part_type_scale(_p, 1.5, 1.5);
part_type_color1(_p, c_yellow);
part_type_alpha2(_p, 1, 0);
part_type_direction(_p, 90, 90, 0, 0);
part_type_orientation(_p, 0, 360, 1, 0, false);
part_type_speed(_p, 0.5, 2, 0, 0);

global.partAmmoCrate = _p;
#endregion

#region //panel particles

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 10, 50);

part_type_scale(_p, 0.1, 0.1);
part_type_alpha2(_p, 1, 0);
part_type_orientation(_p, 0, 360, 1, 0, false);
part_type_gravity(_p, 0.05, 270);

global.partPanelParticle = _p;
#endregion

#region //intro bar left

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 100, 200);

part_type_scale(_p, 0.7, 0.7);
part_type_color1(_p, c_white);
part_type_alpha2(_p, 1, 0);
part_type_direction(_p, 0, 0, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, false);
part_type_speed(_p, 1, 5, 0, 0);

global.partIntroBarLeft = _p;

#endregion

#region //intro bar left

var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 100, 200);

part_type_scale(_p, 0.7, 0.7);
part_type_color1(_p, c_white);
part_type_alpha2(_p, 1, 0);
part_type_direction(_p, 180, 180, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, false);
part_type_speed(_p, 1, 5, 0, 0);

global.partIntroBarRight = _p;

#endregion

#region //intro part

var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 100, 100);

part_type_scale(_p, 0.7, 0.7);
part_type_color2(_p, c_red, c_black);
part_type_alpha3(_p, 0, 1, 0);
part_type_direction(_p, 90, 90, 0, 0);
part_type_orientation(_p, 90, 90, 0, 0, false);
part_type_speed(_p, 5, 15, 0, 0);

global.partIntro = _p;
#endregion