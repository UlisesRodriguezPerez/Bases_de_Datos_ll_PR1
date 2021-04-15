alter table "ComentariosAClientes"
add constraint FKtest
foreign key ("idSubasta")
references "Subasta"("IdSubasta")

alter table "ComentariosAVendedores"
add constraint FKtest
foreign key ("IdSubasta")
references "Subasta"("IdSubasta")

alter table "Pujas"
add constraint FKtest
foreign key ("IdSubasta")
references "Subasta"("IdSubasta")

alter table "Pujas"
add foreign key ("IdUsuario")
references "Usuarios"("Cedula")

alter table "Subasta"
add foreign key ("IdVendedor")
references "Usuarios"("Cedula")

alter table "Subasta"
add foreign key ("IdComprador")
references "Usuarios"("Cedula")

alter table "Subasta"
add foreign key ("IdSubCategoria")
references "SubCategoria"("IdSubCategoria")

alter table "SubCategoria"
add foreign key ("IdCategoria")
references "Categoria"("IdCategoria")

