SET NAMES UTF8;
DROP DATABASE IF EXISTS pd;
CREATE DATABASE pd CHARSET=UTF8;
USE pd;
/*数据表创建*/
#pd_user用户表，包含注册后的用户资料
CREATE TABLE pd_user(
    uid      INT PRIMARY KEY AUTO_INCREMENT,       #用户的ID，为用户的唯一标识，自动生成
    uname    varchar(20)  unique,                  #用户名
    upwd     varchar(20),                          #密码
    uhead    varchar(500),                         #头像图片路径
    question varchar(128),                         #密保问题，防止遗忘密码
    answer   varchar(128),                         #密保答案，用于替代密码
    usay     varchar(500),                         #用户个人简介
    candy    int                                   #糖果积分，签到获得
);

#pd_picture图库表，用户上传的图片
CREATE TABLE pd_picture(
    pid      INT PRIMARY KEY AUTO_INCREMENT,       #图片的ID，为图片的唯一标识，自动生成
    uid      int,                                  #该图片上传用户的ID
    phead    varchar(500),                         #图片路径
    tag      varchar(50),                          #图片标签，用户上传图片时定义
    uptime   datetime,                             #图片上传时间
    pdetail  varchar(500)                          #图片简介    
);


#pd_favorites收藏夹表，用户收藏的喜爱的图片
CREATE TABLE pd_favorites(
    uid      int,                                  #收藏夹用户的ID 
    pid      int                                   #收藏夹收藏图片的ID
);


#pd_loveuser关注表，用户关注的用户
CREATE TABLE pd_loveuser(
    uid      int,                                  #关注表用户的ID
    loveuid  int                                   #关注的用户ID 
);

/*数据插入*/
/*pd_user用户表*/
INSERT INTO pd_user VALUES(1,"荻pote","123456","./image/uhead/1.jpg","母亲大人的姓名是？","达克涵","サークル:Milky Been!気まぐれで作品を消したりします。ご依頼等は一旦ﾒｯｾｰｼﾞ機能にてお願いいたします｡",500);
INSERT INTO pd_user VALUES(2,"SIBYL","654321","./image/uhead/2.jpg","爱好是？","画画","趣味はゲームをすることと絵を描",50);
INSERT INTO pd_user VALUES(3,"純生文屋","23333","./image/uhead/3.jpg","出生地在哪？","大阪","フリーランスのイラストレーターです。お仕事を募集しております。お気軽にご連絡下さい。",41);
INSERT INTO pd_user VALUES(4,"Aoi Ogata","haiyuanqin233","./image/uhead/4.jpg","性别是？","不详","Philippines | Self taught |23 #HateChan |KYRIE MEII'S boyfriend",666);
INSERT INTO pd_user VALUES(5,"cCat","kuikuitan54218","./image/uhead/5.jpg","职业是？","艺术家","on work hiatus/inactive.please do not repost or edit my artwork.",10);
INSERT INTO pd_user VALUES(6,"YUUMEI","allppin","./image/uhead/6.jpg","回家的路？","出门右拐","The art and musings of a disillusioned idealist.",30000);
INSERT INTO pd_user VALUES(7,"wlop","doit","./image/uhead/7.jpg","我的主业是？","web前端","我是中国人，我爱画画",280);

/*pd_picture图库表*/
INSERT INTO pd_picture VALUES(1,1,"./image/picture/1.jpg","女孩|二次元|制服|水手服|哭泣","2019-02-28 14:32:42","(´；ω；｀)");
INSERT INTO pd_picture VALUES(2,1,"./image/picture/2.jpg","女孩|二次元|圣诞节|围巾","2019-02-28 14:32:43","メリークリスマス，仏教徒より爱を込めて，待ち合わせの絵です、山下达郎聴きながら描きました");
INSERT INTO pd_picture VALUES(3,1,"./image/picture/3.jpg","女孩|二次元|血小板|番剧","2019-02-28 14:32:44","可爱的血小板~");
INSERT INTO pd_picture VALUES(4,1,"./image/picture/4.jpg","女孩|monogatari series|二次元|物语|金发|多人|卧倒","2019-02-28 14:32:45","いろんなしのぶちゃんです。なにかのグッズになります。");
INSERT INTO pd_picture VALUES(5,1,"./image/picture/5.jpg","女孩|二次元|制服|校服|樱花","2019-02-28 14:32:46","確か地面にうっすら残ってた雪を見て桜っぽいなーとか思いながら描いた絵だったと思います。");
INSERT INTO pd_picture VALUES(6,1,"./image/picture/6.jpg","女孩|二次元|浴衣|烟花|风景","2019-02-28 14:32:47","新潟は冬死ぬほど長くて夏は毎年一瞬です");
INSERT INTO pd_picture VALUES(7,1,"./image/picture/7.jpg","女孩|二次元|Poinsettia|贞德","2019-02-28 14:32:48","ゲームやったことないけどいい感じの中二だったのでずっと描いてみたかったです。あと私事ですが夏コミ受かりました。やったー");
INSERT INTO pd_picture VALUES(8,1,"./image/picture/8.jpg","女孩|二次元|制服|天空|水面|风景|倒影","2019-02-28 14:32:49","水面の感じの練習がてら描きました。5月ティア頑張って出たいどす");
INSERT INTO pd_picture VALUES(9,1,"./image/picture/9.jpg","女孩|二次元|和服|浴衣|马尾","2019-02-28 14:32:50","夏の終わりの物悲しさは恋の終わりに似ていますね。はい、オタクだからこういうこと言うのキツイです");
INSERT INTO pd_picture VALUES(10,1,"./image/picture/10.jpg","女孩|二次元|ガタ津風|内裤|舰队collection|掀裙子","2019-02-28 14:32:51","ギャルゲっぽい塗リの練習です。");
INSERT INTO pd_picture VALUES(11,1,"./image/picture/11.jpg","女孩|二次元|Love Live!|希绘|妮可真姬|鸟果海","2019-02-28 14:32:52","冬コミに出す新刊、イラスト集の表紙（予定）です。落とさないようにだけがんばるぞい");
INSERT INTO pd_picture VALUES(12,1,"./image/picture/12.jpg","男孩|二次元|结城理|鬼太郎|美少年","2019-02-28 14:32:53","P3の男主人公ほんと好きです。映画まだ見てないので早く見たいです");
INSERT INTO pd_picture VALUES(13,1,"./image/picture/13.jpg","女孩|二次元|初音ミク|VOCALOID","2019-02-28 14:32:54","成長しているのかよくわかりませんが・・・今後もお見守りくださいませ。タイトルはＲＡＴＭの受け売りです。良く意味は分からないです。");
INSERT INTO pd_picture VALUES(14,1,"./image/picture/14.jpg","女孩|男孩|二次元|SKYBLUE|このハイセンス","2019-02-28 14:32:55","ファンタジックなの好きです。");
INSERT INTO pd_picture VALUES(15,1,"./image/picture/15.jpg","女孩|二次元|初音ミク|VOCALOID","2019-02-28 14:32:56","初音ミク！！！！");
INSERT INTO pd_picture VALUES(16,1,"./image/picture/16.jpg","女孩|二次元|南小鸟|萌え禿げた|双马尾","2019-02-28 14:32:57","させてみたかった・・");
INSERT INTO pd_picture VALUES(17,1,"./image/picture/17.jpg","女孩|二次元|水手服|キャプションに|夏季","2019-02-28 14:32:58","夏、オワラナイデー");
INSERT INTO pd_picture VALUES(18,1,"./image/picture/18.jpg","女孩|二次元|初音ミク|VOCALOID|和服","2019-02-28 14:32:59","あけましておめでとうございます。描き初めということで和テイストです。今年も何卒宜しくお願い致します。あ、探しても辰は居ないです。");
INSERT INTO pd_picture VALUES(19,1,"./image/picture/19.jpg","女孩|二次元|东方Project|悪魔の妹|妹様","2019-02-28 14:33:00","はいきましたﾌﾗﾝちゃん定期うpです｡ｱﾆﾒ塗り（もはやｱﾆﾒ塗りじゃない気もしますが）の練習に､仕事の息抜きがてら描きました｡");
INSERT INTO pd_picture VALUES(20,1,"./image/picture/20.jpg","女孩|二次元|鬼火|原创","2019-02-28 14:33:01","やけどするヨ☆");
INSERT INTO pd_picture VALUES(21,1,"./image/picture/21.jpg","女孩|二次元|初音ミク|VOCALOID|初音ミク|VOCALOID","2019-02-28 14:33:02","ミク絵絶賛量産中");
INSERT INTO pd_picture VALUES(22,1,"./image/picture/22.jpg","女孩|二次元|鹿目圆|焰圆|晓美焰","2019-02-28 14:33:04","かかせていただきました。");
INSERT INTO pd_picture VALUES(23,1,"./image/picture/23.jpg","女孩|二次元|中野梓|平沢唯|琴吹紬|田井中律|秋山澪","2019-02-28 14:33:05","衣装考えてみました。映画、非常にたのしみです");
INSERT INTO pd_picture VALUES(24,1,"./image/picture/24.jpg","女孩|二次元|初音ミク|VOCALOID|成长","2019-02-28 14:33:06","以前描いたミクを同じ感じで描き直してみました。");
INSERT INTO pd_picture VALUES(25,1,"./image/picture/25.jpg","女孩|二次元|东方|爱丽丝・玛格特罗依德","2019-02-28 14:33:07","マイブームのアリスたんを描いてみました。");
INSERT INTO pd_picture VALUES(26,1,"./image/picture/26.jpg","女孩|二次元|和服|初音ミク|巡音ルカ|kiseru","2019-02-28 14:33:08","はじめて着物というものを描いてみました。へび様をはじめ、様々素材をお借りいたしました。");
INSERT INTO pd_picture VALUES(27,1,"./image/picture/27.jpg","女孩|二次元|M16|武装|M203","2019-02-28 14:33:09","なんか銃とかよくわかんないんで、適当に雑誌みて描きました。そしてついでに参加してみます");
INSERT INTO pd_picture VALUES(28,1,"./image/picture/28.jpg","男孩|二次元|折原临也|かっこいざや|无头骑士异闻录","2019-02-28 14:33:10","臨也くんペロペロ　　久々にdrrrみたくなってきたーーーい");
INSERT INTO pd_picture VALUES(29,1,"./image/picture/29.jpg","女孩|二次元|初音ミク|VOCALOID|武装|机娘","2019-02-28 14:33:11","ｺﾝｾﾝﾄ１時間充電で２４時間､薪割りから殺人まで何でもしてくれます｡一応１号機的な感じですが､続くかは知りません｡");
INSERT INTO pd_picture VALUES(30,1,"./image/picture/30.jpg","男孩|二次元|泳装|h-entai","2019-02-28 14:33:12","かなり昔、一番最初に書いたデジ絵です。いまだに傑作です。");
INSERT INTO pd_picture VALUES(31,2,"./image/picture/31.jpg","女孩|二次元|狐娘|狐耳|楓","2019-02-28 14:33:13","秋のきつね");
INSERT INTO pd_picture VALUES(32,2,"./image/picture/32.jpg","女孩|二次元|傳說對決|ArenaofValor","2019-02-28 14:33:14","艾瑞--仙鈴幻響");
INSERT INTO pd_picture VALUES(33,2,"./image/picture/33.jpg","女孩|二次元|小恶魔|南瓜裤|万圣节","2019-02-28 14:33:15","trick or treat!");
INSERT INTO pd_picture VALUES(34,2,"./image/picture/34.jpg","女孩|二次元|少女前线|武装|戦線","2019-02-28 14:33:16","K11");
INSERT INTO pd_picture VALUES(35,2,"./image/picture/35.jpg","女孩|二次元|阴阳师|游戏|面霊気","2019-02-28 14:33:17","陰陽師Onmyoji");
INSERT INTO pd_picture VALUES(36,2,"./image/picture/36.jpg","女孩|二次元|木漏れ日|风景|白色连衣裙","2019-02-28 14:33:18","夏蔭");
INSERT INTO pd_picture VALUES(37,2,"./image/picture/37.jpg","女孩|二次元|初音ミク|VOCALOID|ミク誕生祭2019","2019-02-28 14:33:19","ことしは12周年，色々ありがとう...大好き!!");
INSERT INTO pd_picture VALUES(38,2,"./image/picture/38.jpg","女孩|二次元|泳装|玻璃杯|清凉感","2019-02-28 14:33:20","夏の味");
INSERT INTO pd_picture VALUES(39,2,"./image/picture/39.jpg","女孩|二次元|竜骨|bikini armor","2019-02-28 14:33:21","竜の遺跡");
INSERT INTO pd_picture VALUES(40,2,"./image/picture/40.jpg","女孩|二次元|少女|啦啦队员|尻","2019-02-28 14:33:22","チアガール");
INSERT INTO pd_picture VALUES(41,2,"./image/picture/41.jpg","男孩|二次元|仕事絵","2019-02-28 14:33:23","株式会社Aiming様のゲームに実装されているイラストです～");
INSERT INTO pd_picture VALUES(42,2,"./image/picture/42.jpg","女孩|二次元|Love Live!|高坂穗乃果|Solo|感动","2019-02-28 14:33:24","一話の最後　感動されました");
INSERT INTO pd_picture VALUES(43,2,"./image/picture/43.jpg","女孩|二次元|セイレーン|大海の歌姫·セイレーン|マーメイド","2019-02-28 14:33:25","セイレーンかわいい～My best leader hahaXD");
INSERT INTO pd_picture VALUES(44,2,"./image/picture/44.jpg","女孩|二次元|少女|忍者|樱花","2019-02-28 14:33:26","一天半左右練習");
INSERT INTO pd_picture VALUES(45,2,"./image/picture/45.jpg","多人|二次元|景色|动物|鸟笼","2019-02-28 14:33:27","空想综合的作品");
INSERT INTO pd_picture VALUES(46,3,"./image/picture/46.jpg","男孩|二次元|书生|帽子|侦探","2019-02-28 14:33:28","幸薄そう(´・ω・｀)");
INSERT INTO pd_picture VALUES(47,3,"./image/picture/47.jpg","女孩|二次元|海|青の衝撃","2019-02-28 14:33:30","クリアウォーター");
INSERT INTO pd_picture VALUES(48,3,"./image/picture/48.jpg","女孩|二次元|流星|星空|无重力|太空","2019-02-28 14:33:31","獅子座流星群が今年も来ましたね。");
INSERT INTO pd_picture VALUES(49,3,"./image/picture/49.jpg","女孩|二次元|白化症|抹胸|White Noise","2019-02-28 14:33:32","アルビノのこ");
INSERT INTO pd_picture VALUES(50,3,"./image/picture/50.jpg","女孩|二次元|逆光|都市","2019-02-28 14:33:33","気づいたらプロポーズされてた。");
INSERT INTO pd_picture VALUES(51,3,"./image/picture/51.jpg","男孩|二次元|一緒に入ろう|下雨|正太","2019-02-28 14:33:34","涙腺を破壊しに来るゲーム。");
INSERT INTO pd_picture VALUES(52,3,"./image/picture/52.jpg","男孩|二次元|怪兽|英雄|对峙|末世","2019-02-28 14:33:35","１時間位で描いた息抜き。エイリアン２より。ここの戦闘は激アツ。");
INSERT INTO pd_picture VALUES(53,4,"./image/picture/53.jpg","女孩|二次元|波波头|黑白","2019-02-28 14:33:36","Raven");
INSERT INTO pd_picture VALUES(54,4,"./image/picture/54.jpg","女孩|二次元|Raven|黑白|Hatechan","2019-02-28 14:33:37","My original character");
INSERT INTO pd_picture VALUES(55,4,"./image/picture/55.jpg","女孩|二次元|original|Queen|黑白","2019-02-28 14:33:38","random painting");
INSERT INTO pd_picture VALUES(56,4,"./image/picture/56.jpg","女孩|二次元|抽烟|original|黑白","2019-02-28 14:33:39","smoke");
INSERT INTO pd_picture VALUES(57,4,"./image/picture/57.jpg","女孩|二次元|九尾狐|黑白|original","2019-02-28 14:33:40","Kitsune");
INSERT INTO pd_picture VALUES(58,4,"./image/picture/58.jpg","女孩|二次元|original|黑白|帽子","2019-02-28 14:33:41","My original character");
INSERT INTO pd_picture VALUES(59,4,"./image/picture/59.jpg","女孩|二次元|黑白|兔耳|original|Hatechan","2019-02-28 14:33:42","girl");
INSERT INTO pd_picture VALUES(60,4,"./image/picture/60.jpg","女孩|二次元|Kaguya Ōtsutsuki|ナルト疾風伝","2019-02-28 14:33:43","大筒木カグヤ fan art");
INSERT INTO pd_picture VALUES(61,4,"./image/picture/61.jpg","女孩|二次元|黑白|commission|帽子","2019-02-28 14:33:44","Commission by littledreamxr from Instagram");
INSERT INTO pd_picture VALUES(62,4,"./image/picture/62.jpg","女孩|二次元|黑长直|黑白|角娘","2019-02-28 14:33:45","Horns");
INSERT INTO pd_picture VALUES(63,4,"./image/picture/63.jpg","女孩|二次元|恶魔|handling fee|恶魔娘","2019-02-28 14:33:46","Deviantart commission");
INSERT INTO pd_picture VALUES(64,5,"./image/picture/64.jpg","男孩|二次元|鲜花|蓝色","2019-02-28 14:33:47","想要好多花呀");
INSERT INTO pd_picture VALUES(65,5,"./image/picture/65.jpg","男孩|二次元|精灵|尖耳|金发","2019-02-28 14:33:48","最喜欢帅气的精灵呐~");
INSERT INTO pd_picture VALUES(66,5,"./image/picture/66.jpg","女孩|二次元|梦幻|流星|星空","2019-02-28 14:33:49","就像在梦里一样");
INSERT INTO pd_picture VALUES(67,5,"./image/picture/67.jpg","女孩|二次元|头像|毛衣","2019-02-28 14:33:50","作品新出炉啦~");
INSERT INTO pd_picture VALUES(68,5,"./image/picture/68.jpg","女孩|二次元|洗头|清丽","2019-02-28 14:33:51","咦，洗头就用霸王");
INSERT INTO pd_picture VALUES(69,5,"./image/picture/69.jpg","女孩|二次元|水","2019-02-28 14:33:52","女孩儿就是水做的呀");
INSERT INTO pd_picture VALUES(70,5,"./image/picture/70.jpg","女孩|二次元|天体|星辰","2019-02-28 14:33:53","带着星辰来见你");
INSERT INTO pd_picture VALUES(71,5,"./image/picture/71.jpg","女孩|二次元|鳐鱼|梦幻","2019-02-28 14:33:54","咕噜~还在梦里吗？");
INSERT INTO pd_picture VALUES(72,6,"./image/picture/72.jpg","女孩|二次元|红发|Robin","2019-02-28 14:33:55","Trying to some new coloring techniques. It didn't quite turn out how I wanted but oh well, I'll get better next time :) I'm always painting Robin when I just want to test something lol");
INSERT INTO pd_picture VALUES(73,6,"./image/picture/73.jpg","男孩|二次元|都市|朋克","2019-02-28 14:33:56","欢迎来看我新作");
INSERT INTO pd_picture VALUES(74,6,"./image/picture/74.jpg","女孩|二次元|背影|肖像","2019-02-28 14:33:57","Truth be told when I hurt my hand years ago I stopped drawing as much and I felt like my skills went down a lot. Now that I’ve been doing physical therapy exercises and can afford to draw more, I’m really excited to practice lots and get my skill level back up");
INSERT INTO pd_picture VALUES(75,6,"./image/picture/75.jpg","女孩|二次元|纹身|下雨|黑长发","2019-02-28 14:33:58","I had a sudden urge to paint iridescent colored hair. It didn't really come out the way I had imagined but I still like the result. The Chinese on her back roughly translates to 'humans must be selfish'");
INSERT INTO pd_picture VALUES(76,6,"./image/picture/76.jpg","女孩|二次元|极光|天空|倒影|小提琴|白裙","2019-02-28 14:33:59","I don't normally do commissions but MrSuicideSheep on Youtube wanted something to celebrate their 10 mil subscriber, and since I always listen to their channel when I draw, it was only fitting. They wanted something with the themes of music, sky, and reflections ");
INSERT INTO pd_picture VALUES(77,6,"./image/picture/77.jpg","女孩|二次元|白裙|秋天|风|舞蹈|花","2019-02-28 14:34:00","Another photoshop brush painting I did last week. Feels like I'm slowly getting the hang of the program :D I've been really into painting translucent hair and dresses. I just love the way light filters through them.");
INSERT INTO pd_picture VALUES(78,6,"./image/picture/78.jpg","男孩|二次元|小提琴|天空|云彩","2019-02-28 14:34:01","Tomorrow, and tomorrow, and tomorrow,Creeps in this petty pace from day to day,To the last syllable of recorded time;And all our yesterdays have lighted foolsThe way to dusty death. Out, out, brief candle!Life's but a walking shadow, a poor player,That struts and frets his hour upon the stage,And then is heard no more. It is a taleTold by an idiot, full of sound and fury,Signifying nothing.");
INSERT INTO pd_picture VALUES(79,6,"./image/picture/79.jpg","女孩|二次元|日落|城市|摄影|红发|风","2019-02-28 14:34:02","New painting of Robin :D I guess drawing Frey reminded me of how much I miss drawing in my old styles. I really enjoyed trying all the new styles and techniques lately but it’s just so nice to paint the way I’m used to lol");
INSERT INTO pd_picture VALUES(80,6,"./image/picture/80.jpg","动物|二次元|天空|鲲","2019-02-28 14:34:03","Inspired by my hike the other day, except I really wanted there to be a giant fish swimming in the clouds :3");
INSERT INTO pd_picture VALUES(81,6,"./image/picture/81.jpg","女孩|自画像|艺术","2019-02-28 14:34:04","I was still feeling art blocked so I just kept doing more practice studies. It's of Jessie Li again, I think I just really like her angry face lol.The original photo didn't have Chinese word on her face. The word means 'I'. ");
INSERT INTO pd_picture VALUES(82,6,"./image/picture/82.jpg","女孩|二次元|架子鼓|暴风雨|黑天鹅","2019-02-28 14:34:05","In other news, it's that time of the year again :D Convention season is kicking into full swing and I'm so excited to see all my con friends at Fanime again this year! It's at the San Jose Convention Center in CA, from Friday to Monday. I'll be in the artist alley at table 912 with my art as usual. Come by and chat!");
INSERT INTO pd_picture VALUES(83,6,"./image/picture/83.jpg","女孩|二次元|植物|温室|盆栽","2019-02-28 14:34:06","It's been so cold lately that I find it hard to draw. Frozen fingers are no good for painting.I'm dreaming of the warm sunny day in a greenhouse of plants ");
INSERT INTO pd_picture VALUES(84,6,"./image/picture/84.jpg","男孩|二次元|反乌托邦|庞克","2019-02-28 14:34:07","A quick paint-over test of the 3D models and background setting before I begin production of the next chapter! :D Soooooooon");
INSERT INTO pd_picture VALUES(85,6,"./image/picture/85.jpg","男孩|二次元|都市|中国风|风筝","2019-02-28 14:34:08","Full view of the Knite environment paint over test :D Now that all the 3D models are finished, I can begin paint over the 3D renders to make the comic pages without breaking my hands! ");
INSERT INTO pd_picture VALUES(86,6,"./image/picture/86.jpg","女孩|二次元|摩托车|天空|旅行|云彩","2019-02-28 14:34:09","On this journey of life, don't forget to look up and take in the sky.");
INSERT INTO pd_picture VALUES(87,6,"./image/picture/87.jpg","女孩|二次元|都市|绘画|植物","2019-02-28 14:34:10","I will not sit,I will not lie,I will take my stand,and show the world,my vision,of a better tomorrow");
INSERT INTO pd_picture VALUES(88,6,"./image/picture/88.jpg","女孩|二次元|舒服|铁链|乌鸦","2019-02-28 14:34:11","A new interpretation of one of my old drawings of the same title from 6 years ago.");
INSERT INTO pd_picture VALUES(89,6,"./image/picture/89.jpg","女孩|二次元|鲜艳|壁画|绘画","2019-02-28 14:34:12","这里是作品的小合集哦~");
INSERT INTO pd_picture VALUES(90,6,"./image/picture/90.jpg","女孩|二次元|绘画|鲜艳|末日|独处","2019-02-28 14:34:13","Even when the world is filled with sorrow,I will keep painting for that better tomorrow ");
INSERT INTO pd_picture VALUES(91,6,"./image/picture/91.jpg","女孩|二次元|坠落|天空|云彩","2019-02-28 14:34:14","On the plane ride back from Japan, the clouds were so beautiful I wanted to fall through them. I used that as the inspiration for the Shelter fanart ");
INSERT INTO pd_picture VALUES(92,6,"./image/picture/92.jpg","动物|二次元|森林|鹿|鸭子","2019-02-28 14:34:15","This is a very old idea that's been floating around in my head for about 6 years. It was originally a sculpture I made in high school but my baby brothers broke it before I could get any pictures...");
INSERT INTO pd_picture VALUES(93,6,"./image/picture/93.jpg","女孩|二次元|狐狸|动物","2019-02-28 14:34:16","These brief moments we share.");
INSERT INTO pd_picture VALUES(94,6,"./image/picture/94.jpg","女孩|二次元|狐狸|动物","2019-02-28 14:34:17","Spirited Away is my second favorite Miyazaki movie and it's long overdue for a fanart ");
INSERT INTO pd_picture VALUES(95,6,"./image/picture/95.jpg","女孩|二次元|狐狸|动物","2019-02-28 14:34:18","To see with eyes unclouded by hate.");
INSERT INTO pd_picture VALUES(96,6,"./image/picture/96.jpg","女孩|二次元|绿发|长发|裸露","2019-02-28 14:34:19","The tedious process of combing out bedhead each morning... Who else feels this pain?");
INSERT INTO pd_picture VALUES(97,6,"./image/picture/97.jpg","女孩|二次元|动物|鱼|融合","2019-02-28 14:34:20","A painting I finished months ago on the concept of pathological liars.");
INSERT INTO pd_picture VALUES(98,6,"./image/picture/98.jpg","天空|二次元|云彩|日落|星空","2019-02-28 14:34:21","Inspired by a hike I had with my SO. We started in the morning and hiked the entire day until the stars came out. It was magical seeing the blue sky turn to red, dotted with clouds of all shapes and colors, and finally the starry night with the faintest trace of the Milky Way. We live our stressful and hectic days, but it's calming to step back and remember no matter what's happening in our lives, the sun will rise and set, painting the skies in a menagerie of emotions. We all have to do is look up and breathe.");
INSERT INTO pd_picture VALUES(99,6,"./image/picture/99.jpg","女孩|二次元|帽子|耳机|微笑","2019-02-28 14:34:22","remember to have fun and be creative with your photo");
INSERT INTO pd_picture VALUES(100,6,"./image/picture/100.jpg","女孩|二次元|相机|抹胸|都市","2019-02-28 14:34:23","PSA: the way Robin binds her chest is not the correct or safe way to do so. I chose bandages for the visual appeal. Do no copy her in real life!");
INSERT INTO pd_picture VALUES(101,6,"./image/picture/101.jpg","动物|狼|雪","2019-02-28 14:34:24","Despite the struggle, we carry on. We carry on.");
INSERT INTO pd_picture VALUES(102,7,"./image/picture/102.jpg","女孩|二次元|公主|白丝|睡眠|绘画|幻想","2019-02-28 14:34:25","支持我！");
INSERT INTO pd_picture VALUES(103,7,"./image/picture/103.jpg","女孩|二次元|裸露|太空|巨人","2019-02-28 14:34:26","支持我！");
INSERT INTO pd_picture VALUES(104,7,"./image/picture/104.jpg","二次元|游戏|只狼|皇子","2019-02-28 14:34:27","支持我！");
INSERT INTO pd_picture VALUES(105,7,"./image/picture/105.jpg","女孩|二次元|昆特牌|游戏|白发|酒馆","2019-02-28 14:34:28","支持我！");
INSERT INTO pd_picture VALUES(106,7,"./image/picture/106.jpg","女孩|二次元|游戏|英雄联盟|LOL|阿卡丽","2019-02-28 14:34:29","支持我！");
INSERT INTO pd_picture VALUES(107,7,"./image/picture/107.jpg","女孩|二次元|动物|蛇|裸露|红发","2019-02-28 14:34:30","支持我！");
INSERT INTO pd_picture VALUES(108,7,"./image/picture/108.jpg","女孩|二次元|黑发|性感|游戏","2019-02-28 14:34:31","支持我！");
INSERT INTO pd_picture VALUES(109,7,"./image/picture/109.jpg","女孩|二次元|黑天鹅|裸露|孤独","2019-02-28 14:34:32","支持我！");
INSERT INTO pd_picture VALUES(110,7,"./image/picture/110.jpg","女孩|二次元|绘画|教堂|公主","2019-02-28 14:34:33","支持我！");
INSERT INTO pd_picture VALUES(111,7,"./image/picture/111.jpg","女孩|二次元|公主|乌鸦|宫殿","2019-02-28 14:34:34","支持我！");
INSERT INTO pd_picture VALUES(112,7,"./image/picture/112.jpg","女孩|二次元|鳞甲|蒙面|出嫁","2019-02-28 14:34:35","支持我！");
INSERT INTO pd_picture VALUES(113,7,"./image/picture/113.jpg","女孩|二次元|女王|甲胄|精灵","2019-02-28 14:34:36","支持我！");
INSERT INTO pd_picture VALUES(114,7,"./image/picture/114.jpg","女孩|二次元|阿什|游戏|帽子","2019-02-28 14:34:37","支持我！");
INSERT INTO pd_picture VALUES(115,7,"./image/picture/115.jpg","女孩|二次元|玛利亚夫人|帽子|武装|枪|剑","2019-02-28 14:34:38","支持我！");
INSERT INTO pd_picture VALUES(116,7,"./image/picture/116.jpg","女孩|二次元|黑天鹅|白天鹅|长裙","2019-02-28 14:34:39","支持我！");
INSERT INTO pd_picture VALUES(117,7,"./image/picture/117.jpg","女孩|二次元|幻想|2B|权御","2019-02-28 14:34:40","支持我！");
INSERT INTO pd_picture VALUES(118,7,"./image/picture/118.jpg","女孩|二次元|摩托车|独角兽|活力","2019-02-28 14:34:41","支持我！");
INSERT INTO pd_picture VALUES(119,7,"./image/picture/119.jpg","女孩|二次元|花瓣|风|美人痣","2019-02-28 14:34:42","支持我！");
INSERT INTO pd_picture VALUES(120,7,"./image/picture/120.jpg","男孩|二次元|游戏|战神","2019-02-28 14:34:43","支持我！");
INSERT INTO pd_picture VALUES(121,7,"./image/picture/121.jpg","女孩|二次元|风景|长发|黑发","2019-02-28 14:34:44","支持我！");
INSERT INTO pd_picture VALUES(122,7,"./image/picture/122.jpg","女孩|二次元|战斗|动物|狮子|剑","2019-02-28 14:34:45","支持我！");
INSERT INTO pd_picture VALUES(123,7,"./image/picture/123.jpg","女孩|男孩|二次元|幻想|剑|琵琶","2019-02-28 14:34:46","支持我！");
INSERT INTO pd_picture VALUES(124,7,"./image/picture/124.jpg","女孩|二次元|大长腿|摩托车|棒棒糖","2019-02-28 14:34:47","支持我！");
INSERT INTO pd_picture VALUES(125,7,"./image/picture/125.jpg","女孩|二次元|甲胄|棕发|长耳|精灵","2019-02-28 14:34:48","支持我！");
INSERT INTO pd_picture VALUES(126,7,"./image/picture/126.jpg","女孩|二次元|独角兽|金属","2019-02-28 14:34:49","支持我！");
INSERT INTO pd_picture VALUES(127,7,"./image/picture/127.jpg","女孩|二次元|幻想|坠落|哭泣","2019-02-28 14:34:50","支持我！");
INSERT INTO pd_picture VALUES(128,7,"./image/picture/128.jpg","女孩|二次元|剑|美人痣|白发","2019-02-28 14:34:51","支持我！");
INSERT INTO pd_picture VALUES(129,7,"./image/picture/129.jpg","女孩|二次元|王座|甲胄|哭泣|白发","2019-02-28 14:34:52","支持我！");
INSERT INTO pd_picture VALUES(130,7,"./image/picture/130.jpg","女孩|二次元|小提琴|白发","2019-02-28 14:34:53","支持我！");
INSERT INTO pd_picture VALUES(131,7,"./image/picture/131.jpg","女孩|二次元|2B|剑|白发|美人痣","2019-02-28 14:34:54","支持我！");
INSERT INTO pd_picture VALUES(132,7,"./image/picture/132.jpg","女孩|二次元|扑倒|角斗场","2019-02-28 14:34:55","支持我！");
INSERT INTO pd_picture VALUES(133,7,"./image/picture/133.jpg","女孩|二次元|游戏|守望先锋|D.va","2019-02-28 14:34:56","支持我！");
INSERT INTO pd_picture VALUES(134,7,"./image/picture/134.jpg","女孩|男孩|二次元|守护|甲胄|战火","2019-02-28 14:34:57","支持我！");
INSERT INTO pd_picture VALUES(135,7,"./image/picture/135.jpg","女孩|二次元|军队|甲胄","2019-02-28 14:34:58","支持我！");
INSERT INTO pd_picture VALUES(136,7,"./image/picture/136.jpg","女孩|二次元|裸露|刺青|短发","2019-02-28 14:34:59","支持我！");

/*pd_favorites收藏夹表*/
INSERT INTO pd_favorites VALUES(1,2);
INSERT INTO pd_favorites VALUES(1,7);
INSERT INTO pd_favorites VALUES(1,13);
INSERT INTO pd_favorites VALUES(1,28);
INSERT INTO pd_favorites VALUES(1,29);
INSERT INTO pd_favorites VALUES(1,32);
INSERT INTO pd_favorites VALUES(1,53);
INSERT INTO pd_favorites VALUES(1,67);
INSERT INTO pd_favorites VALUES(1,80);
INSERT INTO pd_favorites VALUES(1,92);
INSERT INTO pd_favorites VALUES(1,103);
INSERT INTO pd_favorites VALUES(1,113);
INSERT INTO pd_favorites VALUES(1,115);
INSERT INTO pd_favorites VALUES(2,1);
INSERT INTO pd_favorites VALUES(2,11);
INSERT INTO pd_favorites VALUES(2,38);
INSERT INTO pd_favorites VALUES(2,41);
INSERT INTO pd_favorites VALUES(2,68);
INSERT INTO pd_favorites VALUES(2,82);
INSERT INTO pd_favorites VALUES(2,103);
INSERT INTO pd_favorites VALUES(2,117);
INSERT INTO pd_favorites VALUES(3,10);
INSERT INTO pd_favorites VALUES(3,14);
INSERT INTO pd_favorites VALUES(3,19);
INSERT INTO pd_favorites VALUES(3,23);
INSERT INTO pd_favorites VALUES(3,42);
INSERT INTO pd_favorites VALUES(3,46);
INSERT INTO pd_favorites VALUES(3,73);
INSERT INTO pd_favorites VALUES(3,74);
INSERT INTO pd_favorites VALUES(3,84);
INSERT INTO pd_favorites VALUES(3,89);
INSERT INTO pd_favorites VALUES(3,97);
INSERT INTO pd_favorites VALUES(3,99);
INSERT INTO pd_favorites VALUES(3,111);
INSERT INTO pd_favorites VALUES(3,127);
INSERT INTO pd_favorites VALUES(4,81);
INSERT INTO pd_favorites VALUES(4,92);
INSERT INTO pd_favorites VALUES(4,99);
INSERT INTO pd_favorites VALUES(4,101);
INSERT INTO pd_favorites VALUES(4,107);
INSERT INTO pd_favorites VALUES(4,110);
INSERT INTO pd_favorites VALUES(4,115);
INSERT INTO pd_favorites VALUES(4,120);
INSERT INTO pd_favorites VALUES(4,124);
INSERT INTO pd_favorites VALUES(4,126);
INSERT INTO pd_favorites VALUES(5,36);
INSERT INTO pd_favorites VALUES(5,37);
INSERT INTO pd_favorites VALUES(5,59);
INSERT INTO pd_favorites VALUES(5,83);
INSERT INTO pd_favorites VALUES(5,102);
INSERT INTO pd_favorites VALUES(6,3);
INSERT INTO pd_favorites VALUES(6,5);
INSERT INTO pd_favorites VALUES(6,25);
INSERT INTO pd_favorites VALUES(6,29);
INSERT INTO pd_favorites VALUES(6,54);
INSERT INTO pd_favorites VALUES(6,59);
INSERT INTO pd_favorites VALUES(6,64);
INSERT INTO pd_favorites VALUES(6,85);
INSERT INTO pd_favorites VALUES(6,93);
INSERT INTO pd_favorites VALUES(6,117);
INSERT INTO pd_favorites VALUES(6,118);
INSERT INTO pd_favorites VALUES(6,124);
INSERT INTO pd_favorites VALUES(7,33);
INSERT INTO pd_favorites VALUES(7,44);
INSERT INTO pd_favorites VALUES(7,55);
INSERT INTO pd_favorites VALUES(7,66);
INSERT INTO pd_favorites VALUES(7,77);

/*pd_loveuser关注表*/
INSERT INTO pd_loveuser VALUES(1,2);
INSERT INTO pd_loveuser VALUES(2,1);
INSERT INTO pd_loveuser VALUES(2,5);
INSERT INTO pd_loveuser VALUES(2,7);
INSERT INTO pd_loveuser VALUES(4,2);
INSERT INTO pd_loveuser VALUES(4,6);
INSERT INTO pd_loveuser VALUES(5,3);
INSERT INTO pd_loveuser VALUES(5,4);
INSERT INTO pd_loveuser VALUES(5,6);
INSERT INTO pd_loveuser VALUES(5,7);
INSERT INTO pd_loveuser VALUES(7,1);
INSERT INTO pd_loveuser VALUES(7,6);