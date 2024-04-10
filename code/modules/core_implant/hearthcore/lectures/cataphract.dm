/datum/lecture/hearthcore/cataphract
	name = "Cataphract"
	category = "Cataphract"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

//Holds all the proj, guns and spells for the Cataphract. The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield. They make ~stands~ (automatons) to supply their defensive capacity and area-negating capacity.

/datum/lecture/hearthcore/cataphract/cataphract_personal //Shield that uses the radiance pool. So the user either have to choose to protect itself, or to attack.
	name = "Radiance Personal Shield"
	phrase = "Oxidate Lecture: Radiance Personal Shield."
	desc = "The shield of the Cataphract Knights to protect the custodians in any given situation."
	power = 40

/datum/lecture/hearthcore/cataphract/cataphract_personal/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/shield_projector/rectangle/cataphract_personal/flame = new /obj/item/shield_projector/rectangle/cataphract_personal(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered in thick-layered silvery metal.",
		"The radiance completely covers one of your hands. It constantly draws and releases radiance from your bloodstream."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/shield_projector/rectangle/cataphract_personal
	name = "Cataphract personal shield"
	description_info = "A swift-deploying personal energy shield, powered by the Hearthcore's internal generator and manifested through radiance, offering protection against surprise attacks.  \
	Reliant on radiance reserves, but accessible at any time. It is unable to block area effects like flashbangs or explosions."
	icon_state = "last_shelter"
	high_color = "#FFFFFF"
	shield_health = 2
	max_shield_health = 2
	size_x = 1
	size_y = 1
	shield_regen_amount = 0
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	var/obj/item/implant/core_implant/hearthcore/linked_hearthcore

//Still need to make the shield delete itself when it disactivates (after the power reaches 0), and when the holder dropsit
/obj/item/shield_projector/rectangle/cataphract_personal/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	START_PROCESSING(SSobj, src)

/obj/item/shield_projector/rectangle/cataphract_personal/Process()
	if(loc != holder)
		visible_message("[src] has been broken! The struggling radiance sinks into your skin to breath after so much punishment.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// All the shields tied to their projector are one 'unit', and don't have individualized health values like most other shields.
/obj/effect/directional_shield/cataphract_personal/adjust_health(amount)
	if(projector)
		projector.adjust_health(amount)

/obj/item/shield_projector/rectangle/cataphract_personal/create_shield(newloc, new_dir)
	var/obj/effect/directional_shield/cataphract_personal/S = new(newloc, src)
	S.dir = new_dir
	active_shields += S

//fill the gaps
/obj/item/shield_projector/rectangle/cataphract_personal/attack_self(mob/living/carbon/human/user as mob)
	if(!user.get_core_implant(/obj/item/implant/core_implant/hearthcore))
		qdel(src)
		return
	var/obj/item/implant/core_implant/hearthcore/C = user.get_core_implant(/obj/item/implant/core_implant/hearthcore)
	if(C.power <= 0)
		qdel(src)
		return
	shield_health = C.power
	max_shield_health = C.max_power
	linked_hearthcore = C
	..()

/obj/item/shield_projector/rectangle/cataphract_personal/adjust_health(amount)
	linked_hearthcore.power += (amount * 0.1) //This is negitive, so were adding a negitive number
	shield_health = linked_hearthcore.power
	if(linked_hearthcore.power <= 0)
		destroy_shields()
	..()

/datum/lecture/hearthcore/cataphract/purification
	name = "Genuine Purification"
	phrase = "Oxidate Lecture: Genuine Purification."
	desc = "By spreading radiance to the hand's surface and igniting it, the Knight can use the residual energy as a flamethrower on the battlefield."
	power = 90

/datum/lecture/hearthcore/cataphract/purification/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/custodian_fireball/purification/flame = new /obj/item/gun/custodian_fireball/purification(src, lecturer)
	// Don't spawn the item in question if our hands aren't empty, to prevent it from despawning.
	if(lecturer.hands_are_full())
		to_chat(lecturer, "<span class='warning'>You need your hands free to perform this ritual!</span>")
		return FALSE

	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, silvery ionized metal.",
		"The radiance completely covers one of your hands, willing to sacrifice itself to punish others as you see fit."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/custodian_fireball/purification
	name = "Genuine Purification"
	desc = "The beloved, benevolent purification of the body, to allow these maintenance pests and mutants to finally rest in piece."
	icon = 'icons/obj/guns/projectile/blazelance.dmi'
	icon_state = "blazelance"
	item_state = "blazelance"
	projectile_type = /obj/item/projectile/flamer_lob/flamethrower // What does it shoot
	use_amount = 4 // How many times the gun can shoot
	fire_sound = 'sound/weapons/flamethrower_fire.ogg'

/obj/item/gun/custodian_fireball/purification/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// Alternative to drop it: Use in hand to delete the gun
/obj/item/gun/custodian_fireball/purification/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the silvery metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, deionized."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/obj/item/gun/custodian_fireball/purification/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	START_PROCESSING(SSobj, src)

/obj/item/gun/custodian_fireball/purification/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/datum/lecture/hearthcore/cataphract/dummy
	name = "Assemble: Taunting Dummy"
	phrase = "Radiance, hear me. Assemble the Taunting Dummy."
	desc = "Assemble with your own radiance a thin, taunting dummy. It looks like a moving body to animalistic enemies, may not work for people. Can still be used as a living shield."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35

/datum/lecture/hearthcore/cataphract/dummy/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_WIL)
	if(rob > 25)
		to_chat(lecturer, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
		new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy(lecturer.loc)
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE//Not enough robustness to use this lecture.

/datum/lecture/hearthcore/cataphract/flamecestus
	name = "Produce Flame Cestus"
	phrase = "Oxidate Lecture: Produce Flame Cestus."
	desc = "By performing deionisation of the silver in the hands with a hollow pathway for the radiance, it is possible to make Flame Cestus. Each punch covers the enemy in fiery radiance, igniting them."
	power = 100
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "flamecestus"

/datum/lecture/hearthcore/cataphract/flamecestus/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/clothing/gloves/dusters/flamecestus/flame = new /obj/item/clothing/gloves/dusters/flamecestus(src, lecturer)
	// Don't spawn the item in question if our hands aren't empty, to prevent it from despawning.
	if(lecturer.hands_are_full())
		to_chat(lecturer, "<span class='warning'>You need your hands free to perform this ritual!</span>")
		return FALSE

	lecturer.visible_message(
		"As [lecturer] chants, a flame cestus materializes from their bloodstream, covering [lecturer.get_gender() == MALE ? "his" : lecturer.get_gender() == FEMALE ? "her" : "their"] hands in fiery layers of silver.",
		"The radiance sacrificed itself forging a new cestus for your use, materializing unto your hands. Your hearthcore is tired. You cannot do this lecture again any time soon."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE
