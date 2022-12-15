#include "protheus.ch"
#include "FWMVCDEF.ch"
#include "FWBROWSE.ch"

User Function PLTEINSS()
    Local oBrowse
    Private aRotina := MenuDef()

    oBrowse := FWMBrowse():New()
    oBrowse:setAlias("ZZ1")
    oBrowse:setDescription("Cadastro de cálculo do INSS")
    oBrowse:Activate()
return

Static Function MenuDef()
    Local aRotina := {}
    ADD OPTION aRotina TITLE "Calculo de INSS" ACTION "u_PLTELINS" OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.PLTELINSS" OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.PLTELINSS" OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir" ACTION "VIEWDEF.PLTELINSS" OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.PLTELINSS" OPERATION 4 ACCESS 0

return aRotina

Static Function ModelDef()
    Local oModel
    Local oStructZZ1 := FWFormStruct( 1, "ZZ1")
    oModel := MPFormModel():new("ModelCalINSS")
    oModel:AddFields("MasterZZ1", Nil, oStructZZ1)
    oModel:setDescription("Cálculo do INSS")
    oModel:setPrimaryKey({})
return oModel

Static Function ViewDef()
    Local oView 
    Local oStructZZ1 := FWFormStruct( 2, "ZZ1")
    Local oModel := FWLoadModel("PLTELINSS")
    oView := FWFormView():new()
    oView:setModel(oModel)
    oView:AddField("ViewZZ1", oStructZZ1, "MasterZZ1")
    oView:CreateHorizontalBox("Box", 100)
    oView:setOwnerView("ViewZZ1", "Box")
return oView

User Function 
