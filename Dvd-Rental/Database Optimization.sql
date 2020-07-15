-- 1. Create master and child tables

create sequence paymentParentIdSeq start 1;

create table payment_parent
(
  payment_id integer not null default nextval('rentalParentIdSeq'::regclass),
  customer_id integer not null,
  staff_id integer not null,
  rental_id integer not null,
  amount numeric(5,2) NOT NULL,
  payment_date timestamp without time zone not null
);

ALTER TABLE public.payment_parent
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id)
    REFERENCES public.customer (customer_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
	
ALTER TABLE public.payment_parent
    ADD CONSTRAINT payment_master_pkey PRIMARY KEY (payment_id);
	
ALTER TABLE public.payment_parent
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id)
    REFERENCES public.rental (rental_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE SET NULL;
	
ALTER TABLE public.payment_parent
    ADD CONSTRAINT payment_staff_id_fkey FOREIGN KEY (staff_id)
    REFERENCES public.staff (staff_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
	
create table payment_child_2007_02
(
	check (extract (year from payment_date)=2007), 
	check (extract (month from payment_date)=2)
)inherits(payment_master);


-- 2. Create trigger or rule --

create or replace function paymentMasterTrigger()
returns trigger as $$
declare
        partition_table text;
        partition_year text;
		partition_month text;
begin
       
        select extract(year from new.payment_date) into partition_year;
		select extract(month from new.payment_date) into partition_month;
			
        partition_table := 'rental_child_' || partition_year || '_' || partition_month;
       
        if not exists(select relname from pg_class where relname=partition_table) then
                execute 'create table '|| partition_table || '(check (extract(year from payment_date)=' || partition_year || ' and extract(month from payment_date)=' || partition_month || ')) inherits (payment_parent)';
        end if;
       
        execute 'insert into ' || partition_table || '(customer_id,  staff_id, rental_id, amount, payment_date) values ('|| new.customer_id ||',' || new.staff_id ||','|| new.rental_id ||  ',' || new.amount || ',''' || new.payment_date || ''')';
 
        return null;
end
$$
language plpgsql;

create trigger insertRentalsParent
before insert on payment_parent
for each row execute procedure paymentMasterTrigger();

-- 3. Move data --

insert into payment_master(payment_id, customer_id, staff_id, rental_id, amount, payment_date)
select payment_id, customer_id, staff_id, rental_id, amount, payment_date from payment;


-- 4. Analyze tables --

analyze payment_master;
analyze payment_child_2007_02;


-- 5. Enable dml on master table --

show constraint_exclusion;
-- off, on, partition
set constraint_exclusion=on;

-- 7. Drop old table after lookup
alter index payment_master_pkey rename to payment_pk;

--8. Rename tables

alter table payment rename to tobedropped;
drop table tobedropped;
alter table payment_parent rename to payment;

