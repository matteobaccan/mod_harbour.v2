//Nu Html Checker :: https://validator.w3.org/nu/
//https://github.com/pbse/JSON-to-Bootstrap-Table

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
*/
{% MH_LoadHRB( '..\pluggins\contrib\thtml.hrb' ) %}

procedure main()

    local cHTML as character

    local oLang as object
    local oHTMLDoc as object
    local oHeadTitle as object

    cHTML:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/json-to-Bootstrap-Table/example/index-json.html")
    oHTMLDoc:=THtmlDocument():New(cHTML)

    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    oHeadTitle:=oHTMLDoc:Head:title
    oHeadTitle:text:="MOD_HARBOUR :: JSON/JSON to Bootstrap table"

    addHarbourPRGFileAsCodeText(oHTMLDoc:body:Main,hb_getenv('PRGPATH')+'/04-json-to-Bootstrap-Table.prg')

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('..\pluggins\templates\addHarbourPRGFileAsCodeText.prg') %}
