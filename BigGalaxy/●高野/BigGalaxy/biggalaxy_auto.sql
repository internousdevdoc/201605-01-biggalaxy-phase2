use biggalaxy

delete from tickets_stock where date < CURDATE();

insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("プラネタリウムカフェ",curdate()+3,20,20,20);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("キッズプラネタリウム",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("宇宙と惑星",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("冬の星座",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("夏の星座",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("流星群ヒーリング",curdate()+3,20,20,0);
