// This file contains all mobs tips and tricks and shown when you spawn or your mind is transfered
/tipsAndTricks/mobs
    var/list/mobs_list       //list of mobs to which tip can be shown
    var/list/species_that_we_are    //list of second languages, hack to make chtmant based tipsAndTricks - Doesn't actually work me when.
    textColor = "#957820"

/tipsAndTricks/mobs/breathing
    mobs_list = list(/mob/living/carbon/human)
    tipText = "As an average humanoid, you need oxygen and pressure to breathe. Comfortable pressure for a humanoid is around 101kPa. Some gases, like plasma, are toxic to you. Some exceptions exist, like the opifex, who require nitrogen to breathe and treat oxygen as toxic."
