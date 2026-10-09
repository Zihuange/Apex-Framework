/* ============================================================
 * ACE3 Advanced Medical Configuration - Core
 * Apex Framework ACE3 适配分支 (branch: ace)
 * ============================================================
 * 部署位置: Arma 3 根目录/userconfig/ace/ACE_Medical.hpp
 * 格式说明: CBA Settings 服务器强制语句 (force 前缀)
 * 版本参考: ACE3 master (A3 2.20 / CBA 3.18+)
 * 设置项均取自 ACE3 源码 addons/*/initSettings.inc.sqf
 * ============================================================ */

/* --- 伤害系统 (ace_medical_damage) --- */
force ace_medical_alternateArmorPenetration = true;       // 交替护甲穿透计算
force ace_medical_fatalDamageSource = 1;                  // 1 = 创伤总和致死 (0=仅要害命中 2=两者皆可)
force ace_medical_playerDamageThreshold = 3.5;            // 玩家伤害阈值(累积创伤前可承受)
force ace_medical_AIDamageThreshold = 1.0;                // AI 伤害阈值
force ace_medical_useLimbDamage = 0;                      // 肢体伤害不计入创伤总和 (0=从不 1=仅AI 2=玩家+AI)
force ace_medical_limbDamageThreshold = 5;                // 肢体伤害阈值
force ace_medical_painUnconsciousChance = 0.1;            // 疼痛导致昏迷概率
force ace_medical_painUnconsciousThreshold = 0.5;         // 疼痛昏迷阈值
force ace_medical_deathChance = 1;                        // 死亡概率倍率

/* --- 生命体征 (ace_medical_status) --- */
force ace_medical_bleedingCoefficient = 0.25;             // 失血系数 (0.25 为"Basic"预设推荐值)
force ace_medical_painCoefficient = 1;                    // 疼痛系数
force ace_medical_ivFlowRate = 1;                         // 静脉输液速率系数
force ace_medical_dropWeaponUnconsciousChance = 0;        // 昏迷时武器掉落概率
force ace_medical_windowOnWakeUp = 1;                     // 苏醒时界面提示 (0=无 1=聚焦 2=闪烁)

/* --- 骨折/跛行/自动苏醒 (ace_medical) --- */
force ace_medical_limping = 1;                            // 1 = 开放伤口跛行 (0=禁用 2=包扎后仍跛行)
force ace_medical_fractures = 1;                          // 1 = 夹板完全治愈骨折 (2=不可冲刺 3=不可慢跑)
force ace_medical_fractureChance = 0.8;                   // 骨折概率
force ace_medical_spontaneousWakeUpChance = 0.05;         // 稳定生命体征后每15秒自动苏醒概率
force ace_medical_spontaneousWakeUpEpinephrineBoost = 1.5; // 肾上腺素提升苏醒检查次数

/* --- 载具事故 (ace_medical_engine) --- */
force ace_medical_enableVehicleCrashes = true;            // 载具碰撞可致伤

/* --- 医疗状态机 (ace_medical_statemachine) --- */
force ace_medical_statemachine_fatalInjuriesPlayer = 1;   // 1 = 仅在心脏骤停时致命伤致死
force ace_medical_statemachine_fatalInjuriesAI = 1;       // 同上(AI)
force ace_medical_statemachine_AIUnconsciousness = true;  // AI 可进入昏迷
force ace_medical_statemachine_cardiacArrestTime = 600;   // 心脏骤停至死亡时间(秒, 对应原 ReviveBleedOutDelay)
force ace_medical_statemachine_cardiacArrestBleedoutEnabled = true; // 骤停期间继续失血

/* --- 血氧模拟 (ace_medical_vitals) --- */
force ace_medical_vitals_simulateSpO2 = true;             // 模拟血氧饱和度

/* --- 医疗反馈 (ace_medical_feedback) --- */
force ace_medical_feedback_painEffectType = 0;            // 0=白色闪烁 1=脉动模糊 2=色差 3=仅基础
force ace_medical_feedback_bloodVolumeEffectType = 0;     // 0=颜色校正 1=图标 2=两者
force ace_medical_feedback_enableHUDIndicators = true;    // HUD 医疗指示器

/* --- 血迹系统 (ace_medical_blood) --- */
force ace_medical_blood_enabledFor = 2;                   // 2 = 玩家+AI (0=禁用 1=仅玩家)
force ace_medical_blood_maxBloodObjects = 500;            // 最大血迹对象数
force ace_medical_blood_bloodLifetime = 900;              // 血迹存留时间(秒)

/* --- AI 医疗行为 (ace_medical_ai) --- */
force ace_medical_ai_enabledFor = 2;                      // 2 = 服务器+HC 均启用 AI 医疗
force ace_medical_ai_requireItems = 0;                    // AI 医疗兵治疗不强制消耗物品
