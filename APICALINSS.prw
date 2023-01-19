#include "protheus.ch"
#include "restful.ch"
#include "FWMVCDEF.ch"

//Criando uma Api
WsRestFul calculo Description "Serviços API para realizar inclusão do cálculo Inss" Format APPLICATION_JSON
    WSData apiVersion as STRING OPTIONAL
    WSMethod POST IncInss Description "API criado para gerar inclusão dos cálculos do Inss" ;
    WSSyntax "{apiVersion}/inss" ;
    Path "{apiVersion}/inss" PRODUCES APPLICATION_JSON
End WsRestFul

WSMethod POST IncInss WSService calculo
    Local cBody := ::getContent()
    Local oJson := jsonObject():new()
    Local oModel := FWLoadModel("PLTELINSS")
    oJson:fromJson(cBody)
    
    Do Case

        Case !oJson:hasProperty("nome")
        ::setResponse('{"mensagem" : "Obrigatorio informar o nome!"}')

        Case !oJson:hasProperty("salario")
        ::setResponse('{"mensagem" : "Obrigatorio informar o salário!"}')

        Case ValType(oJson["salario"]) != "N"
        ::setResponse('{"mensagem" : "O tipo da propriedade tem que ser numérico!"}')

        Case ValType(oJson["nome"]) != "C"
        ::setResponse('{"mensagem" : "O nome tem que ser caractere!"}')

        OtherWise
        oModel:setOperation(3)
        oModel:ACTIVATE()
        oModel:setValue("MasterZZ1" , "ZZ1_NOME" , oJson["nome"])
        oModel:setValue("MasterZZ1" , "ZZ1_SALARI" , oJson["salario"])

    EndCase 

    IF oModel:VldData()
    oModel:commitData()
    ::setResponse('{"mensagem" : "Operação realizada com sucesso!"}')

    ELSE
    ::setResponse('{"mensagem" : "Houve falha ao gravar o nome!"}')

    End

return .T.

