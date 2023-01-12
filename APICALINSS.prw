#include "protheus.ch"
#include "restful.ch"

//Criando uma Api
WsRestFul calculo Description "Serviços API para realizar inclusão do cálculo Inss" Format APPLICATION_JSON
    WSData apiVersion as STRING OPTIONAL
    WSMethod POST IncInss Description "API criado para gerar inclusão dos cálculos do Inss" ;
    WSSyntax "{apiVersion}/inss" ;
    Path "{apiVersion}/inss" PRODUCES APPLICATION_JSON
End WsRestFul

WSMethod POST IncInss WSService calculo

    ::setResponse('{"mensagem" : "Olá Mundo!"}')

return .T.

