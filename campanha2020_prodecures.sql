delimiter //
	create procedure add_licence(arg_email varchar(60), )
	begin 
		
	end //
delimiter ;

-- #####################################################################

create database mostra;

use mostra ;

create table parcelas(
id int auto_increment primary key,
cliente varchar(30),
parcelas double(5,2)
);

delimiter //
	create procedure addparcela(nome varchar(30), valor double(5,2), parcela int)
	begin
		set @parcela = (select (valor/parcela));
		set @quant = 1;		
		WHILE @quant <= parcela DO
			insert into parcelas (cliente, parcelas) values (nome, @parcela);
			set @quant = @quant+1;
		END WHILE ;
	end //
delimiter ;

create table credito (
id int auto_increment primary key,
cliente varchar(30),
credito double(5,2)
);

delimiter //
	create procedure credito (nome varchar(30), salario double(7,2), porcentagem int)
	begin
		set @credito = (select ((salario * porcentagem)/100));
		insert into credito (cliente, credito) values (nome, @credito);
	end //
delimiter ;

