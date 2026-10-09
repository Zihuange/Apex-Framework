// ============================================================
// CBA Settings - server-forced settings file
// Apex Framework × ACE3 Medical (branch: ace)
// ============================================================
// 放置位置: Arma 3 根目录/userconfig/cba_settings.sqf
// CBA 官方读取位置（RPT 确认: [CBA] Userconfig: File [userconfig\cba_settings.sqf]）
// 内容: 合并自 @Apex_cfg/userconfig/ace/*.hpp 的全部 force 语句
// 作用: 无需 ACE 可选服务器组件，CBA 直接读取此文件应用服务器强制医疗参数
// ============================================================

/* --- 伤害系统 (ace_medical_damage) --- */
force ace_medical_alternateArmorPenetration = true;
force ace_medical_fatalDamageSource = 1;
force ace_medical_playerDamageThreshold = 3.5;
force ace_medical_AIDamageThreshold = 1.0;
force ace_medical_useLimbDamage = 0;
force ace_medical_limbDamageThreshold = 5;
force ace_medical_painUnconsciousChance = 0.1;
force ace_medical_painUnconsciousThreshold = 0.5;
force ace_medical_deathChance = 1;

/* --- 生命体征 (ace_medical_status) --- */
force ace_medical_bleedingCoefficient = 0.25;
force ace_medical_painCoefficient = 1;
force ace_medical_ivFlowRate = 1;
force ace_medical_dropWeaponUnconsciousChance = 0;
force ace_medical_windowOnWakeUp = 1;

/* --- 骨折/跛行/自动苏醒 (ace_medical) --- */
force ace_medical_limping = 1;
force ace_medical_fractures = 1;
force ace_medical_fractureChance = 0.8;
force ace_medical_spontaneousWakeUpChance = 0.05;
force ace_medical_spontaneousWakeUpEpinephrineBoost = 1.5;

/* --- 载具事故 (ace_medical_engine) --- */
force ace_medical_enableVehicleCrashes = true;

/* --- 医疗状态机 (ace_medical_statemachine) --- */
force ace_medical_statemachine_fatalInjuriesPlayer = 1;
force ace_medical_statemachine_fatalInjuriesAI = 1;
force ace_medical_statemachine_AIUnconsciousness = true;
force ace_medical_statemachine_cardiacArrestTime = 600;
force ace_medical_statemachine_cardiacArrestBleedoutEnabled = true;

/* --- 血氧模拟 (ace_medical_vitals) --- */
force ace_medical_vitals_simulateSpO2 = true;

/* --- 医疗反馈 (ace_medical_feedback) --- */
force ace_medical_feedback_painEffectType = 0;
force ace_medical_feedback_bloodVolumeEffectType = 0;
force ace_medical_feedback_enableHUDIndicators = true;

/* --- 血迹系统 (ace_medical_blood) --- */
force ace_medical_blood_enabledFor = 2;
force ace_medical_blood_maxBloodObjects = 500;
force ace_medical_blood_bloodLifetime = 900;

/* --- AI 医疗行为 (ace_medical_ai) --- */
force ace_medical_ai_enabledFor = 2;
force ace_medical_ai_requireItems = 0;

/* --- 医疗等级门槛 (ace_medical_treatment) --- */
force ace_medical_treatment_medicSetting = 1;
force ace_medical_treatment_requireItemsForMedicSetting = 0;

/* --- 诊断/用药/绷带 --- */
force ace_medical_treatment_advancedDiagnose = 2;
force ace_medical_treatment_numericalPulse = 1;
force ace_medical_treatment_advancedMedication = true;
force ace_medical_treatment_advancedBandages = 2;
force ace_medical_treatment_bandageRollover = true;
force ace_medical_treatment_bandageEffectiveness = 1;
force ace_medical_treatment_woundReopenChance = 1;
force ace_medical_treatment_clearTrauma = 1;

/* --- 自我治疗 --- */
force ace_medical_treatment_allowSelfIV = 1;
force ace_medical_treatment_allowSelfPAK = 1;
force ace_medical_treatment_allowSelfStitch = 1;
force ace_medical_treatment_allowSelfTourniquet = 1;

/* --- 医疗兵专用权限 --- */
force ace_medical_treatment_medicEpinephrine = 1;
force ace_medical_treatment_medicIV = 1;
force ace_medical_treatment_medicPAK = 1;
force ace_medical_treatment_medicSurgicalKit = 1;
force ace_medical_treatment_consumeSurgicalKit = 0;

/* --- 治疗位置限制 --- */
force ace_medical_treatment_locationsBoostTraining = false;
force ace_medical_treatment_locationEpinephrine = 0;
force ace_medical_treatment_locationIV = 0;
force ace_medical_treatment_locationPAK = 3;
force ace_medical_treatment_locationSurgicalKit = 0;

/* --- 治疗时间(秒) --- */
force ace_medical_treatment_treatmentTimeAutoinjector = 5;
force ace_medical_treatment_treatmentTimeTrainedAutoinjector = 5;
force ace_medical_treatment_treatmentTimeTourniquet = 7;
force ace_medical_treatment_treatmentTimeIV = 12;
force ace_medical_treatment_treatmentTimeTrainedIV = 12;
force ace_medical_treatment_treatmentTimePAK = 15;
force ace_medical_treatment_treatmentTimeTrainedPAK = 15;
force ace_medical_treatment_treatmentTimeSurgicalKit = 30;
force ace_medical_treatment_treatmentTimeTrainedSurgicalKit = 30;
force ace_medical_treatment_treatmentTimeCPR = 15;
force ace_medical_treatment_treatmentTimeCoeffZeus = 1;

/* --- 心肺复苏(CPR) --- */
force ace_medical_treatment_cprSuccessChanceMin = 0.4;
force ace_medical_treatment_cprSuccessChanceMax = 0.4;

/* --- 装备共享/物品转换/尸体处理/垃圾 --- */
force ace_medical_treatment_allowSharedEquipment = 0;
force ace_medical_treatment_convertItems = 0;
force ace_medical_treatment_allowBodyBagUnconscious = false;
force ace_medical_treatment_allowGraveDigging = 1;
force ace_medical_treatment_graveDiggingMarker = true;
force ace_medical_treatment_holsterRequired = 0;
force ace_medical_treatment_allowLitterCreation = true;
force ace_medical_treatment_maxLitterObjects = 500;
force ace_medical_treatment_litterCleanupDelay = 600;

/* --- 医疗界面 (ace_medical_gui) --- */
force ace_medical_gui_enableActions = 0;
force ace_medical_gui_enableSelfActions = true;
force ace_medical_gui_enableMedicalMenu = 1;
force ace_medical_gui_openAfterTreatment = true;
force ace_medical_gui_maxDistance = 3;
force ace_medical_gui_interactionMenuShowTriage = 1;
force ace_medical_gui_showDamageEntry = false;
force ace_medical_gui_showBloodlossEntry = true;
force ace_medical_gui_showBleeding = 2;
force ace_medical_gui_peekMedicalInfoReleaseDelay = 1;
force ace_medical_gui_peekMedicalOnHit = false;
force ace_medical_gui_peekMedicalOnHitDuration = 1;
force ace_medical_gui_tourniquetWarning = false;
force ace_medical_gui_medicalHintEnabled = 1;
