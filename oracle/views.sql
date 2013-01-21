--------------------------------------------------------
--  File created - Monday-November-26-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BUDGET_ITEMS_INFO_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."BUDGET_ITEMS_INFO_VIEW" ("NAME", "LIMIT", "Start Date", "End Date", "Remaining Amount", "TITLE", "Cost", "QUANTITY", "Total Cost") AS 
  SELECT b.name,b.limit, b.start_date AS "Start Date",
b.end_date AS "End Date",
(b.limit - b.allocated_amount) AS "Remaining Amount",
bi.title, bi.cost_per AS "Cost", bi.quantity,
(bi.cost_per*bi.quantity) AS "Total Cost"
FROM BUDGETS b INNER JOIN budget_items bi ON bi.budget_id = b.id;
--------------------------------------------------------
--  DDL for View EVENT_SUMMARY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."EVENT_SUMMARY_VIEW" ("NAME", "DATE", "LIMIT", "ALLOCATED_AMOUNT", "MEM_COUNT", "COMMENTS") AS 
  SELECT e.name, 
       e."DATE", 
       b."LIMIT",
       b.allocated_amount, 
       (select COUNT(member_id) from event_members where event_id = e.id) as mem_count, 
       e.comments
FROM events e
INNER JOIN budgets b ON b.event_id = e.id
INNER JOIN event_members em ON em.event_id  = e.id;
--------------------------------------------------------
--  DDL for View EXPENSE_SUMMARY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."EXPENSE_SUMMARY_VIEW" ("NAME", "DATE_OF", "AMOUNT", "ACCOUNT_NUMBER", "DESCRIPTION", "PAYMENT_METHOD") AS 
  SELECT v.name, e.date_of, e.amount, a.account_number, e.description, e.payment_method
FROM expenses e INNER JOIN vendors  v ON e.vendor_id = v.id 
INNER JOIN accounts a ON e.account_id = a.id;
--------------------------------------------------------
--  DDL for View MEMBER_CONTACT_INFO_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."MEMBER_CONTACT_INFO_VIEW" ("Name", "ADDRESS", "CITY", "STATE", "Zip", "Phone Number", "EMAIL") AS 
  SELECT m.first_name || ' ' || m.last_name AS "Name", m.address,m.city,m.state,
m.zipcode as "Zip", m.phone_number as "Phone Number", m.email
from members m;
--------------------------------------------------------
--  DDL for View MEMBER_DONATION_INFO_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."MEMBER_DONATION_INFO_VIEW" ("Name", "DATE_GIVEN", "AMOUNT", "DONATION_TYPE") AS 
  SELECT m.first_name || ' ' || m.last_name AS "Name", d.date_given, d.amount,
d.donation_type
FROM "MEMBERS" m INNER JOIN "DONATIONS" d on d.member_id = m.id;
--------------------------------------------------------
--  DDL for View MINISTRY_INFO_SUMMARY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."MINISTRY_INFO_SUMMARY_VIEW" ("NAME", "MEETING_TIME", "MEETING_DAY", "Number of Members", "Dues Collected", "Cash Assets") AS 
  SELECT m.name, m.meeting_time, m.meeting_day,
(select COUNT(member_id) from minstry_members where ministry_id = m.id) as "Number of Members",
m.dues_collected AS "Dues Collected", m.balance_available AS "Cash Assets"
FROM ministries m;
--------------------------------------------------------
--  DDL for View MINISTRY_MEMBERS_INFO_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ATBYRD"."MINISTRY_MEMBERS_INFO_VIEW" ("NAME", "Name", "ADDRESS", "CITY", "STATE", "Zip", "Phone Number", "EMAIL") AS 
  SELECT ministry.name, member.first_name || ' ' || member.last_name AS "Name",
member.address,member.city,member.state,
member.zipcode as "Zip", member.phone_number as "Phone Number", member.email
FROM ministries ministry INNER JOIN minstry_members mm ON  mm.ministry_id = ministry.id
INNER JOIN members member ON mm.member_id = member.id;
