/obj/item/gun/projectile/shotgun/pump/swat
	name = "\"SWAT\" combat shotgun"
	desc = "The prototype of a Seinemetall Defense GmbH original idea of the \"State\" reinvented to be the be all end all law enforcement shotgun. \
			The \"SWAT\" main appeal other then pure stopping power is the built in pistol to shoot three round for clearing down range targets trying to run away. \
			Can hold up to 7+1 20mm shells in its tube magazine, and 9 10x24 rounds in its underslung pistol."
	icon = 'icons/obj/guns/projectile/swat.dmi'
	icon_state = "cshotgun"
	item_state = "cshotgun"
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 4)
	max_shells = 7 //Same as the gladstone
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 12)
	price_tag = 1250
	damage_multiplier = 1.1
	penetration_multiplier = 1
	recoil_buildup = 14
	one_hand_penalty = 15 //full sized shotgun level
	saw_off = FALSE //No
	folding_stock = TRUE //we can fold are stocks

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire 10x24 pistol", mode_desc="Shoot the built in 10x24 pistol",  burst=3, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

	var/obj/item/gun/projectile/underslung/pistol_10x24

/obj/item/gun/projectile/shotgun/pump/swat/Initialize()
	. = ..()
	pistol_10x24 = new(src)

/obj/item/gun/projectile/shotgun/pump/swat/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/c10x24)))
		pistol_10x24.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/shotgun/pump/swat/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(folded)
		iconstring += "-stock"

	if(wielded)
		itemstring += "_doble"


	icon_state = iconstring
	set_item_state(itemstring)

//Defined here, may be used elsewhere but for now its only used here. -Trilby
/obj/item/gun/projectile/underslung_pistol_10x24
	name = "underslung shotgun"
	desc = "Not much more than a tube and a firing mechanism, this pistol is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 9
	safety = FALSE
	twohanded = FALSE
	caliber = "10x24"
	handle_casings = EJECT_CASINGS