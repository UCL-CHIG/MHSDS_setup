/*   Data set up and initial cleaning

Mental Health Services Dataset (MHSDS) version 4.1
Covering financial years (HES years) 2016/17 - 2019/20
Four tables to upload: 
	- MHS001: Master patient index
	- MHS101: Service or team referral 
	- MHS201: Care contact
	- MHS202: Care activity

Cleaning steps included: 
	- remove complete duplicate records
	- create HES year indicator variable for activity in MHS001, MHS101, MHS201, and MHS202

*/

-- Data set up: for each table, create table with variables

CREATE TABLE rekggth_hes_ons.MHDS_master_patient_index_001 (
accommodationnationallatest	tinyint,
accommodationproviderlatest	tinyint,
agedeath	tinyint,
agerepperiodend	tinyint,
agerepperiodstart	tinyint,
county	varchar(9),
defaultpostcode	varchar(8), 
electoralward	varchar(9),
employmentnationallatest	tinyint,
employmentproviderlatest	tinyint,
ethniccategory	varchar(2),
ethniccategory2021	tinyint,
ethnicityhigher	tinyint,
ethnicitylow	tinyint,
gender	char(1),
genderidcode	tinyint,
gendersameatbirth	tinyint,
icrecccg	tinyint,
icrecccgname	tinyint,
icrecicb	tinyint,
icrecicbname	tinyint,
icrecsubicb	tinyint,
icrecsubicbname	tinyint,
imdquart	tinyint,
ladistrictauth	varchar(9),
lsoa2011	varchar(9),
languagecodepreferred	varchar(2),
localpatientid_deid	varchar(20),
maritalstatus	char(1),
nhsnumberstatus	varchar(2),
orgidccgres	char(3),
orgideduestab	varchar(8), 
orgidicbres	tinyint,
orgidlocalpatientid	varchar(5),
orgidprov	varchar(5),
orgidsubicblocresidence	tinyint,
patmrecinrp	varchar(5),
tokenid	char(15),
postcodedistrict	varchar(4),
recordenddate	date,
recordstartdate	date,
regionicrecccg	tinyint,
regionicrecsubicb	tinyint,
regionicrecsubicbname	tinyint,
stpicrecccg	tinyint,
uniqmonthid	mediumint
)
;

-- load in raw data file
LOAD DATA LOCAL INFILE '~filepath/mhs001mpi_pseudo_dars_nic_393510_d6h1d.csv'
	INTO TABLE rekggth_hes_ons.MHDS_master_patient_index_001
	fields terminated by ","
	optionally enclosed by '"'
	lines terminated by "\n"
	ignore 1 lines
    (@accommodationnationallatest, @accommodationproviderlatest, @agedeath, @agerepperiodend, @agerepperiodstart, @county, @defaultpostcode, @electoralward, @employmentnationallatest, 
@employmentproviderlatest, @ethniccategory, @ethniccategory2021, @ethnicityhigher, @ethnicitylow, @gender, @genderidcode, @gendersameatbirth, @icrecccg, @icrecccgname, @icrecicb, 
@icrecicbname, @icrecsubicb, @icrecsubicbname, @imdquart, @ladistrictauth, @lsoa2011, @languagecodepreferred, @localpatientid_deid, @maritalstatus, @nhsnumberstatus, @orgidccgres, 
@orgideduestab, @orgidicbres, @orgidlocalpatientid, @orgidprov, @orgidsubicblocresidence, @patmrecinrp, @tokenid, @postcodedistrict, @recordenddate, @recordstartdate, 
@regionicrecccg, @regionicrecsubicb, @regionicrecsubicbname, @stpicrecccg, @uniqmonthid)
    SET
    accommodationnationallatest = nullif(@accommodationnationallatest, ''), 
accommodationproviderlatest = nullif(@accommodationproviderlatest, ''), 
agedeath = nullif(@agedeath, ''), 
agerepperiodend = nullif(@agerepperiodend, ''), 
agerepperiodstart = nullif(@agerepperiodstart, ''), 
county = nullif(@county, ''), 
defaultpostcode = nullif(@defaultpostcode, ''), 
electoralward = nullif(@electoralward, ''), 
employmentnationallatest = nullif(@employmentnationallatest, ''), 
employmentproviderlatest = nullif(@employmentproviderlatest, ''), 
ethniccategory = nullif(@ethniccategory, ''), 
ethniccategory2021 = nullif(@ethniccategory2021, ''), 
ethnicityhigher = nullif(@ethnicityhigher, ''), 
ethnicitylow = nullif(@ethnicitylow, ''), 
gender = nullif(@gender, ''), 
genderidcode = nullif(@genderidcode, ''), 
gendersameatbirth = nullif(@gendersameatbirth, ''), 
icrecccg = nullif(@icrecccg, ''), 
icrecccgname = nullif(@icrecccgname, ''), 
icrecicb = nullif(@icrecicb, ''), 
icrecicbname = nullif(@icrecicbname, ''), 
icrecsubicb = nullif(@icrecsubicb, ''), 
icrecsubicbname = nullif(@icrecsubicbname, ''), 
imdquart = nullif(@imdquart, ''), 
ladistrictauth = nullif(@ladistrictauth, ''), 
lsoa2011 = nullif(@lsoa2011, ''), 
languagecodepreferred = nullif(@languagecodepreferred, ''), 
localpatientid_deid = nullif(@localpatientid_deid, ''), 
maritalstatus = nullif(@maritalstatus, ''), 
nhsnumberstatus = nullif(@nhsnumberstatus, ''), 
orgidccgres = nullif(@orgidccgres, ''), 
orgideduestab = nullif(@orgideduestab, ''), 
orgidicbres = nullif(@orgidicbres, ''), 
orgidlocalpatientid = nullif(@orgidlocalpatientid, ''), 
orgidprov = nullif(@orgidprov, ''), 
orgidsubicblocresidence = nullif(@orgidsubicblocresidence, ''), 
patmrecinrp = nullif(@patmrecinrp, ''), 
tokenid = nullif(@tokenid, ''), 
postcodedistrict = nullif(@postcodedistrict, ''), 
recordenddate = nullif(@recordenddate, ''), 
recordstartdate = nullif(@recordstartdate, ''), 
regionicrecccg = nullif(@regionicrecccg, ''), 
regionicrecsubicb = nullif(@regionicrecsubicb, ''), 
regionicrecsubicbname = nullif(@regionicrecsubicbname, ''), 
stpicrecccg = nullif(@stpicrecccg, ''), 
uniqmonthid = nullif(@uniqmonthid, '')
    ;
    
-- Create index on primary key(s)
CREATE INDEX tpid on rekggth_hes_ons.MHDS_master_patient_index_001 (tokenid);


-- Same process repeated for MHS101

CREATE TABLE rekggth_hes_ons.MHDS_referrals_101 (
ageservreferdischdate	tinyint,
ageservreferrecdate	tinyint,
clinrespprioritytype	char(1),
countattendedcarecontactsinfinan	tinyint,
countofattendedcarecontacts	tinyint,
countofattendedcarecontactsinfin	tinyint,
decisiontotreatdate	date,
decisiontotreattime	datetime,
dischplancreationdate	date,
dischplancreationtime	datetime,
dischplanlastupdateddate	date,
dischplanlastupdatedtime	datetime,
firstattendedcontactinfinancialy	tinyint,
firstattendedcontactinrpdate	date,
firstcontacteverdate	date,
firstcontacteverwhereageatcontac	date,
inacttimeref	date, 
localpatientid_deid	varchar(20),
orgidcomm	varchar(5),
orgidprov	varchar(5),
orgidreferring	varchar(19),
tokenid	char(15),
primreasonreferralmh	varchar(2),
recordenddate	date,
recordstartdate	date,
referralrequestreceiveddate	date,
referralrequestreceivedtime	datetime,
referralserviceareasopenendrplda	tinyint,
referralserviceareasstartinginrp	tinyint,
secondattendedcontacteverdate	date,
secondattendedcontactinfinancial	date,
secondcontacteverwhereageatconta	date,
servdischdate	date,
servdischtime	datetime,
servicerequestid_deid	varchar(64),
sourceofreferralmh	varchar(2),
specialisedmhservicecode	varchar(47),
uniqmonthid	mediumint,
uniqservreqid_deid	varchar(64)
)
;

LOAD DATA LOCAL INFILE '~filepath/mhs101referral_pseudo_dars_nic_393510_d6h1d.csv'
	INTO TABLE rekggth_hes_ons.MHDS_referrals_101
	fields terminated by ","
	optionally enclosed by '"'
	lines terminated by "\n"
	ignore 1 lines
    (@ageservreferdischdate, @ageservreferrecdate, @clinrespprioritytype, @countattendedcarecontactsinfinan, @countofattendedcarecontacts, @countofattendedcarecontactsinfin, 
@decisiontotreatdate, @decisiontotreattime, @dischplancreationdate, @dischplancreationtime, @dischplanlastupdateddate, @dischplanlastupdatedtime, @firstattendedcontactinfinancialy, 
@firstattendedcontactinrpdate, @firstcontacteverdate, @firstcontacteverwhereageatcontac, @inacttimeref, @localpatientid_deid, @orgidcomm, @orgidprov, @orgidreferring, @tokenid, 
@primreasonreferralmh, @recordenddate, @recordstartdate, @referralrequestreceiveddate, @referralrequestreceivedtime, @referralserviceareasopenendrplda, @referralserviceareasstartinginrp, 
@secondattendedcontacteverdate, @secondattendedcontactinfinancial, @secondcontacteverwhereageatconta, @servdischdate, @servdischtime, @servicerequestid_deid, @sourceofreferralmh, 
@specialisedmhservicecode, @uniqmonthid, @uniqservreqid_deid)
    SET
    ageservreferdischdate = nullif(@ageservreferdischdate, ''),
ageservreferrecdate = nullif(@ageservreferrecdate, ''),
clinrespprioritytype = nullif(@clinrespprioritytype, ''),
countattendedcarecontactsinfinan = nullif(@countattendedcarecontactsinfinan, ''),
countofattendedcarecontacts = nullif(@countofattendedcarecontacts, ''),
countofattendedcarecontactsinfin = nullif(@countofattendedcarecontactsinfin, ''),
decisiontotreatdate = nullif(@decisiontotreatdate, ''),
decisiontotreattime = nullif(@decisiontotreattime, ''),
dischplancreationdate = nullif(@dischplancreationdate, ''),
dischplancreationtime = nullif(@dischplancreationtime, ''),
dischplanlastupdateddate = nullif(@dischplanlastupdateddate, ''),
dischplanlastupdatedtime = nullif(@dischplanlastupdatedtime, ''),
firstattendedcontactinfinancialy = nullif(@firstattendedcontactinfinancialy, ''),
firstattendedcontactinrpdate = nullif(@firstattendedcontactinrpdate, ''),
firstcontacteverdate = nullif(@firstcontacteverdate, ''),
firstcontacteverwhereageatcontac = nullif(@firstcontacteverwhereageatcontac, ''),
inacttimeref = nullif(@inacttimeref, ''),
localpatientid_deid = nullif(@localpatientid_deid, ''),
orgidcomm = nullif(@orgidcomm, ''),
orgidprov = nullif(@orgidprov, ''),
orgidreferring = nullif(@orgidreferring, ''),
tokenid = nullif(@tokenid, ''),
primreasonreferralmh = nullif(@primreasonreferralmh, ''),
recordenddate = nullif(@recordenddate, ''),
recordstartdate = nullif(@recordstartdate, ''),
referralrequestreceiveddate = nullif(@referralrequestreceiveddate, ''),
referralrequestreceivedtime = nullif(@referralrequestreceivedtime, ''),
referralserviceareasopenendrplda = nullif(@referralserviceareasopenendrplda, ''),
referralserviceareasstartinginrp = nullif(@referralserviceareasstartinginrp, ''),
secondattendedcontacteverdate = nullif(@secondattendedcontacteverdate, ''),
secondattendedcontactinfinancial = nullif(@secondattendedcontactinfinancial, ''),
secondcontacteverwhereageatconta = nullif(@secondcontacteverwhereageatconta, ''),
servdischdate = nullif(@servdischdate, ''),
servdischtime = nullif(@servdischtime, ''),
servicerequestid_deid = nullif(@servicerequestid_deid, ''),
sourceofreferralmh = nullif(@sourceofreferralmh, ''),
specialisedmhservicecode = nullif(@specialisedmhservicecode, ''),
uniqmonthid = nullif(@uniqmonthid, ''),
uniqservreqid_deid = nullif(@uniqservreqid_deid, '')
    ;

CREATE INDEX tpid on rekggth_hes_ons.MHDS_referrals_101 (tokenid);
CREATE INDEX servicereq on rekggth_hes_ons.MHDS_referrals_101 (servicerequestid_deid);

-- Same for MHS201

CREATE TABLE rekggth_hes_ons.MHDS_carecontacts_201 (
actloctypecode varchar(3),
admincatcode tinyint,
agecarecontdate tinyint,
attendordnacode varchar(1),
carecontcanceldate date,
carecontcancelreas tinyint,
carecontdate date, 
carecontpatientthermode varchar(3), 
carecontsubj varchar(2),
careconttime datetime, 
carecontactid_deid char(64),
careprofteamlocalid_deid char(64),
clincontdurofcarecont smallint,
comperimhpartassessofferind varchar(2),
consmechanismmh varchar(2), 
constype tinyint, 
contlocdistancehome smallint, 
earliestclinappdate date, 
earliestreasonofferdate date, 
orgidcomm varchar(5), 
orgidprov varchar(5), 
tokenid char(15), 
plannedcarecontindicator varchar(2), 
reasonableadjustmentmade varchar(2), 
servicerequestid_deid char(64),
specialisedmhservicecode varchar(40), 
timereferandcarecontact mediumint, 
uniqcarecontid_deid char(64),
uniqcareprofteamid_deid char(64),
uniqmonthid smallint,
uniqservreqid_deid char(64)
)
;

LOAD DATA LOCAL INFILE '~filepath/mhs201carecontact_pseudo_dars_nic_393510_d6h1d.csv'
	INTO TABLE rekggth_hes_ons.MHDS_carecontacts_201
	fields terminated by ","
	optionally enclosed by '"'
	lines terminated by "\n"
	ignore 1 lines
	(@actloctypecode, @admincatcode, @agecarecontdate, @attendordnacode, @carecontcanceldate, 
@carecontcancelreas, @carecontdate, @carecontpatientthermode, @carecontsubj, @careconttime, 
@carecontactid_deid, @careprofteamlocalid_deid, @clincontdurofcarecont, 
@comperimhpartassessofferind, @consmechanismmh, @constype, @contlocdistancehome, 
@earliestclinappdate, @earliestreasonofferdate, @orgidcomm, @orgidprov, @tokenid, 
@plannedcarecontindicator, @reasonableadjustmentmade, @servicerequestid_deid, 
@specialisedmhservicecode, @timereferandcarecontact, @uniqcarecontid_deid, 
@uniqcareprofteamid_deid, @uniqmonthid, @uniqservreqid_deid)
	SET
actloctypecode = nullif(@actloctypecode, ''),
admincatcode = nullif(@admincatcode, ''),
agecarecontdate = nullif(@agecarecontdate, ''),
attendordnacode = nullif(@attendordnacode, ''),
carecontcanceldate = nullif(@carecontcanceldate, ''),
carecontcancelreas = nullif(@carecontcancelreas, ''),
carecontdate = nullif(@carecontdate, ''),
carecontpatientthermode = nullif(@carecontpatientthermode, ''),
carecontsubj = nullif(@carecontsubj, ''),
careconttime = nullif(@careconttime, ''),
carecontactid_deid = nullif(@carecontactid_deid, ''),
careprofteamlocalid_deid = nullif(@careprofteamlocalid_deid, ''),
clincontdurofcarecont = nullif(@clincontdurofcarecont, ''),
comperimhpartassessofferind = nullif(@comperimhpartassessofferind, ''),
consmechanismmh = nullif(@consmechanismmh, ''),
constype = nullif(@constype, ''),
contlocdistancehome = nullif(@contlocdistancehome, ''),
earliestclinappdate = nullif(@earliestclinappdate, ''),
earliestreasonofferdate = nullif(@earliestreasonofferdate, ''),
orgidcomm = nullif(@orgidcomm, ''),
orgidprov = nullif(@orgidprov, ''),
tokenid = nullif(@tokenid, ''),
plannedcarecontindicator = nullif(@plannedcarecontindicator, ''),
reasonableadjustmentmade = nullif(@reasonableadjustmentmade, ''),
servicerequestid_deid = nullif(@servicerequestid_deid, ''),
specialisedmhservicecode = nullif(@specialisedmhservicecode, ''),
timereferandcarecontact = nullif(@timereferandcarecontact, ''),
uniqcarecontid_deid = nullif(@uniqcarecontid_deid, ''),
uniqcareprofteamid_deid = nullif(@uniqcareprofteamid_deid, ''),
uniqmonthid = nullif(@uniqmonthid, ''),
uniqservreqid_deid = nullif(@uniqservreqid_deid, '')
;

CREATE INDEX tpid on rekggth_hes_ons.MHDS_carecontacts_201 (tokenid);
CREATE INDEX servicereqid on rekggth_hes_ons.MHDS_carecontacts_201 (servicerequestid_deid);
CREATE INDEX carecontactid on rekggth_hes_ons.MHDS_carecontacts_201 (carecontactid_deid);

-- Same for MHS202
CREATE TABLE rekggth_hes_ons.MHDS_care_activity_202 (
careactid_deid	char(64),
carecontactid_deid	char(64),
careproflocalid_deid	char(64),
clincontactdurofcareact	smallint,
codefind	varchar(16),
codeobs	varchar(16),
codeprocandprocstatus	varchar(35),
findschemeinuse	tinyint,
mastericd10findingcode	tinyint,
mastericd10findingdesc	tinyint,
mastersnomedctfindingcode	int,
mastersnomedctfindingterm	tinyint,
mastersnomedctobscode	int,
mastersnomedctobsterm	tinyint,
obsvalue	float,
orgidprov	varchar(5),
tokenid	char(15), 
uniqcareactid_deid	char(64),
uniqcarecontid_deid	char(64),
uniqcareproflocalid_deid	char(64),
uniqmonthid	smallint,
uniqservreqid_deid	char(64),
unitmeasure	varchar(10)
);

LOAD DATA LOCAL INFILE '~filepath/mhs202careactivity_pseudo_dars_nic_393510_d6h1d.csv'
	INTO TABLE rekggth_hes_ons.MHDS_care_activity_202
	fields terminated by ","
	optionally enclosed by '"'
	lines terminated by "\n"
	ignore 1 lines
    (@careactid_deid, @carecontactid_deid, @careproflocalid_deid, @clincontactdurofcareact, @codefind, @codeobs, @codeprocandprocstatus, @findschemeinuse, 
	@mastericd10findingcode, @mastericd10findingdesc, @mastersnomedctfindingcode, @mastersnomedctfindingterm, @mastersnomedctobscode, @mastersnomedctobsterm, 
	@obsvalue, @orgidprov, @tokenid, @uniqcareactid_deid, @uniqcarecontid_deid, @uniqcareproflocalid_deid, @uniqmonthid, @uniqservreqid_deid, @unitmeasure)
    SET
    careactid_deid = nullif(@careactid_deid, ''), 
carecontactid_deid = nullif(@carecontactid_deid, ''), 
careproflocalid_deid = nullif(@careproflocalid_deid, ''), 
clincontactdurofcareact = nullif(@clincontactdurofcareact, ''), 
codefind = nullif(@codefind, ''), 
codeobs = nullif(@codeobs, ''), 
codeprocandprocstatus = nullif(@codeprocandprocstatus, ''), 
findschemeinuse = nullif(@findschemeinuse, ''), 
mastericd10findingcode = nullif(@mastericd10findingcode, ''), 
mastericd10findingdesc = nullif(@mastericd10findingdesc, ''), 
mastersnomedctfindingcode = nullif(@mastersnomedctfindingcode, ''), 
mastersnomedctfindingterm = nullif(@mastersnomedctfindingterm, ''), 
mastersnomedctobscode = nullif(@mastersnomedctobscode, ''), 
mastersnomedctobsterm = nullif(@mastersnomedctobsterm, ''), 
obsvalue = nullif(@obsvalue, ''), 
orgidprov = nullif(@orgidprov, ''), 
tokenid = nullif(@tokenid, ''), 
uniqcareactid_deid = nullif(@uniqcareactid_deid, ''), 
uniqcarecontid_deid = nullif(@uniqcarecontid_deid, ''), 
uniqcareproflocalid_deid = nullif(@uniqcareproflocalid_deid, ''), 
uniqmonthid = nullif(@uniqmonthid, ''), 
uniqservreqid_deid = nullif(@uniqservreqid_deid, ''), 
unitmeasure = nullif(@unitmeasure, '')
    ;
    
create index tpid on  rekggth_hes_ons.MHDS_care_activity_202 (tokenid);
create index carecontactid on  rekggth_hes_ons.MHDS_care_activity_202 (carecontactid_deid);


-- drop records that are complete duplicates for tables 101, 201, and 202 (not an issue for 001)
set sql_safe_updates = 0;

CREATE TABLE rekggth_hes_ons.MHSDS_referrals_101
	SELECT DISTINCT *
    FROM rekggth_hes_ons.MHDS_referrals_101
    ;
    
DROP TABLE rekggth_hes_ons.MHDS_referrals_101;

CREATE INDEX tpid on rekggth_hes_ons.MHSDS_referrals_101 (tokenid);
CREATE INDEX servreq on rekggth_hes_ons.MHSDS_referrals_101 (uniqservreqid_deid);

CREATE TABLE rekggth_hes_ons.MHSDS_carecontacts_201
	SELECT DISTINCT *
    FROM rekggth_hes_ons.MHDS_carecontacts_201
    ;
   
DROP TABLE rekggth_hes_ons.MHDS_carecontacts_201;

CREATE INDEX tpid on rekggth_hes_ons.MHSDS_carecontacts_201 (tokenid);
CREATE INDEX ccid on rekggth_hes_ons.MHSDS_carecontacts_201 (uniqcarecontid_deid);
CREATE INDEX servreq on rekggth_hes_ons.MHSDS_carecontacts_201 (uniqservreqid_deid);


CREATE TABLE rekggth_hes_ons.MHSDS_care_activity_202
	SELECT DISTINCT *
    FROM rekggth_hes_ons.MHDS_care_activity_202
    ;

DROP TABLE rekggth_hes_ons.MHDS_care_activity_202;
CREATE INDEX tpid on rekggth_hes_ons.MHSDS_care_activity_202 (tokenid);
CREATE INDEX ccid on rekggth_hes_ons.MHSDS_care_activity_202 (uniqcarecontid_deid);

-- Add hesyr variable for the year of the data (indicating financial year, e.g. hesyr = 2016 means 2016/17 

alter table rekggth_hes_ons.MHDS_master_patient_index_001 add hesyr mediumint;

update rekggth_hes_ons.MHDS_master_patient_index_001
set 
	hesyr = if(year(recordstartdate)=2016, 2016,
    if(year(recordstartdate)=2017 AND month(recordstartdate)<4, 2016,
    if(year(recordstartdate)=2017 AND month(recordstartdate)>=4, 2017,
    if(year(recordstartdate)=2018 AND month(recordstartdate)<4, 2017,
	if(year(recordstartdate)=2018 AND month(recordstartdate)>=4, 2018,
    if(year(recordstartdate)=2019 AND month(recordstartdate)<4, 2018,
	if(year(recordstartdate)=2019 AND month(recordstartdate)>=4, 2019,
    if(year(recordstartdate)=2020 AND month(recordstartdate)<4, 2019, 1900
    ))))))))
;

alter table rekggth_hes_ons.MHDS_referrals_101 add hesyr mediumint;

update rekggth_hes_ons.MHDS_referrals_101
set 
	hesyr = if(year(recordstartdate)=2016, 2016,
    if(year(recordstartdate)=2017 AND month(recordstartdate)<4, 2016,
    if(year(recordstartdate)=2017 AND month(recordstartdate)>=4, 2017,
    if(year(recordstartdate)=2018 AND month(recordstartdate)<4, 2017,
	if(year(recordstartdate)=2018 AND month(recordstartdate)>=4, 2018,
    if(year(recordstartdate)=2019 AND month(recordstartdate)<4, 2018,
	if(year(recordstartdate)=2019 AND month(recordstartdate)>=4, 2019,
    if(year(recordstartdate)=2020 AND month(recordstartdate)<4, 2019, 1900
    ))))))))
;

alter table rekggth_hes_ons.MHDS_carecontacts_201 add hesyr mediumint;

update rekggth_hes_ons.MHDS_carecontacts_201
set 
	hesyr = if(year(carecontdate)=2016, 2016,
    if(year(carecontdate)=2017 AND month(carecontdate)<4, 2016,
    if(year(carecontdate)=2017 AND month(carecontdate)>=4, 2017,
    if(year(carecontdate)=2018 AND month(carecontdate)<4, 2017,
	if(year(carecontdate)=2018 AND month(carecontdate)>=4, 2018,
    if(year(carecontdate)=2019 AND month(carecontdate)<4, 2018,
	if(year(carecontdate)=2019 AND month(carecontdate)>=4, 2019,
    if(year(carecontdate)=2020 AND month(carecontdate)<4, 2019, 1900
    ))))))))
;