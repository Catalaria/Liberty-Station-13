/datum/species/human
	name = "Human"
	name_plural = "Humans"
	default_form = FORM_HUMAN
	obligate_name = FALSE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol Federation maintains control of much of the known star space \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultuous at best in the far flung galactic rim."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110

	dark_color = "#ffffff"
	light_color = "#000000"

	stat_modifiers = list(
		STAT_BIO = 4,
		STAT_COG = 4,
		STAT_MEC = 4,
		STAT_ROB = 4,
		STAT_TGH = 4,
		STAT_VIG = 4
	)
	darksight = 2

	perks = list(PERK_IWILLSURVIVE, PERK_BATTLECRY, PERK_TENACITY)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Human"


/datum/species/machine //Boilerplate as fuck.
	name = "Synthetic"
	name_plural = "Synthetics" //CLANKUS
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	default_form = FORM_SYNTH
	obligate_name = TRUE //So people can make 'FBPs' that dont suck if they choose.
	flags = NO_BREATHE | NO_BLOOD | NO_SCAN | NO_PAIN | NO_MINOR_CUT
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	virus_immune = TRUE
	siemens_coefficient = 0.35 //Shock Absorbers to prevent static shocks from destroying components.
	blurb = "A group of synthetics. Report if you see this."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 400 //About as old as a synthetic /can/ be and still be operational.
	show_ssd = "appears to be inactive"

	dark_color = "#ffffff"
	light_color = "#000000"

	darksight = 2
	radiation_mod = 0
	breath_type = null
	poison_type = null
	spawn_flags = CAN_JOIN
	total_health = 90 //Less tankier. Equivalent to doing a few bits of crayon magic in terms of maxHP lost. Significant against high damage projectiles.
	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/robotic_normal,
		BP_GROIN =  new /datum/organ_description/groin/robotic_normal,
		BP_HEAD =   new /datum/organ_description/head/robotic_normal,
		BP_L_ARM =  new /datum/organ_description/arm/left/robotic_normal/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/robotic_normal/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/robotic_normal/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/robotic_normal/full
		)

	has_process = list(    // HOLY MOTHER OF GOD THIS IS CURSED. Force EVERYTHING to process.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp,
		OP_MUSCLE = /obj/item/organ/internal/muscle/robotic,
		OP_NERVE = /obj/item/organ/internal/nerve/robotic,
		OP_BONE
		)

/datum/species/machine/get_bodytype()
	return "Synthetic"


/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/horns)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "The Sablekyne are a mammalian alien species vaguely resembling felines with horns, hailing from Onkarth in the Gamma Minoris system. \
	Sablekyne were originally uplifted by the aid of human colonization and human corporations, aiding them by \
	accelerating the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	ethnicities, something that permeates even to today's times. Northlander sablekyne perfer colder winter environments and speak with Gaelic influences while \
	southlanders prefer hot dry deserts and speak with Japanese influences. Both groups are stocky, strong, and thickly built and few have the lithe feline qualities \
	one would expect."
	taste_sensitivity = TASTE_SENSITIVE                 // How sensitive the species is to minute tastes.

	dark_color = "#00ff00"
	light_color = "#008000"

	cold_level_1 = 240 //Default 270
	cold_level_2 = 215 //Default 230
	cold_level_3 = 190  //Default 200

	heat_level_1 = 340 //Default 330
	heat_level_2 = 400 //Default 380
	heat_level_3 = 480 //Default 460

	heat_discomfort_level = 340
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 240
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)

	spawn_flags = IS_WHITELISTED		//This species is not supposed to be playable. Acts as a baseline for the other Sable species.

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5
	)

	permitted_ears  = list("Sablekyne Large Horns",
		"Sablekyne Curled Horns",
		"Sablekyne Curled Horns (small)",
		"Sablekyne Small Horns 1",
		"Sablekyne Small Horns 2",
		"Sablekyne Small Horns 3",
		"Sablekyne Stabber Horns",
		"Sablekyne Dogma Horns",
		"Sablekyne Outstretched Horns",
		"Sablekyne Halo Horns",
		"Sablekyne Upward Horns",
		"Sablekyne Great Horns",
		"Sablekyne Bun Horns",
		"Sabelkyne Murauder Horns",
		"Sabelkyne Faceguard Horns",
		"Uni-Horn",
		"Ox Horns",
		"Stabber Horns (Colorable)"
		)
	permitted_tail  = list("Sablekyne Tail")
	permitted_wings = list()

	darksight = 3 //Cat eyes
	perks = list(PERK_LASTSTAND, PERK_BONE, PERK_BRAWN)

/datum/species/sablekyne/get_bodytype()
	return "Sablekyne"

/datum/species/sablekyne/bronzecrest
	name = "Bronzecrest Sablekyne"
	name_plural = "Bronzecrest Sablekynes"
	default_form = FORM_BRONZECREST
	spawn_flags = CAN_JOIN

/datum/species/sablekyne/ironcrest
	name = "Ironcrest Sablekyne"
	name_plural = "Ironcrest Sablekynes"
	default_form = FORM_IRONCREST
	spawn_flags = CAN_JOIN

/datum/species/sablekyne/goldcrest
	name = "Goldencrest Sablekyne"
	name_plural = "Goldencrest Sablekynes"
	default_form = FORM_GOLDENCREST
	spawn_flags = CAN_JOIN

//Lupinaris Species - (Kriosans, Narmads, Hybrids)
/datum/species/lupinaris	//Master-path for species. See subpaths below.
	name = "Lupinaris"
	name_plural = "Lupinarians"
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/needle, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	darksight = 4 //enhanced eyes dosnt mean perfected
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "no."
	taste_sensitivity = TASTE_HYPERSENSITIVE
	hunger_factor = 1.25
	radiation_mod = 0.5
	total_health = 130
	siemens_coefficient = 2

	reagent_tag = IS_LUPINARIS

	dark_color = "#ff0000"
	light_color = "#990000"

	cold_level_1 = 240 //Default 270
	cold_level_2 = 200 //Default 230
	cold_level_3 = 170  //Default 200

	cold_discomfort_level = 240
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)

	spawn_flags = IS_WHITELISTED		//Disables the race, basically. Sub-races are playable instead.

	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_VIG = 5
	)

	permitted_ears  = list("Fennec Ears",
		"Fox Ears",
		"Hound Ears",
		"Jagged Ears",
		"Kitsune Ears",
		"Doberman Ears",
		"Sleek Ears",
		"Vulpkanin Ears",
		"Wolf Ears"
		)
	permitted_tail  = list("Cross Fox Tail",
		"Curly Tail",
		"Docked Tail",
		"Fennec Tail, Downwards",
		"Fennec Tail, Upwards",
		"Fennecsune Tails",
		"Fennix Tail",
		"Fox Tail, Downwards",
		"Fox Tail, Upwards",
		"Otie Tail",
		"Vulpkanin Tail",
		"Vulpkanin Tail 2",
		"Vulpkanin Tail 3",
		"Wolf Tail",
		"Jackal Tail"
		)
	permitted_wings = list()

	perks = list(PERK_ENHANCEDSENSES)

/datum/species/lupinaris/kriosan
	name = "Kriosan"
	name_plural = "Kriosans"
	default_form = FORM_KRIOSAN
	spawn_flags = CAN_JOIN

/datum/species/lupinaris/kriosan/get_bodytype()
	return "Kriosan"

/datum/species/lupinaris/naramad
	name = "Naramad"
	name_plural = "Naramadi"
	default_form = FORM_NARAMAD
	spawn_flags = CAN_JOIN

/datum/species/lupinaris/naramad/get_bodytype()
	return "Naramad"

/datum/species/lupinaris/hybrid
	name = "Hybrid Lupinaris"
	name_plural = "Hybrid Lupinaris"
	default_form = FORM_LHYBRID
	spawn_flags = CAN_JOIN

/datum/species/lupinaris/hybrid/get_bodytype()
	return "Hybrid"

/datum/species/marqua
	name = "Mar'Qua"
	name_plural = "Mar'quas"
	default_form = FORM_MARQUA
	obligate_form = TRUE
	reagent_tag = IS_MARQUA
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick)
	darksight = 4
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 160
	blurb = "no."
	hunger_factor = 0.5
	taste_sensitivity = TASTE_HYPERSENSITIVE

	dark_color = "#afeeee"
	light_color = "#20b2aa"

	cold_level_1 = 230 //Default 270
	cold_level_2 = 210 //Default 230
	cold_level_3 = 190  //Default 200

	cold_discomfort_level = 230
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 10,
		STAT_MEC = 10
	)

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART        = /obj/item/organ/internal/heart,
		OP_LUNGS        = /obj/item/organ/internal/lungs,
		OP_STOMACH      = /obj/item/organ/internal/stomach,
		OP_LIVER        = /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT  = /obj/item/organ/internal/kidney,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney,
		BP_BRAIN        = /obj/item/organ/internal/brain,
		OP_APPENDIX     = /obj/item/organ/internal/appendix,
		OP_EYES         = /obj/item/organ/internal/eyes/marqua
	)

	permitted_ears  = list()
	permitted_tail  = list()
	permitted_wings = list()

	perks = list(PERK_SUDDENBRILLIANCE, PERK_INSPIRED, PERK_ALIEN_NERVES)

/datum/species/marqua/get_bodytype()
	return "Mar'Qua"

/datum/species/akula
	name = "Akula"
	name_plural = "Akulas"
	aan = "n"
	default_form = FORM_AKULA
	obligate_form = TRUE
	reagent_tag = IS_AKULA
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/tail, /datum/unarmed_attack/bite/strong)
	darksight = 3
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 130
	blurb = "no."
	taste_sensitivity = TASTE_DULL
	hunger_factor = 1.25
	total_health = 120

	cold_level_1 = 240 //Default 270
	cold_level_2 = 200 //Default 230
	cold_level_3 = 170  //Default 200

	cold_discomfort_level = 240
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	dark_color = "#0000ff"
	light_color = "#0000ff"

	stat_modifiers = list(
		STAT_TGH = 10
	)

	permitted_ears  = list("Sleek Ears")
	permitted_tail  = list("Akula Tail")
	permitted_wings = list()

	perks = list(PERK_RECKLESSFRENZY, PERK_IRON_FLESH)

/datum/species/akula/get_bodytype()
	return "Akula"

/datum/species/cindarite
	name = "Cindarite"
	name_plural = "Cindarites"
	default_form = FORM_CINDAR
	reagent_tag = IS_CINDERITE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite, /datum/unarmed_attack/tail)
	num_alternate_languages = 2
	blurb = "no"
	name_language = null
	min_age = 18
	max_age = 90
	spawn_flags = CAN_JOIN
	total_health = 110                   // Burn damage multiplier.
	radiation_mod = 0
	darksight = 3

	stat_modifiers = list(
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_TGH = 2
	)

	cold_level_1 = 270 //Default 270
	cold_level_2 = 240 //Default 230
	cold_level_3 = 210  //Default 200

	cold_discomfort_level = 270
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly scales stands out in goosebumps."
		)

	heat_level_1 = 370 //Default 330
	heat_level_2 = 410 //Default 380
	heat_level_3 = 500 //Default 460

	heat_discomfort_level = 370
	heat_discomfort_strings = list(
		"Your scales prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated scales itch."
		)

	dark_color = "#660066"
	light_color = "#660066"

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart,
		OP_LUNGS =    /obj/item/organ/internal/lungs,
		OP_STOMACH =  /obj/item/organ/internal/stomach,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left/cindarite,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right/cindarite,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes
		)

	permitted_ears  = list("Frills, Aquatic",
		"Frills, Drake",
		"Frills, Short",
		"Frills, Simple",
		"Frills, Big"
		)
	permitted_tail  = list("Render Tail",
		"Snake Tail",
		"Lizard Tail",
		"Lizard Tail, Short",
		"Lizard Tail, Dark Tiger"
		)
	permitted_wings = list("Spines, Aquatic",
		"Spines, Long",
		"Spines, Long Membrane",
		"Spines, Short",
		"Spines, Short Membrane",
		)

	perks = list(PERK_PURGEINFECTIONS, PERK_PURGETOXINS, PERK_SECOND_SKIN)

/datum/species/cindarite/get_bodytype()
	return "Cindarite"

//Plant People Group - Folken & Mycus
//Debug form; master type
/datum/species/plant
	name = "Plant"
	name_plural = "Plants"
	default_form = FORM_FOLKEN
	obligate_name = TRUE
	obligate_form = TRUE
	name_language = null	// Use the first-name last-name generator rather than a language scrambler
	reagent_tag = IS_TREE
	min_age = 18
	max_age = 110
	num_alternate_languages = 2
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "N/A"
	burn_mod = 2						// Burn damage multiplier.
	slowdown = 0.3
	hunger_factor = 1.3
	darksight = 4
	flags = NO_PAIN
	taste_sensitivity = TASTE_NUMB

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart/plant,
		OP_STOMACH =  /obj/item/organ/internal/stomach/plant,
		BP_BRAIN =    /obj/item/organ/internal/brain/plant,
		OP_EYES =     /obj/item/organ/internal/eyes,
		OP_LUNGS =    /obj/item/organ/internal/lungs,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right,
		)

	spawn_flags = IS_WHITELISTED		//Makes it so people can't join as debug species.

/datum/species/plant/folken
	name = "Folken"
	name_plural = "Folkens"
	default_form = FORM_FOLKEN
	breath_type = "nitrogen"			// Non-oxygen gas breathed, if any.
	poison_type = "plasma"				// Poisonous air.
	exhale_type = "oxygen"
	light_dam = 1 // Same threshold as the Nightcrawler perk
	vision_flags = SEE_SELF
	flags = NO_PAIN

	dark_color = "#ffffff"
	light_color = "#000000"

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 10
	)

	perks = list(PERK_FOLKEN_HEALING)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Folken"

/datum/species/plant/mycus
	name = "Mycus"
	name_plural = "Myci"
	default_form = FORM_MYCUS

	darksight = 6 // Better than base 4 nightvision due to dark-healing. Shrooms.
	light_dam = 1 // Same threshold as the Nightcrawler perk

	dark_color = "#ffffff"
	light_color = "#000000"

	perks = list(PERK_DARK_HEAL)

	stat_modifiers = list(
		STAT_BIO = 0,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 20,
		STAT_TGH = 0,
		STAT_VIG = 0
	)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Mycus"

/datum/species/slime
	name = SPECIES_SLIME
	name_plural = "slimes"

	default_form = FORM_SLIME
	obligate_form = TRUE
	reagent_tag = IS_SLIME
	unarmed_types = list(/datum/unarmed_attack/slime_glomp)
	flags = NO_SLIP | NO_BREATHE | NO_BLOOD | NO_SCAN | NO_MINOR_CUT
	siemens_coefficient = 3 //conductive
	darksight = 3
	virus_immune = TRUE
	always_blood = TRUE
	always_ingest = TRUE
	breath_type = null
	poison_type = null
	hunger_factor = 2
	spawn_flags = CAN_JOIN

	burn_mod = 1.15
	brute_mod = 1.15
	toxins_mod = 1 // fuck toxins_mod, we use a perk for this
	oxy_mod = 0

	cold_discomfort_level = 283
	heat_discomfort_level = 313

	cold_level_1 = 258 //Default 270
	cold_level_2 = 243 //Default 230
	cold_level_3 = 228  //Default 200

	heat_level_1 = 333 //Default 330
	heat_level_2 = 353 //Default 380
	heat_level_3 = 372 //Default 460

	has_process = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime,
		OP_STOMACH = /obj/item/organ/internal/stomach,
		)

	breath_type = null
	poison_type = null

	bump_flag = SLIME
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime
	)

	perks = list(PERK_LIMB_REGEN, PERK_SLIMEBODY)

/datum/species/slime/get_bodytype()
	return "Slime"

/*/datum/species/slime/handle_death(var/mob/living/carbon/human/H)
	spawn(1)
		if(H)
			H.gib()*/
