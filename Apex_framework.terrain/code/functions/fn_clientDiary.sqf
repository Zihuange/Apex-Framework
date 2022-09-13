/*/
File: fn_clientDiary.sqf
Author:
	
	Quiksilver
	
Last Modified:

	26/08/2022 A3 2.10 by Quiksilver

Description:

	-
	
License Notes:

	Part of the EULA for this framework is to ensure this file executes as normal.

__________________________________________________________/*/

/*/========== Create Diary Subjects (this is the order they appear in the map tabs)-创建日记主题 (这是它们在地图标签中显示的顺序)/*/

{
	player createDiarySubject _x;
} forEach [
	['QS_diary_hotkeys',localize 'STR_QS_Diary_001'],
	['QS_diary_rules',localize 'STR_QS_Diary_002'],
	['QS_diary_radio',localize 'STR_QS_Diary_003'],
	['QS_diary_roles',localize 'STR_QS_Diary_004'],
	['QS_diary_mods',localize 'STR_QS_Diary_005'],
	['QS_diary_teamspeak',localize 'STR_QS_Diary_006'],
	['QS_diary_discord',localize 'STR_QS_Diary_007'],
	['QS_diary_leaderboards',localize 'STR_QS_Diary_008'],
	['QS_diary_gitmo',localize 'STR_QS_Diary_009'],
	['QS_diary_fobs',localize 'STR_QS_Diary_010'],
	['QS_diary_revive',localize 'STR_QS_Diary_011'],
	['QS_diary_inventory',localize 'STR_QS_Diary_012']
];

/*/========== Create Diary Records-创建日记记录/*/

if ((missionNamespace getVariable ['QS_missionConfig_aoType','']) isEqualTo 'GRID') then {
	_description = format [
		'%2<br/><br/>%3 %1.<br/><br/>%4<br/><br/>%5 %1.',
		worldName,
		localize 'STR_QS_Diary_014',
		localize 'STR_QS_Diary_015',
		localize 'STR_QS_Diary_016',
		localize 'STR_QS_Diary_017'
	];
	player createDiaryRecord [
		'Diary',
		[
			(format ['%1 %2',worldName,localize 'STR_QS_Diary_013']),
			_description
		]
	];
};

/*/================================= RADIO CHANNELS-无线电频道/*/

player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_018',
		format ['%1<br/><br/>%2<br/><br/>',localize 'STR_QS_Diary_019',localize 'STR_QS_Diary_020',localize 'STR_QS_Diary_021']
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_022',
		format ['%1<br/><br/>%2',localize 'STR_QS_Diary_023',localize 'STR_QS_Diary_024']
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_025',
		localize 'STR_QS_Diary_026'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_027',
		format ['%1<br/><br/>%2<br/><br/>%3',localize 'STR_QS_Diary_028',localize 'STR_QS_Diary_029',localize 'STR_QS_Diary_030']
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_032',
		format ['%1<br/><br/>%2',localize 'STR_QS_Diary_033',localize 'STR_QS_Diary_034']
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		localize 'STR_QS_Diary_035',
		format ['%1<br/><br/>%2<br/><br/>%3<br/><br/>%4<br/><br/>%5',localize 'STR_QS_Diary_036',localize 'STR_QS_Diary_037',localize 'STR_QS_Diary_038',localize 'STR_QS_Diary_039',localize 'STR_QS_Diary_040']
	]
];

/*/================================= INVENTORY-库存/*/

player createDiaryRecord [
	'QS_diary_inventory',
	[
		localize 'STR_QS_Diary_041',
		localize 'STR_QS_Diary_042'
	]
];

/*/================================= REVIVE/*/

player createDiaryRecord [
	'QS_diary_revive',
	[
		localize 'STR_QS_Diary_043',
		format ['%1<br/><br/>%2<br/>%3<br/>%4<br/>%5',localize 'STR_QS_Diary_044',localize 'STR_QS_Diary_045',localize 'STR_QS_Diary_046',localize 'STR_QS_Diary_047',localize 'STR_QS_Diary_048']
	]
];

/*/================================= FOBs/*/

player createDiaryRecord [
	'QS_diary_fobs',
	[
		localize 'STR_QS_Diary_049',
		(format ['%2 %1.<br/><br/>%3',worldName,localize 'STR_QS_Diary_050',localize 'STR_QS_Diary_051'])
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		localize 'STR_QS_Diary_052',
		format ['%1<br/><br/>%2<br/><br/>%3',localize 'STR_QS_Diary_053',localize 'STR_QS_Diary_054',localize 'STR_QS_Diary_055']
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		localize 'STR_QS_Diary_056',
		format ['%1<br/><br/>
		- %2<br/>
		- %3<br/>
		- %4<br/>
		- %5',localize 'STR_QS_Diary_057',localize 'STR_QS_Diary_058',localize 'STR_QS_Diary_059',localize 'STR_QS_Diary_060',localize 'STR_QS_Diary_061']
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		localize 'STR_QS_Diary_062',
		format ['%1<br/><br/>
		%2<br/>
		%3<br/>
		%4<br/>
		%5<br/>
		',localize 'STR_QS_Diary_063',localize 'STR_QS_Diary_064',localize 'STR_QS_Diary_065',localize 'STR_QS_Diary_066',localize 'STR_QS_Diary_067']
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		localize 'STR_QS_Diary_068',
		localize 'STR_QS_Diary_069'
	]
];

/*/================================= Leaderboards-排行榜/*/

player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_074',
		format ['%1<br/><br/>%2<br/><br/>%3',localize 'STR_QS_Diary_070',localize 'STR_QS_Diary_071',localize 'STR_QS_Diary_072']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_073',
		format ['%1<br/><br/>%2<br/><br/>%3',localize 'STR_QS_Diary_075',localize 'STR_QS_Diary_076',localize 'STR_QS_Diary_077']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_078',
		format ['%1<br/><br/>%2<br/><br/>Gitmo is marked on your map at base.',localize 'STR_QS_Diary_079',localize 'STR_QS_Diary_080',localize 'STR_QS_Diary_081']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_082',
		format ['%1<br/><br/>%2',localize 'STR_QS_Diary_083',localize 'STR_QS_Diary_080']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_084',
		format ['%1<br/><br/>%2',localize 'STR_QS_Diary_085',localize 'STR_QS_Diary_080']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_086',
		format ['%1<br/><br/>%2',localize 'STR_QS_Diary_087',localize 'STR_QS_Diary_088']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_089',
		format ['%1<br/><br/>%2<br/><br/>%3',localize 'STR_QS_Diary_090',localize 'STR_QS_Diary_091',localize 'STR_QS_Diary_092']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_093',
		format ['%1<br/><br/>%2<br/><br/>%3<br/><br/>%4<br/>%5',localize 'STR_QS_Diary_094',localize 'STR_QS_Diary_095',localize 'STR_QS_Diary_096',localize 'STR_QS_Diary_097',localize 'STR_QS_Diary_098']
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		localize 'STR_QS_Diary_035',
		format [
			'<t size="2">%2</t><br/><br/>%3<br/><br/>%4<br/><br/>%5, %1!',
			profileName,
			localize 'STR_QS_Diary_099',
			localize 'STR_QS_Diary_100',
			localize 'STR_QS_Diary_101',
			localize 'STR_QS_Diary_102'
		]
	]
];

/*/-------------------------------------------------- Rules-规则/*/

player createDiaryRecord [
	'QS_diary_hotkeys',
	[
		localize 'STR_QS_Diary_103',
		(format ['
		<br/>%7 - [Home]
		<br/>%8 - [End]
		<br/>%9 - [4]
		<br/>%10 - [L.Ctrl]+[%2]
		<br/>%11 - [%5] %12
		<br/>%13 - [%6]
		<br/>%14 - [%3]
		<br/>%15 - [%4]
		<br/>%16 - [Ctrl]+[Numpad x]
		<br/>%17 - %1
		<br/>%18 - [Page [Up/Down]]
		',
			(actionKeysNames 'TacticalPing'),
			(actionKeysNames 'ReloadMagazine'),
			(actionKeysNames 'Diary'),
			(actionKeysNames 'Help'),
			(actionKeysNames 'GetOver'),
			(actionKeysNames 'Teamswitch'),
			localize 'STR_QS_Diary_104',
			localize 'STR_QS_Diary_105',
			localize 'STR_QS_Diary_106',
			localize 'STR_QS_Diary_107',
			localize 'STR_QS_Diary_108',
			localize 'STR_QS_Diary_109',
			localize 'STR_QS_Diary_110',
			localize 'STR_QS_Diary_111',
			localize 'STR_QS_Diary_112',
			localize 'STR_QS_Diary_113',
			localize 'STR_QS_Diary_114',
			localize 'STR_QS_Diary_115'
		])
	]
];

if ((getPlayerUID player) in (['ALL'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
	player createDiaryRecord [
		'QS_diary_hotkeys',
		[
			localize 'STR_QS_Diary_116',
			format ['
			<br/>%1 - [Shift]+[F2]
			<br/>%2 - [Shift]+[F2]
			',localize 'STR_QS_Diary_117',localize 'STR_QS_Diary_118']
		]
	];
	if ((getPlayerUID player) in (['CURATOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
		player createDiaryRecord [
			'QS_diary_hotkeys',
			[
				localize 'STR_QS_Diary_119',
				format ['
				<br/>%1 - [Shift]+[F3]
				<br/>%2 - [Numpad 1]
				<br/>%3 - [Numpad 2]
				<br/>%4 - [Numpad 3]
				<br/>%5 - [Numpad 4]
				<br/>%6 - [Numpad 6]
				<br/>%7 - [Numpad 7]
				<br/>%8 - [Numpad 8]
				<br/>%9 - [Numpad 9]
				',
				localize 'STR_QS_Diary_120',
				localize 'STR_QS_Diary_121',
				localize 'STR_QS_Diary_122',
				localize 'STR_QS_Diary_123',
				localize 'STR_QS_Diary_124',
				localize 'STR_QS_Diary_125',
				localize 'STR_QS_Diary_126',
				localize 'STR_QS_Diary_127',
				localize 'STR_QS_Diary_128'
				]
			]
		];
	};
};


player createDiaryRecord [
	'QS_diary_rules',
	[
		'服务器规定',
		'
		<br />服务器规定是为了给广大玩家群体创造更好的游戏环境，请务必遵守！
		<br />
		<br />1.禁止使用作弊程序或限制外的模组进行游戏。
		<br />
		<br />2.禁止在服务器内发表种族歧视、政治敏感话题，同时严禁互相辱骂，被发现将会被封禁。
		<br />
		<br />3.禁止使用步枪兵以外的兵种挂机
		<br />
		<br />4.不建议单人驾驶重型武装载具(如坦克，轮式突击炮，步兵战车）。
		<br /> 		AI车组成员只仅允许用于坦克，轮式突击炮，步兵战车三种车辆，禁止放AI到乘客位。
		<br />		防空载具禁止用于对地打击。
		<br />		地面载具完成前期的压制后请主动进攻，禁止长时间蹲山头。
		<br />
		<br />5.飞行员禁止参与地面战斗，飞机坠毁后如果无法及时得到救援请重生回基地。
		<br />		武装直升机(AH-99)和武装鱼鹰(V-44X武装版)禁止单人驾驶。
		<br />		在基地内多次发生飞行事故会受到相应惩罚，本服并非用于练习飞行技术。
		<br />		请与其他飞行员及友方地面单位保持良好沟通，防止友军误击。
		<br />		除了地面请求，不要随意飞越4种支线附近（营救POW，武器箱，获取车辆情报，获取军官情报）。
		<br />
		<br />6.禁止用任何方式刷FOB重生票数。
		<br />
		<br />7.服务器管理员对规则拥有最终解释权，有违反所有上述规定的都将受到严厉惩罚。
		<br />
		<br />8.其它问题欢迎进群咨询：813940305
		'
	]
];

player createDiaryRecord [
	'QS_diary_rules',
	[
		localize 'STR_QS_Diary_129',
		(missionNamespace getVariable ['QS_missionConfig_splash_serverRules',''])
	]
];

player createDiaryRecord [
	'QS_diary_rules',
	[
		'飞行准则',
		"
		<br /> 飞行员是一个更加特殊的兵种，承担了运输或火力支援职能，所以有额外的规定要求。
		<br />
		<br />1.请保证您能够通过语音和其他玩家进行沟通，最好可以登录Teamspeak3频道进行交流
		<br />
		<br />2.禁止参与地面战斗！地面作战职能由其他单位承担，请不要浪费飞行员位置
		<br />	
		<br />3.请对自己的飞行水平有一个合理的评估，选择合适的降落地点，不要多次带着友军单位一起阵亡。
		"
	]
];
/*/ Enable or change this if you like
player createDiaryRecord [
	'QS_diary_rules',
	[
		'空中支援准则',
		"
		<br/>0. CAS must be called in by ground elements (infantry who are near the target).
		<br/><br/>1. CAS call-ins must be typed into Side Channel with a specific position or target, no exceptions.
		<br/><br/>2. CAS may freely engage these targets without ground coordination: Fixed-wing Aircraft.
		<br/><br/>3. Do not engage any objectives and/or enemies without being called in on that specific target (See rule 1).
		<br/><br/>4. Do not ram targets and/or objectives.
		<br/><br/>5. Do not fly near (1km) marked objectives unless necessary to complete a mission.
		<br/><br/>6. Must be on Teamspeak, in Pilot channel and communicable.
		<br/><br/><br/>Failure to comply may result in administrative action without warning, up to and including permanent removal from CAS whitelist.
		"
	]
];
/*/
player createDiaryRecord [
	'QS_diary_rules',
	[
		'通讯准则',
		'
		<br />1.长时间占用频道或在频道内播放音乐将会被警告甚至踢出
		<br />
		<br />2.请注意调试自己的麦克风保证通讯质量
		<br />
		<br />3.禁止在语音频道内辱骂他人，违反规定将被封禁处理
		'
	]
];

/*/-------------------------------------------------- Mods/*/


player createDiaryRecord [
	'QS_diary_mods',
	[
	'模组列表',
	'
	<br /> 目前可用的模组:<br /><br />

	<br/>-A3 Thermal Improvement    A3 热成像增强
	<br/>-Achilles    宙斯增强模组
	<br/>-Alternative Running    
	<br/>-Atlas Hitmarkers    Atlas的命中提示
	<br/>-Blastcore Edited    爆炸效果模组
	<br/>-CBA A3    基础功能模组
	<br/>-Enhanced Movement    高级动作模组
	<br/>-JSRS SOUNDMOD    音效模组
	<br/>-JSRS SOUNDMOD - Reloading Sounds    更换弹药音效模组
	<br/>-Mf Heal Abort    终止治疗动作
	<br/>-NOD Colorize    自定义夜视仪颜色(和白磷管选一个挂载)
	<br/>-White_Phosphor_No_ACE    白磷管夜视仪(和自定义夜视仪颜色选一个挂载)
	<br/>-Zeus Enhanced    宙斯增强模组
	<br/>-Zombies and Demons    丧尸模组
	<br/>-Fire Suppression Effect    火力压制效果模组(是你被压制)
	'
	]
];


player createDiaryRecord [
	'QS_diary_gitmo',
	[
		localize 'STR_QS_Diary_130',
		format [
			'%1<br/><br/>%2<br/><br/>%3',
			localize 'STR_QS_Diary_131',
			localize 'STR_QS_Diary_132',
			localize 'STR_QS_Diary_133'
		]
	]
];

/*/-------------------------------------------------- Teamspeak/*/

player createDiaryRecord [
	'QS_diary_teamspeak',
	[
		localize 'STR_QS_Diary_134',
		format ['
		<br/> %2 %1<br/><br/> %3
		',(missionNamespace getVariable ['QS_missionConfig_commTS','']),localize 'STR_QS_Diary_135',localize 'STR_QS_Diary_136']
	]
];

/*/-------------------------------------------------- Credits-积分/*/
player createDiarySubject ['QS_diary_credits','关于我们'];				// EULA relevant line.

////////////////////////////////// EDIT BELOW ///////////////////////////////////////

player createDiaryRecord [
	'QS_diary_credits',
	[
		'服务器简介',
		'本服务器的老玩家组织成立于2019年初，由一群志同道合的人在公共服务器上成立了自发团体Arma3旅游团。<br/>三年来经历各类风雨，最终决定自建服务器与其它玩家同乐。我们的核心理念是在严肃和娱乐中找到平衡点，<br/>让玩家能够体会到Arma这款游戏中别的作品不具备的魅力；珍惜在这个游戏中和他人结成的缘分，以享受过程大于结果的心态来游戏。 <br/>如果多年以后，你还能因为我们的组织，记得曾经有一群不错的玩友和你一起玩过一款了不起的游戏，那将是我们最大的荣幸。'
	]
];

////////////////////////////////// EDIT ABOVE ///////////////////////////////////////

////////////////////////////////// DO NOT EDIT BELOW ///////////////////////////////////////
/*/ 
Please do not tamper with the below lines.
Part of license for use of this framework is to maintain accessibility for players to donate to the Apex Framework developer.
Servers which have made it difficult or impossible for players to access this link are in violation of the EULA.
/*/
player createDiaryRecord [
	'QS_diary_credits',
	[
		"开发人员",
		"<br/><br/><font size='20'>Quiksilver</font><br/><br/>这个框架是几年来 (2013-2022),在 notepad++ 中进行数千小时奋斗的成果。 我们真诚地希望玩家们可以享受这一游戏模式！<br/><br/>If you would like to show your appreciation but do not know how, you can<br/><br/><executeClose expression=""createDialog 'QS_RD_client_dialog_menu_hub';"">Donate to Quiksilver (Patreon)</executeClose><br/><br/>Stay safe out there, soldier!"
	]
];