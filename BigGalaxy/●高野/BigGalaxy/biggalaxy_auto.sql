use biggalaxy

delete from tickets_stock where date < CURDATE();

insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�v���l�^���E���J�t�F",curdate()+3,20,20,20);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�L�b�Y�v���l�^���E��",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�F���Ƙf��",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�~�̐���",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�Ă̐���",curdate()+3,20,20,0);
insert into tickets_stock(name,day,amstock,pmstock,nightstock)
values("�����Q�q�[�����O",curdate()+3,20,20,0);
