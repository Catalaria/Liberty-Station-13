/obj/machinery/spicebed
	name = "spicebed grower"
	desc = "A complex hydroponic tray designed to grow selected, rare herbs that normally could have never been cultivated by traditional methods."
	icon = 'icons/obj/custodians_spicebed.dmi'
	icon_state = "spice_pot"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 1000
	circuit = null
	var/obj/item/spice_plant/planted_item = null
	var/growth = 0 //Amount of growth are plant has, its a counter not a true false
	var/max_growth = 100
	var/can_harvest = FALSE

/obj/machinery/spicebed/update_icon()
	cut_overlays()
	icon_state = initial(icon_state)

	if(planted_item)
		var/grabbed_number = growth_to_percent()
		switch(grabbed_number)
			if(0)
				add_overlay("seed_ling")
			if(1)
				add_overlay("[planted_item.name]_1")
			if(2)
				add_overlay("[planted_item.name]_2")
			if(3)
				add_overlay("[planted_item.name]_3")
			if(4)
				add_overlay("[planted_item.name]_4")

/obj/machinery/spicebed/proc/growth_to_percent()
	//Another kinda gross proc
	if(growth >= 100)
		return 4
	if(growth >= 75)
		return 3
	if(growth >= 50)
		return 2
	if(growth >= 25)
		return 1
	if(growth >= 0)
		return 0

/obj/machinery/spicebed/examine(mob/user)
	..()
	if(planted_item)
		to_chat(user, "<span class='warning'>You can see some [planted_item.name] growing, looks like [get_growth_prefex()].")
	else
		to_chat(user, "Looks like [get_growth_prefex()].")

/obj/machinery/spicebed/proc/get_growth_prefex(mob/user)
	if(!planted_item)
		return "nothing is growing here"
	else
		var/grabbed_number = growth_to_percent()
		switch(grabbed_number)
			if(0)
				return "it has just been planted"
			if(1)
				return "the seedling has sprouted and is growing"
			if(2)
				return "the plant is about halfway done growing"
			if(3)
				return "the spice is almost ready to be harvested"
			if(4)
				return "the spice is ready to be harvested"

/obj/machinery/spicebed/attackby(obj/item/I, mob/user)

	//Hijack tool uses for this, helps us not decontruct this
	if(istool(I))
		tool_use(I, user)
		return

	if(istype(I, /obj/item/spice_plant))
		if(!planted_item)
			planted_item = I
			qdel(I)
			to_chat(user, "<span class='warning'>You plant \the [I.name] in \the [src].")
		else
			to_chat(user, "<span class='warning'>\The [src] already has a plant inside.")
		return

	..()

/obj/machinery/spicebed/Process()
	//If we dont have a plant then we dont care
	if(!planted_item)
		return
	if(prob(planted_item.growth_chance))
		growth += planted_item.growthrate
		update_icon()
		if(growth >= 100)
			can_harvest = TRUE

/obj/machinery/spicebed/proc/tool_use(obj/item/I, mob/user)
	//Little gross of a proc but this should allow us to with many tools remove the plant
	var/tool_type = I.get_tool_type(user, list(QUALITY_SHOVELING, QUALITY_CUTTING, QUALITY_DIGGING), src)
	if(user.a_intent == I_HURT)
		switch(tool_type)
			if(QUALITY_SHOVELING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_TGH))
					clean_spicebed()
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					clean_spicebed()
			if(QUALITY_DIGGING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_ROB))
					clean_spicebed()
	return

/obj/machinery/spicebed/attack_hand(mob/living/user)
	if(planted_item && can_harvest)
		harvest_cultiviation(user)
	else
		to_chat(user, "<span class='warning'>The plant isnt ready to be harvested yet.")

/obj/machinery/spicebed/proc/harvest_cultiviation(mob/living/user)
	if(planted_item && growth >= max_growth)
		if(planted_item.amount_to_harvest)
			for(var/amount in planted_item.amount_to_harvest)
				new planted_item(get_turf(user))
			clean_spicebed()

/obj/machinery/spicebed/proc/clean_spicebed()
	QDEL_NULL(planted_item)
	growth = 0
	update_icon()


//The spices

//TODO: move these somewere reasonable
/obj/item/spice_plant
	name = "rotton gourd seed"
	desc = "A bad seed from a bad plant, you should report this somewere."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "debug"
	var/amount_to_harvest = 3 //When we harvest this plant how many items we get
	var/growthrate = 5 //How much out of 100 are plant is growing per successful process tick
	var/growth_chance = 80 //How likely we are to grow in a process tick
	var/Qi = "debug"

/obj/item/spice_plant/ginger_root
	name = "ginger root"
	desc = "Ginger roots are extensively employed in food and drink brewing, primarily to maintain the Enkindled Calderon's flasks at a consistent temperature, \
	preventing heat dissipation until the flask is broken. This ensures the flask retains its heat throughout the process."
	icon_state = "ginger_root"
	amount_to_harvest = 4
	growthrate = 2
	growth_chance = 80
	Qi = "gr"

/obj/item/spice_plant/spikenard
	name = "spikenard bundle"
	desc = "Spikenard, which was employed as a perfume and a wine spice during the Early Roman Empire and even referenced in the Bible, is utilized by the Custodians as an essential oil in numerous fast-burning flasks."
	icon_state = "spikenard"
	amount_to_harvest = 2
	growthrate = 10
	growth_chance = 60
	sanity_damage = -0.01
	Qi = "sn"

/obj/item/spice_plant/clove
	name = "clove root"
	desc = "Due to the presence of eugenol, clove brews are widely recognized for their analgesic properties and effectiveness as an insect repellent. Numerous clove-based brews can have a highly toxic effect on insects."
	icon_state = "clove"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 75
	Qi = "cr"

/obj/item/spice_plant/cinnamon
	name = "cinnamon branch"
	desc = "Although it has no direct impact on health, cinnamon is commonly added to custodian brews to facilitate the absorption of the brew by the body, enabling chemicals to reach areas beyond the stomach. It is widely utilized in various custodian healing liqueurs."
	icon_state = "cinnamon"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 75
	Qi = "cam"

/obj/item/spice_plant/rosemary
	name = "rosemary bundle"
	desc = "A fragrant herb esteemed by Custodians, celebrated for enhancing memory and concentration, promoting vitality and resilience - but mostly used for culinary purposes."
	icon_state = "rosemary"
	amount_to_harvest = 2
	growthrate = 10
	growth_chance = 60
	sanity_damage = -0.01
	Qi = "rm"

/obj/item/spice_plant/cumin
	name = "cumin bims"
	desc = "Cumin, a spice abundant in antioxidants like flavonoids, plays a vital role in countering the adverse effects of potions. It is often found alongside potions containing Clove as the main ingredient. \
	Strangely enough, most custodians highly dislike Cumin for its soapy taste, but its usefulness remains as their sole reason for its inclusion."
	icon_state = "cumin"
	amount_to_harvest = 6
	growthrate = 5
	growth_chance = 50
	Qi = "qm"

/obj/item/spice_plant/lilyflower
	name = "lily flower"
	desc = "The Lily Flower is widely recognized for its ability to alleviate the discomfort caused by burns, ulcers, and cough. It has also come to symbolize perseverance within the Custodian community, often adorning their walls as a symbolic representation."
	icon_state = "lilyflower"
	amount_to_harvest = 2
	growthrate = 2
	growth_chance = 90
	sanity_damage = -0.01
	Qi = "lyf"

/obj/item/spice_plant/marigold
	name = "marigold flower"
	desc = "Marigold, renowned for its antiseptic properties and historical use in wound treatment before the advent of chemical synthesis, plays a crucial role for the Custodians. \
	It holds special significance within enkindled communities, symbolizing a culture where gifting a Marigold to another Enkindled signifies either a lovely flirt or celebrating for one's health."
	icon_state = "marigold"
	amount_to_harvest = 2
	growthrate = 2
	growth_chance = 90
	sanity_damage = -0.01
	Qi = "mgf"

/obj/item/spice_plant/yerbamate
	name = "yerba mate branch"
	desc = "Coming from the Custodian's south american first colonial reaches centuries ago, the Yerba Mate still remains very present on their culture, possessing beneficial properties that aid in digestion, \
	provide relief from respiratory ailments and body energy. It is extensively utilized in advanced custodian brews to enhance the oxygen levels circulating in the veins, thereby optimizing muscular activity and endurance."
	icon_state = "yerbamate"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 80
	Qi = "yba"

/obj/item/spice_plant/coriander
	name = "coriander leaf"
	desc = "Coriander, long known for its potential to ease gastrointestinal issues, is used by the Enkindled in potion production. \
	This process denatures coriander's chemicals, enabling targeted muscular tension in specific body areas. \
	Crafted potions were believed to enhance blood circulation independently of the heart, a forgotten Enkindled secret."
	icon_state = "coriander"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 80
	Qi = "cad"

/obj/item/spice_plant/gourd
	name = "gourd bulb"
	desc = "A large gourd bulb, can be cut open to use as a glass, poke a hole as a flask or even converted with some silk into a payload."
	icon_state = "gourd"
	amount_to_harvest = 4
	growthrate = 15
	growth_chance = 90
	Qi = "g"

/obj/item/reagent_containers/food/drinks/flask/gourdflask
	name = "gourd flask"
	desc = "A gourd utilized as a flask for easy access. Not really better than the average flask, but it is lightweight and gives anything a tasteful oak taste - and making sure you are not drinking microplastics or aluminium ions."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "drinkable_gourd"
	volume = 60

/obj/item/stack/thrown/gourd
	name = "throwable gourd"
	desc = "A gourd fastened with biosilk to be easily throwed against any victim. There is aluminium wrappings and radiance inside that breaks the gourd when a suitable impact reaches it. Being shot at doesn't trigger any explosion."
	icon_state = "throwable_gourd"
	icon = 'icons/obj/neotheology_spicebed.dmi'
	amount = 1
	max_amount = 1

/obj/item/stack/thrown/gourd/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = WEAPON_FORCE_LETHAL / (1 + 100 / ROB_throwing_damage) + initial(throwforce)
	..()

/obj/item/spice_plant/gourd/attackby(obj/item/I, mob/user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_CUTTING), src)
	if(user.a_intent == I_HURT)
		switch(tool_type)
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					to_chat(user, SPAN_NOTICE("You carve the gourd to ."))
					new /obj/item/cut_gourd(get_turf(user))
					qdel(src)
	if(user.a_intent == I_HELP)
		switch(tool_type)
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					new /obj/item/reagent_containers/food/drinks/flask/gourdflask(get_turf(user))
					qdel(src)
	if(istype(I, /obj/item/stack/material/biopolymer_silk))
		new /obj/item/stack/thrown/gourd(get_turf(user))
		qdel(src)

/obj/item/cut_gourd
	name = "cut gourd"
	desc = "A gourd bulb cut directly in half to use as a bowl for potion brewing base."
	icon = 'icons/obj/custodians_spicebed.dmi'
	icon_state = "cut_gourd"
	var/slot_one = ""
	var/slot_two = ""
	var/slot_three = ""
	var/slot_four = ""
	var/anti_cheat = FALSE

/obj/item/cut_gourd/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/spice_plant))
		var/obj/item/spice_plant/sp = I
		if(sp.Qi)
			add_plant(I, user)

/obj/item/cut_gourd/proc/add_plant(obj/item/spice_plant/SP, mob/user)
	if(anti_cheat)
		to_chat(user, "You've already added this kind of plant.")
		return

	var/obj/item/spice_plant/plant_to_add = SP

	anti_cheat = TRUE

	var/choice = input(user, "What slot do you want to add the spice in?") as null|anything in list("Slot One","Slot Two","Slot Three","Slot Four") //,"Call in a Favour"

	switch(choice)

		if("Slot One")
			if(!slot_one)
				to_chat(user, "You add [plant_to_add.name] into the first slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], first slot.")
			slot_one = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Two")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the second slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], second slot.")

			slot_two = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Tree")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the third slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], third slot.")

			slot_three = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Four")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the fourth slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], fourth slot.")

			slot_four = plant_to_add.Qi
			qdel(plant_to_add)

		else
			to_chat(user, "You decided not to brew with \the [plant_to_add.name] for now.")
			anti_cheat = FALSE
			return
	anti_cheat = FALSE


/obj/machinery/potionmaker
	name = "cultivation pot"
	desc = "A massive cooking pot for cultivation and potion brewing."
	icon = 'icons/obj/custodians_spicebed.dmi'
	icon_state = "potionmaker"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	circuit = null
	var/obj/item/cut_gourd/cg
	var/active = FALSE
	var/cooktime = 30 SECONDS

/obj/machinery/potionmaker/attack_hand(mob/living/user as mob)
	if(active)
		to_chat(user, "Something's already brewing...")
		return
	if(cg && !active)
		icon_state = "potionmaker_active"
		active = TRUE
		addtimer(CALLBACK(src, .proc/repice_index), cooktime) // TODO: FIXME. Trilby, remember to make it revert back to icon_state = "potionmaker" once it finishes brewing

	to_chat(user, "There is nothing inside the pot to brew with.")

/obj/machinery/potionmaker/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/cut_gourd))
		user.drop_from_inventory(I, src)
		cg = I
		return
	..()

/obj/machinery/potionmaker/proc/repice_index()
	var/index_leaser = "[cg.slot_one][cg.slot_two][cg.slot_three][cg.slot_four]"
	if(!index_leaser)
		active = FALSE
		return
	QDEL_NULL(cg)
	switch(index_leaser)
		if("debug", "debugdebug")
			new /obj/item/stack/thrown/gourd(src.loc)
		else
			new /obj/effect/decal/cleanable/ash(src.loc)

	active = FALSE
	icon_state = "potionmaker"

