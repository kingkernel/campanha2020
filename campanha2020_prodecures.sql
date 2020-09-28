delimiter //
	create procedure add_licence(arg_email varchar(60), )
	begin 
		
	end //
delimiter ;

delimiter //
	create procedure sp_selall_estados()
	begin
		select id, estado from estados order by estado;
	end //
delimiter ;

delimiter //
	create procedure sp_sel_cidade(arg_estado int)
	begin
		select id, cidade from cidades where estado = arg_estado;
	end //
delimiter ;

delimiter /
	create procedure sp_add_eleitorsite(arg_nome varchar(75), arg_email varchar(60), arg_estado int, arg_cidade int, arg_bairro varchar(75), arg_logradouro varchar(100), arg_numero varchar(15))
	begin
		insert into eleitor (nome, email, estado, cidade, bairro, logradouro, numero, cadfor)
			values (arg_nome, arg_email, arg_estado, arg_cidade, arg_bairro, arg_logradouro, arg_numero, "site");
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

