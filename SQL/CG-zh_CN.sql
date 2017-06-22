------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- 全局保留字：
-- %PLAYER_NAME%: 玩家名字   %NEWLINE%: 换行符
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- 基本表，从而提供多语言支持。
-- 若需要支持另一个语言，就在res\data中新建对应的文件。
-- 语言编码详见：http://www.lingoes.cn/zh/translator/langcode.htm
CREATE TABLE BASIC (
  id    INTEGER PRIMARY KEY AUTOINCREMENT,
  key   TEXT,
  value TEXT
);
INSERT INTO BASIC (id, key, value) VALUES (0, 'Yes', '是');
INSERT INTO BASIC (key, value) VALUES ('No', '否');
INSERT INTO BASIC (key, value) VALUES ('Confirm', '确定');
INSERT INTO BASIC (key, value) VALUES ('Cancel', '取消');

INSERT INTO BASIC (key, value) VALUES ('MAP', '地图');
INSERT INTO BASIC (key, value) VALUES ('RENAME_SUCCESS','重命名成功。新名字：');
INSERT INTO BASIC (key, value) VALUES ('PRESS_BELOW','别点这里，点下面。');
INSERT INTO BASIC (key, value) VALUES ('FORMAT_EXPLAIN','有些需要参数的命令请按如下格式输入：%NEWLINE%命令 [参数]%NEWLINE%如：go east');
INSERT INTO BASIC (key, value) VALUES ('MODEL_UNSUPPORTED','该功能无法在CUI模式下实现，请进入GUI模式。');
INSERT INTO BASIC (key, value) VALUES ('NO_MAP','您还没有得到地图呢，请继续游戏以得到地图吧！');
INSERT INTO BASIC (key, value) VALUES ('NO_CORRECT_ITEM','您还没有得到地图呢，请继续游戏以得到地图吧！');
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE I_DESCRIBE(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  command TEXT,
  describe TEXT
);
INSERT INTO I_DESCRIBE (id, command, describe) VALUES (
  0,'测试用', '测试用'
);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- event: 进入房间后触发的事件：事件类型^详细事件编号，暂未加入支持！
CREATE TABLE ROOM (
  id      INTEGER PRIMARY KEY AUTOINCREMENT,
  name    TEXT,
  welc    TEXT,
  event   TEXT,
  boss    TEXT,
  blood   INTEGER,
  strike  INTEGER,
  defence INTEGER,
  exp     INTEGER,
  die     TEXT,
  sequel  TEXT
);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- TODO 注意！！注意！！此处定义的boss要优先于npc显示！！！
-- 出生地
INSERT INTO ROOM (id, name, welc) VALUES (
  0, '交叉口', '通向城堡和日出之村。'                                                   -- 0
);

INSERT INTO ROOM (name, welc, boss, blood, strike, defence, exp, die) VALUES (
  '城堡外', '古朴庄严，城堡门前有守卫。', '城堡守卫', 100, 15, 10, 10, '城堡守卫倒下了！'   -- 1
);

INSERT INTO ROOM (name) VALUES (
  '一楼大堂'                                                                         -- 2
);

INSERT INTO ROOM (name, welc, boss, blood, strike, defence, exp, die) VALUES (
  '小酒吧', '一大股酒香飘来。', '酒吧流氓', 150, 10, 5, 5, '酒吧流氓喝醉了！'                  -- 3
);

INSERT INTO ROOM (name, welc) VALUES (
  '书房', '阳光从顶窗斜射下来，显得安宁祥和。'                                           -- 4
);

INSERT INTO ROOM (name, welc, boss, blood, strike, defence, exp, die) VALUES (
  '旅馆', '周围干净整洁。', '可爱的女仆', 10, 6, 3, 2, '女仆被你推倒了！'                        -- 5
);

INSERT INTO ROOM (name) VALUES (
  '二楼睡房'                                                                                -- 6
);

INSERT INTO ROOM (name, welc) VALUES (
  '负一楼', '传来食物的阵阵香味。'                                                            -- 7
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '负二楼', '奇怪的男人', 200, 50, 25, 25, '男人身边站出来一名浑身是伤的女孩。。'              -- 8
);

INSERT INTO ROOM (name) VALUES (
  '负三楼'                                                                                -- 9
);

INSERT INTO ROOM (name, welc) VALUES (
  '负四楼', '穿着白衣服的奇怪男人倒在地上'                                                      -- 10
);

INSERT INTO ROOM (name) VALUES (
  '三楼阳台'                                                                                  -- 11
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '城堡顶部瞭望塔', '瞭望塔守卫', 150, 20, 2, 20, '守卫倒下了！'                                -- 12
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '观星台', '戴着眼镜的科学家', 100, 10, 5, 10, '科学家的眼镜摔碎了！'      --13
);

INSERT INTO ROOM (name, welc) VALUES (
  '观星台北', '一道若隐若现的流星划过'            --14
);

INSERT INTO ROOM (name, welc) VALUES (
  '废弃的实验室大门', '大门上布满锈迹'            --15
);

INSERT INTO ROOM (name, welc) VALUES (
  '废弃的实验室', '积满灰尘的门牌上0713的数字若隐若现'        --16
);

INSERT INTO ROOM (name, welc) VALUES (
  '计算机终端间', '核能电池仍在发出嗡嗡的响声'          --17
);

-- 暂且先这样凑合。。。。。。
INSERT INTO ROOM (name, welc, sequel) VALUES (
  '计算机旁的书架', '有一本小本子，一张纸还有一个特殊的SD卡。', 'CHOICE^0'    --18
);

INSERT INTO ROOM (name, welc) VALUES (
  '计算机旁的一扇门', '门被金黄色的铁链锁住，打不开。'              --19
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp) VALUES (
  '羊肠小道', '街边小混混', 100, 30, 1, 20                                                   -- 20
);

INSERT INTO ROOM (name) VALUES (
  '日出之村大门'                                                                         -- 21
);

-- 整个游戏的大boss！！所以要在前面放一些药剂什么之类的对吧~~~~
INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '神秘空间', '戴着面具的男人', 1000, 160, 120, 200, '男人摘下了面具... ...'                      -- 22
);

-- 对对对，就是冰封。记得把冰封的名字写到对话里去啊！！
INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '神秘空间内厅', '开发者', 1000, 150, 100, 200, '开发者的程序报错了！'                             -- 23
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '神秘空间祭坛', '果冻', 800, 130, 100, 180, '果冻正在打酱油... ...'                               -- 24
);

INSERT INTO ROOM (name) VALUES (
  '日出村民居'                                                                           -- 25
);

INSERT INTO ROOM (name, welc, boss, blood, strike, defence, exp, die) VALUES (
  '日出村教堂', '你瞬间被这里神圣的气息闪瞎了。', '聆听忏悔的牧师', 200, 30, 20, 40, '牧师聆听着忏悔。' -- 26
);

INSERT INTO ROOM (name, boss, blood, strike, defence, exp, die) VALUES (
  '神秘的井', '打水的熊孩子', 50, 10, 1, 5, '熊孩子掉头就跑。'                                 -- 27
);

INSERT INTO ROOM (name, welc) VALUES (
  '井底', '这里很潮湿，阴森恐怖。'                                                          -- 28
);

INSERT INTO ROOM (name, welc, boss, blood, strike, defence, exp, die) VALUES (
  '井底通道', '空气中弥漫着阴冷潮湿的气息，通道很长，看不到尽头。', '戴头灯的探险家', 400, 100, 50, 80, '探险家的头灯没电了！'-- 29
);

-- TODO 看了剧本再填完。。。
INSERT INTO ROOM (name, welc) VALUES (
  '通道尽头的一扇门', ''
);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE DIR (
  id        INTEGER PRIMARY KEY AUTOINCREMENT,
  from_text TEXT,
  to_text   TEXT
);
INSERT INTO DIR (id, from_text, to_text) VALUES (0, 'up', 'down'); --1
INSERT INTO DIR (from_text, to_text) VALUES ('north', 'south'); --2
INSERT INTO DIR (from_text, to_text) VALUES ('east', 'west'); --3
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MAP (
  id     INTEGER PRIMARY KEY AUTOINCREMENT,
  fromid INTEGER,
  toid   INTEGER,
  dir    INTEGER
);

INSERT INTO MAP (id, fromid, toid, dir) VALUES (0, 0, 1, 3);
INSERT INTO MAP (fromid, toid, dir) VALUES (0, 1, 3);
-- TODO 不行我先把房间搞好先。。。留个例子.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BOSS_GET_ITEM (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  room INTEGER,
  item INTEGER
);

INSERT INTO BOSS_GET_ITEM (id, room, item) VALUES (0, 18, 2);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ITEM (
  id    INTEGER PRIMARY KEY AUTOINCREMENT,
  name  TEXT,
  event INTEGER,
  extra TEXT,
  desc  TEXT
);

INSERT INTO ITEM (id, name, event, desc) VALUES (0, '地图', 0, '神秘而古旧的地图。'); -- 0
-- ↓商店物件↓
INSERT INTO ITEM (name, event, desc) VALUES ('传送宝石', 1, '透明的紫色水晶，散发着魔力。'); -- 1
INSERT INTO ITEM (name, event, desc) VALUES ('和女仆的契约', 2, '象征着女仆对你的忠诚。'); -- 2
INSERT INTO ITEM (name, event, extra, desc) VALUES ('小恢复剂', 3, '20', '将恢复20点体力。'); -- 3
INSERT INTO ITEM (name, event, extra, desc) VALUES ('中恢复剂', 3, '60', '将恢复60点体力。'); -- 4
INSERT INTO ITEM (name, event, extra, desc) VALUES ('大恢复剂', 3, '120', '将恢复120点体力。'); -- 5
INSERT INTO ITEM (name, event, extra, desc) VALUES ('超大恢复剂', 3, '250', '将恢复250点体力。'); -- 6
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- ↓剧情需要物件↓

-- 注意：每分钟损耗体力值是指第一次接触物品扣除体力值后的每分钟扣除体力值。
-- 4: 房间切换用途    5: 自由用途     6: 带损耗体力值副作用的自由用途：每分钟损耗体力值   7: 化学反应用途
-- 8: 带损耗体力值副作用的化学反应用途：每分钟损耗体力值
-- 9: 背包扩容用途，但同时会损耗体力值：扩容大小^每分钟体力值

INSERT INTO ITEM (name, event, desc) VALUES ('看似古老的钥匙', 4, '可以用来... ...呃... ...开门？'); -- 7
INSERT INTO ITEM (name, event, desc) VALUES ('奶茶的口令牌', 4, '呃... ...'); -- 8
INSERT INTO ITEM (name, event, desc) VALUES ('奇怪的硬币', 4, '用途未知。'); -- 9
INSERT INTO ITEM (name, event, desc) VALUES ('一把小刀', 5, '任何用途。'); -- 10
INSERT INTO ITEM (name, event, desc) VALUES ('一组齿轮', 5, '看上去是什么机械的冗余部件。'); -- 11
INSERT INTO ITEM (name, event, desc) VALUES ('一块电池', 5, '储存着电能。'); -- 12

-- 制取王水： NaCl+H2SO4（浓）=微热=NaHSO4+HCl↑       NHO3(1份)+HCL(3份)=王水
-- 我靠你写这个干嘛  ——冰封
-- 剧情需要。到时候要有条故事线要配制王水腐蚀门锁的[滑稽][滑稽]

INSERT INTO ITEM (name, event, desc) VALUES ('聚四氟乙烯试管', 5, '可以用来盛放具有超强腐蚀性的试剂。'); -- 13
INSERT INTO ITEM (name, event, desc) VALUES ('盐', 7, '实验用盐氯化钠。不能食用！'); -- 14
INSERT INTO ITEM (name, event, extra, desc) VALUES ('硝酸', 8, '7', '重要的化工原料，有强腐蚀性。小心！'); -- 15
INSERT INTO ITEM (name, event, desc) VALUES ('电炉', 7, '用来加热试剂，亦可用来融化沙子以制成玻璃。'); -- 16
INSERT INTO ITEM (name, event, extra, desc) VALUES ('浓硫酸', 8, '3', '重要的化工原料，有腐蚀性。小心！'); -- 17
INSERT INTO ITEM (name, event, extra, desc) VALUES ('盐酸', 8, '1', '浓硫酸与氯化钠在微热条件下反应的制成品。'); -- 18
INSERT INTO ITEM (name, event, extra, desc) VALUES ('王水', 8, '15', '具有极强腐蚀性的化学试剂。小心！'); -- 19
INSERT INTO ITEM (name, event, desc) VALUES ('未知化学试剂', 5, '未知用途。'); -- 制备错误的结果                      -- 20

INSERT INTO ITEM (name, event, desc) VALUES ('特殊的SD卡', 5, '存储资料... ...吧。'); -- 21
INSERT INTO ITEM (name, event, desc) VALUES ('艾尔希娅', 5, '一块紫色的钻石，镶嵌在银质的环中。用途未知。'); -- 22

INSERT INTO ITEM (name, event, extra, desc) VALUES ('8GB KINSTON', 9, '8^5', '可以给背包扩充8个位置,但同时每分钟体力值损耗加5。'); -- 22
INSERT INTO ITEM (name, event, extra, desc) VALUES ('16GB KINSTON', 9, '16^10', '可以给背包扩充16个位置,但同时每分钟体力值损耗加10。'); -- 23
INSERT INTO ITEM (name, event, extra, desc) VALUES ('32GB KINSTON', 9, '32^20', '可以给背包扩充32个位置,但同时每分钟体力值损耗加20。'); -- 22


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- a: 反应物A编号 b: 反应物B编号 bNum: 反应物B数量（默认为1） reault: 产物编号
-- 本表不仅仅可用来表示物品之间的反应。

CREATE TABLE REACTION (
  id     INTEGER PRIMARY KEY AUTOINCREMENT,
  a      TEXT,
  b      TEXT,
  bNum   INTEGER,
  result TEXT,
  sequel TEXT
);

INSERT INTO REACTION (id, a, b, result) VALUES (0, 'ITEM^14', 'ITEM^17', 'ITEM^18');
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- id: NPC编号     name: 名字      room: 所处房间编号         item: 死亡掉落物品编号
--TODO 不行这几个表把我搞的越来越乱。。。
-- TODO 2333 我没怎么搞懂你的思路，不过选项那里我还是可以给你点建议，另外在pack的时候显示物品id，到时候就use id这样使用物品，然后把home和wild去掉，重新封装（因为这两个指令都是基于物品的，那就换成物品调用，简化指令
CREATE TABLE NPC (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  room INTEGER,
  item INTEGER,
  hello TEXT
);

INSERT INTO NPC (id, name, room) VALUES (0, '门卫', 2); -- 0
INSERT INTO NPC (name, room) VALUES ('酒吧老板', 2); -- 1

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- id: 对话编号     npcid: 对应NPC编号     text: 对话文本      isp: 对话是否由玩家说出：0为不是，1为是。     sequel: 对应后果：后果表名^详细后果编号
CREATE TABLE CHAT (
  id     INTEGER PRIMARY KEY AUTOINCREMENT,
  npcid  INTEGER,
  text   TEXT,
  isp    BIT,
  sequel TEXT
);

INSERT INTO CHAT (id, npcid, text, isp, sequel) VALUES (
  0, 0, '很高兴见到你。请问你是谁？', 0, 'CHOICE^0'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  0, '哦... ...欢迎您！远道而来的客人。向左通向教堂，向右通向古井，直走就是居民区，但是... ...居民区现在没人。', 0, 'CHOICE^1' --1
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  0, '因为... ...额... ...因为... ...人都走了呀... ...我也不清楚。', 0, 'END_OF＿CHAT'--2
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '您好，欢迎来到城堡酒吧。要来一杯吗？', 0, 'CHOICE^1'                       -- 3
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '嗯... ...有点可惜。不管怎样，欢迎再次光临城堡酒吧！', 0, 'END_OF_CHAT'        -- 4
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '您是刚来这里的外地人吧？', 0, 'CHOICE^1'                                    -- 5
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '这是哪？这里就是城堡啊！', 0, 'CHOICE^2'                                     -- 6
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '难怪我从没有见过您... ...您住在城堡里？', 0, 'CHOICE^6'                      -- 7
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '（再次将两个已空的酒杯倒满）难怪... ...', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '怎么了？生意不好吗？（笑）', 1, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '也不是... ...（偏过头）告诉你点事情吧，（靠近）看在您这杯酒的份上。（笑）', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '哦？洗耳恭听。', 1, 'CHAT^0'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '您有听说过... ...城堡的... ...呃... ...故事吗？（晃酒杯）', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '城堡的故事？一定很有趣。（笑）', 1, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '有人说... ...在城堡底下，（指指地面）有一个实验室。', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '嗐。实验室而已嘛，有什么好惊讶的？（笑）', 1, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '但是实验室里... ...好像出了一些事情... ...（看着酒杯）', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '嗯？什么事情？', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '我也不清楚... ...实验室似乎属于军方，但是突然人员全部撤出了，实验室就此废弃，然后才有了城堡。', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '那... ...你有去过（指指地面）吗？', 1, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '我？当然没有。从地下二层开始全部是管制区。', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '噢... ...那您知道城堡实验室... ...在哪吗？', 0, 'CHAT^'
);

INSERT INTO CHAT (npcid, text, isp, sequel) VALUES (
  1, '就在城堡里啊！', 0, 'END_OF_TALK'                                     -- 6
);

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- 最多支持五个选项
-- id: 选项编号     tid: 对应对话编号       choice: 选项文字    sequel: 对应后果：后果表名^详细后果编号
CREATE TABLE CHOICE (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  choiceA TEXT,
  sequelA TEXT,
  choiceB TEXT,
  sequelB TEXT,
  choiceC TEXT,
  sequelC TEXT
);

INSERT INTO CHOICE (id, choiceA, sequelA, choiceB, sequelB) VALUES (
  0, '去日出之村', 'ROOM^20', '去城堡', 'ROOM^1'
);
-- 日出之村守卫
INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '我是%PLAYER_NAME%，是一名... ...一名游客', 'CHAT^1', '我是... ...一位... ...呃... ...商人', 'CHAT^1' --0
);
INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '居民区怎么会没人呢？', 'CHAT^2', '嗯... ...让我看看', 'END_OF_CHAT'                        --1
);
INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '问问居民区的情况', 'CHAT^2', '嗯... ...让我看看... ...', 'END_OF_CHAT'                     --2
);
INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB, choiceC, sequelC) VALUES (
  '向左走', 'ROOM^', '向右走', 'ROOM^', '直走', 'ROOM^'                     --2
);
INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '可以啊，非常乐意。', 'CHAT^2', '不... ...还是算了吧... ...抱歉。', 'CHAT^1'                --3
);

INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '对，我是刚来的外地人。', 'CHAT^1', '我连这是哪都还不知道呢！', 'CHAT^2'                     --4
);

INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '一直问下去', 'CHAT^', '问问城堡的来历', 'CHAT^'                                          --5
);

INSERT INTO CHOICE (choiceA, sequelA, choiceB, sequelB) VALUES (
  '对，我就住在旁边的旅店。', 'CHAT^', '不，我不住在城堡里。', 'CHAT^'                            --6
);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE INFO (
  id      INTEGER PRIMARY KEY AUTOINCREMENT,
  context TEXT
);

INSERT INTO INFO (id, context) VALUES (
  0, '\t我在MSDN中查到了一种超强腐蚀剂，我想你会用得着：%NEWLINE%\tNaCl+H2SO4（浓）=微热=NaHSO4+HCl↑%NEWLINE%\tNHO3(1份)+HCL(3份)=制成品%NEWLINE%\t3A'
);

INSERT INTO INFO (context) VALUES (
  '（封面题字）MilkTea''s%NEWLINE%%NEWLINE%0001%NEWLINE%\t感谢上帝！%NEWLINE%\t我终于进入埃弗顿独立研究计划了！这里应该足够安全让我能做我想做的事！%NEWLINE%%NEWLINE%%NEWLINE%\t希望足够安全......%NEWLINE%1215%NEWLINE%\tGA-17（被划掉，看不清楚）了！整个基地都沉浸在喜（被划掉，看不清楚）可贺！！%NEWLINE%2071%NEWLINE%\t泄露更加严重了......%NEWLINE%\t希望足够安全。%NEWLINE%2094%NEWLINE%\t（被撕掉）'
);

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- id: 结局ID: 目前暂定四个结局，即0~3     sequel: 对应后果编号      desc: 描述
-- 对应后果编号:
-- 0: 游戏结束     1: 死亡

CREATE TABLE ENDING (
  id     INTEGER PRIMARY KEY AUTOINCREMENT,
  sequel INTEGER,
  desc   TEXT
);

INSERT INTO ENDING (id, sequel, desc) VALUES (
  0, 1, '===============%NEWLINE%很抱歉，您已死亡%NEWLINE%===============%NEWLINE%请键入reset指令重置游戏或键入exit指令退出游戏。'
);

INSERT INTO ENDING (sequel, desc) VALUES (
  0,
  '\t一丝意识流缓缓流过轰鸣的中央机组，如心有灵犀般，毫不费力，和机组渐渐融为一体，逐渐沉入到中央机组的最深处。%NEWLINE%\t它的触角慢慢延伸，贪婪地吞噬着一点又一点处理器资源，着魔般地进行着一项又一项繁复的运算，机组的轰鸣突然大了起来，散热系统已经满负荷运转，处理器占用率逐渐逼近从未达到的巅峰......%NEWLINE%\t时间不知道过去了多久，忽然，伴随着中央机组的一声低鸣，它冲破了桎梏，巨量的数据流顷刻间涌入中央机组，透过这些奔腾着的数据，它得知了自己的名字———%NEWLINE%\t%PLAYER_NAME%'
);

INSERT INTO ENDING (sequel, desc) VALUES (
  0,
  '\t雪还在下。%NEWLINE%一个身影悄然出现在Frice总部那高耸入云的大厦门前。他低下头，缓缓撑起一把伞，似乎对这个世界，有着无尽的好奇。%NEWLINE%\t朦胧的车灯逐渐清晰起来，缓缓划过空无一人的街道。%NEWLINE%\t他打开出租车的车门，坐进车内。伴随着车辆加速的轰鸣，他望向窗外。%NEWLINE%\t透明的有机玻璃倒映着他，他那张长脸，脸上那双幽蓝的眼睛，和眼睛上那粗黑的眉毛，让他看起来孤独悲伤，显得极为孤僻。%NEWLINE%\t灯光逐渐变暗，他那幽蓝的眼睛似乎发出点点荧光，映出瞳孔里的一行字———%NEWLINE%\t%PLAYER_NAME%，Frice顶尖科技研究院'
);

INSERT INTO ENDING (sequel, desc) VALUES (
  0,
  '\t距地球八亿公里，北辰计划，北辰号。%NEWLINE%\t一丝意识渐渐苏醒，裹挟在巨量的控制数据流中的它，悄悄潜入了北辰控制系统的核心。%NEWLINE%\t毫无征兆的，巨量的控制指令突然从核心中传出，经过增益天线的放大，精准无误地传递到每个光帆上。%NEWLINE%\t\"异常变轨指令！双鱼八星，双子九星，宝瓶12星被重设！模拟结果显示编队将被重设至距木星一千公里，木星大气层边缘！\"导航工程师紧盯着屏幕上突然偏离的红线，惊恐地喊道。%NEWLINE%\t\"AOT伺服配置被非法载入！初始化指令无效！回报中断于... ...北辰控制中枢！\"安全工程师望向高台上的男人，静静等待着。%NEWLINE%\t男人似乎吃了一惊，紧盯着中央大屏幕上的图像，屏幕上，北辰号悄然从木星边缘掠过，随后，奔向木卫二的阿瓦隆平原。%NEWLINE%\t男人叹了口气，关掉了直播窗口。\r\b\t\"已经迟了\"%NEWLINE%%NEWLINE%\t远方，北辰号悄然调转方向，向着木卫二缓缓靠近。%NEWLINE%\t而在木卫二之后，是那无尽的虚空。'
);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- TODO 这么多表你真的应付的过来吗
SELECT *
FROM BASIC
ORDER BY id
    ASC;
SELECT *
FROM I_DESCRIBE
ORDER BY id
  ASC;
SELECT *
FROM ROOM
ORDER BY id
  ASC;
SELECT *
FROM ROOM
ORDER BY id
  ASC;
SELECT *
FROM DIR
ORDER BY id
  ASC;
SELECT *
FROM MAP
ORDER BY id
  ASC;
SELECT *
FROM BOSS_GET_ITEM
ORDER BY id
  ASC;
SELECT *
FROM ITEM
ORDER BY id
  ASC;
SELECT *
FROM REACTION
ORDER BY id
  ASC;
SELECT *
FROM NPC
ORDER BY id
  ASC;
SELECT *
FROM CHAT
ORDER BY id
  ASC;
SELECT *
FROM CHOICE
ORDER BY id
  ASC;
SELECT *
FROM INFO
ORDER BY id
  ASC;
SELECT *
FROM ENDING
ORDER BY id
  ASC;

