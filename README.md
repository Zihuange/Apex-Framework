<<<<<<< HEAD
# Apex-Framework-BTA
=======
Apex Framework 1.3.0 28/08/2022 A3 2.10
by Quiksilver       ( armacombatgroup@gmail.com ) ( https://www.patreon.com/QS )
>>>>>>> master

### 什么是Apex-Framework-BTA?
Apex-Framework-BTA是由波西米亚旅游协会成员共同协助和开发的Apex-Framework的一个分支，用于旅游团所属的公开服务器。

### 主要内容

Invade & Annex : Apex (原版-主分支)

Invade & Annex : Opposing force (CSAT版本-dev分支)

Invade & Annex : RHS (RHS版本-dev分支)

### 贡献者
原作者:
Quiksilver https://github.com/auQuiksilver

修改:
暴力膜必被续 https://github.com/Zihuange

<<<<<<< HEAD
汉化:
Kanami https://github.com/fubukiiwanami
-=D.R=- Frank https://steamcommunity.com/id/luminous815/
=======
0. Download the "Apex_framework_130_allFiles.zip" file.    (please note some mission files need to be downloaded separately due to 100MB github file size limit).

_______________
1. Place mission PBO files in your servers MPMissions folder.


_______________
2a. Place @Apex folder in your servers ArmA3 directory. Reference: https://i.imgur.com/ijdXgg6.png

2b. Run it as a -servermod in your arma launch options.

_______________
3a. Place @Apex_cfg folder in your servers ArmA 3 directory. Reference: https://i.imgur.com/ijdXgg6.png

3b. Do NOT run @Apex_cfg as a -mod or -servermod, leave it alone!

3c. Enable -filePatching for your server (important!)   Reference: https://community.bistudio.com/wiki/Arma_3_Startup_Parameters
_______________
4. Copy the difficulty options from   server.Arma3Profile file into your servers .arma3profile file.  Reference:   https://i.imgur.com/X71jy3z.png
Ensure the difficulties are set correctly. Reference:   https://i.imgur.com/9NXqPnI.png


_______________
5a. In your "server.cfg" file, ensure your server will load the correct difficulty options. Example:

--------------------------
```
class Missions {

  class apex_framework {

    template="Apex_framework_130.Altis";

    //template="Apex_framework_130.Tanoa";

    //template="Apex_framework_130.Malden";
    
    //template="Apex_framework_130.Enoch";

    difficulty="Custom";

  };
};
```

```
forcedDifficulty = "Custom";
missionWhitelist[] = {"Apex_framework_130.Altis","Apex_framework_130.Tanoa","Apex_framework_130.Malden","Apex_framework_130.Enoch"};
```

--------------------------

5b. Ensure that:    ```forcedDifficulty = "Custom";```

5c. At this time, also double check to ensure the mission template matches the mission you are trying to run.
_______________
6. In your "server.cfg" file, ensure you have a serverCommandPassword set. Example:

```serverCommandPassword = "ShVQArtpGdc5aDQq";```

Make note of the password you have (or created), you will need it now. Copy it to your clipboard.
_______________
7a. Open the new @Apex_cfg folder which you placed in your arma 3 directory.

7b. Open the "parameters.sqf" file.

7c. Locate this:


```_serverCommandPassword = "'ShVQArtpGdc5aDQq'";```


7d. Ignoring the " and ' quotations (do not touch them), copy your serverCommandPassword into that line as shown. See #7 to compare.

7e. Dont use that password!!!

7f. Ensure you change the admin login password in server.cfg. "passwordAdmin"
_______________
8. In the "parameters.sqf" file, locate this:

```_main_mission_type = 'NONE';```

Using the notes and examples posted beneath that line, select the mission type you want to run. Reference:   https://i.imgur.com/FI8tWHZ.png
_______________
9. Enjoy!


Other notes:

- There are a few other options to choose inside that "parameters.sqf" file.
- Inside the "whitelist.sqf" file, you can set player UIDs to give them various permissions. Zeus and Developer permissions are located near the bottom. For Zeus you do not need to edit the mission file, the framework will generate a module on the fly as you log in.
- You can set custom chat messages inside the "chatMessages.sqf" file.
- Ingame admin tools are accessed with key-combo [Shift]+[F2]. For more info, view the map diary tab "Key bindings". 
>>>>>>> master

贴图:
AMV-7初音痛车 THPJ :天煞 https://steamcommunity.com/id/dkz2201/
M4 SOPMOD II WY-55 :M4 SOPMOD II https://steamcommunity.com/id/Simontombu/

### 我能在自己服务器上使用这个任务吗?

是的，你可以。
但是请遵循MIT License中的条款，保留作者的署名和MIT License。
也请你完整保留这份readme用于展示所有的贡献者。
