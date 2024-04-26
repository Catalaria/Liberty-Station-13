///////////////////
// S P E C I E S //
///////////////////

//Species - these are the different specific species in the game. Species defines check what markings can go on, what mechanics/traits they have, etc.

//Human(s) - multiple body forms
#define SPECIES_HUMAN			"Human"
#define SPECIES_HUMAN_VATBORN	"Vatborn"

//Cinderite
#define SPECIES_UNATHI			"Lizard"

//Aquarians
#define SPECIES_SKRELL			"Mar'qua"
#define SPECIES_AKULA			"Akula"

//Sablekyne
#define SPECIES_TAJ				"Sablekyne"

//Promethean (Slime-people)
#define SPECIES_PROMETHEAN		"Promethean"
#define SPECIES_SLIME			"Slime"

//Synthetic (Robit)
#define SPECIES_SYNTH			"Synthetic"

//Lupinaris
#define SPECIES_NARAMAD			"Naramad"

//Genemodder Custom Species
#define SPECIES_CUSTOM			"Custom Species"

// Monkey and alien monkeys.
#define SPECIES_MONKEY			"Monkey"		//Humanoid primates
#define SPECIES_MONKEY_TAJ		"Farwa"			//Sablekyne primates
#define SPECIES_MONKEY_SKRELL	"Neaera"		//Mar'Qua primates
#define SPECIES_MONKEY_UNATHI	"Stok"			//Cinderite primates

// Virtual Reality IDs.
#define SPECIES_VR				"Virtual Reality Avatar"
#define SPECIES_VR_HUMAN		"Virtual Reality Human"
#define SPECIES_VR_UNATHI		"Virtual Reality Lizard"
#define SPECIES_VR_TAJ			"Virtual Reality Sablekyne" // NO CHANGING.
#define SPECIES_VR_SKRELL		"Virtual Reality Mar'qua"
//#define SPECIES_VR_DIONA		"Virtual Reality Diona"

// Misc species. Mostly unused but might as well be complete.
#define SPECIES_SHADOW			"Shadow"
#define SPECIES_SKELETON		"Skeleton"
#define SPECIES_EVENT1			"X Occursus"


///////////////
// F O R M S //
///////////////

//While SPECIES_ controls the specific species checks, forms are the basline appereance and sprite-types, basically.
//Thus why abhumans/genemodders have extra forms in their section but no extra species.

//Humans
#define FORM_HUMAN				"Human"				//Baseline human appereance
#define FORM_HUMANFIT			"Fit Human"			//Fit human appereance
#define FORM_HUMANMUSCULAR		"Muscular Human"	//Muscular human appereance
#define FORM_HUMANMFAT			"Fat Human"			//Fatass human appereance

//Lupinaris
#define FORM_KRIOSAN			"Kriosan Lupinaris"		//Kriosan lupinaris appereance
#define FORM_NARAMAD			"Naramad Lupinaris"		//Naramad Lupinaris appereance
#define FORM_LHYBRID			"Hybrid Lupinaris"		//Hybrid Lupinaris appereance

//Cinderite
#define FORM_CINDAR				"Cinderite"					//Basline cinderite appearance
#define FORM_PLAINSLAND			"Plainslander Cinderite"	//Plainsland cinderite appereance
#define FORM_MOUNTAINLANDS		"Mountainlander Cinderite"	//Mountainland cinderite appereance

//Aquairian
#define FORM_AKULA				"Aquarian Akula"			//Akula aquairian apperenace
#define FORM_MARQUA				"Aquairian Mar'Qua"			//Marqua aquairian apperenace

//Sablekyne
#define FORM_SABLEKYNE			"Sablekyne"			//Basline sablekyne apperenace
#define FORM_BRONZECREST		"Bronzecrest Sablekyne"	//Bronze sablekyne apperenace
#define FORM_GOLDENCREST		"Goldencrest Sablekyne"	//Gold sablekyne apperenace
#define FORM_IRONCREST			"Ironcrest Sablekyne"	//Iron sablekyne apperenace

//Whisper Misc-forms
#define FORM_MYCUS				"Mycus"				//Yeah
#define FORM_FOLKEN				"Folken"			//Plampter

//Slime People
#define FORM_SLIME				"Slime"				//Slime people apperenace

//Synthetic
#define FORM_SYNTH				"Synthetic"			//Base synthetic species; you select your parts in-game.

//Misc Forms - Mostly for genemodder/abhumans to make their own furry snowflake human peoples.
#define FORM_MOTH				"Moth"
#define FORM_MOTH_WHITE			"Moth (Colorable)"
#define FORM_AVIAN				"Avian"
#define FORM_SPIDER				"Arachnoid"
#define FORM_AXOLOTL			"Axolotl"

//Basline Monke/Golem - Purely for mob funny stuff
#define FORM_MONKEY				"Monkey"	//monke
#define FORM_GOLEM				"Golem"
