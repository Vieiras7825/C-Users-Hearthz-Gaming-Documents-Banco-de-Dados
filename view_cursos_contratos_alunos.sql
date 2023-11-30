use universidade_u;

--													

select * from telefone;

select * from telefone where fk_idaluno in(1, 2, 3, 4);

update telefone set fk_idaluno = 1 where fk_idaluno = 9;
update telefone set fk_idaluno = 2 where fk_idaluno = 7;

create view vw_rel_alunos_cursos_contratos a
select
    a.idaluno,
    a.nome,
    c.idcurso,
    c.descricao as curso,
    co.idcontrato,
    co.fk_data_inscricao_curso as data_inscricao,
    co.valor_total_curso
from
    aluno as a
    left join aluno_curso as ac on(a.idaluno = ac.fk_idaluno)
    left join curso as c on (ac.fk_idcurso = c.idcurso)
    left join contrato co on (
    ac.fk_idaluno = co.fk_idaluno 
    and ac.fk_idcurso = co.fk_idcurso 
    and ac.data_inscricao_curso = co.fk_data_inscricao_curso
    );
    
show tables;