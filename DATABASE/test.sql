\c postgres
drop database telegram;
create database telegram;
\c telegram;

create table t_user (id serial primary key 
,telegram_id varchar(30) not null
,phone varchar(15) not null
,email varchar(30) not null
,password varchar(20) not null
,first_name varchar(20) not null
,last_name varchar(25) not null
,verify_code varchar(10)
,pro_pic_url varchar(50)
,created_at timestamp
,updated_at timestamp);

create table channel(
    id integer NOT NULL,
    telegram_id varchar(30) not null,
    title varchar(30) not null,
    info varchar(100),
    creator_id integer not null,
    created_at timestamp,
    updated_at timestamp,
    primary key(id),
    foreign key(creator_id) references t_user 
    );

create table channelMembership(
    user_id INTEGER not null,
    channel_id INTEGER not null,
    created_at timestamp,
    primary key(user_id,channel_id),
    foreign key(channel_id) references channel);

create table BlockUser(
    blocker_user_id INTEGER not null,
    blocked_user_id INTEGER not null,
    created_at timestamp not null,
    primary key(blocked_user_id,blocker_user_id),
    foreign key(blocked_user_id) references t_user,
    foreign key(blocker_user_id) references t_user
);

CREATE TABLE Message (
    id integer NOT NULL,
    sender_id VARCHAR(30) NOT NULL,
    receiver_id VARCHAR(30) NOT NULL,
    message_type VARCHAR(7) NOT NULL,
    message_text VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    CHECK (message_type IN('voice', 'video', 'picture', 'text'))
);

CREATE TABLE ChannelMessage (
    id integer NOT NULL,
    channel_id VARCHAR(30) NOT NULL,
    message_type VARCHAR(7) NOT NULL,
    message_text VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    CHECK (message_type IN('voice', 'video', 'picture', 'text'))
);

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


select * from t_user where phone = '09120000001';


update t_user
set email = 'apstudent2019@gmail.com'
where phone = '09120000001';

select channel.title from channel,channelMembership,t_user where t_user.phone = '09120000003' and
                                                                t_user.telegram_id = channelMembership.user_id and
                                                                channelMembership.channel_id = channel.telegram_id;

select count(*)
from channelMembership
where channelMembership.channel_id = 'aut_ap_2019';

select email from t_user where phone like '0935%';

select phone from t_user where t_user.id in(select blocked_user_id from t_user,BlockUser where t_user.phone = '09120000001' and 
                                                t_user.id = BlockUser.blocker_user_id and
                                                now() - BlockUser.created_at < interval '1 month'); 

--Q7 email of admins of channels who have > 3 member & email of one is = " --- " 
--select email from t_user,channel where channel.creator_id = t_user.id 
--having t_user.email = 'apstudent2019@gmail.com'
--and channel.id in(
--select channel_id from channelMembership  
--group by channel_id
--having count(*) > 3);
select email from t_user,channel where channel.creator_id = t_user.id 
and t_user.email = 'apstudent2019@gmail.com'
and channel.id in(
select channel_id from channelMembership  
group by channel_id
having count(*) > 3);

select message_text from Message where sender_id = 'amir.jahanshahi' and receiver_id = 'sHDiV4RHs' OR
                                        sender_id = 'sHDiV4RHs' and receiver_id = 'amir.jahanshahi';

delete from MESSAGE where sender_id = 'amir.jahanshahi' and receiver_id = 'sHDiV4RHs' OR
                        sender_id = 'sHDiV4RHs' and receiver_id = 'amir.jahanshahi';


select phone from t_user where telegram_id in (
    select creator_id from Channel where channel.id IN (
        select id from ChannelMessage
        group by id
        having now() - max(created_at) > INTERVAL '1' MONTH
    )
);