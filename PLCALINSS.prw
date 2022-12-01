#include "protheus.ch"

user Function PLTELINS()
    Local oDlg, oGet, cSalario := space(20), cNome := space(60)
    
    DEFINE DIALOG oDlg TITLE "Calculo do INSS" FROM 180,180 TO 550,550 PIXEL

    @ 30,60 SAY decodeUtf8("Informe o seu nome:") SIZE 55,07 OF oDlg PIXEL
    @ 40,40 GET oGet VAR cNome SIZE 100,10 OF oDlg PIXEL //VALID !empty() 

    @ 70,60 SAY decodeUtf8("Informe o seu salário: ") SIZE 55,07 OF oDlg PIXEL
    // Cria o Objeto tGet usando o comando @ .. GET
    @ 80,40 GET oGet VAR cSalario SIZE 100,10 OF oDlg PIXEL VALID !empty(cSalario) 
   
    oTButton2 := TButton():New( 115, 40, "Fechar",oDlg,{||oDlg:End()}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. )
    oTButton2:setCss("background: violet; border-radius: 15%; border: solid 1px black; font: bold;")
    oTButton1 := TButton():New( 115, 90, "Calcular",oDlg,{||fwmsgrun(,{||PLCALINS(cSalario, cNome)},,"Calculando...")}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. ) 
    oTButton1:setCss("background: violet; border-radius: 15%; border: solid 1px black; font: bold;")
    ACTIVATE DIALOG oDlg CENTERED
return

Static Function PLCALINS(cSalario, cNome)

Local nsalario := Val(cSalario)
Local ncontribuicao := 0

Local ninss1 := 0.075
Local ninss2 := 0.09
Local ninss3 := 0.12
Local ninss4 := 0.14

Local nbase1 := 1212.00
Local nbase2 := 2437.35
Local nbase3 := 3641.03
Local nbase4 := 7087.22

Local nsoma  := nbase1 * ninss1
Local nsoma1 := (nbase2 - nbase1) * ninss2
Local nsoma2 := (nbase3 - nbase2) * ninss3
Local nsoma3 := (nbase4 - nbase3) * ninss4

Local ndesconto1 := 0
Local ndesconto2 := 0
Local ndesconto3 := 0
Local ndesconto4 := 0
Local ndesconto5 := 0

If nsalario <= nbase1
    ndesconto1 := nsalario * ninss1
    ncontribuicao := ndesconto1  
ELSEIF nsalario <= nbase2
    ndesconto2 := (nsalario - nbase1) * ninss2 + nsoma
    ncontribuicao := ndesconto2
ELSEIF nsalario <= nbase3
    ndesconto3 := (nsalario - nbase2) * ninss3 + nsoma + nsoma1
    ncontribuicao := ndesconto3
ELSEIF nsalario <= nbase4
    ndesconto4 := (nsalario - nbase3) * ninss4 + nsoma + nsoma1 + nsoma2
    ncontribuicao := ndesconto4
ELSEIF nsalario >= nbase4
    ndesconto5 := nsoma + nsoma1 + nsoma2 + nsoma3
    ncontribuicao := ndesconto5
    
EndIf
    mensagem(nsalario, ncontribuicao, cNome)
return

/*/{Protheus.doc} nomeStaticFunction
    (long_description)
    @type  Static Function
    @author user
    @since date
    @version version
    @param param, param_type, param_descr
    @return return, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
 Static Function mensagem(nsalario, ncontribuicao, cNome)
    FWalertSuccess(decodeUtf8("O nome da pessoa é <b>" + cNome + "</b>" + chr(13) + chr(10) +;
    "O salário bruto informado foi de R$ " + Transform(nsalario, "@E 9999,9999.99") + chr(13) + chr(10) + ;
    "O valor de contribuição ao INSS é <b>R$" + Transform(ncontribuicao, "@E 9999,9999.99") + "</b>"))
 return

