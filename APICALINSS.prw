#include "protheus.ch"
#include "restful.ch"

//Criando uma Api
WsRestFul calculo Description "Servi�os API para realizar inclus�o do c�lculo Inss" Format APPLICATION_JSON
    WSData apiVersion as STRING OPTIONAL
    WSMethod POST IncInss Description "API criado para gerar inclus�o dos c�lculos do Inss" ;
    WSSyntax "{apiVersion}/inss" ;
    Path "{apiVersion}/inss" PRODUCES APPLICATION_JSON
End WsRestFul

WSMethod POST IncInss WSService calculo

    ::setResponse('{"mensagem" : "Ol� Mundo!"}')

return .T.

