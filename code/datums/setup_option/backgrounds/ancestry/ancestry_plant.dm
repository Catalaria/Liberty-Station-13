/datum/category_item/setup_option/background/ethnicity/folken_elder
	name = "Elder"
	desc = "Elders are folken who have lived for longer than a century and are often highly spiritual but not quite shamans. An elder will have cultivated for themselves an \
	extensive network of personal philosophies, goals, and friends both within and without their tribe. An elder knows that his place is to focus heavily on being an intellectual \
	and discussing the best way to lead their people. Elders within the colony generally come to learn from other races to then give the information back to their tribe to improve them."

	restricted_to_species = list(FORM_FOLKEN)

	perks = list(PERK_FOLKEN_HEALING)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 20
	)

/datum/category_item/setup_option/background/ethnicity/folken_shaman
	name = "Shaman"
	desc = "Shamans are folken who have spent years or decades understanding the natural processes of the planet, in particular the anomalous nature of it and the objects it creates. \
	A shaman can intuitively understand some anomalous objects, in particular oddities, allow them to use certain chants and rites to enhance them by either improving their current \
	stats or rerolling them entirely"

	restricted_to_species = list(FORM_FOLKEN)

	perks = list(PERK_FOLKEN_HEALING, PERK_ODD_REROLL)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/mushroom
	name = "Mushroom-born"
	desc = "Mushroom born are the most common type of mycus and benefit from a robust biology capable of replicating many natural and artifical chemicals. \
	Mushroom mycus are often accompanied by a lesser mushroom capable of replicating various powerful chemicals after being fed. These lesser mushrooms are \
	treated affectionately by them, similar to humans and dogs, with the mycus defending them violently if needed. Unlike other mycus types, mushroom born are \
	much more attuned to the biological needs of both themselves and other races."

	restricted_to_species = list(FORM_MYCUS)

	perks = list(PERK_MUSH_FOLLOWER)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/slime
	name = "Slime-mold"
	desc = "Mold born mycus are considered the physically strongest of all the mycus subtypes, often living on diets of pure meat by performing the hunting for a mycus tribe. \
	Slime mold bodies are naturally tougher, more capable of enduring damage and exceptional at healing when remaining in areas of darkness. Mold-born often choose to bring \
	mushroom companions cultivated specifically for fighting, often times using them similar to hunting dogs, but taking care to ensure they do not perish. Slime-molds receive \
	their name from their oily bodies, the sponge-like flesh considered by other races to be �gooey� as it is coated in an enzyme that aids in halting bleeding or flesh tearing."

	restricted_to_species = list(FORM_MYCUS)

	perks = list(PERK_SLIME_FOLLOWER)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 10,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/cryptic
	name = "Cryptic"
	desc = "A cryptic mycus is often considered by their tribe to age prematurely, being the most settled of the mycus types a cryptic will often avoid fighting, \
	choosing instead to cultivate new fungi or work towards solving problems the tribe faces. This often gives cryptic�s the shortest life spans, as their discovery \
	of knowledge and focus towards more thoughtful approaches results in them growing in size faster then other types. This accelerated growth will often lead to early \
	fracturing, but some cryptics stubbornly remain huge for longer than is normal, especially if they become the tribes mold mind. Due to their intellectual pursuits, \
	few cryptics bother with cultivating sporelings, finding that managing them is more trouble than its worth."

	restricted_to_species = list(FORM_MYCUS)

	perks = list(PERK_FOLKEN_HEALING)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_COG = 10
	)
