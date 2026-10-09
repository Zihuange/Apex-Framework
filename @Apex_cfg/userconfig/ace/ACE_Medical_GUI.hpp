/* ============================================================
 * ACE3 Advanced Medical Configuration - GUI
 * Apex Framework ACE3 适配分支 (branch: ace)
 * ============================================================
 * 部署位置: Arma 3 根目录/userconfig/ace/ACE_Medical_GUI.hpp
 * 格式说明: CBA Settings 服务器强制语句 (force 前缀)
 * 版本参考: ACE3 master (A3 2.20 / CBA 3.18+)
 * 设置项均取自 ACE3 源码 addons/medical_gui/initSettings.inc.sqf
 * ============================================================ */

/* --- 医疗交互动作 --- */
force ace_medical_gui_enableActions = 0;              // 0 = 选择部位(3D) 1 = 环形菜单 2 = 禁用
force ace_medical_gui_enableSelfActions = true;       // 启用自我医疗交互
force ace_medical_gui_enableMedicalMenu = 1;          // 1 = 启用医疗菜单 (0=禁用 2=仅载具内)
force ace_medical_gui_openAfterTreatment = true;      // 治疗动作后自动打开医疗菜单
force ace_medical_gui_maxDistance = 3;                // 医疗菜单最大交互距离(米)
force ace_medical_gui_interactionMenuShowTriage = 1;  // 交互菜单显示检伤分级 (0=禁用 1=任何人 2=医疗兵)

/* --- 医疗菜单信息显示 --- */
force ace_medical_gui_showDamageEntry = false;        // 菜单中显示伤害条目
force ace_medical_gui_showBloodlossEntry = true;      // 菜单中显示失血条目
force ace_medical_gui_showBleeding = 2;               // 显示出血信息 (0=禁用 1=启用 2=含出血速率)

/* --- 信息窥视(Peek) --- */
force ace_medical_gui_peekMedicalInfoReleaseDelay = 1; // 窥视释放延迟(秒)
force ace_medical_gui_peekMedicalOnHit = false;        // 被击中时自动窥视医疗信息
force ace_medical_gui_peekMedicalOnHitDuration = 1;    // 被击中窥视时长(秒)

/* --- 止血带警告 --- */
force ace_medical_gui_tourniquetWarning = false;       // 止血带使用警告

/* --- 医疗提示 --- */
force ace_medical_gui_medicalHintEnabled = 1;          // 1 = 医疗提示(含音效) (0=禁用 2=仅音效)
//force ace_medical_gui_medicalHintMessage = "";       // 自定义医疗提示文本 (EDITBOX, 默认含地图坐标)
//force ace_medical_gui_medicalHintMedicIcon = "";     // 医疗兵提示图标路径 (EDITBOX)

/* --- 颜色配置(可选, 默认即可) --- */
//force ace_medical_gui_showBloodlossColor = true;     // 失血颜色显示(旧版)
// 注: bloodLossColor/damageColor 为 COLOR 类型 10 档渐变, 如需定制请参照源码默认值
