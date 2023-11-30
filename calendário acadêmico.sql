use universidade_u;

/* um calendário acadêmico */

create table calendario(
    idcalendaro int not null primary key auto_increment,
    `data` date not null,
    dia int(2) not null,
    mes int(2) not null,
    ano int(4) not null,
    feriado enum('s', 'n'),
    nome_feriado varchar(50)
);

select * from calendario;
select * from calendario where feriado = '2019-09-07';

delimiter $$
create procedure proc_calendario(in p_data_inicio date, in p_data_fim date)
comment 'Procedimento para definição do calendário com base em uma data início e fim'
begin
    declare v_dia, v_mes int(2);
    declare v_ano int(4);
    declare v_feriado char(1);
    declare v_nome_feriado varchar(50);
    
    select p_data_inicio as data_inicio, p_data_fim as data_fim;
    
    while p_data_inicio <= p_data_fim do /* '2019-01-01' <= 2019-12-31' */
      
        set v_dia = extract(day from p_data_inicio);
        set v_mes = extract(month from p_data_inicio);
		set v_ano = extract(year from p_data_inicio);
        
        if v_dia = 1 and v_mes = 1 then
            set v_feriado = 's';
            set v_nome_feriado = 'Confraternização Universal';
		elseif v_dia = 1 and v_mes = 5 then
			set v_feriado = 's';
            set v_nome_feriado = 'Dia do Trabalho';
		elseif v_dia = 7 and v_mes = 9 then
			set v_feriado = 's';
            set v_nome_feriado = 'Indepedência';
		elseif v_dia = 25 and v_mes = 12 then
			set v_feriado = 's';
            set v_nome_feriado = 'Natal';            
		else 
			set v_feriado = 'n';
            set v_nome_feriado = null;
		end if;
     
        insert into calendario(`data`, dia, mes, ano)
        values(p_data_inicio, v_dia, v_mes, v_ano, v_feriado, v_nome_feriado);
    
        set p_data_inicio = date_add(p_data_inicio, interval 1 day); /* 2020-01-01 */
    end while;
end
$$
delimiter ;

call proc_calendario('2019-01-01', '2019-12-31');
drop procedure universidade_u.proc_calendario;
truncate table calendario;