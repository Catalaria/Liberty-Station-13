//Holds all the proj, guns and spells for the Hussars. The Hussars focuses on movement, rapid attacks and dealing pain. In overall, they are the specializations that focus on muscular improvement and spearheading any battle formation to quickly attack an enemy, and then fall back. They can deal pain and toxin damage (at the same time) to weaken enemies before clashing against them. In other hands, they may have an ranged approach with radiant bows.

/datum/lecture/hearthcore/hussar
	name = "Hussar"
	category = "Hussar"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

/datum/lecture/hearthcore/hussar/skirmish
	name = "Skirmishing"
	phrase = "Oxidate Lecture: Skirmishing."
	desc = "Temporarily enable radiance to create internal alveoli, gathering oxygen from the surface of the skin and deliver it directly to the muscles. Simultaneously, the radiance filter out lactic acid, enhancing muscle function for increased speed and stamina."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	power = 35

datum/lecture/hearthcore/hussar/skirmish/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C,list/targets)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 25)//You need 25 robustness at minimum to use this lecture
		to_chat(lecturer, "<span class='info'>The feeling of rejuvenation washes over you. You feel comfortable warmth on your muscles.</span>")
		lecturer.add_chemical_effect(CE_SPEEDBOOST, 0.3, 5, "skirmish")
		lecturer.add_chemical_effect(CE_OXYGENATED, 5)
		lecturer.updatehealth()
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE

/obj/item/projectile/hussar
	damage_types = list(HALLOSS = WEAPON_FORCE_HARMLESS)
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	armor_penetration = list(ARMOR_PEN_GRAZING)
	check_armour = ARMOR_ENERGY
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	recoil = 1

	//Temp for debug testing untill C-sprites are done
	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact

//end of misery
/obj/item/projectile/misery/normal
	damage_types = list(HALLOSS = WEAPON_FORCE_NORMAL) //10 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/dangerous
	damage_types = list(HALLOSS = WEAPON_FORCE_DANGEROUS) //20 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/robust
	damage_types = list(HALLOSS = WEAPON_FORCE_ROBUST) //26 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/brutal
	damage_types = list(HALLOSS = WEAPON_FORCE_BRUTAL) //33 of damage
	armor_penetration = ARMOR_PEN_SHALLOW
//end of normal blazelances


/datum/lecture/hearthcore/hussar/misery
	name = "Misery from Malady"
	phrase = "Oxidate Lecture: Misery from Malady."
	desc = "Makes your radiance abuse the pain receptors of the enemy. Sometimes even making the pain relatable to ovarian or testicular torsion."
	power = 30

/datum/lecture/hearthcore/hussar/misery/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/misery/flame = new /obj/item/gun/misery(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, silvery ionized metal.",
		"The radiance completely covers one of your hands, willing to punish others. It seems to be laughing somehow."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/misery //Miseries used by knights with Hussar specialization.
	name = "Pain Overloader"
	desc = "This radiance is curiously shaped, no longer shaped like a little hearthcore, but rather a Y. It seems to use this shape to overload the nerves of any creature to their biddings, sometimes making the pain relatable to ovarian or testicular torsion."
	icon = 'icons/obj/guns/projectile/blazelance.dmi'
	icon_state = "blazelance"
	item_state = "blazelance"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = HALLOSS
	var/projectile_type = /obj/item/projectile/blazelance // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE
	knightly_check = TRUE

/obj/item/gun/misery/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	var/rob = holder.stats.getStat(STAT_ROB)
	if(changes_projectile)
		switch(rob)
			if(1 to 20)
				force = /obj/item/projectile/cblazelance/normal
			if(21 to 40)
				force = /obj/item/projectile/cblazelance/dangerous
			if(41 to 60)
				force = /obj/item/projectile/cblazelance/robust
			if(61 to INFINITY)
				force = /obj/item/projectile/cblazelance/brutal
			else
				force = /obj/item/projectile/cblazelance
	START_PROCESSING(SSobj, src)

/obj/item/gun/misery/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/misery/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/datum/lecture/hearthcore/hussar/stealth //Experimental
	name = "Radiant Mirror"
	phrase = "Oxidate Lecture: Radiant Mirror."
	desc = "Allow your radiance in a polished state to reach your skin and start reflecting the light on the other side of your body. Functional against humans and alike. \
	It is not perfect, but still effective for stealth operations. Does not work against creatures that relies on body warmth or smells to notice you."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "convalescence"
	effect_time = 1 MINUTES
	power = 90

/datum/lecture/hearthcore/hussar/stealth/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.invisibility = INVISIBILITY_WEAK
	user.alpha = 75
	user.visible_message(SPAN_DANGER("[user.name] becomes reasonably transparent."))
	anim(get_turf(user), user,'icons/mob/mob.dmi',,"cloak",,user.dir)
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	return TRUE

/datum/lecture/hearthcore/hussar/stealth/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.invisibility = INVISIBILITY_NONE
	user.alpha = 255

//forget the bow. Make a sniper lecture here that only ignites and deal low damage.

/datum/lecture/hearthcore/hussar/fblazelance
	name = "Focused Blazelance"
	phrase = "Oxidate Lecture: Focused Blazelance."
	desc = "Focus the blazelance in two hands at the same time. This will allow better concentration due to the same focus on two lenses."
	power = 100

/datum/lecture/hearthcore/hussar/fblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/tblazelance/flame = new /obj/item/gun/blazelancesniper(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered in bluish ionized metal.",
		"The radiance fully envelops your hand, soon to highlight the vulnerability of your enemy"
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/blazelancesniper // I hate myself
	name = "Double lense blazelance"
	desc = "This one was made because Monochrome9090 is a retard."
	icon = 'icons/obj/guns/projectile/blazelance.dmi'
	icon_state = "blazelance"
	item_state = "blazelance"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = HALLOSS
	zoom_factors = list(1,2)
	var/projectile_type = /obj/item/projectile/beam/fblazelance // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	init_firemodes = list(
		WEAPON_CHARGE //Need help to make this weapon only shoot when fully charged.
	)
	twohanded = TRUE // because you are using double focuses for the lenses, you must use both hands like a Kamehameha
	serial_shown = FALSE
	safety = FALSE
	knightly_check = TRUE

/obj/item/gun/blazelancesniper/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	START_PROCESSING(SSobj, src)

/obj/item/gun/blazelancesniper/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/blazelancesniper/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return
