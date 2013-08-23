INSERT INTO radgroupreply (groupname,attribute,op,value) VALUES ('dynamic','Framed-Compression',':=','Van-Jacobsen-TCP-IP'),('dynamic','Framed-Protocol',':=','PPP'),('dynamic','Service-Type',':=','Framed-User'),('dynamic','Acct-Interim-Interval','=','60'),('dynamic','MS-Primary-DNS-Server','=','8.8.8.8');
INSERT INTO radgroupreply (groupname,attribute,op,value) VALUES ('walled_garden','Framed-Compression',':=','Van-Jacobsen-TCP-IP'),('walled_garden','Framed-Protocol',':=','PPP'),('walled_garden','Service-Type',':=','Framed-User'),('walled_garden','Acct-Interim-Interval','=','20'),('walled_garden','MS-Primary-DNS-Server','=','8.8.8.8');
INSERT INTO radippool (pool_name, framedipaddress)
VALUES
	('walled_garden','10.11.12.1'),
	('walled_garden','10.11.12.2'),
	('walled_garden','10.11.12.3'),
	('walled_garden','10.11.12.4'),
	('walled_garden','10.11.12.5'),
	('walled_garden','10.11.12.6'),
	('walled_garden','10.11.12.7'),
	('walled_garden','10.11.12.8'),
	('walled_garden','10.11.12.9'),
	('walled_garden','10.11.12.10'),
	('walled_garden','10.11.12.11'),
	('walled_garden','10.11.12.12'),
	('walled_garden','10.11.12.13'),
	('walled_garden','10.11.12.14'),
	('walled_garden','10.11.12.15'),
	('walled_garden','10.11.12.16'),
	('walled_garden','10.11.12.17'),
	('walled_garden','10.11.12.18'),
	('walled_garden','10.11.12.19'),
	('walled_garden','10.11.12.20'),
	('walled_garden','10.11.12.21'),
	('walled_garden','10.11.12.22'),
	('walled_garden','10.11.12.23'),
	('walled_garden','10.11.12.24'),
	('walled_garden','10.11.12.25'),
	('walled_garden','10.11.12.26'),
	('walled_garden','10.11.12.27'),
	('walled_garden','10.11.12.28'),
	('walled_garden','10.11.12.29'),
	('walled_garden','10.11.12.30');
	
INSERT INTO radippool (pool_name, framedipaddress)
VALUES
	('dynamic','10.11.0.1'),
	('dynamic','10.11.0.2'),
	('dynamic','10.11.0.3'),
	('dynamic','10.11.0.4'),
	('dynamic','10.11.0.5'),
	('dynamic','10.11.0.6'),
	('dynamic','10.11.0.7'),
	('dynamic','10.11.0.8'),
	('dynamic','10.11.0.9'),
	('dynamic','10.11.0.10'),
	('dynamic','10.11.0.11'),
	('dynamic','10.11.0.12'),
	('dynamic','10.11.0.13'),
	('dynamic','10.11.0.14'),
	('dynamic','10.11.0.15'),
	('dynamic','10.11.0.16'),
	('dynamic','10.11.0.17'),
	('dynamic','10.11.0.18'),
	('dynamic','10.11.0.19'),
	('dynamic','10.11.0.20'),
	('dynamic','10.11.0.21'),
	('dynamic','10.11.0.22'),
	('dynamic','10.11.0.23'),
	('dynamic','10.11.0.24'),
	('dynamic','10.11.0.25'),
	('dynamic','10.11.0.26'),
	('dynamic','10.11.0.27'),
	('dynamic','10.11.0.28'),
	('dynamic','10.11.0.29'),
	('dynamic','10.11.0.30');
	
INSERT INTO radgroupcheck (groupname, attribute, op, value)
VALUES
	('walled_garden','Pool-Name',':=','walled_garden'),
	('dynamic','Pool-Name',':=','dynamic');
	
	
INSERT INTO radcheck (username, attribute, op, value) VALUES ('user@ras','Cleartext-Password',':=','password');
INSERT INTO radcheck (username, attribute, op, value) VALUES ('setup@ras','Cleartext-Password',':=','setup');
INSERT INTO radusergroup VALUES ('user@ras','dynamic', 1);
INSERT INTO radusergroup VALUES ('setup@ras','walled_garden', 1);





