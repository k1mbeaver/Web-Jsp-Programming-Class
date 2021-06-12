CREATE TABLE IF NOT EXISTS product(
	p_id varchar(10) not null,
	p_name varchar (20),
	p_unitPrice integer,
	p_description text,
	p_category varchar(20),
	p_manufacturer varchar(20),
	p_unitInStock long,
	p_condition varchar(20),
	p_filename varchar(20),
	primary key (p_id)
)default charset=euckr;

select * from product;