/*/
File: QS_data_fortifiedAA.sqf
Author:

	Quiksilver
	
Last modified:

	6/03/2018 A3 1.80 by Quiksilver
	
Description:

	Fortified AA Data
__________________________________________________________________________/*/

if (worldName in ['Tanoa','Lingor3','Enoch']) exitWith {
	if ((random 1) > 0.333) then [
		{
			[
				["o_apc_tracked_02_aa_f",[-5.34766,0.143311,0.016685],270.378,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
				["Land_BagFence_01_long_green_F",[4.104,0.0585938,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[0.0810547,-4.68604,1.9154],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.0498,2.4082,2.01259],269.377,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[0.28125,4.70337,1.96381],0.0261029,[],FALSE,FALSE,TRUE,{}],  
				["Land_BagFence_01_long_green_F",[4.13721,-2.48828,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-2.49365,-4.34351,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[4.24023,-2.72827,0],90.1508,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-2.3042,4.68652,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-2.81201,-4.47412,1.85721],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-2.59473,4.71655,1.84145],0.0261029,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[4.29883,3.45776,0],90.1508,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.18018,-5.10205,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.03125,5.3186,2.01259],269.874,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-5.58252,-4.48584,1.9154],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-5.54932,4.72998,1.96381],0.0261029,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-6.74072,-4.37427,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-6.59717,4.69678,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-8.31738,4.70923,1.96381],179.601,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-8.48779,-4.46411,1.9154],178.714,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.85986,0.136719,2.05747],92.9792,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-9.89404,0.758057,0],90.7865,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.70703,3.06982,2.09318],92.9792,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.8457,-2.80469,1.92252],268.615,[],FALSE,FALSE,TRUE,{}]
			]
		},
		{
			[
				["o_apc_tracked_02_aa_f",[2.54688,-0.0488281,-0.0447016],270.525,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
				["Land_HBarrier_01_line_3_green_F",[-4.61914,0.139893,1.17173],268.138,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[-1.78027,-4.44263,1.68432],219.983,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-5.24414,0.261719,0],0.579887,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-3.98438,-3.93115,0.177021],138.395,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-2.87744,5.13672,0.167141],221.716,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[-3.28613,5.17041,1.6311],310.772,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[2.79346,-6.04395,1.66587],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[0.815918,-6.93335,0],91.1816,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[0.82959,7.38428,1.85543],352.72,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[1.95459,7.56567,0.00454473],88.8767,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[5.81592,6.39014,1.82709],24.0442,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[7.45996,-4.86206,1.67862],151.957,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[7.51758,-5.62183,0],61.7147,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[9.45605,4.57324,0],313.125,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[9.9917,3.24292,1.78129],49.3943,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[10.9458,-1.0271,1.64725],102.284,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[11.7227,-0.575928,0.112813],2.39138,[],FALSE,FALSE,TRUE,{}]
			]
		}
	];
};
if ((random 1) > 0.333) then [
	{
		[
			["SPE_M45_Quadmount",[-0.813171,-0.171326,-0.00635338],270.153,[],false,false,false,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
			["Land_SPE_Dugout_6m45_sandbags",[2.93219,-4.90393,0.875],120.357,[],false,false,true,{}], 
			["Land_SPE_Dugout_6m45_sandbags",[1.26355,5.76147,0.875],13.9846,[],false,false,true,{}], 
			["Land_SPE_Dugout_3m_sandbags",[6.26758,2.94348,0.875],327.831,[],false,false,true,{}], 
			["Land_SPE_Dugout_6m45_sandbags",[-4.89911,5.05017,0.875],304.472,[],false,false,true,{}], 
			["Land_SPE_Dugout_6m45_sandbags",[-3.49176,-6.26154,0.875],182.727,[],false,false,true,{}], 
			["Land_SPE_Dugout_3m_sandbags",[7.04456,-2.57452,0.875],212.454,[],false,false,true,{}], 
			["Land_SPE_Dugout_6m45_sandbags",[-7.56006,-1.29279,0.875],245.724,[],false,false,true,{}], 
			["Land_SPE_Dugout_6m315_sandbags",[9.51355,0.761475,0.875],108.041,[],false,false,true,{}]
		]	
	},
	{
		[
			["SPE_M45_Quadmount",[-0.481445,-1.01831,-0.0063529],271.017,[],false,false,false,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
			["Land_SPE_Sandbag_Long_Thick",[3.25293,4.48975,2.25],123.508,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[-1.37207,5.98975,2.25],90,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[6.37793,1.11475,2.125],330.771,[],false,false,true,{}], 
			["Land_Rampart_F",[5.47559,3.4873,0],313.125,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[3.12793,-5.76025,2],61.266,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[-5.16138,4.20129,2.19588],45.682,[],false,false,true,{}], 
			["Land_Rampart_F",[-2.02588,6.47974,0],88.8767,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[-1.12207,-6.76025,2],277.276,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[6.37793,-2.88525,2],216.429,[],false,false,true,{}], 
			["Land_Rampart_F",[3.53711,-6.70776,0],61.7147,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[-5.24707,-5.51025,1.875],298.508,[],false,false,true,{}], 
			["Land_Rampart_F",[7.74219,-1.66187,0],2.39138,[],false,false,true,{}], 
			["Land_Rampart_F",[-6.85791,4.05078,0],221.716,[],false,false,true,{}], 
			["Land_Rampart_F",[-3.16455,-8.01929,0],91.1816,[],false,false,true,{}], 
			["Land_SPE_Sandbag_Long_Thick",[-8.57324,-1.4364,2.424],178.63,[],false,false,true,{}], 
			["Land_Rampart_F",[-9.22461,-0.824219,0],0.579887,[],false,false,true,{}], 
			["Land_Rampart_F",[-7.96484,-5.01709,0.181664],138.395,[],false,false,true,{}]
		]	
	}
];