select Supply_id, Name, Category, Retail_Price 
from Stock_of_supplies;
UPDATE person SET First_Name="Douglas",Mid_Name="Magdalène",First_name="undefined",Last_Name="McCloughen",Gender="Male",Age=22,Address="81336 Quincy Hill",Nationality="Macedonia",email_id="dmccloughend@parallels.com" Where U_ID= "U14GofTNvjb";
SELECT CORRELATION(Quantity_available, Discount)
  FROM Stock_of_supplies;
  select min(cost) from Treatment;
  select Floor(avg(Salary)) from human_resources;
SELECT Round(avg(Age)) from Person,Dead_Patient Where Dead_Patient.U_ID=Person.U_ID;
select sum(cost) from Treatment;
  select VARIANCE(cost) from Treatment;

drop table if exists cp, cd;
create table cp as 
select p.Patient_ID from patient p where p.Treatment_ID in (select Treatment_ID from treatment t where t.Disease_ID=(select di.Disease_ID from disease di where di.Name='Malaria') and t.End_time is not null );

create table cd as 
select d.Patient_ID from dead_patient d where d.Treatment_ID in (select Treatment_ID from treatment t where t.Disease_ID=(select di.Disease_ID from disease di where di.Name='Malaria'));

select count(p.Patient_ID)*100/(count(d.Patient_ID)+count(d.Patient_ID)) from cp p, cd d;
drop table if exists cp, cd;

 
select count(p.Patient_ID)*100/(count(d.Patient_ID)+count(d.Patient_ID)) from patient p, dead_patient d where p.Treatment_ID in (select Treatment_ID from treatment t where t.Disease_ID=(select di.Disease_ID from disease di where di.Name='Malaria') and t.End_time is not null ) and d.Treatment_ID in (select Treatment_ID from treatment t where t.Disease_ID=(select di.Disease_ID from disease di where di.Name='Malaria') );
  
drop database dbms_proj;
# Creating database for the project
create database if not exists dbms_proj;
use dbms_proj;

# Table Creation

# 1. insurance_record

CREATE TABLE IF NOT EXISTS insurance_record (
    insurance_id VARCHAR(10),
    Date_of_issue DATETIME NOT NULL,
    Date_of_expiry DATETIME NOT NULL,
    Amount NUMERIC(6, 2) NOT NULL,
    PRIMARY KEY(insurance_id)
);

INSERT INTO insurance_record VALUES
    ('Iu2sod2ng','2016-03-27 08:37:09','2018-04-18 23:41:26',2649.74),
    ('Ifu39bjih','2014-05-16 16:24:15','2015-03-19 05:11:54',5170),
    ('Iz86tt6u3','2013-06-04 13:29:06','2016-03-13 23:41:32',6636.91),
    ('Ieizf7iii','2015-02-26 01:48:09','2017-05-23 17:06:57',3469.6),
    ('Ipvdhjlyh','2016-12-29 04:54:36','2019-02-11 16:17:17',2814.99),
    ('In1qabruv','2014-12-23 02:49:32','2016-12-14 23:26:01',2838.45),
    ('I4dky2oe6','2014-07-30 11:53:21','2019-12-20 18:16:47',2575.75),
    ('I4d2t9osn','2015-08-30 16:05:59','2018-05-15 09:34:44',4444.95),
    ('I3jkn7y7z','2016-06-12 15:57:12','2018-01-10 01:08:03',3425.89),
    ('I3f1zc1i9','2018-08-19 06:25:39','2019-02-05 06:37:34',6472.88),
    ('Ing3o0f5g','2018-11-19 19:08:43','2021-01-31 04:19:16',1596.83),
    ('Ic74lgobj','2016-08-04 13:03:05','2019-04-30 07:04:22',5425.3),
    ('I6gebxns5','2014-08-17 00:39:22','2015-03-08 20:52:13',2335.15),
    ('Icxfsjrtq','2017-04-01 21:28:31','2018-02-27 22:52:09',3073.87),
    ('I4uic797v','2017-02-27 12:31:27','2020-05-03 07:04:21',3891.31),
    ('Ig8ute6or','2016-01-01 04:35:29','2018-06-21 15:53:05',6651.84),
    ('Ilg20egam','2013-12-07 19:30:56','2014-07-20 05:21:24',5894.44),
    ('Ij0grwpu4','2016-06-27 22:06:35','2018-02-22 07:01:46',4980.12),
    ('Iwxy8at9m','2013-07-06 13:22:28','2017-07-17 22:57:19',1566.29),
    ('Iez5d70yd','2017-01-27 09:08:56','2019-11-06 09:44:56',6829.97);
    
# 2. Financial_Transactions

CREATE TABLE IF NOT EXISTS Financial_Transactions (
    Trans_ID VARCHAR(14),
    Date DATETIME,
    Amount NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY(Trans_ID)
);
INSERT INTO Financial_Transactions VALUES
    ('TR-768-234prF9','2018-07-31 05:15:14',5219878.36),
    ('TR-164-81envE1','2016-05-19 11:56:06',3429440.66),
    ('TR-449-93odzCM','2015-11-22 04:56:23',9538316.42),
    ('TR-166-00elm0H','2016-05-02 05:52:13',868774.14),
    ('TR-753-030czG6','2019-02-03 22:28:40',7996358.55),
    ('TR-133-70xvvQF','2014-03-24 23:07:49',1136153.66),
    ('TR-357-16eanCN','2016-09-22 22:17:57',1522813.59),
    ('TR-342-22y538D','2013-11-23 02:15:01',3282153.37),
    ('TR-437-70uj2FC','2013-11-16 09:27:22',9743925.19),
    ('TR-611-63gt66W','2015-08-06 04:52:03',5483673.75);

# 3. Disease

CREATE TABLE IF NOT EXISTS Disease (
    Name VARCHAR(22)  NOT NULL,
    Disease_ID VARCHAR(6),
    Dis_description VARCHAR(1000),
    PRIMARY KEY(Disease_ID)
);
INSERT INTO Disease VALUES
    ('Measles','DI519O','Abn lev substnc nonmed source in specmn from resp org/thrx'),
    ('Pancreatitis','DI58FM','Atherosclerosis of CABG w oth angina pectoris'),
    ('Malaria','DI76VM','Burn of right ear drum, sequela'),
    ('Cirrhosis','DI322E','Nondisplaced oblique fracture of shaft of right radius'),
    ('Asthma','DI303I','Displ spiral fx shaft of ulna, unsp arm, 7thM'),
    ('Common cold','DI18WA','Nondisp artic fx head of l femr, 7thD'),
    ('Stroke','DI26BJ','Toxic effect of nitrogen oxides, undetermined, init encntr'),
    ('Breast Cancer','DI99ER','Acute perichondritis of left external ear'),
    ('Depression','DI41ZX','Poisoning by digestants, intentional self-harm, sequela'),
    ('AIDS','DI38RF','Abrasion, unspecified great toe, subsequent encounter'),
    ('Epilepsy','DI70MQ','Laceration of blood vessel of left index finger, sequela'),
    ('Fibromyalgia','DI44P1','Nondisp fx of shaft of left clavicle, subs for fx w malunion'),
    ('Hepatitis','DI25E1','Nondisp fx of lateral epicondyl of r humer, 7thP'),
    ('Diabetes Mellitus','DI685J','Unspecified sprain of unspecified thumb, sequela'),
    ('Kidney Stone','DI4983','Unspecified subluxation of left foot'),
    ('Obesity','DI23IE','Nondisp fx of lateral condyle of unsp femr, 7thQ'),
    ('Parkinson','DI185X','Fracture of base of skull, right side, 7thB'),
    ('Sickle Cell Disease','DI30O4','Milt op w explosn of improv explosv device, civ, sequela'),
    ('Tuberculosis','DI63KB','Striking against glass with subsequent fall, subs encntr'),
    ('Ischemic heart disease','DI731I','Unsp inj msl/tnd lng extensor muscle of toe at ank/ft level');

# 4. Departments

CREATE TABLE IF NOT EXISTS Departments (
    Dept_ID VARCHAR(6),
    type VARCHAR(100)  NOT NULL,
    PRIMARY KEY(Dept_ID)
);
INSERT INTO Departments VALUES
    ('DP-13Q','Aneasthetics'),
    ('DP-596','Cardiology'),
    ('DP-44l','Critical Care'),
    ('DP-20o','ENT'),
    ('DP-20W','Geriatrics'),
    ('DP-08r','Gastroenterology'),
    ('DP-60i','General Surgery'),
    ('DP-43m','Gynaecology'),
    ('DP-75p','Neurology'),
    ('DP-05r','Haematology');
    
# 5. Stock_of_supplies

CREATE TABLE IF NOT EXISTS Stock_of_supplies (
    Supply_id VARCHAR(14),
    Name VARCHAR(23)  NOT NULL,
    Quantity_available INT,
    Category VARCHAR(39),
    Retail_Price numeric(8,2),
    Discount INT,
    Prescription_Needed VARCHAR(3),
    PRIMARY KEY(Supply_id),
    check(Prescription_Needed in ('YES','NO'))
);
INSERT INTO Stock_of_supplies VALUES
    ('S-735-105nveE6','Storage Carts',65,'Storage and Transport Medical Equipment',198746.81,23,'NO'),
    ('S-222-339d7y29','Wheelchairs',14,'Durable Medical Equipment',213860.30,35,'NO'),
    ('S-291-830u8nC9','MRI Scans',44,'Diagnostic Medical Equipment',871389.90,9,'YES'),
    ('S-191-311r6cLX','Pacemakers',80,'Electronic Medical Equipment',731856.05,39,'YES'),
    ('S-179-496oicSO','Surgical Tables',91,'Surgical Medical Equipment',156169.53,25,'NO'),
    ('S-746-795q1pN6','Wound and skincare kits',59,'Acute Care',110711.51,6,'NO'),
    ('S-339-509kd378','Operating Scissors',23,'Procedural Medical Equipment',951128.44,40,'YES'),
    ('S-816-311zreS2','Utility Carts',5,'Storage and Transport Medical Equipment',247351.30,40,'NO'),
    ('S-124-423q4254','Ventilators',14,'Durable Medical Equipment',196133.92,30,'YES'),
    ('S-735-070wqm9U','stethoscopes',18,'Diagnostic Medical Equipment',138962.55,13,'NO');

#6. Resources

CREATE TABLE IF NOT EXISTS Resources (
    Res_ID VARCHAR(14),
    Category_ID VARCHAR(4),
    Fees numeric(7,2),
    Due_Paid NUMERIC(7, 2),
    Occupied BOOLEAN,
    Repair_Status VARCHAR(50),
    Cost NUMERIC(8, 2),
    PRIMARY KEY(Res_ID)
);
INSERT INTO Resources VALUES
    ('TR-391-88gmhRW','Cj33',46916.79,80959.43,false,'justo morbi ut odio',345511.83),
    ('TR-799-31ust5N','Cu47',75288.53,36266.56,true,'amet sapien dignissim vestibulum vestibulum',773805.84),
    ('TR-800-37m9sDM','Cq56',27550.31,49169.25,true,'elit sodales scelerisque mauris sit amet',536484.12),
    ('TR-806-91b4wSV','Cr66',95513.89,35066.73,true,'at ipsum ac tellus semper',376277.11),
    ('TR-463-148ycKG','Cm46',59106.77,36292.86,false,'posuere nonummy integer',530807.35),
    ('TR-344-08egh0D','Cg71',39462.05,99741.71,true,'ante vivamus tortor duis mattis egestas',326174.45),
    ('TR-666-41dpbLO','Cr44',43142.48,45445.42,true,'integer non velit donec diam',641686.72),
    ('TR-359-28mmcCZ','Cg88',70791.81,61988.01,true,'habitasse platea dictumst',908838.68),
    ('TR-830-37rzsZU','Ck42',98545.80,36803.99,false,'quam pharetra magna',927682.69),
    ('TR-136-57j9rM7','Ct72',58124.19,56591.12,false,'convallis nunc proin at turpis a',972019.48),
    ('TR-680-45ndnMY','Ck39',20988.22,55158.98,false,'fusce lacus purus aliquet',979488.51),
    ('TR-141-52kks79','Cd37',40912.84,48732.82,true,'mi sit amet',744431.62),
    ('TR-089-18ts3HR','Cw17',60177.40,71282.30,false,'amet justo morbi ut',551180.09),
    ('TR-573-09yug12','Cz24',21475.33,93653.42,true,'pede libero quis orci nullam molestie',215488.16),
    ('TR-323-42jlgBR','Cd30',63633.27,33901.27,true,'aliquam augue quam sollicitudin vitae consectetuer',37738.98);
    
# 7. Prescription

CREATE TABLE IF NOT EXISTS Prescription (
    Prescription_ID VARCHAR(12),
    PageImage VARCHAR(2000)  NOT NULL,
    PRIMARY KEY(Prescription_ID)
);
INSERT INTO Prescription VALUES
    ('Px-6i9-823P9','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKaSURBVDjLrZNdSFNhGMdPF15EdOO94E230kXR6sIZZl4VkRiVMdOLiqC6sMgr08hQQUqUnBFJbRqKpa6yrw2bzm162lduY2dubjvbbF/Oj+WZuu38e8+hdRNGUA/8eDnw/P/v83FeCgD1L1D/1YBhmBKCwuVyKZxOp8LhcIzZ7fax+fl5hc1mU1itVoXZbC75zcDtdpcSYWBxcRGJRALLy8siyWRSPOPxuEg0GgUxBU3Tgbm5uVLRgIjLiZhfWVlBPMziy5thTD59iPG223jZcl1E1d6Iyf4umCZGSE4QsVgMRqORNxgM5ULZFkGcyWTExAenDv4RVUcjUqmUaDIzM2OhSDnrGo0GPM8jS0w+ytuhvFmLRxfK0XVaItIrq8DgrTrQfefhV9Xhm0kptjQ9Pb1GKZXKUCQSQTqdRjabFc/t7W0RobI8Yb0cidkbyKRmsaS+CJduCFNTU16qu7t7GD9DKI1MH4JhfnACQWM/YloZMqsKrNqbkTA0wTtQjU/yhneUVCqtzBsIfZG1wePxwO/3w+fzQdiM5/U1bCWHsLnUhM3IY6zamsCxzWDkZWtUYWHh4fztglgQBYNBsCyLQCAgfi98uIfv3nZw/qtIsw3gfLXg3NUw3ZGkqIKCgkNklZZcLieWKwjC4TBCoRBY+yQCE5cQ0tRjnZGBWziJtLcGGy4ibtmfeX62+BxFYrdgMjo66iRGsFgs4gyC9CB8IzWk1D5seKrAMcdh6pHC2nEMtjbp1gtZcdWvP5HELsIerVY7QnbLC32H3l8hPT/D+lcJOGclzL1HMSa/y2vejr/6LCvau+Nj0uv1RTqdLutR1WMreh8bzAnQPWVQPWnNqdXqor9+jbOdB1od/RVRuvOIf+DyvjM75f0AOEMKvrn+ie0AAAAASUVORK5CYII='),
    ('Px-4l0-857EK','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKbSURBVDjLfVPfS1NhGH7O2THJubmtWUZrYNGFzELRsggLFSUJqosuxaCiy7rsHwiJiDYvCykvC68qIiSsXVgU1NTIZkpZmgulnL82d35+ve+3TTCqb7zfe87O9zzv8/74FCEE/rcSicQ9y7K6TNPUyIO8NMMw2N9X/kUwNjZWQYA+n893trS0DDqB4DiQpwnj9/swOPgU2t/Ao6OjJxgcDAZ3ud1uTH+dA0d3HAFHOEQkYBOZruvQksmkbtv2FjJ5qCiTfTqd/lMyFhfTROSgvaNT/qcxOBQKY2lpWUYX/BOsUkjjF4qJgL8Cjx89RKS2Xkbnb1IBszL4al+CjilQFNrzm/RsqysruHHpoIw4kngNVrvz5Om8ApbKUfmgP7ANqqpCIVMLxs9MIJx8xNoDjfJZFGqgsgJ6JwIVLpdrk6kFz+v2yHl88PZj3j2Fu0sxmZZUYBbao6gKXJq2EV16ToE8r5xlIhSswZP3NzFjeaUKScAbF4RT4IjV28tk/l+yF2E6VH3HQjBiodK7DzVVTVjNZZD+/oYIM7IrkkAt5Mn2eTI/C+F6A+2Rc7Cp77Zjg0cotTyL/aGjWDPWcfnZMTSY3XmCkhIN1y/UyfaYpoVsVkf/lCHB335NkRKaD1Jj2iZW9FXU7W7GmpnF0PodaFTJW/H48+PFQSEf8Hg81Tk7B8u2sMMbJrAtyX4szyBQXoXE7EuMp5Komz+DTXeht7f3CpGcOtR0pDU23o2coVMNDMrXwN5gBIf3dODtzCsMTwyj/mcntuqeiQ2CWCxWSS1baGlpQ7nHQ6NsQ3OpRBrNRKPR8tpraqYx3FoWnxyaMxy0pXrEJ8ZtXCaSvkj2bmDgQUNx/gv34iN/zxoCLybjWHfQvNAjpou43xdyww7T9h6SAAAAAElFTkSuQmCC'),
    ('Px-1u1-932LZ','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMDSURBVBgZpcFNaJt1HMDx7/PkSdombdO0Tedo2q6H2VSnlZXBylAUN/HiRRBksNsQ8eLNsyBFL9tJUA+CMnUiXmSbgqOjgyF9YVu3pmvarG+sa+eatmmb5snz8v/9zA4Dkd38fCxV5f9w3h2+0pJpb7zeHI9lUAtUMKqYIMDzAoIgwK96eJ5H6HqYqovvViltbK+tzC6edHo6mqaHXuzK9B5o5QlR5QkjiohiVDFGMKIYYzCiBMZwa+pe66i3O+t0tiUy6XiE+ZVHhMZwc3qZ44NZJm/P88qRbsJAuJ1bpr//EDduTNN1qANjhOczSdLPHUw5lgWiSjRisVUWKqFFxUTZqgRcGytgjCBq49OAZ8XYLO7Sk0kRimBZFtanF/5SO3SxRbHsCENH+9j2YxgRjCgiEBohFKHZqTAyMolX3iT0AzYe7uKMz6ycyab1i7ZkIpJOZw5EYg3WWmGWtUeb+KEhDA3GCKFRzmTzfPjCEpNL9Q+uLGaK92cnzqOqqCofnbv00/dXczq+sKf5v43+1+UfPtfi+Mca7I3r8u+n/ZvDh99WVSxV5b3Pfuvu70zOnRjM1ifijfR2xOlM2jy1c+9X/OIlUgOn2F9dINwTdu7frcxN3jkbGd3LWnZl/+obx/t64vEmYrEYPW1R6hyLp3ZyF2gZeA1x8ziJTsTfpSV7MBopbZ+0R8+9r9n+3sFUS4r1UoARoSFq8W+RRIZgexnxi6g/R6x5BaozlNe9iENN1Rd7vVhiYX2fqtfOyNgMbtUnZZZ5MzlCY5PQ3WJhSwnsJjTwyV0s6Nxc6QOHmjAICIzghyH5xVWMKIdlgmN1Y7z86inU/xPL7HHncgVT3iVm23ybHwi/+fm7iw41Vd/HdX262uswoYOo8rrm6DvxDn7xKxwnSe6az/X9t6i0H8WtuBTcW0KNQ83SVC5febyRjdYnEBMiIgwdCbAiD4nUpZn6Y4cf777EA00ihQLVcpnHq6tfUmOpKs8ycf7YcGNr6mxla9+dn9/45PTX87/wDP8ABifE0eTdPioAAAAASUVORK5CYII='),
    ('Px-0i3-481OP','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKgSURBVDjLY/j//z8DJRhMmJQd+x89/W4IRQbY1x5L8590dzmy5PuIqC4gfvA+PPIyEMfhNqD06H+L9gfG9p33/jr23OMEiX30DTj8yT/oFxCf+hAYfBeIfwPxIyBWwjSg5Mh/tYZHzDr1D34aND7Y9tXOsf2Lg/O/z85uNjCFn908lT56eH985xXwzXvygwYUA4yLD/9Xcm+QlS572JWesP7XVyOL79/MLKci22Rc/6DXvPH+X8um+79t2u7/tOu4/w9ugFHxof8wha+1LP89NHT9iaxZIf/BCpWie7/Vi+/N/25kqvrN2Oz/suiO6QgDig6ADfgtJrX0p6TMb1u/Xd+5Eh9M4k16yCyQdH+HYOK9H6JJd+tgBv7U0j3wXVvvA9wAg8J9/6sNAvT/8gr++8Mn1MYQ8aCFIfzBf6bwB3+Zwx/8Ywu7H44e+j8VVX4hDMjf+/8/I6v/fya2OyghHHCn3GuRw3TvJTZnumq0n+4OFHi9x4nl305X5kfXDHmvwg3Qz9v9/ycDS8hvBhZxmGavmZZeHjMtX3jMMn/QW6p5+XyJxd/vW3v//7u24//XFUX/T2fr/tnlzJILVqyXu/P/HFENB5hmxw6jaY6dRh8dugwXOfQY8ux0Yb77Daj5/yTf///LBf//b1P8/7rL4T9Q/B5Yg2729v+WJTqSFqXaM81LdR8B6bcWZToZMANBzv53dt1/ZPC+XuI/SBxiQNa2/0YZmv6GGepu6gGWrkAanBqFNTxkQTTQz4+/zE3+/x+o6UcZw/93QPwwg/k/UPwJ2ADtzC3/tTM2/9fK2ATEG/9rpW0A4vX/NUE4dd3/sriU/8dS1P8/K1f8/6qS9f/dFMb/u33Z/u9wZa4iOtcdCZetANp4HxoLj0GaQeIAMa12DZDYXzMAAAAASUVORK5CYII='),
    ('Px-2s0-390LB','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIBSURBVDjLlZPNTxNBGIeLV/8FNUYisaIRqOHswat3DfHgzXhUIwQIQWKUgyFq2pgm6oHgxcKBiJ76YRcS8CJJNVFoqZSaXbof3e3H7s52qz9nRoZIkRQneTKT7LzPvL/JTgBAgI5jlBClvw0nKUdYjSCwIwgRQizf9382m038C/od4XD4aatECPpZcb1eh23bu1QqFZimiVKpxCWKoiASieyRsNHBBGyD67rwPI/PjFqtBsuyoKoqFziOA3ZINBrlkn0CVixgAlZQrVahadq+SDt30rFHQGPsbmBrlltE0XWddyLL8sGCVoSkXFzE1sooDG0LhmEcXsBjuVUUlu7AyMYgZ17ySP8l0NfeQPs6A7+ew9rbAZjK58MLHGsT6wvXQbQFEHkK5Y13yKfG4DdIe4HfaKC4/Jh2MAtSnIA0GULDmMXqq8swcqn2Aqv4Ed8TI/DUaTi5G5Ae9cItDMLKv0fm9TUETxy9dKCAtfht/iZMenHu5l3Y61f/kKVx5CcopJ9h+nYw2ir4JQTbmTkUpCl428/56XZ2gEbo47OTvwVHmUdy/Fw5fb/7rHgLF+nfZ9Ni/pg+vbgCR9+AV06AqPQO1NhfzMGvfcGPlRkkR7piQnCcScSzlSZ7LelhD0k/uEA+TJwnqfFukhwLkuToGZIY7iLxodMkPtjpxu+dWvwNhj+uekyCXgUAAAAASUVORK5CYII='),
    ('Px-7y6-258DA','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIdSURBVDjLpdNfSFNxFAfwX+GbSGjhg+JDED2YBYVGSPiQJigYRRZGUBD0UuBDT2rkIjOV/LsH5/5oIlE9yHSbFsy5TV3zH3soZcQWtD+CmjPXcru62f127q9YM8gH93D4wf1xPuece89lAFgy8d+LrtOyLGO2WudOe+t1pQ55LJnq0ea7+b1NVTmgMFCU7wmEmE1EmRewh4E3G0DeZwQz5hETNjD29CxHOCDPlR2MsnHtFjNFBTYOgVkQYVag7SuwIAD+GDBL51QY1pF++EzP8PLBKQm4wwHlsYZUkb2fQs86oPkG9FCMhgAbVTbQ6RB+P5cHoKguwNJEBzpuH5WALA5os9uPI+XDRw5c8gEVFPWrlERtWwmZoFDR3a3l7cHaAriHqqVkxF/idJrmMtKdPqioyhU/ULkEyFaAgSC1HgFGqAvFOjxNzqC19QK+vHu0G/AzbSOer31HHVW9QcBNAp7Q/K8JcEcB4w9AH8Jwiw7OgeuYlpdKwGIcCLMxPVXY4a2X0luvJegVJZs2AWXgJ0q8EZR4YjPX9BwYri+UgIa/e3DANovOANBPM7+gMbTU8kkXfQm76M2fdKB5rWqrzNV3JicTi31Xobp3QgKK4oDliFK9ygzhTWYWQ8wkrjDjtvmwxp64E5RQrLmfxztInH/PRfoHaNE9Pp8U8GlOUZEUwJPNrRfjK7wvYPDhOQmo2Q/Q/ecvlM5DiXe/ADHD2LkNLqYxAAAAAElFTkSuQmCC'),
    ('Px-1i6-519Y7','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAL5SURBVDjLjZNbSJNhGMd3KdRlN90E1Z0URVfShYKKic7ChFRKyHRNp3lAgq1ppeam5nFuno+JJ8ylzNMSRec3LdFNm7rKPuemznm2nMfl/n3fBw6tiC5+Lw8Pz//H8148LH1VvBNFDIWCgqSwUhxNlETiQ94D9IluHymEbtbGuGtk5eOLClnIuZjcwLNOAFg0LGqYmOsSwzwkw4q2Amu6GqxOVMMyUoZFVSFM73NBtokxWSsAkRcKOd8VlIBwCKZrn00cC5bHyijKsTRcgoUBGea6c0C2ZkDfkAxtWQJUWSGMIC/k/IRDoP5kdB5T9+NbVymm6pMwIgtDn/gOqLVBrY0q7mUUh11AadQVNKQGoFSaDmldl7NDQD99M4fdY/MHWNu2Ye/Qjn2bHes7PzFl3sOocReGtQOQqwdo16xC2mnoPg47BDTK6d13yukd+xw1bN0/gnnLBv3SPmapoPrrDxQpTfaCDoP8ZPiUgKZV+92lTbtFfiS3Ydo4ZMKd4+soVBpnJB2zLr+H/xAcUz+0MqgxWjFq2Ias26j628w/BY1Dy8Pj81aMUQJJ++zgfwvq1cs3mwmT6U1zO7KyslFZWYnUtAwkl/ctCKUK38TERJLupaWlbfB4vKeurq5nHOHaQUtrE7Foz5WWIj8/HxaLBSRJYmBgAOmvc5H4Kg/6z1+O6B5BEMwMm83OZMLVqiVlj24d8s5eCIVCaHQ6iMXp8PPzA4fDgUQigUAgYGpfNtseFBTUSUsSEhK2WA09Oue6QTP6pzchysyBSCRiBDu7e7jl7Y3e3l5oNBqoVCq0tLTA3dMLvCTZDVqQkpKyx9zCpLIYxLAa6ZIKxMbGMQK+8Dk8PDzh5eUFf39/Brr2cHfHwwD3TVrA5XI3Tx3TiCIDnNBgFOTnQP62CXK5HEVFRYiPjwefz2dqutdUV2PLzs7epL6oZ508Z21xBNny8t5u8F1fcDmP8CQqEtEUSfev7r8IvGSO5kXYoqJ4h+Hh4VYfHx+Dm5vb9V9HN9N1j9T0nAAAAABJRU5ErkJggg=='),
    ('Px-1k2-202BH','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALsSURBVBgZBcFtaJVlGMDx/3U/9znz7LjjfMGXYiq1VkkrUiRoZQUhhoOKrAi/hEH0IUHFZQSREu1TQh8CP0TaEBQtIYikfRD3ciSWc0rlWpuzEmbT5TZ1O8fzPPd9Xf1+8uLHvW8XSnXbnbABWAAIAAKYgClBdXz2lp2ROzMd/YfaUwAAAHnps3L/0Z0bHnVOGg0SDAAAzACMqbmMY4OzTF6rVYZ/H1lSPtReAwDwLpGH8z5pvHyTxImAgClEU0Iwqlnk+YcaeKrFM6BT9aaPzDz3/o+Le7/cWgNwIrLQzJJ84sg58AKJg0RABBwCKKtKeYorvmdtc67gS8UjAADOQAAc4AScCE4EJ4ITwSXCv9NV1izMmKtOEOq+JsklrwMAeAAz8AkIgomg0biRjjH03w9cn/uDMB4JaaCpYTVZmKd+5QkHzwLgzcAALw7DMGCyNsb5qe+4r34Jjy9tR02JFlGLBI1UKgNuyxcvXPlp19lmb4ACIiAIBozdHmBZvsjywgqGJgYZmxwlSwNNi1cTQ2T4SqrdHWebAZwGMAMFDDAzrs5cYuj6BU799i3zFcfuZ06ye9Mpbk1XCRVHqLyTtu3fWADwqoaZgYFhAOxYdxAzUIOokeODnWxb/xGL8is58MonvNw5yLlPz1cBfFSIBqagAAAYQVOEHF+V93G3OosavNV2gA+Ovsdc7ZcFT+wKFrLwj9dgqBn7L6YIhgqYCagjvfkhTQ23qcsH9nzzNFkaeLBpLdu3vcHwyJ/09p/r9iFEYoRVpRzrlzvUIBqc7nuN+xtLtDa3Ei3yWMs6okXUIqNXx+npK1+IIR73oaYaVC2NyM8TERXDEJa2nOTvy3uozA+QhcDwyAghDYQsouGBGELc+1fXtR6f3Ys3ivlk2b7WtGhmDgMFABZt/JyOrnep3Jmm3PkrImgh7+627uieGO3a0gPgRezg5r19r4rIk4bVAwBgYIDxJjE5nGvbeSYD7qnqkHccAwD4HyXFhGV2sNBxAAAAAElFTkSuQmCC'),
    ('Px-6m2-091O8','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALoSURBVDjLbVNbSJNhGH7+7z9scyqepi6JobKmE5ZigSWpYV5UskYZkRJk0lVeVN5GF96EF0kXZXRVFHWTKynqKijFQmvqTYRMcWuYodtS59zxP/T9vwdc9P08vP93eJ738L0foygKdkbb7bHLhlxdF2HQSqcM/RJQGEiSqFsNK0PjA429+GcwewVO3fmcetZbzxOqsLOs2mA0hReeNSz5EvE5rzd/9P7p5A6H7FVjWSLyLIFvlYN/jcVcmMGPFaDcZITr0D6UW/UGLtf4eC8nQ0BRw95eJAyzi99/4rBkp3H1SCFYnj3/X4H+/n4DlSBqyByrggFLU1HtPI1kMiBCx7NgOEbu7u42ZAhQcg81K9S9oKbOMUTb4CmZoxHoBBZ6CoWu0oiEZDK50tHR0aOlTQhpM5vNL5ubm4WxnwrOHDYjlqaeKFGR1VSo6qYHBeEnMBTWYsSzipsd9cLy8rJzcHDwC0dF7jY0NKC4uBgHIw9wb+B9xjXxrIz22kWYatox7r6F+oQJVus1uFwuBAKBh6qAzW63a4edTidsNluGwGbgLa1DNXLNdagqGUGptQ1FRUUahoeHKzhJkgQK7bDf79c2QqHQVoHEEAwr71BxtBNS5A1M9k6EJl5DTJ8EQ1isr68zRBRFLCwsaFCJtECIRqMUG7SDPqK46iyQmMbXp8+RnRdHVtKHec/ILodLp9NYXFzUPMZiMaiCqVQKurQfBUYeOfkx6t0HtaJS9BvKW/ow++ERopZcBIPBLQGVoA69Xg+3200rr6DRNI28E5cgxyYpN476czbIqSXojV6Yba2Y932CyiWULEciEU1ATaG6xoHjjhxU1rQgKycERQzT/mQx9cpLT8iQE16YDlhAfo2hNEcB63A4ymZnZ4WZmZmSzeou3LjQhLWJAViaroPQlmT4/SD6KpTVHdMsI1SCM1qhy7YgPzz6PeM1XhmalDjaWhc3+sBK9CXLyjbkbWz9EykZhzpXlKm/wwxDbisZJhAAAAAASUVORK5CYII='),
    ('Px-5h2-11709','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ3SURBVBgZBcHPi5RlHADwz/POOzu7o21bIWVsiiAR1kYdJOwHdAgKO3QQDMqCTv4XdQikg1BCUnTQCIK6REVdOnWTClIRjAwNCdFy1t1xdnZm3nee59vnkyICAOSTJyu5HCsdR6PESju4fXG6vvFBOxzOVd7r7tn7Zju4vbF58dJnk7Y9VQMAaNu3PbTr03rtyR6hGqw/N/3u+6ct9mYrrx5+cXHfXpHLzqVffn3/2pnPl2oAgNJfPN5de7xnNGK8re733Xf0yCFtq2oKl/+UcO/aE1K3+1YNAJBTtdptC+sbRGHzrqruUDLDIaUw3mbnDlFKrwYAyFujmbZhe8w8kzOzGfM5udDMmGyjaPM86is/HrywuHzgQEoVWKh0ujf2WFjewfUb5DklyC2TGbMpqw+7c/6CzeHdH+oU1WOPPH+2m1IiyPtvWf/oQ/es7ra0Z5Wr19gYkVt6XQ486s6li37/+tvfxpPJido8pkrTm936RG46VMv6x9YMf7rhvzNn7T78soUqsT3R7Fzyx6mPjfdv5eF4/NqRweBmrU0VlHkfYevaOcPL5+nhFa6XL+mhB/TfqfWtdJ796spNqJWqo+oY/X1Fc+cfZbbtgYOvW3nqDUlS5q1mMKEU3fsX1Mv7/HX6GQC1OUnHrhfeJTJRkDWDb8hjZEkjTDSDic6OEwCg1kZEZM2/X6AQgUwUES3RijIhjykTAAC1JgqBIAqRRTTEnGhEmZK3lTwSeQsFANRmUaREFBFzoqXMRJkRU1GmooxF3qJMUAGAOtrSy+NN0oNSSuiITiXpgKRCIhJqeTICAHXMZj9fPf3SIYEEAAAACCSUcg7gf+9HV+4TlzZTAAAAAElFTkSuQmCC');

# 8. Person - insurance_record 

CREATE TABLE IF NOT EXISTS Person (
    U_ID VARCHAR(11) ,
    First_Name VARCHAR(30)  NOT NULL,
    Mid_Name VARCHAR(30) ,
    Last_Name VARCHAR(30)  NOT NULL,
    Gender VARCHAR(10) ,
    Age INT,
    Address VARCHAR(50)  NOT NULL,
    Nationality VARCHAR(21)  NOT NULL,
    mobile_no VARCHAR(12) ,
    email_id VARCHAR(32) NOT NULL,
    insurance_id VARCHAR(10) ,
    PRIMARY KEY(U_ID),
    FOREIGN KEY(insurance_id) REFERENCES insurance_record(insurance_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO Person VALUES
    ('U62GwpjjRKS','Gustavus','Intéressant','Englefield','Male',58,'342 Namekagon Point','France','263-475-1146','genglefield0@123-reg.co.uk','Iu2sod2ng'),
    ('U56OJoocIGE','Shea','Marie-hélène','Fominov','Female',32,'388 Westend Center','United States','754-651-9061','sfominov1@ameblo.jp','Ifu39bjih'),
    ('U18udtsdqJO','Padriac','Daphnée','Donisi','Male',28,'85 Kipling Alley','Colombia','144-590-2147','pdonisi2@paginegialle.it','Iz86tt6u3'),
    ('U46quduEPPF','Geri','Lucrèce','Valdes','Male',38,'46020 4th Trail','United States','816-220-1933','gvaldes3@hao123.com','Ieizf7iii'),
    ('U99bnax9cYE','Bambi','Maïly','Capeloff','Female',28,'9 Hanover Pass','Croatia','476-764-8995','bcapeloff4@nymag.com','Ipvdhjlyh'),
    ('U92lOxlCOEJ','Cassie','Cunégonde','Krause','Male',35,'98 Fordem Court','Poland','205-283-9897','ckrause5@youtu.be','In1qabruv'),
    ('U21yPxqV7RM','Marja','Adèle','Goalby','Female',72,'99667 Heffernan Place','Argentina','317-466-7729','mgoalby6@wordpress.org','I4dky2oe6'),
    ('U84eAepUKHO','Leonelle','Maëline','Felix','Female',54,'66 Havey Point','Sweden','430-457-7934','lfelix7@sina.com.cn','I4d2t9osn'),
    ('U46yaihFfEY','Felicdad','Cléa','Crilly','Female',62,'292 Melrose Crossing','Mongolia','203-159-9772','fcrilly8@vinaora.com','I3jkn7y7z'),
    ('U12EkixRUDO','Asher','Almérinda','Letten','Male',37,'02 Ridgeview Pass','Sweden','118-313-2179','aletten9@sphinn.com','I3f1zc1i9');

# 9. Human_resources - Person

CREATE TABLE IF NOT EXISTS Human_resources (
    U_ID VARCHAR(11),
    H_ID VARCHAR(6),
    Job VARCHAR(17),
    Salary NUMERIC(9,2),
    No_of_holiday_avl INT,
    Date_of_join DATETIME,
    PRIMARY KEY(H_ID),
    FOREIGN KEY(U_ID) REFERENCES Person(U_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO Human_resources VALUES
    ('U62GwpjjRKS','H-x752','Chemist',2304085.10,13,'2018-12-22 00:27:52'),
    ('U56OJoocIGE','H-j900','Compunder',2290852.97,22,'2013-01-23 23:28:17'),
    ('U18udtsdqJO','H-z997','Sanitation Worker',1611981.19,18,'2016-03-19 00:43:21'),
    ('U46quduEPPF','H-w017','Nurse',8450373.31,10,'2014-02-22 07:31:24'),
    ('U99bnax9cYE','H-h675','Compunder',6605990.51,18,'2016-06-24 04:29:52'),
    ('U92lOxlCOEJ','H-f016','Ward Boy',6195667.32,17,'2013-07-17 14:27:17'),
    ('U21yPxqV7RM','H-b147','Nurse',6708068.38,19,'2018-01-17 18:37:31'),
    ('U84eAepUKHO','H-k185','Nurse',8434322.06,12,'2013-12-10 17:24:44'),
    ('U46yaihFfEY','H-w578','Compunder',7592203.03,17,'2012-07-16 10:42:47'),
    ('U12EkixRUDO','H-l119','Chemist',3459631.66,18,'2013-12-13 11:02:51');
    
# 10. Doctors - Person,Departments

CREATE TABLE IF NOT EXISTS Doctors (
    U_ID VARCHAR(11),
    Doctor_ID VARCHAR(6),
    Dept_ID VARCHAR(10),
    Avl_from time,
    Avl_till time,
    Salary NUMERIC(10, 2),
    No_of_holiday_avl INT,
    Date_of_join DATE,
    experience INT,
    PRIMARY KEY(Doctor_ID),
    FOREIGN KEY(U_ID) REFERENCES Person(U_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Dept_ID) REFERENCES Departments(Dept_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO Doctors VALUES
    ('U62GwpjjRKS','D560M0','DP-43m','3:21:00','8:00:00',16269500,16,'2013-10-26',10),
    ('U56OJoocIGE','D5532E','DP-20W','1:29:00','6:00:00',12000000,17,'2017-08-28',23),
    ('U18udtsdqJO','D0867M','DP-75p','2:39:00','6:00:00',12000976.93,28,'2016-01-14',29),
    ('U46quduEPPF','D782V2','DP-44l','8:55:00','2:00:00',16685870.53,21,'2014-05-16',34),
    ('U99bnax9cYE','D3529J','DP-75p','8:53:00','2:00:00',12691162.08,19,'2017-02-22',21),
    ('U92lOxlCOEJ','D162MY','DP-60i','4:17:00','10:00:00',19374537.7,15,'2018-01-30',20),
    ('U21yPxqV7RM','D9178C','DP-20o','12:50:00','6:00:00',7987675.74,28,'2015-01-19',15),
    ('U84eAepUKHO','D375FC','DP-43m','9:26:00','2:00:00',16977810.27,26,'2017-11-07',18),
    ('U46yaihFfEY','D468A7','DP-20W','11:47:00','4:00:00',17144667.67,29,'2017-12-30',13),
    ('U12EkixRUDO','D282C5','DP-43m','1:40:00','7:00:00',6214061.94,24,'2014-10-18',30);
    
# 11. Treatment - Prescription,Disease,Doctors

CREATE TABLE IF NOT EXISTS Treatment (
    Prescription_ID VARCHAR(12),
    Treatment_ID VARCHAR(11),
    Disease_ID VARCHAR(6),
    Start_time DATE,
    End_time DATE,
    Cost NUMERIC(8, 2),
    Doctor_ID VARCHAR(6),
    PRIMARY KEY(Treatment_ID),
    FOREIGN KEY(Prescription_ID) REFERENCES Prescription(Prescription_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Disease_ID) REFERENCES Disease(Disease_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Doctor_ID) REFERENCES Doctors(Doctor_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO Treatment VALUES
    ('Px-6i9-823P9','Tr-4z5-05gQ','DI519O','2017-05-31','2019-11-03',224520.43,'D560M0'),
    ('Px-4l0-857EK','Tr-9n9-65qv','DI58FM','2019-08-07','2019-09-26',274824.51,'D5532E'),
    ('Px-1u1-932LZ','Tr-3c5-57sP','DI76VM','2015-05-08','2019-08-30',759803.72,'D0867M'),
    ('Px-0i3-481OP','Tr-1o5-84EY','DI322E','2019-08-13','2019-12-01',31762.3,'D782V2'),
    ('Px-2s0-390LB','Tr-5u3-41Fw','DI303I','2014-06-06','2020-09-04',661863.95,'D3529J'),
    ('Px-7y6-258DA','Tr-2h9-59UY','DI18WA','2019-06-07','2019-10-05',734374.82,'D162MY'),
    ('Px-1i6-519Y7','Tr-9t4-23hS','DI26BJ','2019-06-28','2020-06-29',902541.98,'D9178C'),
    ('Px-1k2-202BH','Tr-8b5-215c','DI99ER','2019-06-01','2019-07-02',542840.45,'D375FC'),
    ('Px-6m2-091O8','Tr-9m0-44KY','DI41ZX','2018-01-29','2019-05-18',480353.49,'D468A7'),
    ('Px-5h2-11709','Tr-7w5-39T7','DI38RF','2016-02-06','2019-08-20',985347.9,'D282C5');

# 12. Dead_Patient - Person, Treatment

CREATE TABLE IF NOT EXISTS Dead_Patient (
    U_ID VARCHAR(11),
    Patient_ID VARCHAR(10),
    Treatment_ID VARCHAR(11),
    Date_of_admission DATETIME,
    Date_of_death DATETIME,
    Blood_gp VARCHAR(3),
    PRIMARY KEY(Patient_ID),
    FOREIGN KEY(U_ID) REFERENCES Person(U_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Treatment_ID) REFERENCES Treatment(Treatment_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    check(Blood_gp in ('O-','O+','A+','A-','B+','B-','AB+','AB-'))
);
INSERT INTO Dead_Patient VALUES
    ('U62GwpjjRKS','P-m8-99mT5','Tr-4z5-05gQ','2019-02-13 00:09:58','2020-06-12 16:44:24','B+'),
    ('U56OJoocIGE','P-p6-94hJ9','Tr-9n9-65qv','2014-08-28 17:22:08','2019-08-08 20:16:14','O+'),
    ('U18udtsdqJO','P-c1-37eQ8','Tr-3c5-57sP','2018-06-14 01:56:35','2019-07-18 06:03:05','B-'),
    ('U46quduEPPF','P-n9-73vY9','Tr-1o5-84EY','2012-07-10 13:09:28','2016-11-22 22:27:52','AB+'),
    ('U99bnax9cYE','P-r7-48gG5','Tr-5u3-41Fw','2019-09-16 06:35:31','2020-01-15 00:10:03','AB+'),
    ('U92lOxlCOEJ','P-z2-894Q7','Tr-2h9-59UY','2019-06-01 05:37:07','2019-10-10 01:03:07','AB-'),
    ('U21yPxqV7RM','P-x6-02wM3','Tr-9t4-23hS','2019-11-09 19:53:32','2020-03-08 10:03:59','B+'),
    ('U84eAepUKHO','P-x4-10aP3','Tr-8b5-215c','2016-08-14 21:10:14','2019-07-15 11:15:26','AB-'),
    ('U46yaihFfEY','P-r3-74nU6','Tr-9m0-44KY','2017-12-28 16:35:16','2019-08-04 09:58:54','A-'),
    ('U12EkixRUDO','P-x5-075S2','Tr-7w5-39T7','2019-05-04 20:40:35','2020-01-30 03:53:00','AB-');

# 13. Patient - Person, Treatment

CREATE TABLE IF NOT EXISTS Patient (
    U_ID VARCHAR(11),
    Patient_ID VARCHAR(10),
    Treatment_ID VARCHAR(11),
    Date_of_admission DATETIME,
    Blood_gp VARCHAR(3),
    PRIMARY KEY(Patient_ID),
    FOREIGN KEY(U_ID) REFERENCES Person(U_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Treatment_ID) REFERENCES Treatment(Treatment_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE, 
    check(Blood_gp in ('O-','O+','A+','A-','B+','B-','AB+','AB-'))
);
INSERT INTO Patient VALUES
    ('U62GwpjjRKS','P-i5-335G5','Tr-4z5-05gQ','2019-08-12 15:56:21','AB-'),
    ('U56OJoocIGE','P-d3-15gJ2','Tr-9n9-65qv','2019-09-14 15:21:09','AB-'),
    ('U18udtsdqJO','P-j8-694I6','Tr-3c5-57sP','2019-10-26 01:57:59','B-'),
    ('U46quduEPPF','P-m6-38kF7','Tr-1o5-84EY','2020-02-09 16:29:15','AB-'),
    ('U99bnax9cYE','P-i1-534T4','Tr-5u3-41Fw','2020-01-18 18:27:15','O+'),
    ('U92lOxlCOEJ','P-p6-054N1','Tr-2h9-59UY','2019-07-24 17:06:19','B+'),
    ('U21yPxqV7RM','P-q4-42oG7','Tr-9t4-23hS','2019-07-16 00:31:17','B+'),
    ('U84eAepUKHO','P-o3-18uW3','Tr-8b5-215c','2019-06-01 06:18:06','B-'),
    ('U46yaihFfEY','P-o7-05pC6','Tr-9m0-44KY','2019-12-04 23:06:06','O-'),
    ('U12EkixRUDO','P-s2-351M2','Tr-7w5-39T7','2019-10-26 02:04:26','O-');
    
# 14. Organ_Donations - Patient

CREATE TABLE IF NOT EXISTS Organ_Donations (
    Donor_ID VARCHAR(6),
    Patient_ID VARCHAR(11),
    Organ VARCHAR(20),
    Donation_date DATETIME,
    Blood_gp VARCHAR(3),
    PRIMARY KEY(Donor_ID),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    check(Blood_gp in ('O+','O-','A+','A-','B+','B-','AB+','AB-'))
);
INSERT INTO Organ_Donations VALUES
    ('D-t630','P-i5-335G5','Eyes','2018-02-05 02:56:39','B-'),
    ('D-g516','P-d3-15gJ2','Liver','2016-08-25 18:02:36','AB-'),
    ('D-o950','P-j8-694I6','Heart','2015-06-26 03:15:15','A+'),
    ('D-t264','P-m6-38kF7','Lungs','2019-01-07 18:36:06','A-'),
    ('D-f521','P-i1-534T4','Small Bowel','2018-09-26 18:51:17','O+'),
    ('D-i222','P-p6-054N1','Kidney','2015-08-04 14:45:47','B+'),
    ('D-e394','P-q4-42oG7','Eyes','2015-04-30 14:21:19','A+'),
    ('D-y529','P-o3-18uW3','Eyes','2015-11-09 23:18:42','A+'),
    ('D-r182','P-o7-05pC6','Liver','2015-06-05 12:46:49','O+'),
    ('D-w873','P-s2-351M2','Liver','2018-11-23 09:48:13','B+');


INSERT INTO Person VALUES
    ('U14Ffn3Unjb','Edna','Hélène','McDonagh','Female',49,'9 Karstens Way','Nicaragua','849-956-2722','emcdonagh0@shutterfly.com',NULL),
    ('U14MfmYJhtf','Bryon','Laïla','Ruppertz','Male',17,'4 Hovde Plaza','Iran','943-203-3089','bruppertz1@mapquest.com',NULL),
    ('U14EggV1rhv','Jaquith','Yénora','Jaher','Female',53,'15 Anderson Street','Georgia','275-502-9580','jjaher2@networkadvertising.org',NULL),
    ('U14TbqASh4z','Pauline','Mélys','Gudgion','Female',58,'1 Bobwhite Road','Poland','821-725-3664','pgudgion3@sourceforge.net',NULL),
    ('U14ZewI7lid','Teirtza','Maï','Rapa','Female',56,'65581 Artisan Avenue','Indonesia','957-463-6687','trapa4@spiegel.de',NULL),
    ('U14Qed6Fasr','Sandra','Estée','Borel','Female',62,'3 Heffernan Junction','United Kingdom','109-836-6469','sborel5@aol.com',NULL),
    ('U14UhiEA3ex','Wiatt','Régine','Beaford','Male',58,'59 Donald Hill','Russia','261-880-4303','wbeaford6@miibeian.gov.cn',NULL),
    ('U14Dul5E9uv','Lambert','Marie-françoise','Shackleford','Male',50,'91 Gateway Trail','Panama','383-761-1457','lshackleford7@mlb.com',NULL),
    ('U14YgoF575q','Teirtza','Pål','Steely','Female',26,'55 Jana Lane','Chile','643-942-2544','tsteely8@altervista.org',NULL),
    ('U14FroZ4zrs','Aurelie','Léane','Isabell','Female',21,'30 Bultman Avenue','Morocco','369-388-2691','aisabell9@ucsd.edu',NULL),
    ('U14FbuWHqrp','Steffane','Danièle','Baude','Female',19,'65 Macpherson Court','Portugal','415-634-2921','sbaudea@samsung.com',NULL),
    ('U14RhgYV5mg','Bev','Aí','Ryce','Male',62,'6 Daystar Lane','Philippines','218-236-9131','bryceb@netscape.com',NULL),
    ('U14MlzH7o9p','Ulises','Angèle','Muggeridge','Male',23,'52535 Comanche Road','Philippines','831-863-3758','umuggeridgec@clickbank.net',NULL),
    ('U14GofTNvjb','Douglas','Magdalène','McCloughen','Male',19,'81336 Quincy Hill','Macedonia','374-467-9908','dmccloughend@parallels.com',NULL),
    ('U14Abv48ttc','Ruddie','Léonore','Booth','Male',63,'06 Reindahl Pass','United States','973-355-9082','rboothe@hugedomains.com',NULL),
    ('U14SlvK37bu','Waldemar','Styrbjörn','Sugars','Male',50,'862 Sunnyside Plaza','Malaysia','797-881-1865','wsugarsf@cmu.edu',NULL),
    ('U14YdeH3u6i','Bondon','Lyséa','McCord','Male',36,'23122 Lakewood Gardens Place','Saudi Arabia','310-460-8967','bmccordg@comcast.net',NULL),
    ('U14Vte0Av0x','Sherlocke','Gaétane','Zorn','Male',53,'3 Arkansas Park','Serbia','936-680-2221','szornh@cam.ac.uk',NULL),
    ('U14TkmCKglk','Cathyleen','Cécile','Cripps','Female',42,'01866 Fieldstone Way','China','324-848-3300','ccrippsi@buzzfeed.com',NULL),
    ('U14TapY77jk','Tatiana','Camélia','Sharpous','Female',39,'9 Thackeray Court','Cyprus','638-431-8421','tsharpousj@dell.com',NULL),
    ('U57MiyBNcrb','Steve','Nélie','Baiss','Male',49,'40587 Lawn Point','China','828-574-8525','sbaiss0@un.org',NULL),
    ('U57SfqLJu1f','Craggie','Bécassine','Simonutti','Male',11,'11 Manley Crossing','China','494-372-7522','csimonutti1@samsung.com',NULL),
    ('U57PfjQChur','Svend','Cléopatre','Wyldbore','Male',13,'5522 Fairfield Junction','South Africa','225-394-3981','swyldbore2@friendfeed.com',NULL),
    ('U57Seb8Xkxq','Darrin','Maëlys','Jewson','Male',69,'110 Steensland Street','France','846-449-0025','djewson3@feedburner.com',NULL),
    ('U57FwzIUosb','Audra','Yóu','Romei','Female',50,'682 Lunder Hill','Philippines','338-553-9776','aromei4@psu.edu',NULL),
    ('U57Don0E8xc','Colet','Ruò','O'' Bee','Male',43,'329 Doe Crossing Road','China','823-673-5148','cobee5@forbes.com',NULL),
    ('U57DuxBDnmw','Fergus','Andréanne','Jaukovic','Male',23,'839 Columbus Terrace','Ethiopia','586-713-1140','fjaukovic6@booking.com',NULL),
    ('U57ZcyH2a3p','Terence','Océane','Gambie','Male',15,'49643 Colorado Trail','Portugal','469-334-7587','tgambie7@alexa.com',NULL),
    ('U57ChiLDi5p','Barbabas','Lorène','Kearley','Male',44,'945 Springview Plaza','Russia','198-741-3849','bkearley8@tripadvisor.com',NULL),
    ('U57BvgAL1tj','Marthe','Gisèle','Belford','Female',67,'381 Utah Trail','Portugal','142-760-1948','mbelford9@economist.com',NULL),
    ('U57Gyi480zo','Kirsten','Gaïa','Windibank','Female',60,'29835 Victoria Plaza','Thailand','881-676-3049','kwindibanka@upenn.edu',NULL),
    ('U57XwlGCnti','Inna','Loïc','Birth','Female',64,'1248 Arkansas Alley','Afghanistan','963-939-3741','ibirthb@themeforest.net',NULL),
    ('U57Gdw19wtt','Aurelie','Maëlle','Cradduck','Female',45,'4 Mesta Alley','Sweden','885-402-3357','acradduckc@soundcloud.com',NULL),
    ('U57YquV46zt','Brandyn','Tú','Cuddon','Male',62,'528 Macpherson Hill','Russia','243-843-3221','bcuddond@diigo.com',NULL),
    ('U57TbbIMpwc','Bondon','Thérèsa','Densham','Male',36,'83 Oneill Plaza','Indonesia','486-701-5840','bdenshame@unc.edu',NULL);

-- ==============================================================================
INSERT INTO Doctors VALUES
    ('U57MiyBNcrb','D90OZR','DP-05r','15:32:00','22:32:00',19,11485220.21,'2013-09-26 00:00:00',30),
    ('U57SfqLJu1f','D40YEV','DP-05r','8:09:00','2:00:00',25,11764246.4,'2013-12-05 00:00:00',16),
    ('U57PfjQChur','D20EJ4','DP-44l','4:57:00','22:00:00',14,19970565.35,'2015-09-01 00:00:00',17),
    ('U57Seb8Xkxq','D20FE0','DP-596','8:07:00','2:00:00',29,2117204.72,'2013-06-17 00:00:00',29),
    ('U57FwzIUosb','D50NML','DP-08r','6:47:00','1:00:00',20,8005179.15,'2014-02-26 00:00:00',14),
    ('U57Don0E8xc','D30AH6','DP-44l','5:54:00','11:00:00',28,13168403.13,'2013-10-01 00:00:00',12),
    ('U57DuxBDnmw','D90HP3','DP-60i','12:00:00','6:00:00',30,5225579.52,'2019-02-12 00:00:00',14),
    ('U57ZcyH2a3p','D90ZYN','DP-596','16:15:00','9:00:00',23,18526958.12,'2018-01-08 00:00:00',23),
    ('U57ChiLDi5p','D30WNL','DP-13Q','15:51:00','8:00:00',26,15434561.98,'2013-08-06 00:00:00',24),
    ('U57BvgAL1tj','D10OIQ','DP-13Q','6:09:00','3:00:00',26,14586807.66,'2018-07-05 00:00:00',13),
    ('U57Gyi480zo','D00TDE','DP-08r','8:00:00','2:00:00',24,10726509.94,'2019-05-22 00:00:00',22),
    ('U57XwlGCnti','D60SHI','DP-75p','1:00:00','6:00:00',30,18313463.5,'2013-09-18 00:00:00',27),
    ('U57Gdw19wtt','D80OAK','DP-20o','14:00:00','7:00:00',24,6372394.37,'2013-12-23 00:00:00',28),
    ('U57YquV46zt','D80NWO','DP-20o','11:00:00','5:00:00',23,4346766.24,'2014-10-09 00:00:00',14),
    ('U57TbbIMpwc','D10CJ7','DP-75p','12:15:00','5:15:00',28,8283778.49,'2015-03-06 00:00:00',10);
-- ==================================================================================================
INSERT INTO Prescription VALUES
    ('Px-6w6-456AW','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJKSURBVDjLjZNLSNVBFIe/+d97LdTCK2ki3qJLBipE9KBWtZAkW4ebFkEF7nLZroWQBBVGbgpa9FhJ65BCIUGxl9EmwSJLKzMl8IF2//M4p8W16zVbeJjhzGLmO7/fmRmjqoyPj6uIICKEEAgh4L0v5OLpnCvktrY2kwQIIVBbW8f84iKoQn6AKgqoamGNKul0BX19TwAoAOYXFrh0e5jNxPX2I1hr1wDe+9WSUJfZRXlpCZmqMrZuSZJzivOCCxAUXrx6h4oSxzEAEYBzLi8TMMawkvPMzOdYiQOq4INivRD7/B5V1itwziF/9RmDMYalFY9oTEVZimQyQSSKrgJEZSNAJY8wRZDfNmCdUFZaQiIREZl8DZU1QMECRRaMMXkIoMawEgfmpJ1pdxYTeeRfC9ZaokQEwOSXz//tfFVTzO7qBhb3XkWixxsBJakk1y4eIAQllUpxZ/Q8Kg4rHus9tZX1NNQcZSm3zOX+FhrdmbxiVaW3t/emc+5E0SurHNv+cM/JpnMEFYIEBGVm4RvpsmpGJvoZnRrUnLdp8/f6iqO7u7vjffrRrdP7LzD56yNOPF4cLjiiqITqbXUMTTzl5eehkCw+2NPTU+Wcm62v38fozxw+eHZu34WXQFDhx8IUleU1vP06zPCnoTnraVkHiOP4cCaTobX1FPfvdfBg5AZWLDlvye5o5Fi2hdeTQwx8eDZjPc3TXTq2wUJnZ+cb59yhf3/hYPVdDu4+zvMPA9+t0DzdpeOFJm4mslfMcpBE6W8J2dkuLdz1H8DrioJLLPMsAAAAAElFTkSuQmCC'),
    ('Px-6z6-48kD8','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKFSURBVBgZBcHLi1V1HADwz+/cc1/j2Az4qiYjhQoXIg5lr11tWgi5aWWLwB64FMJdu5Ya/QVFbkKiNrVKMAmipLI2UZJMZcmMM+k8LnPnnnPP+X37fNLHX9y4mHM6Pa7zoGoAABAAQLdk0PXRG6cWz0GZI7128oWD+waDQUqpAwAAACaZtpn6/Oqt13EOynGV+/3+IF26tm7inlG66dCBVcPupiay+1tDv96aMxNHlPZ459VD2pwSQFk3FEVHkaiLFYf2rur3/rZZjTRto+z3HT74kD+Xdpnv7ZUzAFBCRlEkVazpdddt7Gyq2om6aTSxrd/v266G9gwLIRAASsgoUhJNVrVTk6ayM63UudFmpKnIrbJIIgIAlBBBkZKBfUbby6LTtfzbebv7jOtGOdszk3es/Dfy/qd/yNGZO3Phelz9+c4zJURQFMlsZ8GdlbvmBst2xhMvnnjSK4uzvvz+X++ePgIALl1bk3O6XgQiKIpktrvfw8Pj1n9ZN66m7o8acOXHuwAmDVsVaxu1lLISIrh57y1tztqcPVGtWe4lnWDaZhfPLso5BDrCTElVVba2a2VESHh58RyAztENP3xVmFRT713+S5Fo2iy3WSAiCGa6WZlAAIB2OK/JoWobnaKLkLRSSiKHiKxppuq6UQ66aVOezh078CwpCRBG4590U+nsyd2aXKMgiJQNyp4Ln9x2b2tb2SvT5c++XnqubuNoBABtjrmOrmzHhzfetnfmUUlhbfyPN5/+QGFgXNXKM6eOnwcAgG9ufhePPciB2ZGXjp0w31ugYGOyYP+uxkyPMiUpIgAAwFNnr3z7+CPD5+f78wblA5o8lXKWopXT2O+3l6xuTf0PNZJB+2NWN98AAAAASUVORK5CYII='),
    ('Px-6s6-96cHM','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALbSURBVDjLfZHrM5RhGMb9A33uq7ERq7XsOry7y2qlPqRFDsVk0c4wZZgRckjJeWMQRhkju5HN6V1nERa7atJMw0zMNLUow1SOUby7mNmrdzWJWn245nnumee+7vt3PRYALI6SZy8fnt08kenu0eoW4E666v9+c6gQDQgYB2thJwGPNrfOmBJfK0GTSxT/qfP3/xqcNk3s4SX9rt1VbgZBs+tq9N1zSv98vp5fwzWG3BAUHGkg7CLWPToIw97KJLHBb3QBT+kMXq0zMrQJ0M63IbUoAuIozk2zBjSnyL3FFcImYt2HPAvVlBx97+pRMpoH1n1bRPT6oXmsEk7Fp+BYYA+HPCY9tYPYoDn32WlOo6eSh8bxUuQ+lyK9MwTJnZEQVhJgFdhBWn8Z3v42uv0NaM4dmhP8Bpc6oZJYuqTyh/JNMTJ7wpGo8oPkiRfyO4IxOXId1cOFcMixgyDUuu0QAq/e+RVRywUh54KcqEBGdxgSSF9IakUIb/DD24FIrOpaoO6PBSuDCWaazaZdsnXcoQyIR1xDaFMAigbjEN8sRpjCC0F1F9A3EIdlOofdzWlMtgfDN5sN28QTxpPxDNjEWv0J0O0BZ+uaSoqyoRRIHnsjUOGDqu4ETLRehGG5G4bPJVib6YHioRDiVPvjph5GtOXtfQN+uYuMU8RCdk8KguRiFHelobVBjJX3JAzz2dDe42JnlcSE/IxxvFoUaPYbuTK2hpFkiZqRClSRUnxUp2N7qQ7U9FVoZU7Qz6VgffYZBkuJxddlxLF/DExySGdqOLfsMag4j290cPpPSdj6EPJLOgmNUoo5TTnac9mlZg1MypJxx+a0Jdj+Wrk3fUt3hUbg7J3UbAyoLx3Q5rAWNVn2TLMG9HoL1MoMttfUMCzRGSy1HJAKuz+msDBWj6F0mxazBi8LOSsvZI7UaB6boidRA5lM9GfYYfiOLUU3Ueo0a0qdwqAGk61GfwIga508Gu46TQAAAABJRU5ErkJggg=='),
    ('Px-6g6-01fPG','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALMSURBVDjLfZNLaJRnFIaf779PMuYPmSSjCUmYKBXREBLwEhUXIm2otlRBN1WsIoJLRcRdN0VEcKWgC1trV7pQBHGjokKrYBFNWsQk2gwpphNzGWcymcx//T4XIWpQ++4OHJ7zcnhfcenGk9NSiu9nA+n4ER9LLRxNAxyTiwe+6z4MYEgldm/b0NLgOI4QQuf/5EmIo5Brd1/+AMwBZn1p27Yjfrv/Bo8pSmKQTHqchFkkUpL8dIJnL12q1AoMUhzdmSGWQsxDjSACTdPRBATaGJn6cWxrhKJfIoojDNumvWUJ2eFqaq16pFzoygCQgKYJfDWBZb6hUCnixx5BFBGpMrZtU/YTpBIaCrXgMe8BQqAiiR+HeJFPJfQJZEQsARGiZEy79SeFmz/yVbLD7f/luBLe6F4DQKk5gEMDpXIOpZv4skwQxZh6gnIpydq6SXob8yTqd+NmuihklzNw68Kp9wBNkNSbGR17jevkqKrWsEXETL6KVGmGXWvqqXG7yf/zHEsELKpZTDLV6hrqQ4DZSFOii1dP71Gb/A8Rx2Rsm+2bV1PbvgU/dxmrSjDSN0DoBVNeZWb9OweDUweJpSSWki/8CXpa2hBmkabOLtylX+ONnkezIsxkG5qXVeG0t2X1kdtDhlIKAfTOBQsAvaNAYfg+y5qW4i77Fm/0HJoZEUxnmHzQx6Pq/eU9B3b0AWjiE3n1J4dIORaNK7cSjF1AtxT+dBuv/3iM3XuWopWJ53c1xxRFZEhneh2di3tY9O8r0pUioWwm9/cZJB7lfDOTjwao++Ycdk0KQxfvLhqWIa5cvTfcE8SqQylIZ391dx76mcHLRxn6/SF2aydePidHWg/Plh8UYkMvYGpcmgcIpRba/+ngqvDY/kMGWkzfneuMZF/MuA11G7880d//qYJ9BNi1qa7S3Z421qzIoEz/YWV8Yt+2k38Nf66hbwFu+Dui0xbh3gAAAABJRU5ErkJggg=='),
    ('Px-6j6-334TZ','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJMSURBVBgZpcFLiI1hGMDx//ed78yZ4RzTzGHcRpEZUpqajbsmaYpcdpRYYGEhbGwUG2VhMwslScnCwoZSChE2khW5LliImDFk3M4333nf93mfB6VsFDW/X2JmTETKBKVMUHb04kfjL0SVEBQnQghQiFE4wQWh8EYelKIQMn5a2tvGH4aoEaMhakg0ghhBlRCMIEqIihflzO1RMn77Ni5EBVFDouKjEUQJYnhRnER8MJwoPiid1YyiIaT8pGYM9tVwIbKhv8bW5R3sWNnJzoE6KxdWackStq2YSmtLwu41XTRcZNxFtAikToQgSiVLcEGplFNO3/xAksDQlRG662UWzKwwu7OFyS0pc6dVyJuRIiiaC1nuhKYolXLC9tV1sjQhd4KZ0XARVVjaW8WAZlAazci4j7iQYnkkaxSG80rhlRNXRzmwfjrjTcWAvBmJZjx5XfBm5DqjI9c4cvYLk0OTsU8DqOsn+1p4mr4NM8idYAYNJ5hB7iKqxrmb5+mZ84DBgSV0d/Zy59ll7j+9QH36C5K1x57bpv4O3o45fFCcKC4YXhQnihelXQ+yZeM6KKVsXrSfoVt7KJFy4dI10m/fhcJHaq0lapNKtLeV6KiWqFdLTKtmdE0p86UxSjmpsnnRfn45uPYM87v6SNJANlYETl59hwVDnWJesKCYi+AVi0rP4s88G77Ho+G7HBo8x/Ebu2gtVTAtk5gZ/7Js36xj3fPaD6/oW0XvjH5evn/Ivcd3efvq61BiZvyPZftmHQf2AjXgO3Dq/snhQz8A9uxhvZij7OIAAAAASUVORK5CYII='),
    ('Px-6x6-747MQ','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ7SURBVDjLpZNNbxJRFIb7A/wF/A5YunRDovEjalEXJm5M2Ji4aFoTI6kxjcVaCGOJYtq0NlBJ0AS0tcbWSkeQhhQopQwfAhYotAwIAwPDUI5zLh9SdedN3kzmznmfc86dc4cAYGhQZ2ZAJkkhSSlJ1ZWyuyf7M37QeEqSfOxNWW37uk+5fVF6Z3ePDQRD7KY3TL/eSFAj1qIaYzD2BKBrPm1xZjWBvTiTK5SB45sgHreJKjUBMvkiuLxBZnY1rsHYHqQHkKM5GP7O1Rsi4OKFFhS5JrCSqo0W2eN4ATY9fs60HEGInACwLywbM/fMR2UB9gt1yJUEomypAYk834esrruYO4s5bEeGAIWN/kFh2YNmldZ7wjw8uUX2cYUTB2Cwuin0IkDp2o7Q2DOWmjqqw6WHTgLIFBsQz/Fw7p6DAPBbuSbCYYmHuSUHjV4EqPw7uyweVv6nABfHP0vaIAbMfHbMLskBVx97yDtWIYjHsGheYtFLAL5AkAAKlSZcm/LDhQefCACBlx/RcP7+B7gy4SbVdKpowtz8qz5A+WUrRJe4BlR4EdKs1P8Tn9TCNiQPOwaEDU96IXZQI38mmi6BwWTut6Awr8WoVKYA7TYQA5Z5YzpAMqKw9OtP/RDJ1KDZasP6txBojO/7hyi7azlSrzk9DFvunDKaMDtmjGZrxIhPTBCTsuufLzC3jNHOb+wNkuFtQGP/6ORyxSoJLFVFUg2CcJgwczRdBJ3Jwo0aln8P0uAoa80ezYLVzrj9MUjlyuRMsOdQkoUVZwC0hllmRP/u71EevEy3XybV4y9WqKmZedrwzMhO6yl2QmeiR3U26iYV/vdl+p/r/AvMhAk86cw6LgAAAABJRU5ErkJggg=='),
    ('Px-6p6-79kP2','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIwSURBVDjLhZHLaxNRGMUjaRDBjQtBxAdZFEQE/wEFUaurLm1FfEGzENwpturG6qIFrYUKXbUudOODNqIiTWqvFEwXKo1UUVRqS2NM0kmaZPKYPKbJ8XzTiUQxceDH3HvnO+e73xnH8X7fLjJInjbgEekiOwA4/sbBD0Ov5sIqY5SVXiO/Rpospw01HphXrOttZPBMxCkWJ3NltZItq3i2pOKZklrWi9Z5SMuKwf2GBtJVxJotiqWLKpIqqHCyYO3/Z/A8UyirBDtLcZTi6Y+RdxdHAsnTAy/NM0TerCuRlE2Y9El+YjCWoLBkViyxdL40OpNmLuBo0Gvk12AuYC5gLqB2XAw8A2NBFZzXVHm1YnHq1qQpYs4PjgbmAuYC5gLe0jrnWGLwzZqDi33ksSTunw3JvKZ0FbFmi5gLeDswF2v/h4Ftcm8yaIl9JMtcwFys4midOJQwEOX6ZyInBos18QYJk0yQVhJjLiiald/iTw+GMHN2N6YOuTB9YieCozfE4EvNYDO5Ttz2vn/Q+x5zC3EwEyw9GcaH7v0ovLiN6mcf8g8v4O35vRg+edTr+Ne/tU2OEV03SvB3uGFQjDvtQM8moM+N+M0D8B92LjQ0sE2+MhdMHXShOutF/ZO6toXnLdVm4o1yA1KYOLI+lrvbBVBU7HYgSZbOOeFvc4abGWwjXrLndefW3jeeVjPS44Z2xYXvnnVQ7S2rvjbn1aYj1BPo3H6ZHRfl2nz/ELGc/wJRo/MQHUFwBgAAAABJRU5ErkJggg=='),
    ('Px-6c6-50qYN','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKvSURBVDjLpZJdSFNhGMcnIX4GhglGKHlRemHhYBoSiEkgZhgaIjqwNaqBGuxiF5FFhDOHzRmZlGBdhI5SopQInZOJtXkTKGYyN+fm5s7mOW7HtjHHhv17zynLqDDowMN7znOe/+/5egUABP9jewY4VlePOp3OG3a7/YnVaq32er37/hlgXlq65fF6wbIsb263G2azmZqdnU3fE/Bhbq7d7fEgGo0iEokgGAwiHA7D7/eDAFjjzEziXwEGo/Gu3eXixaFQiM/OMAzW19d5kNVmw3uTSfFHgMFgUFpIACfmgrmMnJj0zrfAGbOxAcP0tO83gHVgoI3S6xElgkAgAJ/Px4s9pJW1tTU4HA7YCJzzj01O4heAp7W1LTg0hNjUFLY6O7FpMICmaVAUBRdph2wBy8vLPJBsBi9HR5d+AKz19TK2vx8xQt1SqRBsacFnqRT04CDICrGysgKyQqwSITeHsfFxPNNqs3iAMTs7wdbUhBhxhpVKBMj7pkQCf10dmKoquNRqWCwWvJh4CsXji7iqOY8G5elwxfUTN3nAWE7OMbtcjujwMAIyGTYbG+GrrQVTWQlvWRmo4mJou67hzvAlvFnoxRylQ/dEE+q6j+Nk8yG14Hlm5pFFki3S1wdWLIavpgZ0RQW8paWgiopAE4C0/QxGPt7HyOIDbnBQ66+gWy/jAFuCntTUuNd5efOMXP4lpFCALi+Hp6QEbpEINAGwhYU41yrE24V+7H5G53s5wLcN9KSlHTSJRE5GLI6GGhpAE0CAVOAXCvEpPx+nmg9H7+mk6NBJeHHHuORnBTtr1KSkHBjIyHi1WFDAuoXCbVtu7va7rKyYNj39LAlUXlDnoUt3mc/Mndw3P4PdF+l2fHycJjFR9Cg5WfEwKalak5Cwf+cfCVYRC3Blfz9VnP8rovbZoQ8oWiIAAAAASUVORK5CYII='),
    ('Px-6d6-793XI','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIcSURBVDjLjZO/T1NhFIafc+/trdRaYk1KUEEWjXHRaCSik+E/cDHGzYXB2YHRhMRFY1SYmRgYHZ3VxIRFDYMraMC2hrbQXm7v9+M4UGobiOEk7/adN+9zvnNEVQEQkYvAGBDy/6oBm6rqAVBVeia30jRtGmOctVaPU5qmuri4+AaYAgJVHTKYNsa4drutnU6nr1arpY1GQ6vVqlprdXt7W5eWlvomMv/uw6tSofB4p+NOF0biYtc48tEAhXiuTZzh/s1xyuUyWZbhvWdlZeXt3Nzca14sf6zW6nXf7uzrcfq9s6sLy5+1Xq8fQQKmo1ZCvlAoyo+tXT5tPGO09IckM2zWznH3/AJ3rl5ACInjmGazifceay2VSgWASISSBaz3FIs1RnJlPF18vEG1keDVk1lLFEWICM45wvAfYqTKriqje0lGI01x2qFtuuwkKQ26oEKcCwnDEBFBRA6HfmBw8JWwl3o2ti7j8+u0TUKzcYkrY/n+wyAIEJEjSxEglLyH5r7j+tg8T1oVZr8GzE69JIoiFMiM7zeHYUgQBAMJVBGU77+eYoxhLcvIxnNk6w8xxvDo3hqH+yIieO+HEkQB/qe6bPL5g/cckCkDiBhjOJULhlCGDJIkXX2z+m3GeW4UCnExyxxxHIIOLNLk2WP5AaQXTYDb1tovgHCy8lEUzQS9g1LAO+f2AX+SZudcAjgZOOeJ3jkHJ0zggNpfYEZnU63wHeoAAAAASUVORK5CYII='),
    ('Px-6a6-63wQP','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACuSURBVCjPvdChDcMwFATQD4rKwgxNwypjAxNTN6hmNakMKkWKFGDqEQo6QEbICH+EjBBeXnoFUQ0MAqOjT7rTEWg/dAhInDi9Eo9TP8dvWP3LsZ31pNa228CSLskM6DMofPwbZFkzqM0yb6ADjeaJmEE+OgnSrBgEEl3Z0JsHQv73Km65GhnNHb6AlmUNgrnBFSBZ1MCbK2wBYmlq4CbLelYGBBJDw2c+DUdevZ8ffsX6A70Y4hwAAAAASUVORK5CYII='),
    ('Px-6x6-53uAP','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEdSURBVDjLY/j//z8DJZiB6gY0rH7xpW7li3YKDHj1v2bli38lix61k2VA5fJn/9eeeP+/fcOL/wlT7/aRbEDegkf/Vxx/93/xobf/S5c8/u/ecm0eSQYkTX/4f+HBN/8nbX/xf+bul/8Tp9/9r1N0dgnRBgT33QZqfPW/YdXj/42rH//v2vjkv3fHtf9SScceEWWAc8u1/xO2Pv9fsvjB//IlD4CGPPrvXH/5v2Tksc1EGWBaful/+/on/4sW3gfGxsP/9lUX/ksEH1gj6rqdhSgDlPPO/q9b8fB/5bIH/23LL/wXD9i7kqRAlEo6+b908f3/NiXn/4t57V1EcjRKRB75b1145r+o684FZCUkMb8D/0Uct88euMxEKgYA7Ojrv4CgE7EAAAAASUVORK5CYII='),
    ('Px-6m6-43qWC','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAL2SURBVDjLfVHrS9NhGB0Evy/9HQlZmmbe0iabspbbwJm6IKnMLWND2dzcnKDb3CJyjpy3QR+MgoxMV06HNl3iHBO6qDkjvGVlgn5Qt1yOCD393l8X8EIvHHg4z3nO+7znZQFg7Yer/ATVp4xbcavjowO6hKin5vSKp+4MdZj2ANFXcZKiB0M+Kx9TnXK8e1KBQIsYQ/WpoSFLGvVfA7cqnhrQJoTGbAJMdylpqDDdrUHwWQ38jiIM1KeH3IZ06lADt+YUNahPDPubRAg+VSPQmg+POQMvbmXC11aEye5aDNsL0a1PCz9Wp1B7DAZ1iZSnJikcsOch2KNFoK0Aw3c4eD8zzaDfzMGQrRDjj3RwWfLQcTMp3H4tkTFh0QFRdEDhQEs+gk49vWohPLe5ePP6FdbX17G5uYmF+Vl0as/BaRTBe0+Bh1XnYS2IC1uEsRRryJAyHmi7+OedEno4G1OTb7GxscEM/8X83Cwc0jTcV+agt7EYrdJM1HBixll0snyPJX3H1y5Bn5G9++njwr+b92P58xJMgjg0XT0LPfvYDg3+7wAN6fzndWlj9ru23e3tbUas0Wig1Wqh0+lQXV3NcJFIBDZrA3Sc2BkyfOAbrVbr1traGlwuFywWCzo6OmA0GqHX67G8vIzGxkaGo3thuVxexWazj+4xMJvNWw6HA3a7Haurq1hcXMTo6ChMJhMIPzc3x3B+v5/RCIXCBlb5y5L4672XLhc9EA0LlLwdbbUWE8EgSktLiQAymQzNzc3MFqQWCAWQyAu3iEmluvI7ix7+quy/gdqRSogq+DDVmxgDsnpOTg68Xi8mJibg8/nQ09ODbB4XdV41s4XBZACLvnnkgp3zJcOYPJ5akByVlcl2iUFJSQm4XC54PB7EYjEDUnO4HIiKhSFiIC2T/tyTwXH6iESiDzabbbOrq2vd6XQyb1epVMxPkJpwpEc0RLvHICYm5khWVlZCbm7uklQqjSgUiiiNHxKJ5AqNbLr+RjjSIxqi/QVm6pQnUTAFywAAAABJRU5ErkJggg=='),
    ('Px-6t6-97mNG','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEPSURBVDjLxZM7TsNQFERPrIielg5FFNkVy6FhN6wiG4hC5AoJVkAR+84MhWM75FNRcKWRXnPP3N9bJOEv0fDHWAK8vn1NZSghAgUsIwcpWFAlXp4fFxcAgIf7O5LgQBxskI0NPkLaz7pegRLsIdnOiUDyAHDoe90AiDnhzHVMtkJVbgDKlK67WkEG23QV9vt9bGOb9Xq9WAJUeXY7c53eBvVitXoiCdvtdq6gaoBccx3bsUMJJNE0DbZnQNcLaXnV1TpCEuR5iJJmQF/m/eObOvY/DNXT/pUQmwDj5Y4VkORCbdtGUrqum3Q4HCZVVTabTZLMh3QakkhC09y+9F8tnIdtdrsd47puCWDx77/xB7F6hU6PdBGYAAAAAElFTkSuQmCC'),
    ('Px-6i6-49kAF','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIJSURBVDjLpZM9SJVRGMd/532vetOswQgjSoW2gj4Gh4ZoiIKGwGi4EtQQ0VxLQhAOEW2NzUVLOQRBBioUakGT5CBiGhZe8aameLv3nPc9H0/DvX7hHQSf4ZzDgf/v/3/O4VEiwl4qYo+VWT/I7EdxxSVEUsRZxFvEpYhLEJ+ANXhnEKfBGg5ef6W2A7yj7lRuh4MIKKgugMBKX/fOBMlqnn0iSNCVCwUiAVAImwQVNSBW12jBOUK6gCt+g5Agklb2kEIwSDBI0NQf6iLYcg2ATwCHBANiq6KtYoOEMohD0hoJ3L/lSuRtzpoQTBWiIeiKiSvtBARvMD9GcMk0+BTE4c0a2bbDFedgEK9BQu038HoZt5Zn/5mbQCCkvyiOvUF8GaRMYXiawvAk5fm3RI2K7/2ZnssD7tkGQIlg/4yzMjTKgfN3UUoRxG6IS1OWs7mHNHScRI8PMDEy+GTwUl0p2vrfzZ23sauLrA4/r4oN4g1zQ2OcuHiD7Mxn1MtuGn++o72tJRYl9zcS4Awqjmg6dwc90U/x63viltNkWy9gl/rItnbA1QebvfceIQ6qXa0P0+LraxJsgjiDWI3TBSAiUoqpT3N0dt2i6fcHEr1AGSiuxUzOkFe7mcbR3NHe+uamR8daXCYTzVFcdMwWYm+NPFa7HecvueM9pb/z92Kv2nwseYEXVwbc0/9TqFA0aM0H7QAAAABJRU5ErkJggg=='),
    ('Px-6s6-509ZG','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIJSURBVDjLpVM9aJNRFD35GsRSoUKKzQ/B0NJJF3EQlKrVgijSCBmC4NBFKihIcXBwEZdSHVoUwUInFUEkQ1DQ4CKiFsQsTrb5xNpgaZHw2Uog5t5zn0NJNFaw0guX97hwzuPcc17IOYfNlIdNVrhxufR6xJkZjAbSQGXjNAorqixSWFDV3KPhJ+UGLtSQMPryrDscPwLnAHOEOQc6gkbUpIagGmApWIb/pZRX4fjj889nWiSQtgYyBZ1BTUEj6AjPa0P71nb0Jfqwa+futIheHrzRn2yRQCUK/lOQhApBJVQJChHfnkCqOwWEQ+iORJHckUyX5ksvAEyGNuJC+s6xCRXNHNxzKMmQ4luwgjfvZp69uvr2+IZcyJ8rjIporrxURggetnV0QET3rrPxzMNM2+n7p678jUTrCiWhphAjVHR9DlR0WkSzf4IHxg5MSF0zXZEuVKWKSlCBCostS8zeG7oV64wPqxInbw86lbVXKEQ8mkAqmUJ4SxieeVhcnANFC02C7N2h69HO2IXeWC8MDj2JnqaFNAMd8f3HKjx6+LxQRmnOz1OZaxKIaF1VISYwB9ARZoQaYY6o1WpYCVYxt+zDn/XzVBv/MOWXW5J44ubRyVgkelFpmF/4BJVfOVDlVyqLVBZI5manPjajDOdcswfG9k/3X9v3/vfZv7rFBanriIo++J/f+BMT+YWS6hXl7QAAAABJRU5ErkJggg=='),
    ('Px-6a6-61pDE','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKmSURBVDjLjZPdS5NRHMf3D+h9XXVZRGBXBpYEdSGUaNkLoZWPmNNEI4tekMg0c+HKGLoldhFuBa2bKSm57WI2Wcryhfm4t/biptNRc29uzu2Z+/acU4+Y3njgy++cH+f7Ob/zJgIg2imTyVRkMBh6dTrdzMjIyG+NRhNRq9UOlUql+KBUnN49f7tjNpvzeLOcN2f8fj/C4TDi8TiSySRisRhsNisUfZ1cv7xD2SuT5P8H+Gf+6na7kcvlkEqlQCA+nw+hUAjZbBa57Aa4DQcM+o/ofvnQKOl6kr8NICsTcyaTAWkcx4GMXS4XotEohaY3VrCZsGJr8ye0o+/R/rRJSQG8+QRf9lYikaCG9fV1CgkEArDb7SD5bJZDMmZHOmGjVWR4tdyt37p/r7FIxJvlS0tLIHI4HNRE9kxAq6urtJ/ejPEAljf6+f4aX2EaRqMRYrFYLiooKMB+Rc6GgCORCDweDxiGmaMAlmXhdDoxMTGBwcFBOpnE5eVlmhdy5GC9Xi8WFxcRDAZRWVkZogAySTARCBHJCXkhmha8mGJdVHbfCi5UXFnbAyASzDsBZcxZtChuou51GW5IStCh7ERJ2SXrni0IIBKFLXS+fYxnnxl8Yfswt6JFj+42rvYcwynmqGVfh1j1/AyG5t9gyCqjVyzV30KPXozCxgNp+pBkMpl8fHwcwSh/lQELrL5ZzHt+YNY5hWm7Cedbj2OUfYedbdjSRwB/37NUKs3reNGu/zSsgueXjUIIYMY5iWnHdxTfOYRubQ26tNXU3DVWLVSQ2v5MbW1teY9aHww0NNdxmjE1Jue/UYjFbUbrQD0qpIfxSltLVyaRjHmAVLT7ezY3N52sa6jtv15TxV6+djFcXlEaLi0/xxYzR2YLGw8mSdm84rwkZP4fYOfdUwjREaAAAAAASUVORK5CYII='),
    ('Px-6l6-88xDP','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMxSURBVBgZdcFraFtlAAbg9zvnO5fcTk7Smda2SRvbLbau69aSUXWdE4rTuTlBnUxkYzgUFX9VLKJ4mQoyEMShwqygqKWKjKEDYSiuk152payKTdvFZZCmSdauTXNyTs4ln/vhjxLc85D1n82BASAMcqcqfPDgeu+BWpmXzl3XUqNThWPJtHbc55MRUCSUNQeT78WwFnWKNsAAw6oYaUryFUrErOEYl+a0C8mU/o2iyvD6ZNwOdW6aYAIPn8z1PBBx7x88OX8k0iBvpgyCKIv3KiH3DoFBqlgMt9gA3sAaHCs5KK9anr425UhzUKrnjUqqK+SK1MhcoKxZNTLPHdwYdb1W76cvLGZMEVU43aigRRUON/po15Wp5cvtdeKzDQp/j+RUmAeVWp9I1NlZbaxYsPP6sjWEKtTv4h55KB58e/z84vDpM9m3WMmULNP5VA25tzTdrXYspPSvbiwYo7FWz8dHdxzfkxhaucx7O6DdGAEx0gfpgb7QywEvnwsoVPPAXlIa3H13BD0BItKwV7AKJcLO3hkSor01vwZ3xdR3Xev2wB/dguV/Ypg+PXiU+j10Lw84AVUgstfFVsr0t1MXV8ObN/l6rKKd4xkb2Bkd3fDitqzkV+/H0tW/IRITPqUO3pqIn/I8caaTJfx+ocBMwQXKkbbWJvn1ZKLwcypZeuf7p97cFO/u+VZteRjlzDBEN0FqchqWYS4aevE+bva6gZ/OLCOTtznKk8fr1gmfuCWuZTFbHrt0eH94a3f8O7X1UWLMfwEi3ITg9UEuXc1ahUxf/JUTM3Rm3kJ92AVR4CjAnnbLXC1z2OyTjT/0ehr3feRvfQxG+nNwgg2zEEV+ZHzV0Uu7u/rPTeIWwhhDtV/er3+iOf7MUGz7XtHMfg3CmzBWGpE/e153dK091j9+Df/hUOXLlyLPNXUf+tFiYTEzdQwVGNCWGpAbmcg5hrYx1j9+DWtQVFGaNwy2b3seieFXMfPHGKRIJ+xcYj4g8js7BiaSqMKhSmJuwTb/OoVoZy88nhjSF6eKhm7u6hiY+BP/gzDGsNa+7UG9665aurUtCiaUx/Rc/tDuD68kcRv/AvFKVJouQOXGAAAAAElFTkSuQmCC'),
    ('Px-6x6-90rN4','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADxSURBVDjLY/z//z8DJYCJgUJAsQEsMEZ5efn/f//+Mfz58weOf//+Dce/fv2C0yC8d+9eRpA+RkrDgAWZ07rx3ZVqfyEdEDs2NvY6so3o+MyZM5pwAwL67msqSLCv4WFjgTsHqEgRl2YQhgFG3867mpJirIs0JdlNmBiZGR6++c7QGyXDSKwXwGHgWHldU1KOYy03B8e/2YmSYC94enpegdn28+dPuM0wbz18+FAH7oX97ZrXgZRW9MxnV2Am//jxQwXd2cixgeICqsSCt7f3f3yBhpwmQPjz589UTge2trb/sQUWsq0fPnxgxBoLA5qZANTo8jopO/z6AAAAAElFTkSuQmCC'),
    ('Px-6s6-358Z7','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF7SURBVDjL1VM9a8JQFD3PiEGSCO1ih1gnB0EkdCkKzp0E/0IHIRQc3bJ0LTh28me00CJ06SSddGmQGKpYHbQGVEz8wte8QIqQoYND6YXHvXC5h3POvY9QSnFMhHBk/D1A2C80TbtzU9X3hGX/bbdb1Go1UqlU6Gq1Qr1eJwEGu92uWiwWkU6nkUgk0Gq1cKtmoF29Qdd1qKpKJUmCKIoolUpGgIEgCGi321AUBbFYDPl8Hi/vQzSbBZTLCpbLJQaDAXieZ/V5AIChZ7NZPPRP8dxjxCIonMm4SKXQaDSQy+XQ6XQgyzKTFAlIYMjRaBRPZgizPY8ZeLx+CeA4DvP5HEy74zhYr9dMbnALtm1jsVi4pu1BmUUcAQ0RjMdjr/crwHQ6hWmauDyxIBEHIrGRCfdhGIY35A+zjRxe748Hk8kElmW5G/jEtWsiY9PTe/gYDhGPx71eMpn02DCQAMBoNLp3ad50u13i736z2XiZuX94F248+nPk/3+mb7TL1kbVXJ5aAAAAAElFTkSuQmCC'),
    ('Px-6c6-31gLD','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEjSURBVDjLxVM7TsRADPVEK4oVSrGU1FyCjltwADrOQhOJe1DsMbbfYjsQ2g4h5cvM2MaeT1BIJNBSYMl69iTv+TOJYWb4ixWnEquqCpVX3x887bqxJSQAkgwRwEvsE97drM0wDLAooHZxXgBlsiAmJDl4ecPwTtd1ywJaXsmZqLFP5JBHPrRtuyyQ29Xq2nIU44mYWtM0ywJKOr7TOC9hjIOAOvwgcHu9Nr+5hYnAw/bI81EYvLTgBJ1lsA7BORIkeLy/MnVdTzu43JwFJPmwdFGjgNcRxH0BXsj757i8mQBzWhaqK4EDGZ1gyvV8+KD5LeRqPmCKQ/UYo3oSJ6L5DqwlOLz2ghiq6pzOxvZ1fuQvYra+73PrfJKXZcmK5t/+xmyf9PZAc1Cvzt0AAAAASUVORK5CYII=');
-- ===================================================================================================
INSERT INTO Treatment VALUES
    ('Px-6w6-456AW','Tr-6uM-0TcG','DI519O','2017-10-24 00:00:00',NULL,27114.29,'D90OZR'),
    ('Px-6z6-48kD8','Tr-0v6-0OSp','DI58FM','2018-08-12 00:00:00',NULL,45577.68,'D40YEV'),
    ('Px-6s6-96cHM','Tr-6wM-3BeL','DI76VM','2016-02-13 00:00:00',NULL,39788,'D20EJ4'),
    ('Px-6g6-01fPG','Tr-7pZ-9Cb9','DI303I','2020-04-09 00:00:00',NULL,9794.44,'D20FE0'),
    ('Px-6j6-334TZ','Tr-9np-9MIk','DI18WA','2014-08-13 00:00:00',NULL,362251.78,'D50NML'),
    ('Px-6x6-747MQ','Tr-8yf-6UZS','DI58FM','2017-07-13 00:00:00',NULL,77746.5,'D30AH6'),
    ('Px-6p6-79kP2','Tr-8ij-0Ukh','DI26BJ','2020-01-18 00:00:00',NULL,6243.86,'D90HP3'),
    ('Px-6c6-50qYN','Tr-8nA-1UZ2','DI99ER','2016-04-13 00:00:00',NULL,7571.21,'D90ZYN'),
    ('Px-6d6-793XI','Tr-9pP-5RYo','DI41ZX','2017-02-24 00:00:00',NULL,38625.04,'D30WNL'),
    ('Px-6a6-63wQP','Tr-7sl-9JrD','DI38RF','2017-05-24 00:00:00',NULL,5543.82,'D10OIQ'),
    ('Px-6x6-53uAP','Tr-6cj-4VJO','DI519O','2017-09-28 00:00:00',NULL,52857.94,'D00TDE'),
    ('Px-6m6-43qWC','Tr-0ac-9Xql','DI58FM','2016-01-01 00:00:00',NULL,31016.87,'D60SHI'),
    ('Px-6t6-97mNG','Tr-6pZ-2IbT','DI76VM','2015-06-21 00:00:00',NULL,66213.62,'D80OAK'),
    ('Px-6i6-49kAF','Tr-7d3-9YQe','DI322E','2019-04-20 00:00:00',NULL,57046.84,'D80NWO'),
    ('Px-6s6-509ZG','Tr-1g9-5IqU','DI303I','2020-07-16 00:00:00',NULL,18408.37,'D10CJ7'),
    ('Px-6a6-61pDE','Tr-8aB-2CDU','DI18WA','2016-05-27 00:00:00',NULL,63180.83,'D162MY'),
    ('Px-6l6-88xDP','Tr-4ob-8HBb','DI26BJ','2018-08-11 00:00:00',NULL,87486.09,'D9178C'),
    ('Px-6x6-90rN4','Tr-3nu-8Mkg','DI99ER','2017-07-21 00:00:00',NULL,59767.44,'D375FC'),
    ('Px-6s6-358Z7','Tr-3n0-5PqD','DI41ZX','2020-04-13 00:00:00',NULL,6989.27,'D468A7'),
    ('Px-6c6-31gLD','Tr-3ai-0O52','DI38RF','2018-11-28 00:00:00',NULL,329697.53,'D282C5');
-- ==================================================================================================
INSERT INTO Patient VALUES
    ('U14Ffn3Unjb','P-r6-06cO5','Tr-6uM-0TcG','2017-07-21 21:14:42','B-'),
    ('U14MfmYJhtf','P-w6-11tN2','Tr-0v6-0OSp','2019-08-08 09:41:22','AB-'),
    ('U14EggV1rhv','P-l6-76mE2','Tr-6wM-3BeL','2017-06-30 23:13:48','A-'),
    ('U14TbqASh4z','P-d6-07vH8','Tr-7pZ-9Cb9','2019-05-09 00:54:54','O+'),
    ('U14ZewI7lid','P-j6-31oM3','Tr-9np-9MIk','2017-09-05 00:46:00','O+'),
    ('U14Qed6Fasr','P-o6-84kD7','Tr-8yf-6UZS','2016-08-12 05:29:57','A+'),
    ('U14UhiEA3ex','P-v6-65iN6','Tr-8ij-0Ukh','2018-02-28 04:00:43','AB-'),
    ('U14Dul5E9uv','P-a6-92uU4','Tr-8nA-1UZ2','2018-06-13 16:30:44','A+'),
    ('U14YgoF575q','P-f6-84wB8','Tr-9pP-5RYo','2017-08-27 13:39:55','B+'),
    ('U14FroZ4zrs','P-z6-781M3','Tr-7sl-9JrD','2020-01-29 07:03:48','AB+'),
    ('U14FbuWHqrp','P-f6-12xJ2','Tr-6cj-4VJO','2019-11-14 23:57:47','A-'),
    ('U14RhgYV5mg','P-f6-79vQ7','Tr-0ac-9Xql','2019-01-08 21:51:22','A-'),
    ('U14MlzH7o9p','P-r6-73oQ7','Tr-6pZ-2IbT','2019-09-19 20:48:05','O-'),
    ('U14GofTNvjb','P-m6-52oG8','Tr-7d3-9YQe','2017-12-29 15:19:48','AB-'),
    ('U14Abv48ttc','P-r6-60fP9','Tr-1g9-5IqU','2019-07-21 13:11:38','B+'),
    ('U14SlvK37bu','P-v6-890B3','Tr-8aB-2CDU','2018-10-09 06:47:00','AB-'),
    ('U14YdeH3u6i','P-q6-98rG4','Tr-4ob-8HBb','2019-08-20 19:35:25','B-'),
    ('U14Vte0Av0x','P-e6-395M7','Tr-3nu-8Mkg','2016-06-04 12:00:58','A-'),
    ('U14TkmCKglk','P-u6-40qO0','Tr-3n0-5PqD','2017-01-22 14:43:54','O+'),
    ('U14TapY77jk','P-f6-410C4','Tr-3ai-0O52','2018-07-25 10:30:06','O+');
