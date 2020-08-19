#Guia de caso tudo der errado

#usuario
create user "impressoras"@"%" identified by "rr";
create user "impressoras"@"localhost" identified by "rr";
grant all on impressoras_geral . * to "impressoras"@"%";
grant all on impressoras_geral . * to "impressoras"@"localhost";
flush privileges;
