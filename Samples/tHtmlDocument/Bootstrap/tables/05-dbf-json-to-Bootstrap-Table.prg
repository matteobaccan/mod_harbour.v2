//Nu Html Checker :: https://validator.w3.org/nu/
//https://github.com/pbse/JSON-to-Bootstrap-Table

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
    SetEnvIf Request_URI "/samples/tHtmlDocument/Bootstrap/tables/" MH_INITPROCESS=../pluggins/contrib/thtml.hrb,../pluggins/templates/addHarbourPRGFileAsCodeText.prg,../pluggins/templates/BootstrapStarterTemplate.prg
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure main()

    local cHTML as character

    local oLang as object
    local oHTMLDoc as object
    local oHeadTitle as object
    local pHrbLoad as pointer

    cHTML:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/json-to-Bootstrap-Table/example/index-dbf.html")
    oHTMLDoc:=tHTMLDocumentNew(cHTML,@pHrbLoad)

    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    oHeadTitle:=oHTMLDoc:Head:title
    oHeadTitle:text:="MOD_HARBOUR :: DBF/JSON to Bootstrap table"

    addHarbourPRGFileAsCodeText(oHTMLDoc:body:Main,hb_getenv('PRGPATH')+'/05-dbf-json-to-Bootstrap-Table.prg')

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
