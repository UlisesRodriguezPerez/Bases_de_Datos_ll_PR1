insert into "Categoria"("Nombre")SELECT DISTINCT (categorias) FROM categoriasubcategoria order by (categorias);

insert into "SubCategoria"("IdCategoria","Nombre")
select Ca."IdCategoria",Cs.subcategoria from "Categoria" Ca
inner join categoriasubcategoria Cs on cs.categorias = Ca."Nombre"
order by (cs.subcategoria);