drop database if exists biggalaxy;

create database biggalaxy;

use biggalaxy;

/* Create Tables */


/* チケット内容 */
/*
 * ticket_id チケットID(自動)
 * name チケット名
 * date 日付
 * time 時間
 * stock 在庫
 * unit_price チケット金額
 * place 会場
 * detail チケット説明
 */
CREATE TABLE ticket_info
(
	ticket_id int(8) NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	date date NOT NULL,
	time varchar(15) NOT NULL,
	stock int(6) NOT NULL,
	unit_price int(5) NOT NULL,
	detail text NOT NULL,
	PRIMARY KEY (ticket_id)
);

/* チケット内容 by YUKA TAKANO */
/*
 * id チケットID
 * modal モーダル名
 * name チケット名
 * date 日付
 * amtime AM時間
 * pmtime AM時間
 * nighttime AM時間
 * price チケット金額
 * place 会場
 * image 画像
 * text チケット簡易説明
 * detail チケット説明
 */
CREATE TABLE tickets_info
(
	id int(8) NOT NULL,
	modal varchar(15) NOT NULL,
	name varchar(50) NOT NULL,
	amtime varchar(15) NOT NULL,
	pmtime varchar(15) NOT NULL,
	nighttime varchar(15),
	price int(5) NOT NULL,
	place varchar(50) NOT NULL,
	image varchar(50) NOT NULL,
	text varchar(150) NOT NULL,
	detail text NOT NULL,
	PRIMARY KEY (id)
);

/* チケット在庫 by YUKA TAKANO */
/*
 * name チケット名
 * date 日付
 * amstock AMstock
 * pmstock PMstock
 * nightstock Nightstock
 */

CREATE TABLE tickets_stock
(
	id int(8) NOT NULL,
	amstock int(10) NOT NULL,
	pmstock int(10) NOT NULL,
	nightstock int(10) NOT NULL
);

/* 会員情報 */
/*
 * user_id 会員ID(自動)
 * name 氏名
 * phonetic ふりがな
 * e_mail メール
 * password パスワード
 * tel_num 電話
 * postal 郵便番号
 * address 住所
 */
CREATE TABLE user_info
(
	user_id int(8) NOT NULL AUTO_INCREMENT,
	name varchar(1000) NOT NULL,
	phonetic varchar(1000) NOT NULL,
	e_mail varchar(100) NOT NULL,
	password varchar(16) NOT NULL,
	tel_num varchar(11) NOT NULL,
	postal varchar(9) NOT NULL,
	address varchar(100) NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (e_mail)
);

CREATE TABLE creditcard
(
	creditcard_id int(8) NOT NULL AUTO_INCREMENT,
	user_id int(8) NOT NULL,
	company int(1) NOT NULL,
	number bigint(16) NOT NULL,
	name varchar(50) NOT NULL,
	year varchar(2) NOT NULL,
	month varchar(2) NOT NULL,
	code int(4) NOT NULL,
	PRIMARY KEY (creditcard_id),
	foreign key(user_id)references user_info(user_id)
);

CREATE TABLE order_info
(
	ticket_id int(8) NOT NULL,
	quantity int(8) NOT NULL,
	total int(8) NOT NULL,
	method int(1) NOT NULL,
	creditcard_id int(8),
	purchase timestamp DEFAULT current_timestamp NOT NULL,
	user_id int(8) NOT NULL,
	foreign key(ticket_id)references ticket_info(ticket_id),
	foreign key(user_id)references user_info(user_id),
	foreign key(creditcard_id)references creditcard(creditcard_id)
);

CREATE TABLE administer
(
	id varchar(10) NOT NULL,
	password varchar(10) NOT NULL,
	login boolean NOT NULL
);

CREATE TABLE sign_out_reason
(
	a int(3) DEFAULT 0,
	b int(3) DEFAULT 0,
	c int(3) DEFAULT 0,
	d int(3) DEFAULT 0,
	e int(3) DEFAULT 0,
	other text
);

/* チケット内容 */
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("プラネタリウムカフェ",curdate(),"9:20～10:00",10,500,"「プラネタリウムStarlight Cafe」朝昼夕と三部構成によるプログラムを高性能プロジェクターでお楽しみいただけます。朝は、ドーム全天に映し出される美しい宇宙を。昼は、日本三大流星群のふたご座流星群を。夕方には、大人の方向けのロマンチックなヒーリングプログラムをお送りいたします。カフェでくつろぎながら贅沢なひと時をお楽しみいただけます。");
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("キッズプラネタリウム",curdate(),"10:00～11:00",10,1000,"幼児・小学生低学年のお子様を対象にした、“こんやのほしぞら”では、お子様向けにやさしい星空の解説でお送ります。「たなばた　ものがたり」鳥の「かささぎ君」と一緒に、おりひめ様、ひこ星様に会いにいきましょう。お子様に教えたい「たなばた」のお話しを、天の川の下でお楽しみください。「ギャラクシティ」講師の方とぺケモンのお星様を一緒に見つけよう！もちろん土星などの惑星も見ることが出来ます☆カーペットを敷いた桟敷席｢ごろごろはらっぱ｣で家族みんなで寝そべりながらのんびり過ごしてみてはいかがでしょうか。");
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("宇宙と惑星",curdate(),"10:00～11:00",10,1000,"惑星は国際天文学連合により「ほぼ球形の形状をとるのに十分な質量がある」「恒星を回る軌道を取り、かつ恒星でも衛星でない」「その軌道の周辺で他の天体を一掃してしまっている」天体として定義されています。太陽系では「水星」「金星」「地球」「火星」「木星」「土星」「天王星」「海王星」のことを指し、太陽系外で見つかっている惑星のことは系外惑星と呼ばれ、恒星近くを周る巨大な惑星、ホットジュピターなど太陽系の常識とは全く異なったものも多く見つかっています。");
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("冬の星座",curdate(),"11:00～11:40",10,800,"冬は一年中でもっとも星空がきれいな季節です。オリオン座のベテルギウス、左下にあるおおいぬ座のシリウス、そして左にあるこいぬ座のプロキオンが「冬の大三角」を成す3つの星。これだけにとどまらず、シリウスとプロキオン、ふたご座のポルックス、ぎょしゃ座のカペラ、おうし座のアルデバラン、オリオン座のリゲルという、1等星に限定しても「冬のダイヤモンド」が作れるその豪華さはまさにダイヤモンド級。ほかの季節にくらべて、より星空の印象が強い季節でもあります。");
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("夏の星座",curdate(),"9:20～10:00",10,800,"夏といえば、やっぱり夏の大三角！夏の星座には、こと座、わし座、はくちょう座、てんびん座、さそり座、いて座、りゅう座、へびつかい座、ヘルクレス座などがある。七夕の「おりひめ」と「ひこぼし」にあたること座のベガとわし座のアルタイル、そしてはくちょう座のデネブは「夏の大三角」として夏の夜をすずやかに彩ってくれる。この三角形に囲まれた部分には、や（矢）座、こぎつね座というややマイナーな星座もあるので、星のきれいなところに出かけて探してみるとちょっと通を気取れるかも？");
insert into ticket_info(name,date,time,stock,unit_price,detail)
values("流星群ヒーリング",curdate(),"10:00～11:00",10,1000,"松谷　隆さん（まつたに　たかし）のピアノをバックにペルセウス座流星群を紹介します。ペルセウス座流星群は毎年8月12日、13日頃を中心に活動するとても観察しやすい流星群です。毎年、ほぼ確実に、たくさんの流星が出現することがその理由のひとつです。40個以上の流星を見ることができます。大切な人と夜空を眺めてみてはいかがでしょうか。ナレーションは女優の多部　未華さん（たべ　みか）。静謐（せいひつ）な雰囲気にぴったりの透明感あふれる声で、未知なる世界へといざないます。");


/* チケット内容 by YUKA TAKANO
 * イテレータを使用し、TOP内に表記させています。 */
insert into tickets_info(id,modal,name,amtime,pmtime,nighttime,price,place,image,text,detail)
values(1,"modal1","プラネタリウムカフェ","9:20～10:00","12:00～12:40","18:00～18:40",500,"1F マーキュリールーム","1.jpg","朝昼晩の3部構成で行われています。外を歩き疲れたあなたへ贅沢なひと時を。定番のデートはもちろんちょっとした女子会にもお勧めです。","「プラネタリウムStarlight Cafe」朝昼夕と三部構成によるプログラムを高性能プロジェクターでお楽しみいただけます。朝は、ドーム全天に映し出される美しい宇宙を。昼は、日本三大流星群のふたご座流星群を。夕方には、大人の方向けのロマンチックなヒーリングプログラムをお送りいたします。カフェでくつろぎながら贅沢なひと時をお楽しみいただけます。");
insert into tickets_info(id,modal,name,amtime,pmtime,price,place,image,text,detail)
values(2,"modal2","キッズプラネタリウム","10:00～11:00","15:00～16:00",1000,"2F ヴィーナスルーム","2.jpg","幼児・小学生低学年のお子様を対象にした、わかりやすいプラネタリウム番組。小さなお子さま向けにやさしい星空の解説でお送ります。","幼児・小学生低学年のお子様を対象にした、“こんやのほしぞら”では、お子様向けにやさしい星空の解説でお送ります。「たなばた　ものがたり」鳥の「かささぎ君」と一緒に、おりひめ様、ひこ星様に会いにいきましょう。お子様に教えたい「たなばた」のお話しを、天の川の下でお楽しみください。「ギャラクシティ」講師の方とぺケモンのお星様を一緒に見つけよう！もちろん土星などの惑星も見ることが出来ます☆カーペットを敷いた桟敷席｢ごろごろはらっぱ｣で家族みんなで寝そべりながらのんびり過ごしてみてはいかがでしょうか。");
insert into tickets_info(id,modal,name,amtime,pmtime,price,place,image,text,detail)
values(3,"modal3","宇宙と惑星","10:00～11:00","17:00～18:00",1000,"3F アースルーム","3.jpg","宇宙の始まりから惑星の始まり。たくさんの世界が広がる瞬間を大迫力のスクリーンでお届けいたします。","惑星は国際天文学連合により「ほぼ球形の形状をとるのに十分な質量がある」「恒星を回る軌道を取り、かつ恒星でも衛星でない」「その軌道の周辺で他の天体を一掃してしまっている」天体として定義されています。太陽系では「水星」「金星」「地球」「火星」「木星」「土星」「天王星」「海王星」のことを指し、太陽系外で見つかっている惑星のことは系外惑星と呼ばれ、恒星近くを周る巨大な惑星、ホットジュピターなど太陽系の常識とは全く異なったものも多く見つかっています。");
insert into tickets_info(id,modal,name,amtime,pmtime,price,place,image,text,detail)
values(4,"modal4","冬の星座","11:00～11:40","16:00～16:40",800,"4F マーズルーム","4.jpg","一年を通して星が一番美しく見える冬。星を見つけるのが苦手なあなたもお気に入りが見つかるかも。冬のダイヤモンドをぜひ探してみてください。","冬は一年中でもっとも星空がきれいな季節です。オリオン座のベテルギウス、左下にあるおおいぬ座のシリウス、そして左にあるこいぬ座のプロキオンが「冬の大三角」を成す3つの星。これだけにとどまらず、シリウスとプロキオン、ふたご座のポルックス、ぎょしゃ座のカペラ、おうし座のアルデバラン、オリオン座のリゲルという、1等星に限定しても「冬のダイヤモンド」が作れるその豪華さはまさにダイヤモンド級。ほかの季節にくらべて、より星空の印象が強い季節でもあります。");
insert into tickets_info(id,modal,name,amtime,pmtime,price,place,image,text,detail)
values(5,"modal5","夏の星座","9:20～10:00","13:00～13:40",800,"5F ジュピタールーム","5.jpg","夏といえば、やっぱり夏の大三角！有名な星からマイナーな星まで夜空を彩ります。通になりたいあなた向けのプログラムをお送りいたします！","夏といえば、やっぱり夏の大三角！夏の星座には、こと座、わし座、はくちょう座、てんびん座、さそり座、いて座、りゅう座、へびつかい座、ヘルクレス座などがある。七夕の「おりひめ」と「ひこぼし」にあたること座のベガとわし座のアルタイル、そしてはくちょう座のデネブは「夏の大三角」として夏の夜をすずやかに彩ってくれる。この三角形に囲まれた部分には、や（矢）座、こぎつね座というややマイナーな星座もあるので、星のきれいなところに出かけて探してみるとちょっと通を気取れるかも？");
insert into tickets_info(id,modal,name,amtime,pmtime,price,place,image,text,detail)
values(6,"modal6","流星群ヒーリング","10:00～11:00","16:00～17:00",1000,"6F サターンルーム","6.jpg","美しいピアノ演奏をバックに流星群をお楽しみいただけます。ナレーションに多部未華さんをお迎えしました。心が洗われるひと時をお楽しみください。","松谷　隆さん（まつたに　たかし）のピアノをバックにペルセウス座流星群を紹介します。ペルセウス座流星群は毎年8月12日、13日頃を中心に活動するとても観察しやすい流星群です。毎年、ほぼ確実に、たくさんの流星が出現することがその理由のひとつです。40個以上の流星を見ることができます。大切な人と夜空を眺めてみてはいかがでしょうか。ナレーションは女優の多部　未華さん（たべ　みか）。静謐（せいひつ）な雰囲気にぴったりの透明感あふれる声で、未知なる世界へといざないます。");

/* チケット内容 by YUKA TAKANO */
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(1,20,20,20);
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(2,20,20,20);
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(3,20,20,20);
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(4,20,20,20);
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(5,20,20,20);
insert into tickets_stock(id,amstock,pmstock,nightstock)
values(6,20,20,20);
