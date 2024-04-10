/mob/living/carbon/superior_animal/liberty
	name = "mob template"
	desc = "You should not be seeing this. Scream at the top of your lungs if you do."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("clicks")
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "fauna"
	wander = TRUE
	fire_verb = "shoots"
	see_in_dark = 10
	sanity_damage = 1
	destroy_surroundings = TRUE

	ranged = FALSE

	maxHealth = 100
	health = 100

	melee_damage_lower = 10
	melee_damage_upper = 15

	armor = list(melee = 30, bullet = 40, energy = 35, bomb = 25, bio = 100, rad = 100)

	//inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_DWARFISM, MUTATION_NERVOUSNESS, MUTATION_DEAF, MUTATION_IMBECILE) - Cant be used so dont track these
	contaminant_immunity = TRUE
	cold_protection = 1000
	heat_protection = 100
	breath_required_type = 0
	breath_poison_type = 0
	min_breath_required_type = 0
	min_breath_poison_type = 0
	min_air_pressure = 0 //below this, brute damage is dealt
	max_air_pressure = 10000 //above this, brute damage is dealt
	min_bodytemperature = 0 //below this, burn damage is dealt
	max_bodytemperature = 10000 //above this, burn damage is dealt
	friendly_to_colony = FALSE
	/* Armor related variables - Soj edit we have are own
	var/melee = 0
	var/bullet = 0
	var/energy = 0
	var/bomb = 0
	var/bio = 0
	var/rad = 0

	 Damage multiplier when destroying surroundings*/
	var/surrounds_mult = 0.5

	// The ennemy of all wurmkind
	//var/obj/machinery/mining/drill/DD

	//Controller that spawned the wurm
	//var/datum/wurm_controller/controller

	range_telegraph = "starts to wobble at"

/mob/living/carbon/superior_animal/liberty/ventrofacius
	name = "vicious Ventrofacius"
	desc = "This unusual creature suffered carcinification, with two reddish claws protruding from its furry, ceramic-like shell as an extension of what was previously an antenna. It lacks hands, and its mouth is located on its stomach."
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	melee_damage_lower = 15
	melee_damage_upper = 20
	chitin_amount = 6	//Lil' bit of chitin for your efforts. Crob.
	maxHealth = 125 //2nd Edit. Gave them way more health due to how easy it was to kill. Sorry Medi.
	health = 125
	move_to_delay = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

/mob/living/carbon/superior_animal/liberty/magnibrachius
	name = "deranged Magnibrachius"
	desc = "A peculiar creature with a large brain and pair of long arms that replaces their short legs. It seems the short legs are becoming more and more vestigial each generation. \
	However, their arms are stronger than a earth's gorilla, and often squash bones and skulls for fun."
	icon_state = "magnibrachius"
	icon_dead = "magnibrachius_dead"
	attacktext = "smashed"
	attack_sound = 'sound/weapons/blunthit.ogg'
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 250 //2nd Edit. Gave them way more health due to how easy it was to kill. Sorry Medi.
	health = 250
	move_to_delay = 7
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

/mob/living/carbon/superior_animal/liberty/oculamia
	name = "antagonized creature"						//Medi suggested this be unnamed for now
	desc = "A strange serpentoid creature with three visible arms topped with curved hard tips, its fourth arm is broken off or otherwise malformed."
	icon_state = "oculamia"
	icon_dead = "oculamia_dead"

	ranged = TRUE
	ranged_cooldown = 1
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/bullet/rock/ice
	rapid = FALSE
	comfy_range = 5

	melee_damage_lower = 10
	melee_damage_upper = 15
	darkbones_amount = 4	//Not very big, so not a lot of bones. Spineless..........
	maxHealth = 400 //More health than a noraml person. //2nd Edit. Gave them way more health due to how easy it was to kill. Sorry Medi.
	health = 400
	move_to_delay = 7
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

