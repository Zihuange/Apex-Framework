/*/
File: arsenal.sqf
Author:

	Quiksilver
	
Last Modified:

	15/10/2020 A3 2.00 by Quiksilver
	
Description:

	Arsenal Whitelisting & Blacklisting for each player role/class
	
Format of this script:

	1. Sort player into Roles from classname
	2. Sort game assets (weapons/backpacks/magazines/items) into basic categories (you can add/modify/etc).
	3. Configure a blacklist and a whitelist for each Role, using the categories created in #2, using the provided format.

Documentation File:

	'documentation\Arsenal & Gear Restrictions.txt'
	
Notes:

	- It could take several hours to configure this script to your liking.
	- Hard-coded gear blacklists are inside 'code\functions\fn_clientArsenal.sqf', but that file requires mission update to edit while this file only requires server restart to take effect.
	- You do not need to update the mission file to edit this script, it can be done between restarts.
_______________________________________________________/*/

//=========================================== GET PLAYER ROLE

params [
	['_side',WEST],
	['_role','rifleman']
];

//=========================================== At this point you could build up lists of weapons like 'normalguns + marksmanguns + sniperguns + LMGguns + HMGguns' and use those variables instead of the default copy-paste used below.
// These variables are just suggestions, you would add them together like this:   (_weaponsBasic + _weaponsMarksman + _weaponsHandgun)
// All weapons including pistols, launchers, binoculars (yes they are classified as a weapon).
_weaponsAll = [
	'',
	'vn_p38s',
	'vn_sa7',
	'vn_sa7b',
	'vn_rpg2',
	'vn_rpg7',
	'vn_dp28',
	'vn_hd',
	'vn_hp',
	'vn_izh54',
	'vn_izh54_shorty',
	'vn_izh54_p',
	'vn_k50m',
	'vn_m45',
	'vn_m45_camo',
	'vn_m45_sd',
	'vn_m45_fold',
	'vn_m1carbine',
	'vn_m1carbine_sniper',
	'vn_m1carbine_bayo',
	'vn_m1carbine_gl',
	'vn_m127',
	'vn_m14',
	'vn_m14_bayo',
	'vn_m14_camo',
	'vn_m14_sd',
	'vn_m16',
	'vn_m16_bayo',
	'vn_m16_camo',
	'vn_m16_mrk',
	'vn_m16_mrk_sd',
	'vn_m16_nvg',
	'vn_m16_nvg_sd',
	'vn_m16_sd',
	'vn_m16_sniper',
	'vn_m16_sniper_sd',
	'vn_m16_xm148',
	'vn_m1891',
	'vn_m1891_bayo',
	'vn_m1895',
	'vn_m1895_sd',
	'vn_m1897',
	'vn_m1897_bayo',
	'vn_m1911',
	'vn_mx991_m1911',
	'vn_m1911_sd',
	'vn_mx991_m1911_sd',
	'vn_m2carbine',
	'vn_m2carbine_sniper',
	'vn_m2carbine_bayo',
	'vn_m2carbine_gl',
	'vn_m3sd',
	'vn_m3carbine',
	'vn_m38',
	'vn_m38_bayo',
	'vn_m3a1',
	'vn_m40a1',
	'vn_m40a1_sniper',
	'vn_m40a1_sniper_sd',
	'vn_m40a1_nvg',
	'vn_m40a1_nvg_sd',
	'vn_m4956',
	'vn_m4956_sniper',
	'vn_m4956_bayo',
	'vn_m4956_gl',
	'vn_m60',
	'vn_m60_shorty',
	'vn_m60_shorty_camo',
	'vn_m63a',
	'vn_m712',
	'vn_m72',
	//'vn_m79',
	'vn_m9130',
	'vn_m9130_sniper',
	'vn_mat49',
	'vn_mat49_f',
	'vn_mat49_sd',
	'vn_mat49_vc',
	'vn_mc10',
	'vn_mc10_sd',
	'vn_mk22_sd',
	'vn_mk22',
	'vn_m10',
	'vn_m10_sd',
	'vn_mp40',
	'vn_pk',
	'vn_pm',
	'vn_fkb1_pm',
	'vn_pm_sd',
	'vn_fkb1_pm_sd',
	'vn_pps43',
	'vn_pps52',
	'vn_ppsh41',
	'vn_rpd',
	'vn_rpd_shorty_01',
	'vn_rpd_shorty',
	'vn_sks',
	'vn_sks_gl',
	'vn_sks_sniper',
	'vn_sks_bayo',
	'vn_sten',
	'vn_sten_sd',
	'vn_tt33',
	'vn_type56',
	'vn_type56_bayo',
	'vn_welrod',
	'vn_xm177',
	'vn_xm177_camo',
	'vn_xm177_fg',
	'vn_xm177_mrk',
	'vn_xm177_nvg',
	'vn_xm177_short',
	'vn_xm177_sniper',
	'vn_xm177_stock',
	'vn_xm177_xm148',
	'vn_m21',
	'vn_m21_nvg',
	'vn_m21_nvg_sd',
	'vn_m21_sd'
];

// General infantry rifles + marksman rifles
_weaponsBasic = [
	'',
	'vn_type56', 'vn_gau5a', 'vn_m16_usaf', 'vn_m16', 'vn_m16_m203_camo', 'vn_m16_m203', 'vn_m16_xm148', 'vn_m63a', 'vn_xm16e1', 'vn_xm16e1_xm148', 'vn_xm177e1', 
	'vn_xm177e1_camo', 'vn_xm177', 'vn_xm177_xm148', 'vn_xm177_xm148_camo', 'vn_xm177_fg', 'vn_xm177_stock', 'vn_xm177_stock_camo', 'vn_xm177_short', 'vn_xm177_camo', 
	'vn_m1carbine', 'vn_m1carbine_gl', 'vn_m2carbine', 'vn_m2carbine_gl', 'vn_m1897', 'vn_izh54', 'vn_izh54_shorty', 'vn_sks_gl', 'vn_m4956_gl', 'vn_m1_garand_gl', 
	'vn_l1a1_01_gl', 'vn_l1a1_02_gl',"vn_ak_01", "vn_kbkg", "vn_kbkg_gl","vn_xm177_m203", "vn_xm177_m203_camo", "vn_m1carbine_shorty", "vn_m14a1_shorty", "vn_m1903_gl"
];
// marksman rifles
_weaponsMarksman = [

];
// heavy marksman rifles
_weaponsMarksmanHeavy = [
	'vn_l1a1_03', 'vn_l1a1_xm148', 'vn_l1a1_xm148_camo', 'vn_l1a1_02', 'vn_l1a1_02_camo', 'vn_l1a1_01', 'vn_l1a1_01_gl', 
	'vn_l1a1_01_camo', 'vn_l1a1_03_camo', 'vn_m1_garand', 'vn_m14', 'vn_m14_camo', 'vn_m14a1', 'vn_m1891', 'vn_m38', 'vn_m4956', 
	'vn_m9130', 'vn_sks', "vn_k98k", "vn_m1903", "vn_m36"
];
// Sniper rifles
_weaponsSniper = [
	'vn_m1_garand', 'vn_m14', 'vn_m14_camo', 'vn_m14a1', 'vn_l1a1_01', 'vn_l1a1_01_camo', 'vn_l1a1_02', 'vn_l1a1_02_camo', 'vn_m1891',
	'vn_m3carbine', 'vn_m38', 'vn_m40a1', 'vn_m40a1_camo', 'vn_m4956', 'vn_m9130', 'vn_sks', 'vn_vz54' , "vn_k98k", "vn_m1903", "vn_svd"
];
// high-capacity variants of rifles (drum magazines, variants with 100 round mags,etc)
_weaponsSW = [
	
];
// light machine guns
_weaponsLMG = [
	'vn_dp28', 
	'vn_m1918', 
	'vn_m63a_lmg', 
	'vn_rpd_shorty_01', 
	'vn_rpd_shorty', 
	'vn_rpd',
	'vn_l2a1_01',
	"vn_l4"
];
// medium machine guns
_weaponsMMG = [
	'vn_m63a_cdo', 
	'vn_m60',
	'vn_m60_shorty',
	'vn_m60_shorty_camo',
	'vn_pk',
	'vn_rpd_shorty_01', 
	'vn_rpd_shorty', 
	'vn_rpd', 
	"vn_mg42"
];
// compact weapons
_weaponsCompact = [

];
// all launchers
_weaponsLauncherAll = [
	'vn_sa7',
	'vn_sa7b',
	'vn_rpg2',
	'vn_rpg7',
	'vn_m127',
	'vn_m72',
	"vn_m20a1b1_01"
];
// basic launchers (rpg)
_weaponsLauncherBasic = [
	'vn_rpg2',
	'vn_m127',
	'vn_m72'
];
// regular launchers 
_weaponsLauncherRegular = [
	'vn_sa7',
	'vn_sa7b',
	'vn_rpg2',
	'vn_rpg7',
	'vn_m127',
	'vn_m72',
	"vn_m20a1b1_01"
];
// light AT
_weaponsLauncherLAT = [
	'vn_sa7',
	'vn_sa7b',
	'vn_rpg2',
	'vn_rpg7',
	'vn_m127',
	'vn_m72',
	"vn_m20a1b1_01"
];
// heavy AT
_weaponsLauncherHAT = [
	'vn_sa7',
	'vn_sa7b',
	'vn_rpg2',
	'vn_rpg7',
	'vn_m127',
	'vn_m72',
	"vn_m20a1b1_01"
];
// pistols / handguns
_weaponsHandgun = [
	'vn_p38s', 
	'vn_hd', 
	'vn_hp', 
	'vn_izh54_p', 
	'vn_m1895', 
	'vn_m1911', 
	'vn_mx991_m1911', 
	'vn_m712', 
	'vn_m79_p', 
	'vn_mk22', 
	'vn_m10', 
	'vn_mx991', 
	'vn_mx991_red', 
	'vn_fkb1_pm', 
	'vn_tt33', 
	'vn_vz61_p', 
	'vn_welrod', 
	'vn_pm',
	"vn_type64",
	"vn_ppk",
	"vn_p38"
];
// submachine guns
_weaponsSMG = [
	'vn_f1_smg', 
	'vn_k50m', 
	'vn_mc10', 
	'vn_mat49', 
	'vn_mat49_f', 
	'vn_mat49_vc', 
	'vn_mpu', 
	'vn_pps43', 
	'vn_pps52', 
	'vn_ppsh41', 
	'vn_vz61', 
	'vn_m45', 
	'vn_m45_fold', 
	'vn_m45_camo', 
	'vn_m1928_tommy', 
	'vn_m1928a1_tommy', 
	'vn_m1a1_tommy', 
	'vn_m1a1_tommy_so', 
	'vn_mp40', 
	'vn_m3a1', 
	'vn_sten',
	"vn_type64_smg", 
	"vn_type64_f_smg",
	"vn_l2a3", "vn_l2a3_f", 
	"vn_l34a1", "vn_l34a1_xm148", "vn_l34a1_f",
	""
];
// underwater weapons
_weaponsUW = [
	'vn_mk1_udg'
];
// binoculars, rangefinders, designators
_viewersAll = [
	'vn_m19_binocs_grn',
	'vn_m19_binocs_grey',
	'vn_mk21_binocs',
	'vn_fkb1',
	'vn_fkb1_red',
	'vn_mx991',
	'vn_mx991_red',
	'vn_anpvs2_binoc',
	"vn_camera_01"
];
// Binoculars and rangefinders (no lasers)
_viewersBasic = [
	'vn_m19_binocs_grn',
	'vn_m19_binocs_grey',
	'vn_mk21_binocs',
	'vn_fkb1',
	'vn_fkb1_red',
	'vn_mx991',
	'vn_mx991_red',
	'vn_anpvs2_binoc',
	"vn_camera_01"
];
// Laser designators
_viewersLaser = [
	'vn_m19_binocs_grn',
	'vn_m19_binocs_grey',
	'vn_mk21_binocs',
	'vn_fkb1',
	'vn_fkb1_red',
	'vn_mx991',
	'vn_mx991_red',
	'vn_anpvs2_binoc',
	"vn_camera_01"
];

// 'vn_b_uniform_macv_05_01'

// all uniforms
_uniformsAll = [
	'',
	'vn_b_uniform_sog_01_04', 'vn_b_uniform_sog_01_06', 'vn_b_uniform_sog_01_01', 'vn_b_uniform_sog_01_02', 'vn_b_uniform_sog_01_05', 'vn_b_uniform_sog_01_03', 
	'vn_b_uniform_sog_02_04', 'vn_b_uniform_sog_02_06', 'vn_b_uniform_sog_02_01', 'vn_b_uniform_sog_02_02', 'vn_b_uniform_sog_02_05', 'vn_b_uniform_sog_02_03', 
	'vn_b_uniform_macv_01_17', 'vn_b_uniform_macv_02_17', 'vn_b_uniform_macv_03_17', 'vn_b_uniform_macv_04_17', 'vn_b_uniform_macv_05_17', 'vn_b_uniform_macv_06_17', 
	'vn_b_uniform_nz_01_01', 'vn_b_uniform_nz_02_01', 'vn_b_uniform_nz_03_01', 'vn_b_uniform_nz_04_01', 'vn_b_uniform_nz_05_01', 'vn_b_uniform_nz_06_01', 
	'vn_b_uniform_seal_07_01', 'vn_b_uniform_seal_07_02', 'vn_b_uniform_seal_07_03', 'vn_b_uniform_seal_07_04', 'vn_b_uniform_seal_08_01', 'vn_b_uniform_seal_08_02', 
	'vn_b_uniform_seal_08_03', 'vn_b_uniform_seal_08_04', 'vn_b_uniform_seal_09_01', 'vn_b_uniform_seal_03_01', 'vn_b_uniform_seal_04_01', 'vn_b_uniform_seal_01_06', 
	'vn_b_uniform_seal_01_07', 'vn_b_uniform_seal_01_01', 'vn_b_uniform_seal_01_02', 'vn_b_uniform_seal_01_05', 'vn_b_uniform_seal_02_06', 'vn_b_uniform_seal_02_07', 
	'vn_b_uniform_seal_02_01', 'vn_b_uniform_seal_02_02', 'vn_b_uniform_seal_02_05', 'vn_b_uniform_seal_05_06', 'vn_b_uniform_seal_05_07', 'vn_b_uniform_seal_05_01', 
	'vn_b_uniform_seal_05_02', 'vn_b_uniform_seal_05_05', 'vn_b_uniform_seal_06_06', 'vn_b_uniform_seal_06_07', 'vn_b_uniform_seal_06_01', 'vn_b_uniform_seal_06_02', 
	'vn_b_uniform_seal_06_05', 'vn_b_uniform_aus_01_01', 'vn_b_uniform_aus_10_01', 'vn_b_uniform_aus_02_01', 'vn_b_uniform_aus_03_01', 'vn_b_uniform_aus_04_01', 
	'vn_b_uniform_aus_05_01', 'vn_b_uniform_aus_06_01', 'vn_b_uniform_aus_07_01', 'vn_b_uniform_aus_08_01', 'vn_b_uniform_aus_09_01', 'vn_b_uniform_sas_01_06', 
	'vn_b_uniform_sas_02_06', 'vn_b_uniform_sas_03_06', 'vn_b_uniform_macv_01_15', 'vn_b_uniform_macv_01_06', 'vn_b_uniform_macv_01_04', 'vn_b_uniform_macv_01_07', 
	'vn_b_uniform_macv_01_01', 'vn_b_uniform_macv_01_02', 'vn_b_uniform_macv_01_05', 'vn_b_uniform_macv_01_08', 'vn_b_uniform_macv_01_03', 'vn_b_uniform_macv_02_15', 
	'vn_b_uniform_macv_02_06', 'vn_b_uniform_macv_02_07', 'vn_b_uniform_macv_02_01', 'vn_b_uniform_macv_02_02', 'vn_b_uniform_macv_02_05', 'vn_b_uniform_macv_02_08', 
	'vn_b_uniform_macv_03_15', 'vn_b_uniform_macv_03_06', 'vn_b_uniform_macv_03_07', 'vn_b_uniform_macv_03_01', 'vn_b_uniform_macv_03_02', 'vn_b_uniform_macv_03_05', 
	'vn_b_uniform_macv_03_08', 'vn_b_uniform_macv_04_15', 'vn_b_uniform_macv_04_21', 'vn_b_uniform_macv_04_06', 'vn_b_uniform_macv_04_07', 'vn_b_uniform_macv_04_01', 
	'vn_b_uniform_macv_04_02', 'vn_b_uniform_macv_04_20', 'vn_b_uniform_macv_04_05', 'vn_b_uniform_macv_04_08', 'vn_b_uniform_macv_05_15', 'vn_b_uniform_macv_05_06', 
	'vn_b_uniform_macv_05_07', 'vn_b_uniform_macv_05_01', 'vn_b_uniform_macv_05_02', 'vn_b_uniform_macv_05_05', 'vn_b_uniform_macv_05_08', 'vn_b_uniform_macv_06_15', 
	'vn_b_uniform_macv_06_06', 'vn_b_uniform_macv_06_07', 'vn_b_uniform_macv_06_01', 'vn_b_uniform_macv_06_02', 'vn_b_uniform_macv_06_05', 'vn_b_uniform_macv_06_08', 
	'vn_b_uniform_heli_01_01', 'vn_b_uniform_macv_01_18', 'vn_b_uniform_macv_02_18', 'vn_b_uniform_macv_03_18', 'vn_b_uniform_macv_04_18', 'vn_b_uniform_macv_05_18', 
	'vn_b_uniform_macv_06_18'
];
// basic uniforms
_uniformsBasic = [
	'vn_b_uniform_macv_01_03',
	'vn_b_uniform_macv_01_06',
	'vn_b_uniform_macv_01_08',
	'vn_b_uniform_macv_01_07',
	'vn_b_uniform_macv_01_01',
	'vn_b_uniform_macv_01_04',
	'vn_b_uniform_macv_01_05',
	'vn_b_uniform_macv_01_02',
	'vn_b_uniform_macv_02_06',
	'vn_b_uniform_macv_02_08',
	'vn_b_uniform_macv_02_07',
	'vn_b_uniform_macv_02_01',
	'vn_b_uniform_macv_02_05',
	'vn_b_uniform_macv_02_02',
	'vn_b_uniform_macv_03_06',
	'vn_b_uniform_macv_03_08',
	'vn_b_uniform_macv_03_07',
	'vn_b_uniform_macv_03_01',
	'vn_b_uniform_macv_03_05',
	'vn_b_uniform_macv_03_02',
	'vn_b_uniform_macv_04_06',
	'vn_b_uniform_macv_04_08',
	'vn_b_uniform_macv_04_07',
	'vn_b_uniform_macv_04_01',
	'vn_b_uniform_macv_04_05',
	'vn_b_uniform_macv_04_02',
	'vn_b_uniform_macv_05_06',
	'vn_b_uniform_macv_05_08',
	'vn_b_uniform_macv_05_07',
	'vn_b_uniform_macv_05_01',
	'vn_b_uniform_macv_05_05',
	'vn_b_uniform_macv_05_02',
	'vn_b_uniform_macv_06_06',
	'vn_b_uniform_macv_06_08',
	'vn_b_uniform_macv_06_07',
	'vn_b_uniform_macv_06_01',
	'vn_b_uniform_macv_06_05',
	'vn_b_uniform_macv_06_02',
	'vn_b_uniform_sog_01_03',
	'vn_b_uniform_sog_01_01',
	'vn_b_uniform_sog_01_04',
	'vn_b_uniform_sog_01_06',
	'vn_b_uniform_sog_01_02',
	'vn_b_uniform_sog_01_05',
	'vn_b_uniform_sog_02_03',
	'vn_b_uniform_sog_02_01',
	'vn_b_uniform_sog_02_04',
	'vn_b_uniform_sog_02_06',
	'vn_b_uniform_sog_02_02',
	'vn_b_uniform_sog_02_05'
];
// sniper uniforms
_uniformsSniper = [
	'vn_b_uniform_macv_01_03',
	'vn_b_uniform_macv_01_06',
	'vn_b_uniform_macv_01_08',
	'vn_b_uniform_macv_01_07',
	'vn_b_uniform_macv_01_01',
	'vn_b_uniform_macv_01_04',
	'vn_b_uniform_macv_01_05',
	'vn_b_uniform_macv_01_02',
	'vn_b_uniform_macv_02_06',
	'vn_b_uniform_macv_02_08',
	'vn_b_uniform_macv_02_07',
	'vn_b_uniform_macv_02_01',
	'vn_b_uniform_macv_02_05',
	'vn_b_uniform_macv_02_02',
	'vn_b_uniform_macv_03_06',
	'vn_b_uniform_macv_03_08',
	'vn_b_uniform_macv_03_07',
	'vn_b_uniform_macv_03_01',
	'vn_b_uniform_macv_03_05',
	'vn_b_uniform_macv_03_02',
	'vn_b_uniform_macv_04_06',
	'vn_b_uniform_macv_04_08',
	'vn_b_uniform_macv_04_07',
	'vn_b_uniform_macv_04_01',
	'vn_b_uniform_macv_04_05',
	'vn_b_uniform_macv_04_02',
	'vn_b_uniform_macv_05_06',
	'vn_b_uniform_macv_05_08',
	'vn_b_uniform_macv_05_07',
	'vn_b_uniform_macv_05_01',
	'vn_b_uniform_macv_05_05',
	'vn_b_uniform_macv_05_02',
	'vn_b_uniform_macv_06_06',
	'vn_b_uniform_macv_06_08',
	'vn_b_uniform_macv_06_07',
	'vn_b_uniform_macv_06_01',
	'vn_b_uniform_macv_06_05',
	'vn_b_uniform_macv_06_02',
	'vn_b_uniform_sog_01_03',
	'vn_b_uniform_sog_01_01',
	'vn_b_uniform_sog_01_04',
	'vn_b_uniform_sog_01_06',
	'vn_b_uniform_sog_01_02',
	'vn_b_uniform_sog_01_05',
	'vn_b_uniform_sog_02_03',
	'vn_b_uniform_sog_02_01',
	'vn_b_uniform_sog_02_04',
	'vn_b_uniform_sog_02_06',
	'vn_b_uniform_sog_02_02',
	'vn_b_uniform_sog_02_05'
];
// pilot uniforms
_uniformsPilot = [
	'','vn_b_uniform_heli_01_01',
	'vn_b_uniform_k2b_03_02', 'vn_b_uniform_k2b_03_01', 'vn_b_uniform_k2b_02_03', 'vn_b_uniform_k2b_01_02', 'vn_b_uniform_k2b_02_02',
	'vn_b_uniform_k2b_01_05', 'vn_b_uniform_k2b_01_04', 'vn_b_uniform_k2b_02_05', 'vn_b_uniform_k2b_02_04', 'vn_b_uniform_k2b_01_01', 'vn_b_uniform_k2b_02_01'
];
// all helmets, except for thermal stuff
_headgearBasic = [
	'',
	'vn_b_boonie_02_08', 'vn_b_boonie_02_06', 'vn_o_boonie_nva_02_01', 'vn_o_boonie_nva_02_02', 'vn_b_boonie_02_04', 'vn_b_boonie_06_01', 'vn_b_boonie_08_01', 'vn_b_boonie_08_02',
	'vn_b_boonie_06_02', 'vn_b_boonie_07_01', 'vn_b_boonie_07_02', 'vn_o_boonie_vc_01_01', 'vn_b_boonie_02_01', 'vn_b_boonie_02_05', 'vn_b_boonie_02_02', 'vn_b_boonie_02_07',
	'vn_o_boonie_vc_01_02', 'vn_b_boonie_02_03', 'vn_b_boonie_01_08', 'vn_b_boonie_01_06', 'vn_b_boonie_01_04', 'vn_b_boonie_01_01', 'vn_b_boonie_01_05', 'vn_b_boonie_01_02',
	'vn_b_boonie_01_07', 'vn_b_boonie_01_03', 'vn_b_boonie_03_08', 'vn_b_boonie_03_06', 'vn_b_boonie_03_04', 'vn_b_boonie_03_01', 'vn_b_boonie_03_05', 'vn_b_boonie_03_02',
	'vn_b_boonie_03_07', 'vn_b_boonie_03_03', 'vn_b_boonie_05_08', 'vn_b_boonie_05_06', 'vn_b_boonie_05_04', 'vn_b_boonie_05_01', 'vn_b_boonie_05_05', 'vn_b_boonie_05_02',
	'vn_b_boonie_05_07', 'vn_b_boonie_05_03', 'vn_b_boonie_04_08', 'vn_b_boonie_04_06', 'vn_b_boonie_04_04', 'vn_b_boonie_04_01', 'vn_b_boonie_04_05', 'vn_b_boonie_04_02',
	'vn_b_boonie_04_07', 'vn_b_boonie_04_03', 'vn_b_bandana_08', 'vn_b_bandana_06', 'vn_b_bandana_04', 'vn_b_bandana_01', 'vn_b_bandana_02', 'vn_b_bandana_05',
	'vn_b_bandana_07', 'vn_b_bandana_03', 'vn_b_headband_08', 'vn_b_headband_05', 'vn_b_headband_04', 'vn_b_headband_02', 'vn_b_helmet_m1_02_02', 'vn_b_helmet_m1_02_01',
	'vn_b_helmet_m1_03_02', 'vn_b_helmet_m1_03_01', 'vn_b_helmet_m1_05_02', 'vn_b_helmet_m1_05_01', 'vn_b_helmet_m1_06_02', 'vn_b_helmet_m1_06_01', 'vn_b_helmet_m1_07_02',
	'vn_b_helmet_m1_07_01', 'vn_b_helmet_m1_04_02', 'vn_b_helmet_m1_04_01', 'vn_b_helmet_m1_08_02', 'vn_b_helmet_m1_08_01', 'vn_b_helmet_m1_10_01', 'vn_b_helmet_m1_11_01',
	'vn_b_helmet_m1_09_02', 'vn_b_helmet_m1_09_01', 'vn_b_helmet_m1_01_02', 'vn_i_helmet_m1_01_01', 'vn_i_helmet_m1_01_02', 'vn_i_helmet_m1_02_01', 'vn_i_helmet_m1_03_01',
	'vn_i_helmet_m1_02_02', 'vn_i_helmet_m1_03_02', 'vn_b_helmet_m1_01_01', 'vn_b_helmet_m1_12_01', 'vn_b_helmet_m1_12_02', 'vn_b_helmet_t56_01_01', 'vn_b_helmet_t56_01_02', 
	'vn_b_helmet_t56_02_02', 'vn_b_helmet_t56_01_03', 'vn_b_helmet_t56_02_03', 'vn_b_helmet_t56_02_01', 'H_HeadBandage_bloody_F', 'H_HeadBandage_stained_F', 'H_HeadBandage_clean_F', 
	'vn_b_beret_01_08', 'vn_b_beret_01_05', 'vn_i_beret_03_01', 'vn_i_beret_03_03', 'vn_i_beret_01_01', 'vn_i_beret_03_04', 'vn_i_beret_03_02', 'vn_b_beret_01_04', 'vn_b_beret_01_01', 
	'vn_b_beret_01_07', 'vn_b_beret_04_01', 'vn_b_beret_03_01', 'vn_b_beret_01_06', 'vn_b_beret_01_03', 'vn_b_beret_01_02', 'vn_b_helmet_sog_01',
	"vn_b_helmet_m1_14_02", "vn_b_helmet_m1_14_01", "vn_b_helmet_m1_15_02", "vn_b_helmet_m1_15_01", "vn_b_helmet_m1_16_02", "vn_b_helmet_m1_16_01", "vn_b_helmet_m1_18_02",
	 "vn_b_helmet_m1_18_01", "vn_b_helmet_m1_19_02", "vn_b_helmet_m1_19_01", "vn_b_helmet_m1_20_02", "vn_b_helmet_m1_20_01"
];

// Pilot helmets
_headgearPilot = [
	'','vn_b_helmet_aph6_01_01', 'vn_b_helmet_aph6_02_01', 'vn_b_helmet_aph6_01_03', 'vn_b_helmet_aph6_02_03', 'vn_b_helmet_aph6_01_04', 'vn_b_helmet_aph6_02_04', 
	'vn_b_helmet_aph6_01_05', 'vn_b_helmet_aph6_02_05', 'vn_b_helmet_aph6_01_02', 'vn_b_helmet_aph6_02_02', 'vn_b_helmet_svh4_01_06', 'vn_b_helmet_svh4_02_06', 
	'vn_b_helmet_svh4_01_05', 'vn_b_helmet_svh4_02_05', 'vn_b_helmet_svh4_01_02', 'vn_b_helmet_svh4_02_02', 'vn_b_helmet_svh4_01_01', 'vn_b_helmet_svh4_02_01', 
	'vn_b_helmet_svh4_01_03', 'vn_b_helmet_svh4_02_03', 'vn_b_helmet_svh4_01_04', 'vn_b_helmet_svh4_02_04'
];
// thermal helmets
_headgearThermal = [
	
];
// all vests
_vestsAll = [
	'',
	'vn_b_vest_sog_01', 'vn_b_vest_sog_06', 'vn_b_vest_sog_04', 'vn_b_vest_sog_05', 'vn_b_vest_sog_03', 'vn_b_vest_sog_02', 'vn_b_vest_seal_05', 
	'vn_b_vest_seal_06', 'vn_b_vest_seal_07', 'vn_b_vest_seal_03', 'vn_b_vest_seal_04', 'vn_b_vest_seal_01', 'vn_b_vest_seal_02', 'vn_b_vest_anzac_03', 
	'vn_b_vest_anzac_07', 'vn_b_vest_anzac_06', 'vn_b_vest_anzac_04', 'vn_b_vest_anzac_05', 'vn_b_vest_anzac_09', 'vn_b_vest_anzac_10', 'vn_b_vest_anzac_01', 
	'vn_b_vest_anzac_02', 'vn_b_vest_sas_01', 'vn_b_vest_sas_04', 'vn_b_vest_sas_02', 'vn_b_vest_sas_03', 'vn_b_vest_usarmy_04', 'vn_b_vest_usarmy_09', 
	'vn_b_vest_usarmy_07', 'vn_b_vest_usarmy_01', 'vn_b_vest_usarmy_08', 'vn_b_vest_usarmy_05', 'vn_b_vest_usarmy_06', 'vn_b_vest_usarmy_02', 'vn_b_vest_usarmy_03', 
	'vn_b_vest_usarmy_11', 'vn_b_vest_usarmy_12', 'vn_b_vest_usarmy_13', 'vn_b_vest_usarmy_14', 'vn_b_vest_usarmy_10',
	"vn_b_vest_usmc_06", "vn_b_vest_usmc_05", "vn_b_vest_usmc_04", "vn_b_vest_usmc_09", "vn_b_vest_usmc_03", "vn_b_vest_usmc_08", "vn_b_vest_usmc_01", "vn_b_vest_usmc_02", "vn_b_vest_usmc_07"
];
// Pilot vests
_vestsPilot = [
	'','vn_b_vest_aircrew_01', 'vn_b_vest_aircrew_07', 'vn_b_vest_aircrew_02', 'vn_b_vest_aircrew_04', 'vn_b_vest_aircrew_06', 'vn_b_vest_aircrew_03', 'vn_b_vest_aircrew_05', 'vn_b_vest_anzac_08'
];
// all backpacks
_backpacksAll = [
	'',
	'vn_b_pack_04_02', 'vn_b_pack_03_02', 'vn_b_pack_02_02', 'vn_b_pack_05_02', 'vn_b_pack_01_02', 'vn_b_pack_04', 'vn_b_pack_03', 'vn_b_pack_02',
	'vn_b_pack_05', 'vn_b_pack_01', 'vn_b_pack_trp_02', 'vn_b_pack_trp_04', 'vn_b_pack_trp_01', 'vn_b_pack_trp_03', 'vn_b_pack_seal_01', 'vn_b_pack_p08_01',
	'vn_b_pack_p08_02', 'vn_b_pack_p08_03', 'vn_b_pack_p44_01', 'vn_b_pack_p44_02', 'vn_b_pack_p44_03', 'vn_b_pack_pfield_01', 'vn_b_pack_pfield_02',
	'vn_b_pack_prc77_01', 'vn_b_pack_static_tow', 'vn_b_pack_static_m1919a4_low_01', 'vn_b_pack_static_m1919a4_high_01', 'vn_b_pack_static_m1919a6_01',
	'vn_b_pack_static_m2_01', 'vn_b_pack_static_m2_low_01', 'vn_b_pack_static_m2_high_01', 'vn_b_pack_static_m29_01', 'vn_b_pack_static_m60_low_01',
	'vn_b_pack_static_m60_high_01', 'vn_b_pack_static_mk18', 'vn_b_pack_lw_03', 'vn_b_pack_m5_01', 'vn_b_pack_lw_07', 'vn_b_pack_lw_04', 'vn_b_pack_lw_06',
	'vn_b_pack_lw_05', 'vn_b_pack_lw_02', 'vn_b_pack_lw_01', 'vn_b_pack_static_base_01', 'vn_b_pack_trp_02_02', 'vn_b_pack_trp_04_02', 'vn_b_pack_trp_01_02',
	'vn_b_pack_trp_03_02', 'vn_i_pack_parachute_01', 'vn_o_pack_parachute_01', 'vn_b_pack_ba18_01', 'vn_b_pack_ba22_01',
	"vn_b_pack_m41_01", "vn_b_pack_m41_02", "vn_b_pack_m41_03", "vn_b_pack_m41_04", "vn_b_pack_m41_05"
];
// Regular sized backpacks (all backpacks except for the big ones)
_backpacksBasic = [
	'',
	'vn_b_pack_04_02', 'vn_b_pack_03_02', 'vn_b_pack_02_02', 'vn_b_pack_05_02', 'vn_b_pack_01_02', 'vn_b_pack_04', 'vn_b_pack_03', 'vn_b_pack_02',
	'vn_b_pack_05', 'vn_b_pack_01', 'vn_b_pack_trp_02', 'vn_b_pack_trp_04', 'vn_b_pack_trp_01', 'vn_b_pack_trp_03', 'vn_b_pack_seal_01', 'vn_b_pack_p08_01',
	'vn_b_pack_p08_02', 'vn_b_pack_p08_03', 'vn_b_pack_p44_01', 'vn_b_pack_p44_02', 'vn_b_pack_p44_03', 'vn_b_pack_pfield_01', 'vn_b_pack_pfield_02',
	'vn_b_pack_prc77_01', 'vn_b_pack_static_tow', 'vn_b_pack_static_m1919a4_low_01', 'vn_b_pack_static_m1919a4_high_01', 'vn_b_pack_static_m1919a6_01',
	'vn_b_pack_static_m2_01', 'vn_b_pack_static_m2_low_01', 'vn_b_pack_static_m2_high_01', 'vn_b_pack_static_m29_01', 'vn_b_pack_static_m60_low_01',
	'vn_b_pack_static_m60_high_01', 'vn_b_pack_static_mk18', 'vn_b_pack_lw_03', 'vn_b_pack_m5_01', 'vn_b_pack_lw_07', 'vn_b_pack_lw_04', 'vn_b_pack_lw_06',
	'vn_b_pack_lw_05', 'vn_b_pack_lw_02', 'vn_b_pack_lw_01', 'vn_b_pack_static_base_01', 'vn_b_pack_trp_02_02', 'vn_b_pack_trp_04_02', 'vn_b_pack_trp_01_02',
	'vn_b_pack_trp_03_02', 'vn_i_pack_parachute_01', 'vn_o_pack_parachute_01', 'vn_b_pack_ba18_01', 'vn_b_pack_ba22_01'
];
// Large backpacks
_backpacksLarge = [

];
// NATO backpacks which can be assembled into static turrets (tripods + weapon)
_backpacksStatic = [
	'vn_b_pack_static_tow',
	'vn_b_pack_static_m1919a4_low_01',
	'vn_b_pack_static_m1919a4_high_01',
	'vn_b_pack_static_m1919a6_01',
	'vn_b_pack_static_m2_high_01',
	'vn_b_pack_static_m2_low_01',
	'vn_b_pack_static_m2_01',
	'vn_b_pack_static_m29_01',
	'vn_b_pack_static_m60_high_01',
	'vn_b_pack_static_m60_low_01',
	'vn_b_pack_static_base_01'
];
// UAV backpacks
_backpacksUAV = [
	
];
// Radio backpacks
_backpacksRadio = [
	'vn_b_pack_lw_06',
	'vn_b_pack_prc77_01',
	'vn_b_pack_trp_04_02',
	'vn_b_pack_03_02',
	'vn_b_pack_03',
	'vn_b_pack_trp_04'
];
// all goggles
_gogglesAll = [
	'',
	'none',
	'vn_b_acc_goggles_01',
	'vn_b_acc_m17_01',
	'vn_b_acc_m17_02',
	'vn_b_acc_ms22001_01',
	'vn_b_acc_ms22001_02',
	'vn_b_aviator',
	'vn_b_bandana_a',
	'vn_b_scarf_01_01',
	'vn_b_scarf_01_03',
	'vn_b_spectacles',
	'vn_b_spectacles_tinted',
	'vn_b_squares',
	'vn_b_squares_tinted',
	'vn_g_glasses_01',
	'vn_g_spectacles_01',
	'vn_g_spectacles_02',
	'vn_glasses_base',
	'vn_o_acc_goggles_01',
	'vn_o_acc_goggles_02',
	'vn_o_acc_goggles_03',
	'vn_o_acc_km32_01',
	'vn_o_bandana_b',
	'vn_o_bandana_g',
	'vn_o_poncho_01_01',
	'vn_o_scarf_01_01',
	'vn_o_scarf_01_02',
	'vn_o_scarf_01_03',
	'vn_o_scarf_01_04'
];
// armor piercing missiles
_magazinesAT = [

];
// all magazines and ammo
_magazinesAll = [
	'',
	'vn_vmagazine',
	'vn_magazine',
	'vn_lmagazine',
	'vn_pistolmag_base',
	'vn_riflemag_base',
	'vn_shotgunmag_base',
	'vn_smgmag_base',
	'vn_lmgmag_base',
	'vn_handgrenade_base',
	'vn_prop_base',
	'vn_prop_fort_mag',
	'vn_prop_med_base',
	'vn_prop_med_antibiotics',
	'vn_prop_med_antimalaria',
	'vn_prop_med_antivenom',
	'vn_prop_med_painkillers',
	'vn_prop_med_wormpowder',
	'vn_prop_med_dysentery',
	'vn_prop_drink_01',
	'vn_prop_drink_02',
	'vn_prop_drink_03',
	'vn_prop_drink_04',
	'vn_prop_drink_05',
	'vn_prop_drink_06',
	'vn_prop_drink_10',
	'vn_prop_food_meal_01',
	'vn_prop_food_fresh_01',
	'vn_prop_food_fresh_02',
	'vn_prop_food_fresh_03',
	'vn_prop_food_fresh_04',
	'vn_prop_food_fresh_05',
	'vn_prop_food_fresh_06',
	'vn_prop_food_fresh_07',
	'vn_prop_food_fresh_08',
	'vn_prop_food_fresh_09',
	'vn_prop_food_fresh_10',
	'vn_prop_food_sack_01',
	'vn_prop_food_sack_02',
	'vn_prop_food_lrrp_01_01',
	'vn_prop_food_lrrp_01_02',
	'vn_prop_food_lrrp_01_03',
	'vn_prop_food_lrrp_01_04',
	'vn_prop_food_lrrp_01_05',
	'vn_prop_food_lrrp_01_06',
	'vn_prop_food_lrrp_01_07',
	'vn_prop_food_lrrp_01_08',
	'vn_prop_food_pir_01_01',
	'vn_prop_food_pir_01_02',
	'vn_prop_food_pir_01_03',
	'vn_prop_food_pir_01_04',
	'vn_prop_food_pir_01_05',
	'vn_prop_food_can_01_01',
	'vn_prop_food_can_01_02',
	'vn_prop_food_can_01_03',
	'vn_prop_food_can_01_04',
	'vn_prop_food_can_01_05',
	'vn_prop_food_can_01_06',
	'vn_prop_food_can_01_07',
	'vn_prop_food_can_01_08',
	'vn_prop_food_can_01_09',
	'vn_prop_food_can_01_10',
	'vn_prop_food_can_01_11',
	'vn_prop_food_can_01_12',
	'vn_prop_food_can_01_13',
	'vn_prop_food_can_01_14',
	'vn_prop_food_can_01_15',
	'vn_prop_food_can_01_16',
	'vn_prop_food_can_02_01',
	'vn_prop_food_can_02_02',
	'vn_prop_food_can_02_03',
	'vn_prop_food_can_02_04',
	'vn_prop_food_can_02_05',
	'vn_prop_food_can_02_06',
	'vn_prop_food_can_02_07',
	'vn_prop_food_can_02_08',
	'vn_prop_food_can_03_01',
	'vn_prop_food_can_03_02',
	'vn_prop_food_can_03_03',
	'vn_prop_food_can_03_04',
	'vn_prop_food_box_01_01',
	'vn_prop_food_box_01_02',
	'vn_prop_food_box_01_03',
	'vn_prop_food_box_02_01',
	'vn_prop_food_box_02_02',
	'vn_prop_food_box_02_03',
	'vn_prop_food_box_02_04',
	'vn_prop_food_box_02_05',
	'vn_prop_food_box_02_06',
	'vn_prop_food_box_02_07',
	'vn_prop_food_box_02_08',
	'vn_prop_drink_08_01',
	'vn_prop_drink_07_01',
	'vn_prop_drink_07_02',
	'vn_prop_drink_07_03',
	'vn_prop_drink_09_01',
	'vn_prop_food_meal_01_01',
	'vn_prop_food_meal_01_02',
	'vn_prop_food_meal_01_03',
	'vn_prop_food_meal_01_04',
	'vn_prop_food_meal_01_05',
	'vn_prop_food_meal_01_06',
	'vn_prop_food_meal_01_07',
	'vn_prop_food_meal_01_08',
	'vn_prop_food_meal_01_09',
	'vn_prop_food_meal_01_10',
	'vn_prop_food_meal_01_11',
	'vn_prop_food_meal_01_12',
	'vn_prop_food_meal_01_13',
	'vn_prop_food_meal_01_14',
	'vn_prop_food_meal_01_15',
	'vn_prop_food_meal_01_16',
	'vn_prop_food_meal_01_17',
	'vn_prop_food_meal_01_18',
	'vn_prop_food_meal_02_01',
	'vn_prop_food_meal_02_02',
	'vn_prop_food_meal_02_03',
	'vn_prop_food_meal_02_04',
	'vn_prop_food_meal_02_05',
	'vn_prop_food_meal_02_06',
	'vn_b_item_bandage_01',
	'vn_b_item_bugjuice_01',
	'vn_b_item_cigs_01',
	'vn_b_item_gunoil_01',
	'vn_b_item_lighter_01',
	'vn_b_item_rations_01',
	'vn_mine_m18_mag',
	'vn_mine_m18_range_mag',
	'vn_mine_m18_x3_mag',
	'vn_mine_m18_x3_range_mag',
	'vn_mine_ammobox_range_mag',
	'vn_mine_m14_mag',
	'vn_mine_m16_mag',
	'vn_mine_tripwire_m16_02_mag',
	'vn_mine_tripwire_m16_04_mag',
	'vn_mine_tripwire_f1_02_mag',
	'vn_mine_tripwire_f1_04_mag',
	'vn_mine_tripwire_m49_02_mag',
	'vn_mine_tripwire_m49_04_mag',
	'vn_mine_tripwire_arty_mag',
	'vn_mine_satchel_remote_02_mag',
	'vn_mine_tm57_mag',
	'vn_mine_m15_mag',
	'vn_mine_m112_remote_mag',
	'vn_mine_punji_01_mag',
	'vn_mine_punji_02_mag',
	'vn_mine_punji_03_mag',
	'vn_m61_grenade_mag',
	'vn_v40_grenade_mag',
	'vn_m67_grenade_mag',
	'vn_m14_grenade_mag',
	'vn_m14_early_grenade_mag',
	'vn_m7_grenade_mag',
	'vn_m34_grenade_mag',
	'vn_molotov_grenade_mag',
	'vn_rkg3_grenade_mag',
	'vn_t67_grenade_mag',
	'vn_chicom_grenade_mag',
	'vn_f1_grenade_mag',
	'vn_rg42_grenade_mag',
	'vn_rgd5_grenade_mag',
	'vn_rgd33_grenade_mag',
	'vn_m18_red_mag',
	'vn_rdg2_mag',
	'vn_m18_white_mag',
	'vn_m18_green_mag',
	'vn_m18_yellow_mag',
	'vn_m18_purple_mag',
	'vn_m72_mag',
	'vn_rpg2_mag',
	'vn_rpg7_mag',
	'vn_sa7_mag',
	'vn_sa7b_mag',
	'vn_m127_mag',
	'vn_m128_mag',
	'vn_m129_mag',
	'vn_hd_mag',
	'vn_welrod_mag',
	'vn_m1911_mag',
	'vn_hp_mag',
	'vn_mk22_mag',
	'vn_m10_mag',
	'vn_m1895_mag',
	'vn_pm_mag',
	'vn_tt33_mag',
	'vn_m712_mag',
	'vn_izh54_mag',
	'vn_izh54_so_mag',
	'vn_m1897_buck_mag',
	'vn_m1897_fl_mag',
	'vn_m45_mag',
	'vn_m45_t_mag',
	'vn_m3a1_mag',
	'vn_m3a1_t_mag',
	'vn_sten_mag',
	'vn_sten_t_mag',
	'vn_mat49_mag',
	'vn_mat49_t_mag',
	'vn_mp40_mag',
	'vn_mp40_t_mag',
	'vn_mat49_vc_mag',
	'vn_m16_mag_base',
	'vn_m16_20_mag',
	'vn_m16_30_mag',
	'vn_m16_40_mag',
	'vn_m16_20_t_mag',
	'vn_m16_30_t_mag',
	'vn_m16_40_t_mag',
	'vn_m63a_30_mag',
	'vn_m63a_30_t_mag',
	'vn_m14_mag',
	'vn_m14_t_mag',
	'vn_m14_10_mag',
	'vn_m14_10_t_mag',
	'vn_m40a1_mag',
	'vn_m40a1_t_mag',
	'vn_m60_100_mag',
	'vn_carbine_15_mag',
	'vn_carbine_15_t_mag',
	'vn_carbine_30_mag',
	'vn_carbine_30_t_mag',
	'vn_m4956_10_mag',
	'vn_m4956_10_t_mag',
	'vn_mc10_mag',
	'vn_mc10_t_mag',
	'vn_pps_mag',
	'vn_pps_t_mag',
	'vn_ppsh41_35_mag',
	'vn_ppsh41_35_t_mag',
	'vn_ppsh41_71_mag',
	'vn_ppsh41_71_t_mag',
	'vn_type56_mag',
	'vn_type56_t_mag',
	'vn_sks_mag',
	'vn_sks_t_mag',
	'vn_m38_mag',
	'vn_m38_t_mag',
	'vn_rpd_100_mag',
	'vn_rpd_125_mag',
	'vn_dp28_mag',
	'vn_pk_100_mag',
	'vn_mk1_udg_mag',
	'vn_mpu_mag',
	'vn_mpu_t_mag',
	'vn_vz61_mag',
	'vn_vz61_t_mag',
	'vn_m1a1_20_mag',
	'vn_m1a1_20_t_mag',
	'vn_m1a1_30_mag',
	'vn_m1a1_30_t_mag',
	'vn_m1928_mag',
	'vn_m1928_t_mag',
	'vn_m63a_100_mag',
	'vn_m63a_100_t_mag',
	'vn_m63a_150_mag',
	'vn_m63a_150_t_mag',
	'vn_mine_bike_mag',
	'vn_mine_bike_range_mag',
	'vn_mine_cartridge_mag',
	'vn_mine_lighter_mag',
	'vn_mine_pot_mag',
	'vn_mine_pot_range_mag',
	'vn_mine_jerrycan_mag',
	'vn_mine_jerrycan_range_mag',
	'vn_mine_punji_04_mag',
	'vn_mine_punji_05_mag',
	'vn_mine_mortar_range_mag',
	'vn_mine_limpet_01_mag',
	'vn_mine_limpet_02_mag',
	'vn_mine_chicom_no8_mag',
	'vn_mine_dh10_mag',
	'vn_mine_dh10_range_mag',
	'vn_mine_gboard_range_mag',
	'vn_mine_satchelcharge_02_mag',
	'vn_mine_bangalore_mag',
	"vn_mine_m18_wp_fuze10_mag",
	"vn_mine_m18_wp_range_mag",
	"vn_mine_m18_wp_mag",
	'vn_satchelcharge_02_throw_mag',
	'vn_f1_smg_mag',
	'vn_f1_smg_t_mag',
	'vn_m1_garand_mag',
	'vn_m1_garand_t_mag',
	'vn_l1a1_10_mag',
	'vn_l1a1_10_t_mag',
	'vn_l1a1_20_mag',
	'vn_l1a1_20_t_mag',
	'vn_l1a1_30_mag',
	'vn_l1a1_30_t_mag',
	'vn_l1a1_30_02_mag',
	'vn_l1a1_30_02_t_mag',
	'vn_m1918_mag',
	'vn_m1918_t_mag',
	'vn_type56_v_12_he_mag',
	'vn_type56_v_12_heat_mag',
	'vn_22mm_n94_heat_mag', 'vn_22mm_m9_heat_mag', 'vn_40mm_m717_smoke_p_mag', 'vn_40mm_m716_smoke_y_mag', 'vn_40mm_m715_smoke_g_mag', 'vn_40mm_m682_smoke_r_mag',
	'vn_40mm_m680_smoke_w_mag', 'vn_40mm_m651_cs_mag', 'vn_22mm_m61_frag_mag', 'vn_22mm_m60_heat_mag', 'vn_22mm_m60_frag_mag', 'vn_40mm_m576_buck_mag',
	'vn_40mm_m433_hedp_mag', 'vn_40mm_m406_he_mag', 'vn_40mm_m397_ab_mag', 'vn_40mm_m381_he_mag', 'vn_22mm_m22_smoke_mag', 'vn_22mm_m1a2_frag_mag',
	'vn_22mm_m19_wp_mag', 'vn_22mm_m17_frag_mag',
	"vn_kbkg_mag", "vn_kbkg_t_mag",
	"vn_type64_smg_mag", "vn_type64_smg_t_mag",
	"vn_mg42_50_t_mag", "vn_mg42_50_mag",
	"vn_k98k_mag", "vn_k98k_t_mag",
	"vn_m1903_mag", "vn_m1903_t_mag",
	"vn_m36_mag", "vn_m36_t_mag",
	"vn_svd_mag", "vn_svd_t_mag",
	"vn_p38_mag", "vn_type64_mag", "vn_ppk_mag",
	"vn_m20a1b1_heat_mag", "vn_m20a1b1_wp_mag"
];
// all weapon attachments
_attachmentsAll = [
	'vn_o_anpvs2_m16','vn_bipod_m16','vn_o_3x_l1a1','vn_b_l1a1','vn_s_m45_camo','vn_s_m45','vn_o_3x_m84','vn_b_carbine','vn_b_camo_m1_garand',
	'vn_b_m1_garand','vn_b_camo_m14','vn_o_9x_m14','vn_o_anpvs2_m14','vn_b_m14','vn_s_m14','vn_bipod_m14','vn_b_camo_m14a1','vn_o_9x_m16','vn_o_4x_m16',
	'vn_o_1x_sp_m16','vn_b_m16','vn_s_m16','vn_b_m38','vn_b_m1897','vn_bipod_m1918','vn_s_m3a1','vn_o_9x_m40a1','vn_o_anpvs2_m40a1','vn_b_camo_m40a1',
	'vn_o_4x_m4956','vn_b_m4956','vn_b_camo_m9130','vn_o_3x_m9130','vn_s_mat49','vn_s_mc10','vn_s_mpu','vn_b_sks','vn_s_sten','vn_b_type56','vn_o_3x_vz54',
	'vn_b_camo_vz54',"vn_o_1_5x_k98k","vn_b_k98k", "vn_b_camo_k98k", "vn_o_m14_front", "vn_o_8x_m1903", "vn_b_m1903", "vn_b_camo_m1903",
	"vn_b_m36", "vn_b_camo_m36","vn_o_4x_svd", "vn_b_camo_svd","vn_s_ppk"
];
// all weapon attachments
_attachmentsBasic = [
	'',
	'vn_b_sks',
	'vn_b_m1897',
	'vn_b_carbine',
	'vn_b_m14',
	'vn_b_m16',
	'vn_b_m4956',
	'vn_b_m38',
	'vn_b_type56',
	'vn_b_camo_m14',
	'vn_b_camo_m40a1',
	'vn_o_3x_m84',
	'vn_o_9x_m14',
	'vn_o_anpvs2_m14',
	'vn_o_4x_m16',
	'vn_o_9x_m16',
	'vn_o_anpvs2_m16',
	'vn_o_9x_m40',
	'vn_o_anpvs2_m40a1',
	'vn_o_9x_m40a1',
	'vn_o_4x_m4956',
	'vn_o_3x_m9130',
	'vn_s_m45',
	'vn_s_m14',
	'vn_s_m16',
	'vn_s_m1895',
	'vn_s_m1911',
	'vn_s_m3a1',
	'vn_s_mat49',
	'vn_s_mc10',
	'vn_s_mk22',
	'vn_s_m10',
	'vn_s_pm',
	'vn_s_sten',
	"vn_o_1_5x_k98k",
	"vn_o_m14_front",
	
];
// thermal weapon attachments
_attachmentsThermal = [];
// special inventory items + head-mounted displays like NVG, including thermal
_assignedItemsAll = [
	'',
	'vn_b_item_compass_sog',
	'vn_b_item_compass',
	'vn_o_item_radio_m252',
	'vn_o_item_firstaidkit',
	'vn_b_item_firstaidkit',
	'itemmap',
	'minedetector',
	'vn_o_item_map',
	'vn_b_item_map',
	'vn_b_item_medikit_01',
	'vn_b_item_radio_urc10',
	'vn_b_item_toolkit',
	'vn_b_item_trapkit',
	'vn_b_item_watch',
	'vn_b_item_wiretap',
	'nvgoggles_tna_f','o_nvgoggles_ghex_f','o_nvgoggles_hex_f','o_nvgoggles_urb_f','o_nvgoggles_grn_f','nvgoggles_opfor','nvgoggles','nvgoggles_indep'
];
// same as above but with no thermal
_assignedItemsBasic = [
	'',
	'vn_b_item_compass_sog',
	'vn_b_item_compass',
	'vn_o_item_radio_m252',
	'vn_o_item_firstaidkit',
	'vn_b_item_firstaidkit',
	'itemmap',
	'minedetector',
	'vn_o_item_map',
	'vn_b_item_map',
	'vn_b_item_medikit_01',
	'vn_b_item_radio_urc10',
	'vn_b_item_toolkit',
	'vn_b_item_trapkit',
	'vn_b_item_watch',
	'vn_b_item_wiretap',
	'nvgoggles_tna_f','o_nvgoggles_ghex_f','o_nvgoggles_hex_f','o_nvgoggles_urb_f','o_nvgoggles_grn_f','nvgoggles_opfor','nvgoggles','nvgoggles_indep'
];
// uav terminal
_assignedItemsUAV = [

];
// thermal head-mounted displays
_assignedItemsThermal = [

];
// other inventory items
_inventoryAll = [
	'','vn_b_item_firstaidkit','vn_b_item_medikit_01','vn_b_item_toolkit','vn_o_item_firstaidkit',
	'vn_b_item_compass_sog',
	'vn_b_item_compass',
	'vn_o_item_radio_m252',
	'vn_o_item_firstaidkit',
	'vn_b_item_firstaidkit',
	'itemmap',
	'minedetector',
	'vn_o_item_map',
	'vn_b_item_map',
	'vn_b_item_medikit_01',
	'vn_b_item_radio_urc10',
	'vn_b_item_toolkit',
	'vn_b_item_trapkit',
	'vn_b_item_watch',
	'vn_b_item_wiretap',
	'nvgoggles_tna_f','o_nvgoggles_ghex_f','o_nvgoggles_hex_f','o_nvgoggles_urb_f','o_nvgoggles_grn_f','nvgoggles_opfor','nvgoggles','nvgoggles_indep'	
];
_o_weapons = [

];
_o_uniforms = [

];
_o_vests = [
	
];
_o_backpacks = [

];
_o_headgear = [

];
_o_magazines = [

];
_o_attachments = [

];

//=========================================== GET [BLACKLIST + WHITELIST] FOR PLAYER ROLE

// Undefined role (not used, kept here as an example/template).
if (_role isEqualTo '') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[								// ITEMS
				_uniformsAll,				// whitelisted UNIFORMS
				_vestsAll,					// whitelisted VESTS
				_inventoryAll,					// whitelisted Inventory
				_assignedItemsAll,			// whitelisted ASSIGNED ITEMS
				_headgearBasic,				// whitelisted HEADGEAR
				_gogglesAll,				// whitelisted goggles
				_attachmentsAll				// whitelisted Attachments
			],
			_magazinesAll,					// whitelisted MAGAZINES
			_backpacksAll,					// whitelisted BACKPACKS
			_weaponsAll						// whitelisted WEAPONS
		]
	]
};
// Rifleman role (Grenadier, marksman, engineer, medic, mortar gunner, etc)
if (_role isEqualTo 'rifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,			// whitelisted UNIFORMS
				_vestsAll,				// whitelisted VESTS
				_inventoryAll,			// whitelisted Inventory
				_assignedItemsAll,		// whitelisted ASSIGNED ITEMS
				_headgearBasic,			// whitelisted HEADGEAR
				_gogglesAll,			// whitelisted goggles
				_attachmentsAll			// whitelisted Attachments
			],
			_magazinesAll,				// whitelisted MAGAZINES
			_backpacksAll,				// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsMarksmanHeavy + _weaponsHandgun + _weaponsSMG + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Rifleman role (Grenadier, marksman, engineer, medic, mortar gunner, etc)
if (_role in ['engineer','medic','mortar_gunner','medic_WL']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,			// whitelisted UNIFORMS
				_vestsAll,				// whitelisted VESTS
				_inventoryAll,			// whitelisted Inventory
				_assignedItemsAll,		// whitelisted ASSIGNED ITEMS
				_headgearBasic,			// whitelisted HEADGEAR
				_gogglesAll,			// whitelisted goggles
				_attachmentsAll			// whitelisted Attachments
			],
			_magazinesAll,				// whitelisted MAGAZINES
			_backpacksAll,				// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsHandgun + _weaponsSMG + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Machine gunner, autorifleman, etc
if (_role isEqualTo 'autorifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsSW + _weaponsLMG + _weaponsHandgun + _viewersAll + _weaponsUW)	// whitelisted WEAPONS
		]
	]
};
if (_role in ['machine_gunner','machine_gunner_WL']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsMMG + _weaponsHandgun + _viewersAll + _weaponsUW)	// whitelisted WEAPONS
		]
	]
};
// AT / AA / Missile soldiers, etc
if (_role isEqualTo 'rifleman_lat') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,							// whitelisted UNIFORMS
				_vestsAll,								// whitelisted VESTS
				_inventoryAll,							// whitelisted Inventory
				_assignedItemsAll,						// whitelisted ASSIGNED ITEMS
				_headgearBasic,							// whitelisted HEADGEAR
				_gogglesAll,							// whitelisted goggles
				_attachmentsAll							// whitelisted Attachments
			],
			_magazinesAll,								// whitelisted MAGAZINES
			_backpacksAll,								// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsLauncherLAT + _weaponsHandgun + _weaponsSMG + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'rifleman_hat') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,							// whitelisted UNIFORMS
				_vestsAll,								// whitelisted VESTS
				_inventoryAll,							// whitelisted Inventory
				_assignedItemsAll,						// whitelisted ASSIGNED ITEMS
				_headgearBasic,							// whitelisted HEADGEAR
				_gogglesAll,							// whitelisted goggles
				_attachmentsAll							// whitelisted Attachments
			],
			_magazinesAll,								// whitelisted MAGAZINES
			_backpacksAll,								// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsLauncherHAT + _weaponsHandgun + _weaponsSMG + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Sniper role
if (_role in ['sniper','sniper_WL']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsSniper + _weaponsSMG + _weaponsHandgun + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'crewman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsCompact + _weaponsSMG + _weaponsHandgun + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// JTAC role
if (_role isEqualTo 'jtac') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,							// whitelisted UNIFORMS
				_vestsAll,								// whitelisted VESTS
				_inventoryAll,							// whitelisted Inventory
				_assignedItemsAll,						// whitelisted ASSIGNED ITEMS
				_headgearBasic,							// whitelisted HEADGEAR
				_gogglesAll,							// whitelisted goggles
				_attachmentsAll							// whitelisted Attachments
			],
			_magazinesAll,								// whitelisted MAGAZINES
			_backpacksRadio,							// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsHandgun + _weaponsSMG + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Pilot role
if (_role in ['pilot','pilot_plane','pilot_cas','pilot_heli','pilot_heli_WL']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsPilot,						// whitelisted UNIFORMS
				_vestsPilot,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearPilot,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsHandgun + _weaponsSMG + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Officer/Commander role
if (_role isEqualTo 'commander') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsHandgun + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Squad leader/Team leader role
if (_role in ['leader']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,						// whitelisted UNIFORMS
				_vestsAll,							// whitelisted VESTS
				_inventoryAll,						// whitelisted Inventory
				_assignedItemsAll,					// whitelisted ASSIGNED ITEMS
				_headgearBasic,						// whitelisted HEADGEAR
				_gogglesAll,						// whitelisted goggles
				_attachmentsAll						// whitelisted Attachments
			],
			_magazinesAll,							// whitelisted MAGAZINES
			_backpacksAll,							// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsHandgun + _weaponsSMG + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// UAV Operator role
if (_role isEqualTo 'uav') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items  (we dont blacklist the uav terminal for the uav operator!)
					
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			[	// blacklisted WEAPONS
			
			]
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_uniformsAll,								// whitelisted UNIFORMS
				_vestsAll,									// whitelisted VESTS
				_inventoryAll,								// whitelisted Inventory
				(_assignedItemsAll + _assignedItemsUAV),	// whitelisted ASSIGNED ITEMS
				_headgearBasic,								// whitelisted HEADGEAR
				_gogglesAll,								// whitelisted goggles
				_attachmentsAll								// whitelisted Attachments
			],
			_magazinesAll,									// whitelisted MAGAZINES
			_backpacksAll,									// whitelisted BACKPACKS
			(_weaponsBasic + _weaponsHandgun + _weaponsSMG + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'o_rifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_o_uniforms,			// whitelisted UNIFORMS
				_o_vests,				// whitelisted VESTS
				_inventoryAll,			// whitelisted Inventory
				_assignedItemsAll,		// whitelisted ASSIGNED ITEMS
				_o_headgear,			// whitelisted HEADGEAR
				_gogglesAll,			// whitelisted goggles
				_o_attachments			// whitelisted Attachments
			],
			_magazinesAll,				// whitelisted MAGAZINES
			_o_backpacks,				// whitelisted BACKPACKS
			((_o_weapons - [_weaponsSW + _weaponsLMG]) + _weaponsHandgun + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'o_autorifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				
				],
				[	// blacklisted vests
				
				],
				[	// blacklisted inventory
				
				],
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				_o_uniforms,			// whitelisted UNIFORMS
				_o_vests,				// whitelisted VESTS
				_inventoryAll,			// whitelisted Inventory
				_assignedItemsAll,		// whitelisted ASSIGNED ITEMS
				_o_headgear,			// whitelisted HEADGEAR
				_gogglesAll,			// whitelisted goggles
				_o_attachments			// whitelisted Attachments
			],
			_magazinesAll,				// whitelisted MAGAZINES
			_o_backpacks,				// whitelisted BACKPACKS
			(_o_weapons + _weaponsHandgun + _weaponsLauncherBasic + _viewersAll)	// whitelisted WEAPONS
		]
	]
};
// Default
([WEST,'rifleman'] call (missionNamespace getVariable 'QS_data_arsenal'))