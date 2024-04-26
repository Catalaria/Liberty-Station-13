/*/datum/species_form/template
	name
	name_plural (Unused, don't use it for now)
	base
	deform
	face
	damage_overlays
	damage_mask
	blood_mask*/

//Playable satus refers to IF you can select this species-form in character creation. This effectively only matters to genemodders.

//Human forms
/datum/species_form/human
	name = FORM_HUMAN
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

/datum/species_form/humanfit
	name = FORM_HUMANFIT
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

/datum/species_form/humanmuscular
	name = FORM_HUMANMUSCULAR
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

/datum/species_form/humanfat
	name = FORM_HUMANMFAT
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

//Cinderite forms - Base cinderite, Plainslander, Highlander
/datum/species_form/cindarite
	playable = FALSE
	name = FORM_CINDAR
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/plainscindar
	playable = FALSE
	name = FORM_PLAINSLAND
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/mountaincindar
	playable = FALSE
	name = FORM_PLAINSLAND
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

//Lupinaris forms - Kriosan, Naramads, Hybrids
/datum/species_form/kriosan
	playable = FALSE
	name = FORM_KRIOSAN
	base = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = null	//TODO: White vulp deformed sprites. There aren't even regular ones here.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/naramad
	playable = FALSE
	name = FORM_NARAMAD
	base = 'icons/mob/human_races/r_sergal.dmi'
	deform = 'icons/mob/human_races/r_def_sergal.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/lupinaris_hybrid
	playable = FALSE
	name = FORM_LHYBRID
	base = 'icons/mob/human_races/r_vulpkanin.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

//Aquarian forms - Mar'qua, Akula
/datum/species_form/marqua
	playable = FALSE
	name = FORM_MARQUA
	base = 'icons/mob/human_races/r_marqua_vr.dmi'
	deform = 'icons/mob/human_races/r_def_marqua.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/akula
	playable = FALSE
	name = FORM_AKULA
	base = 'icons/mob/human_races/r_akula.dmi'
	deform = 'icons/mob/human_races/r_def_akula.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

//Sablekyne forms - Base Sablekyne, bronzecrest, ironcrest, goldcrest
/datum/species_form/sablekyne
	playable = FALSE
	name = FORM_SABLEKYNE
	base = 'icons/mob/human_races/r_sablekyne_white.dmi'
	deform = 'icons/mob/human_races/r_def_sablekyne_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/sablekyne_bronze
	playable = FALSE
	name = FORM_BRONZECREST
	base = 'icons/mob/human_races/r_sablekyne_white.dmi'
	deform = 'icons/mob/human_races/r_def_sablekyne_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/sablekyne_iron
	playable = FALSE
	name = FORM_IRONCREST
	base = 'icons/mob/human_races/r_sablekyne_white.dmi'
	deform = 'icons/mob/human_races/r_def_sablekyne_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/sablekyne_gold
	playable = FALSE
	name = FORM_GOLDENCREST
	base = 'icons/mob/human_races/r_sablekyne_white.dmi'
	deform = 'icons/mob/human_races/r_def_sablekyne_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

//Plant People Forms
/datum/species_form/folken
	playable = TRUE
	name = FORM_FOLKEN
	base = 'icons/mob/human_races/r_folken.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR

/datum/species_form/mycus
	playable = TRUE
	name = FORM_MYCUS
	base = 'icons/mob/human_races/r_mycus.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR

//Slime people form
/datum/species_form/slime
	name = FORM_SLIME
	base = 'icons/mob/human_races/r_slime.dmi'
	deform = 'icons/mob/human_races/r_slime.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = FALSE

	blood_color = "#05FF9B"
	flesh_color = "#05FFFB"

	remains_type = /obj/effect/decal/cleanable/slimecorpse // Snowflake remains done, sorry carrions!
	death_message = "rapidly loses cohesion, splattering across the ground..."

//Surplus Genemodder/Abhuman forms - NOTE: You MUST put these as 'playable = TRUE' if you want people to actually be able to select these.
/datum/species_form/avian
	playable = TRUE
	name = FORM_AVIAN
	base = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/spider
	playable = TRUE
	name = FORM_SPIDER
	base = 'icons/mob/human_races/r_spider.dmi'
	deform = 'icons/mob/human_races/r_def_spider.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/moth
	playable = TRUE
	name = FORM_MOTH
	base = 'icons/mob/human_races/r_moth.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/moth_white
	playable = TRUE
	name = FORM_MOTH_WHITE
	base = 'icons/mob/human_races/r_moth_white.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/axolotl
	playable = TRUE
	name = FORM_AXOLOTL
	base = 'icons/mob/human_races/r_axolotl_white.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
