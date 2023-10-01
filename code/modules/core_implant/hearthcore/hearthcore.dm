#define OBELISK_UPDATE_TIME 5 SECONDS

var/list/disciples = list()

/obj/item/implant/core_implant/hearthcore
	name = "Hearthcore"
	icon_state = "hearthcore_green"
	desc = "This symbol and power core of knighthood resides at the very heart of Custodian accolades, a silver implant that marks the initiation of a new knight."
	allowed_organs = list(BP_CHEST)
	implant_type = /obj/item/implant/core_implant/hearthcore
	layer = ABOVE_MOB_LAYER
	security_clearance = CLEARANCE_COMMON
	access = list(access_crematorium)
	power = 0
	max_power = 100
	power_regen = 0.5
	price_tag = 10000
	var/channeling_boost = 0  // used for the power regen boost if the wearer has the channeling perk
	var/obj/item/hearthcore_upgrade/upgrade
	unacidable = 1

/obj/item/implant/core_implant/hearthcore/install(mob/living/target, organ, mob/user)
	. = ..()
	if(.)
		target.stats.addPerk(PERK_SANITYBOOST)

/obj/item/implant/core_implant/hearthcore/uninstall()
	wearer.stats.removePerk(PERK_SANITYBOOST)
	return ..()

/obj/item/implant/core_implant/hearthcore/get_mob_overlay(gender, form)
	gender = (gender == MALE) ? "m" : "f"
	return image('icons/mob/human_races/cyberlimbs/neotheology.dmi', "[icon_state]_[gender]")

/obj/item/implant/core_implant/hearthcore/hard_eject()
	if(!ishuman(wearer))
		return
	var/mob/living/carbon/human/H = wearer
	name = "[H]'s Hearthcore" //This is included here to make it obvious who a Hearthcore belonged to if it was surgically removed
	if(H.stat == DEAD)
		return
	if(!active)
		return
	H.adjustBrainLoss(60)
	H.adjustOxyLoss(200+rand(50))
	if(part)
		H.apply_damage(100+rand(150), BURN, part)
	H.apply_effect(40+rand(20), IRRADIATE, check_protection = 0)
	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(3, 1, src)
	s.start()

/obj/item/implant/core_implant/hearthcore/activate()
	if(!wearer || active)
		return

	if(is_carrion(wearer))
		playsound(wearer.loc, 'sound/hallucinations/wail.ogg', 55, 1)
		wearer.gib()
		return
	..()
	add_module(new HEARTHCORE_COMMON)
	update_data()
	disciples |= wearer
	return TRUE


/obj/item/implant/core_implant/hearthcore/deactivate()
	if(!active || !wearer)
		return
	disciples.Remove(wearer)
	..()

/obj/item/implant/core_implant/hearthcore/Process()
	..()
	if(wearer && wearer.stat == DEAD || wearer.is_mannequin) //If were dead or a mannequin we do not actively process our hearthcore
		deactivate()
	if(wearer && wearer.stats && wearer.stats.getPerk(PERK_RADIANCE) && round(world.time) % 5 == 0)
		power_regen -= channeling_boost  // Removing the previous channeling boost since the number of disciples may have changed
		//wearer.visible_message(SPAN_DANGER("Old [channeling_boost]"))
		channeling_boost = 0.2 * disciples.len  // Proportional to the number of people with hearthcores on board
		power_regen += channeling_boost  // Applying the new power regeneration boost
		//wearer.visible_message(SPAN_DANGER("New [channeling_boost]"))

/obj/item/implant/core_implant/hearthcore/examine(mob/user)
	..()
	var/datum/core_module/hearthcore/cloning/data = get_module(HEARTHCORE_CLONING)
	if(data?.mind) // if there is cloning data and it has a mind
		to_chat(user, SPAN_NOTICE("This Hearthcore has been activated."))
		if(isghost(user) || (user in disciples))
			var/datum/mind/MN = data.mind
			if(MN.name) // if there is a mind and it also has a name
				to_chat(user, SPAN_NOTICE("This Hearthcore belongs to <b>[MN.name]</b>."))
			else
				to_chat(user, SPAN_DANGER("Something terrible has happened with these radiances. Please notify your superiors in the lower colonies."))
	else // no cloning data
		to_chat(user, "This Hearthcore has not yet been activated.")

/obj/item/implant/core_implant/hearthcore/proc/transfer_soul()
	if(!wearer || !activated)
		return FALSE
	var/datum/core_module/hearthcore/cloning/data = get_module(HEARTHCORE_CLONING)
	if(wearer.dna.unique_enzymes == data.dna.unique_enzymes)
		for(var/mob/M in GLOB.player_list)
			if(M.ckey == data.ckey)
				if(M.stat != DEAD)
					return FALSE
		var/datum/mind/MN = data.mind
		if(!istype(MN, /datum/mind))
			return
		MN.transfer_to(wearer)
		wearer.ckey = data.ckey
		for(var/datum/language/L in data.languages)
			wearer.add_language(L.name)
		update_data()
		if (activate())
			return TRUE

/obj/item/implant/core_implant/hearthcore/proc/update_data()
	if(!wearer)
		return

	add_module(new HEARTHCORE_CLONING)

//////////////////////////
//////////////////////////

/obj/item/implant/core_implant/hearthcore/proc/make_common()
	remove_modules(HEARTHCORE_OATHPLEDGE)
	security_clearance = CLEARANCE_COMMON
