#include "protheus.ch"
#include "totvs.ch"

Static Function pesFisica()
    Local cNome := space(50)
    Local nCpf := space(11)
    Local nTel := space(11)
    Local cEmail := space(50)
    Local oDlg, oGet
    
    DEFINE DIALOG oDlg TITLE "Cadastro Bancario" FROM 100,100 TO 600,500 PIXEL

    @ 10,10 GROUP oGrp TO 200,180 LABEL decodeUtf8("Informe os seus dados!") PIXEL 

    @ 30,60 SAY decodeUtf8("Nome:") SIZE 100,10 OF oDlg PIXEL
    @ 40,40 GET oGet VAR cNome SIZE 100,10 OF oDlg PIXEL VALID !empty(cNome) 

    @ 60,60 SAY decodeUtf8("CPF:") SIZE 100,10 OF oDlg PIXEL
    @ 70,40 GET oGet VAR nCpf SIZE 100,10 OF oDlg PIXEL VALID !empty(nCpf)

    @ 90,60 SAY decodeUtf8("Telefone:") SIZE 100,10 OF oDlg PIXEL
    @ 100,40 GET oGet VAR nTel SIZE 100,10 OF oDlg PIXEL VALID !empty(nTel)

    @ 120,60 SAY decodeUtf8("Email:") SIZE 50,10 OF oDlg PIXEL
    @ 130,40 GET oGet VAR cEmail SIZE 100,10 OF oDlg PIXEL VALID !empty(cEmail)

    oTButton1 := TButton():New( 180, 30, "Fechar",oDlg,{||oDlg:End()}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. )
    oTButton1:setCss("background: red; border-radius: 15%; border: solid 1px white; font: bold;")
    oTButton3 := TButton():New( 180, 80, "Cadastrar",oDlg,{||salvar(cNome, nCpf, nTel, cEmail)}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. ) 
    oTButton3:setCss("background: green; border-radius: 15%; border8: solid 1px white; font: bold;")
    ACTIVATE DIALOG oDlg CENTERED

return

Static Function PesJurid()
    Local cNomeFanta := space(100)
    Local nCnpj := space(20)
    Local nTelJu := space(11)
    Local cEmailJu := space(50)
    Local oDlg, oGet
    
    DEFINE DIALOG oDlg TITLE "Cadastro Bancario" FROM 100,100 TO 600,500 PIXEL

    @ 10,10 GROUP oGrp TO 200,180 LABEL decodeUtf8("Informe os seus dados!") PIXEL

    @ 30,60 SAY decodeUtf8("Nome Fantasia:") SIZE 100,10 OF oDlg PIXEL
    @ 40,40 GET oGet VAR cNomeFanta SIZE 100,10 OF oDlg PIXEL VALID !empty(cNomeFanta) 

    @ 60,60 SAY decodeUtf8("CNPJ:") SIZE 100,10 OF oDlg PIXEL
    @ 70,40 GET oGet VAR nCnpj SIZE 100,10 OF oDlg PIXEL VALID !empty(nCnpj)

    @ 90,60 SAY decodeUtf8("Telefone:") SIZE 100,10 OF oDlg PIXEL
    @ 100,40 GET oGet VAR nTelJu SIZE 100,10 OF oDlg PIXEL VALID !empty(nTelJu)

    @ 120,60 SAY decodeUtf8("Email:") SIZE 50,10 OF oDlg PIXEL
    @ 130,40 GET oGet VAR cEmailJu SIZE 100,10 OF oDlg PIXEL VALID !empty(cEmailJu)

    oTButton1 := TButton():New( 180, 30, "Fechar",oDlg,{||oDlg:End()}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. )
    oTButton1:setCss("background: red; border-radius: 15%; border: solid 1px white; font: bold;")
    oTButton3 := TButton():New( 180, 80, "Cadastrar",oDlg,{||salvar(cNomeFanta, nCnpj, nTelJu, cEmailJu)}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. ) 
    oTButton3:setCss("background: green; border-radius: 15%; border8: solid 1px white; font: bold;")
    ACTIVATE DIALOG oDlg CENTERED
return

user Function PLTELBAN()
    Local oDlg, oGet
    
    DEFINE DIALOG oDlg TITLE "Cadastro Bancario" FROM 100,100 TO 600,500 PIXEL

    @ 10,10 GROUP oGrp TO 200,180 LABEL decodeUtf8("Cadatro Bancario!") PIXEL

    @ 30,60 SAY decodeUtf8("Escolha o tipo de cadastro: ") SIZE 100,10 OF oDlg PIXEL

    oTButton1 := TButton():New( 80, 50, "Pessoa Fisica",oDlg,{||pesFisica()}, 50,30,,,.F.,.T.,.F.,,.F.,,,.F. )
    oTButton1:setCss("background: blue; border-radius: 15%; border: solid 1px white; font: bold;")
    oTButton3 := TButton():New( 80, 95, "Pessoa Juridica",oDlg,{||PesJurid()}, 50,30,,,.F.,.T.,.F.,,.F.,,,.F. ) 
    oTButton3:setCss("background: Blue; border-radius: 15%; border8: solid 1px white; font: bold;")
    ACTIVATE DIALOG oDlg CENTERED

return

