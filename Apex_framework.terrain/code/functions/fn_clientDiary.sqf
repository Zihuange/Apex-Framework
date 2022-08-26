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
	['QS_diary_hotkeys','按键绑定'],
	['QS_diary_rules','规则'],
	['QS_diary_radio','无线电频道'],
	['QS_diary_roles','角色'],
	['QS_diary_mods','模组'],
	['QS_diary_teamspeak','Teamspeak'],
	['QS_diary_leaderboards','排行榜'],
	['QS_diary_gitmo','监狱'],
	['QS_diary_fobs','FOBs'],
	['QS_diary_revive','医疗系统'],
	['QS_diary_inventory','载具货箱']
];

/*/========== Create Diary Records-创建日记记录/*/

if ((missionNamespace getVariable ['QS_missionConfig_aoType','']) isEqualTo 'GRID') then {
	_description = format ['NATO在 %1 的驻军遭到了CSAT袭击，敌军认为我们的力量正在衰弱，打算乘虚而入。<br/><br/>但是很明显他们想错了！<br/><br/>我们不会放弃 %1！',worldName];
	player createDiaryRecord [
		'Diary',
		[
			(format ['%1 Campaign',worldName]),
			_description
		]
	];
};

/*/================================= RADIO CHANNELS-无线电频道/*/

player createDiaryRecord [
	'QS_diary_radio',
	[
		'General channel:常规频道',
		'通常广泛使用的语音通信常规频道。<br/><br/>严禁在此频道播放音乐或做出其他扰乱游戏秩序的行为！'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		'Platoon channels:班排组频道',
		'加入班排频道 (Alpha, Bravo or Charlie) 进行小队间通信。'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		'AO channels:战区频道',
		'如果你兼听了这些频道, 在主作战区域的2km范围内 和 次要作战区域 (支线任务)的1km范围内,你将自动添加到这些频道。 当你离开该范围时，你将离开该频道。'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		'Aircraft channel:航空频道',
		'飞行员和UAV无人机操作员使用的频道。<br/><br/>目前只有飞行员、无人机操作员和指挥官可以在此频道上发言。<br/><br/>其他单位可以在航空控制中心兼听此频道。'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		'Side channel:阵营频道',
		'阵营频道上禁用语音通信<br/><br/>使用常规频道向服务器上的所有玩家传送语音。'
	]
];
player createDiaryRecord [
	'QS_diary_radio',
	[
		'概述',
		'Beta v0.9<br/><br/>A number of custom radio channels are available for use in-game.<br/><br/>To access: Press [Home] >> [Comm-Link] >> [Radio Management]<br/><br/>A Radio inventory item is required to transmit voice communications.<br/><br/>Transmission of music or other audio is only permitted over Group, Vehicle and Direct channels (when away from base).<br/><br/>Spamming and generally annoying other players using Voice communications can lead to administrative action.'
	]
];

/*/================================= INVENTORY-库存/*/

player createDiaryRecord [
	'QS_diary_inventory',
	[
		'编辑库存',
		'你可以在基地地图的货物编辑区自定义车辆和弹药箱的库存（目前有bug）'
	]
];

/*/================================= REVIVE/*/

player createDiaryRecord [
	'QS_diary_revive',
	[
		'医疗载具',
		'将陷入昏迷的单位放入医疗载具（例如HEMTT医疗卡车、救护车、Taru医疗舱等）可以让他们恢复意识。<br/><br/>载具必须有足够的医疗票数。<br/>治疗一名玩家消耗一个医疗票数。<br/>在基地载具维护点，可以补充医疗票数。<br/>医疗票数上限等于载具的座位数量。'
	]
];

/*/================================= FOBs/*/

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'常规',
		(format ['FOB 意为前线基地，会在 %1 的主要作战区域附近设立。<br/><br/>>FOB可以提供很多帮助，但也有可能遭到敌军攻击。<br/><br/>当某些类型的载具/补给箱位于FOB的半径范围内时，它们可以启动某些服务。',worldName])
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'雷达设备',
		'当FOB处于激活状态时，可以探测敌军位置和雷达数据。<br/><br/>在FOB主建筑内有一个可交互终端用于管理FOB的功能。'
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'重生',
		'如果满足几个条件则可以在FOB内重生:<br/><br/>
		- FOB必须被激活<br/>
		- 玩家必须启用个人FOB重生。（可以在位于FOB主建筑内的FOB终端设置）<br/>
		- 玩家不是飞行员兵种<br/>
		- FOB有剩余复活票数<br/>
		- 距离上一次在FOB重生过去至少3分钟'
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'载具维护',
		'FOB可以为地面和空中载具提供维护服务:<br/><br/>
		- 重生 - 将HEMTT运输卡车或HEMTT货柜卡车开到FOB。<br/>
		- 修理 - 将HEMTT维修卡车或Huron维修货柜带到FOB。<br/>
		- 燃料 - 将HEMTT燃油补给卡车或Huron燃油货柜带到FOB。<br/>
		- 弹药 - 将HEMTT弹药卡车或Huron弹药货柜带到FOB。（同时可以激活玩家使用的军火库）<br/>
		'
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'重生票数',
		'将医疗载具带到FOB补充重生票数。'
	]
];

player createDiaryRecord [
	'QS_diary_fobs',
	[
		'军火库',
		'在基地内将装备放入车辆或弹药箱带到FOB可以增加FOB军火库的物品。'
	]
];

/*/================================= Leaderboards-排行榜/*/

player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'Gitmo',
		'Earn points by imprisoning enemies in "Gitmo".<br/><br/>Multipliers: n/a<br/><br/>Gitmo is marked on your map at base. See "Gitmo" diary tab for further details.'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'电塔游骑兵',
		'作为步兵通过摧毁无线电塔（不包括飞行员）获得分数。<br/><br/>倍数计算: n/a'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'牙医',
		'通过从死掉的敌人士兵中收集金牙获得分数。<br/><br/>倍数计算: n/a'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'Scalpers',
		'Collect the Berets (hats) of enemy Commanders.<br/><br/>Multipliers: 1 for Black beret, 3 for Red beret'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'医疗兵',
		'通过治疗昏迷的士兵获得分数。'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'运输员',
		'将士兵安全送到战区以获取分数。<br/><br/>倍数计算: n/a<br/><br/>目前不支持吊索货物运输<br/>目前不支持车辆货物运输'
	]
];
player createDiaryRecord [
	'QS_diary_leaderboards',
	[
		'General Info',
		format ['<t size="2">Version 1.0</t><br/><br/>Leaderboards are reset each Monday at 00:01h.<br/><br/>To maintain performance and FPS, the leaderboards are not synchronized frequently, and only saved to database every 5-10 minutes. For this reason, points accumulated just prior to a server crash may not be saved (*sadface*).<br/><br/>Thanks for your patience, %1!',profileName]
	]
];

/*/-------------------------------------------------- Rules-规则/*/

player createDiaryRecord [
	'QS_diary_hotkeys',
	[
		'按键绑定',
		(format ['
		<br/>客户端菜单 - [Home]
		<br/>耳塞 - [End]
		<br/>背上武器 - [4]
		<br/>重新整理弹药 - [L.Ctrl]+[%2]
		<br/>跳跃 - [%5] 在跑步的时候
		<br/>小队管理器 - [%6]
		<br/>任务 - [%3]
		<br/>提示 - [%4]
		<br/>手势 - [Ctrl]+[Numpad x]
		<br/>战术指示标 - %1
		<br/>打开和关闭门 - [Space]
		<br/>Raise and Lower sling ropes - [Page [Up/Down]]
		',(actionKeysNames 'TacticalPing'),(actionKeysNames 'ReloadMagazine'),(actionKeysNames 'Diary'),(actionKeysNames 'Help'),(actionKeysNames 'GetOver'),(actionKeysNames 'Teamswitch')])
	]
];

if ((getPlayerUID player) in (['ALL'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
	player createDiaryRecord [
		'QS_diary_hotkeys',
		[
			'管理员按键',
			'
			<br/>管理菜单打开 - [Shift]+[F2]
			<br/>管理菜单关闭 - [Shift]+[F2]
			<br/>退出选项 - [Shift]+[F2]
			'
		]
	];
	if ((getPlayerUID player) in (['CURATOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
		player createDiaryRecord [
			'QS_diary_hotkeys',
			[
				'宙斯按键',
				'
				<br/>同步可编辑对象 - [Shift]+[F3]
				<br/>(选定小组) 建筑物驻防 - [Numpad 1]
				<br/>(选定小组) 巡逻区 - [Numpad 2]
				<br/>(选定小组) 搜索建筑 - [Numpad 3]
				<br/>(选定小组) 围捕目标 - [Numpad 4]
				<br/>(选定小组) 压制射击 - [Numpad 6]
				<br/>(选定小组) 治疗玩家 - [Numpad 7]
				<br/>(选定小组) 查看方向 - [Numpad 8]
				<br/>(选定小组) 设置单位无意识 - [Numpad 9]
				'
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
		'常规',
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
		'抓捕战俘',
		'在战斗中可以逼迫敌军投降。<br/><br/>保持敌军单位和你的距离在5米以内，滚轮菜单选择 命令-俘虏 后，等待进度条完成即可抓捕战俘。将战俘送回监狱即可获得奖励！<br/><br/>祝你好运！'
	]
];

/*/-------------------------------------------------- Teamspeak/*/

player createDiaryRecord [
	'QS_diary_teamspeak',
	[
		'TS3 频道地址',
		format ['
		<br/> IP地址: %1
		<br/>
		<br/> 欢迎访客和来宾!
		',(missionNamespace getVariable ['QS_missionConfig_commTS',''])]
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