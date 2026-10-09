/* ============================================================
 * ACE3 Advanced Medical Configuration - Treatment
 * Apex Framework ACE3 适配分支 (branch: ace)
 * ============================================================
 * 部署位置: Arma 3 根目录/userconfig/ace/ACE_Medical_Treatment.hpp
 * 格式说明: CBA Settings 服务器强制语句 (force 前缀)
 * 版本参考: ACE3 master (A3 2.20 / CBA 3.18+)
 * 设置项均取自 ACE3 源码 addons/medical_treatment/initSettings.inc.sqf
 * ============================================================ */

/* --- 医疗等级门槛 --- */
force ace_medical_treatment_medicSetting = 1;              // 1 = 医疗兵可进行高级治疗 (0=任何人 2=仅医生)
force ace_medical_treatment_requireItemsForMedicSetting = 0; // 医疗兵治疗是否强制消耗物品 (0=否 1=是 2=仅医疗兵)

/* --- 诊断 --- */
force ace_medical_treatment_advancedDiagnose = 2;          // 2 = 高级诊断(含心脏骤停诊断)
force ace_medical_treatment_numericalPulse = 1;            // 数值脉搏显示 (0=任何人 1=医疗兵 2=医生)

/* --- 用药与绷带 --- */
force ace_medical_treatment_advancedMedication = true;     // 高级用药(副作用/过量/药物相互作用)
force ace_medical_treatment_advancedBandages = 2;          // 2 = 高级绷带,伤口可重新出血需缝合
force ace_medical_treatment_bandageRollover = true;        // 绷带覆盖(无效包扎自动失效)
force ace_medical_treatment_bandageEffectiveness = 1;      // 绷带效果倍率
force ace_medical_treatment_woundReopenChance = 1;         // 伤口重新出血概率倍率
force ace_medical_treatment_clearTrauma = 1;               // 1 = 缝合后清除创伤 (0=从不 2=包扎后清除)

/* --- 自我治疗 --- */
force ace_medical_treatment_allowSelfIV = 1;               // 医疗兵可自我静脉输液
force ace_medical_treatment_allowSelfPAK = 1;              // 医疗兵可自我使用 PAK
force ace_medical_treatment_allowSelfStitch = 1;           // 医疗兵可自我缝合
force ace_medical_treatment_allowSelfTourniquet = 1;       // 医疗兵可自我使用止血带
//force ace_medical_treatment_allowSelfBandage = 1;        // 自我包扎(部分版本存在, 如当前版本无此设置将被 CBA 静默忽略)

/* --- 医疗兵专用权限 --- */
force ace_medical_treatment_medicEpinephrine = 1;          // 医疗兵可用肾上腺素
force ace_medical_treatment_medicIV = 1;                   // 医疗兵可用静脉输液
force ace_medical_treatment_medicPAK = 1;                  // 医疗兵可用 PAK
force ace_medical_treatment_medicSurgicalKit = 1;          // 医疗兵可用缝合包
force ace_medical_treatment_consumeSurgicalKit = 0;        // 缝合包是否消耗 (0=不消耗 1=消耗)

/* --- 治疗位置限制 --- */
force ace_medical_treatment_locationsBoostTraining = false; // 位置提升训练(未使用)
force ace_medical_treatment_locationEpinephrine = 0;       // 0=任意位置 (1=载具 2=医疗设施 3=两者 4=禁用)
force ace_medical_treatment_locationIV = 0;                // 同上(IV)
force ace_medical_treatment_locationPAK = 3;               // PAK 仅限载具+医疗设施
force ace_medical_treatment_locationSurgicalKit = 0;       // 缝合任意位置

/* --- 治疗时间(秒) --- */
force ace_medical_treatment_treatmentTimeAutoinjector = 5;         // 自动注射器治疗时间
force ace_medical_treatment_treatmentTimeTrainedAutoinjector = 5;   // 训练者(医疗兵)自动注射器时间
force ace_medical_treatment_treatmentTimeTourniquet = 7;            // 止血带时间
//force ace_medical_treatment_treatmentTimeTrainedTourniquet = 7;    // 训练者止血带时间(部分版本存在, 如无此设置将被 CBA 静默忽略)
force ace_medical_treatment_treatmentTimeIV = 12;                   // IV 时间
force ace_medical_treatment_treatmentTimeTrainedIV = 12;            // 训练者 IV 时间
force ace_medical_treatment_treatmentTimePAK = 15;                  // PAK 时间
force ace_medical_treatment_treatmentTimeTrainedPAK = 15;           // 训练者 PAK 时间
force ace_medical_treatment_treatmentTimeSurgicalKit = 30;          // 缝合时间
force ace_medical_treatment_treatmentTimeTrainedSurgicalKit = 30;   // 训练者缝合时间
force ace_medical_treatment_treatmentTimeCPR = 15;                  // 心肺复苏时间
force ace_medical_treatment_treatmentTimeCoeffZeus = 1;             // Zeus 治疗时间系数

/* --- 心肺复苏(CPR) --- */
force ace_medical_treatment_cprSuccessChanceMin = 0.4;     // CPR 成功率下限
force ace_medical_treatment_cprSuccessChanceMax = 0.4;     // CPR 成功率上限

/* --- 装备共享与物品转换 --- */
force ace_medical_treatment_allowSharedEquipment = 0;      // 0 = 优先患者装备 (1=优先医疗兵)
force ace_medical_treatment_convertItems = 0;              // 原版医疗物品转换为 ACE 物品 (0=启用 1=仅移除 2=禁用)

/* --- 尸体处理 --- */
force ace_medical_treatment_allowBodyBagUnconscious = false; // 昏迷单位可否装入尸袋
force ace_medical_treatment_allowGraveDigging = 1;         // 1 = 仅死者可挖墓 (0=禁用 2=均可)
force ace_medical_treatment_graveDiggingMarker = true;     // 墓地标记

/* --- 治疗行为 --- */
force ace_medical_treatment_holsterRequired = 0;           // 治疗是否需要收枪 (0=禁用 1=放低 2=放低+检查 3=收枪 4=收枪+检查)

/* --- 医疗垃圾 --- */
force ace_medical_treatment_allowLitterCreation = true;    // 允许产生医疗垃圾
force ace_medical_treatment_maxLitterObjects = 500;        // 最大垃圾对象数
force ace_medical_treatment_litterCleanupDelay = 600;      // 垃圾清理延迟(秒, -1=不清理)
