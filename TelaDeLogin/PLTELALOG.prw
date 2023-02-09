#include "protheus.ch"
#include "FWMVCDEF.ch"
#include "FWBROWSE.ch"

User Function PLTELOGI()
    Local oDlg, oGet
    Local cUsuario := space(50)
    Local cEmail := space(50)
    Local cSen := space(30)

    DEFINE DIALOG oDlg TITLE "Tela de Login" FROM 180,180 TO 550,550 PIXEL

    @ 30,80 SAY decodeUtf8("Usuário:") SIZE 100,10 OF oDlg PIXEL
    @ 40,40 GET oGet VAR cUsuario SIZE 100,10 OF oDlg PIXEL VALID !empty(cUsuario)

    @ 60,80 SAY decodeUtf8("E-mail:") SIZE 100,10 OF oDlg PIXEL
    @ 70,40 GET oGet VAR cEmail SIZE 100,10 OF oDlg PIXEL VALID !empty(cEmail)

    @ 90,80 SAY decodeUtf8("Senha:") SIZE 100,10 OF oDlg PIXEL
    @ 100,40 GET oGet VAR cSen SIZE 100,10 OF oDlg PIXEL VALID !empty(cSen)

    oTButton1 := TButton():New( 120, 50, "Cadastrar",oDlg,{||oDlg:End()}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. )
    oTButton1:setCss("background: #27D5E8; border-radius: 15%; border: solid 1px white; font: bold;")
    oTButton2 := TButton():New( 120, 95, "Login",oDlg,{||}, 40,25,,,.F.,.T.,.F.,,.F.,,,.F. ) 
    oTButton2:setCss("background: #27D5E8; border-radius: 15%; border8: solid 1px white; font: bold;")
    ACTIVATE DIALOG oDlg CENTERED
return

User Function PLTELBRO()
    Local oBrowse 
    Private aRotina := MenuDef()

    oBrowse := FWMBrowse():New()
    oBrowse:setAlias("ZZ3")
    oBrowse:setDescription("Tela de Login")
    oBrowse:Activate()
return

Static Function MenuDef()
    Local aRotina := {}
    ADD OPTION aRotina TITLE "Tela de Login" ACTION "U_PLTELOGI" OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.PLTELALOG" OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.PLTELALOG" OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir Cadastro" ACTION "VIEWDEF.PLTELALOG" OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.PLTELALOG" OPERATION 4 ACCESS 0
return aRotina

Static Function ModelDef()
    Local oModel
    Local oStructZZ3 := FWFormStruct( 1, "ZZ3")
    oModel := MPFormModel():new("TelaDeLogin")
    oModel:AddFields("MasterZZ3", Nil, oStructZZ3)
    oModel:setDescription("Login")
    oModel:setPrimaryKey({})
return oModel

Static Function ViewDef()
    Local oView 
    Local oStructZZ3 := FWFormStruct( 2, "ZZ3")
    Local oModel := FWLoadModel("PLTELALOG")
    oView := FWFormView():new()
    oView:setModel(oModel)
    oView:AddField("ViewZZ3", oStructZZ3, "MasterZZ3")
    oView:CreateHorizontalBox("Box", 100)
    oView:setOwnerView("ViewZZ3", "Box")
return oView

