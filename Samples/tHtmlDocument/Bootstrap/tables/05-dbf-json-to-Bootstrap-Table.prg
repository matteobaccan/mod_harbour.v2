//https://github.com/pbse/JSON-to-Bootstrap-Table
procedure main()

    local cHTML as character

    local oLang as object
    local oHTMLDoc as object
    local oHeadTitle as object

    cHTML:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/json-to-Bootstrap-Table/example/index-dbf.html")
    oHTMLDoc:=THtmlDocument():New(cHTML)

    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    oHeadTitle:=oHTMLDoc:Head:title
    oHeadTitle:text:="MOD_HARBOUR :: DBF/JSON to Bootstrap table"

    addHarbourPRGFileAsCodeText(oHTMLDoc:body,hb_getenv('PRGPATH')+'/05-dbf-json-to-Bootstrap-Table.prg')

    cHTML:=oHTMLDoc:toString()

    ??cHTML

    return

{% MH_LoadFile('..\pluggins\templates\addHarbourPRGFileAsCodeText.prg') %}
