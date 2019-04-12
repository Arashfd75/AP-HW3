insert into t_user values(1,'arashfd', '09120000001', 'arash.fd75@gmail.com',
'12345678', 'arash', 'farahdel','12234' );
insert into t_user values(2,'assef_gh', '09120000002', 'asef_gh@gmail.com',
'12345678', 'asef', 'ghamisi','12235' );
insert into t_user values(3,'mr.hallaj', '09120000003', 'mamraz75@gmail.com',
'12345678', 'mohammadreza', 'hallajiyan','12236' );
insert into t_user values(4,'ahmad.nazari', '09350000001', 'ahmad.nz@gmail.com',
'12345678', 'ahmadreza', 'nazari','12237' );
insert into t_user values(5,'a', '09120000005', 'a@gmail.com',
'12345678', 'a', 'a','12234' );
insert into t_user values(6,'b', '09120000006', 'b@gmail.com',
'12345678', 'b', 'b','12235' );
insert into t_user values(7,'c', '09120000007', 'c@gmail.com',
'12345678', 'c', 'c','12236' );
insert into t_user values(8,'d', '09350000008', 'd@gmail.com',
'12345678', 'd', 'd','12237' );
insert into t_user values(9,'aps', '09350000008', 'apstudent2019@gmail.com',
'12345678', 'ap', 'student','12237' );
insert into t_user values(10,'sHDiV4RHh', '09350000029', 'shdivar@gmail.com',
'12345678', 'mehdi', 'naseri','12237' );
insert into t_user values(11,'amir.jahanshahi', '09350000030', 'amir.js@gmail.com',
'12345678', 'amir', 'jahanshahi','12237' );


insert into channel (id,telegram_id,title,creator_id)
values(1,'aut_ap_2019','ap2019',1);


insert into channel (id,telegram_id,title,creator_id)
values(2,'aut_ap_2018','ap2018',5);


insert into channel (id,telegram_id,title,creator_id)
values(3,'cooking_aut','cooking',3);

insert into channelMembership values(1,1);
insert into channelMembership values(2,1);
insert into channelMembership values(3,1);
insert into channelMembership values(4,1);
insert into channelMembership values(5,2);
insert into channelMembership values(6,2);
insert into channelMembership values(7,3);
insert into channelMembership values(9,1);

--Q6
insert into BlockUser VALUES ('1','2','2019-03-15');
insert into BlockUser VALUES ('2','3','2019-03-16');
------------

INSERT INTO Message(id, sender_id, receiver_id, message_type, message_text, created_at, updated_at)
VALUES(0, '11', '10','text', 'salam bia daftaram', NOW(), NOW());

INSERT INTO Message(id, sender_id, receiver_id, message_type, message_text, created_at, updated_at)
VALUES(0, '10', '11','text', 'bale ostad alan miam', NOW(), NOW());

INSERT INTO ChannelMessage(id, channel_id, message_type, message_text, created_at, updated_at)
VALUES(1, 'aut_ap_2019', 'text', 'the lastest info about channel ...', '2018-01-01', '2018-01-01');
