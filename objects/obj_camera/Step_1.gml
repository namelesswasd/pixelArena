// initializing game user interface\nhud.initialize("pixel_arena", v1.atestat, 1.3)\n\n----HUD INITIALIZING---\nWELCOME USER !$!(*@%&!@*%&)\nLAST LOGIN: 14/06/42\nLAST LOGIN ATTEMPT: 01/01/96\nPLEASE UPDATE THE APPLICATION, FILES MAY BE CORRUPT!\n\nLOADING ASSETS:\n== spr_healthBar : ---------------------------- | DONE \n== spr_icon : ---------------------------- | DONE \n== spr_blackScreen : ---------------------------- | DONE \n== spr_dmgScreen : ---------------------------- | DONE \n== spr_introScreen : ---------------------------- | DONE \n== spr_dmc : ---------------------------- | DONE \n\nLOADING TEXT:\n== HUD_HEALTH : ---------------------------- | DONE \n== HUD_SEPARATOR : ---------------------------- | DONE \n== HUD_WEAPON_BACK : ---------------------------- | DONE \n== HUD_WEAPON_AMMO : ---------------------------- | DONE \n== HUD_WAVE_TEXT : ---------------------------- | DONE \n\nstruct group_info init_groups = { .usage = ATOMIC_INIT(2) };\nstruct group_info *groups_alloc(int gidsetsize)\n{\n	struct group_info *group_info;int nblocks;\n	int i;nblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK;\n	/* Make sure we always allocate at least one indirect block pointer */\n	nblocks = nblocks ? : 1;\n	group_info = kmalloc(sizeof(*group_info) + nblocks*sizeof(gid_t *), \n	GFP_USER);if (!group_info)return NULL;group_info->ngroups = gidsetsize;\n	group_info->nblocks = nblocks;atomic_set(&group_info->usage, 1);\n	if (gidsetsize <= NGROUPS_SMALL)group_info->blocks[0] = group_info->small_block;\n	else {\n		for (i = 0; i < nblocks; i++) {\n			gid_t *b;b = (void *)__get_free_page(GFP_USER);\n			if (!b)goto out_undo_partial_alloc;\n			group_info->blocks[i] = b;\n			}\n		}\n		return group_info;\n		out_undo_partial_alloc:\n		while (--i >= 0) {\n			free_page((unsigned long)group_info->blocks[i]);\n			}\n			kfree(group_info);\n	return NULL;\n}EXPORT_SYMBOL(groups_alloc);\n\n----INITIAZATION COMPLETE----\n\n\nGOOD LUCK!\n