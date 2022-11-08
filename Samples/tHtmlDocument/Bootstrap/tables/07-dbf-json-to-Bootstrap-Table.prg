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
    local oScript as object
    local oHTMLDoc as object

    local oHeadTitle as object

    local oDivContainer as object

    local oDivPageHeader as object
    local oDivPageHeaderH3 as object
    local oDivPageHeaderRow as object
    local oDivPageHeaderRowH5 as object
    local oDivPageHeaderRowDiv as object

    local oDivCreateTableJSON as object

    local oFigureHighlight as object
    local oFigureHighlightPre as object
    local oFigureHighlightPreH4 as object
    local oFigureHighlightPreCode as object
    
    local pHrbLoad as pointer

    cHTML:=hb_MemoRead(hb_GetEnv('PRGPATH')+"/json-to-Bootstrap-Table/example/index-json-dbf.html")
    oHTMLDoc:=tHTMLDocumentNew(cHTML,@pHrbLoad)
    
    oLang:=oHTMLDoc:root:html
    oLang:attr:={"lang"=>"en"}

    oHeadTitle:=oHTMLDoc:Head:title
    oHeadTitle:text:="MOD_HARBOUR :: DBF/JSON to Bootstrap table"

    oDivContainer:=oHTMLDoc:body:Main:div
    oDivContainer:attr:='class="container-fluid"'

    oDivPageHeader:=oDivContainer+"div"
    oDivPageHeader:attr:='class="page-header"'
    oDivPageHeaderH3:=oDivPageHeader:h3
    oDivPageHeaderH3:text:="mod_harbour :: DBF/JSON to Bootstrap table"

    oDivPageHeaderRow:=oDivContainer+"div"

    oDivPageHeaderRowH5:=oDivPageHeaderRow:h5
    oDivPageHeaderRowH5:text:="mod_harbour :: Bootstrap Table with JSON Data - Ajax request"

    oDivPageHeaderRowDiv:=oDivPageHeaderRow+"div"
    oDivCreateTableJSON:=oDivPageHeaderRowDiv+"div"
    oDivCreateTableJSON:attr:='class="createTableJSON"'

    oFigureHighlight:=oDivPageHeaderRowDiv:AddNode(THtmlNode():New(oDivPageHeaderRowDiv,"figure"))
        oFigureHighlight:attr:='class="highlight"'

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="Code Used"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"

        TEXT INTO oFigureHighlightPreCode:text
&lt;script src="./json-to-Bootstrap-Table/example/jsonToTable.js"&gt;&lt;/script&gt;
&lt;script&gt;
    var dtbl = new createTable({
    url:'./json-to-Bootstrap-Table/example/JSONToBootstrapTable.prg?file=dbf',
    wrapper:".createTableJSON"
    }).create();
&lt;/script&gt;
        ENDTEXT

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="To Pass a Data instead of URL"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"
        TEXT INTO oFigureHighlightPreCode:text
&lt;script src="./json-to-Bootstrap-Table/example/jsonToTable.js"&gt;&lt;/script&gt;
&lt;script&gt;
    var ctbl = new createTable({
    data:[{"d":"a", "e":"b"},{"e":"a", "d":"b"}],
    wrapper:".createTable"
    }).create();
&lt;/script&gt;
        ENDTEXT

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="JSON Data"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"
        TEXT INTO oFigureHighlightPreCode:text
[
    {"id": 1,"gender": "Male","first_name": "Randy","last_name": "Russell","email": "rrussell0@ebay.com","ip_address": "65.239.17.202"},
    {"id": 2,"gender": "Male","first_name": "Mark","last_name": "Ryan","email": "mryan1@cbsnews.com","ip_address": "69.21.244.122"}.... & more
]
        ENDTEXT

    oFigureHighlight:=oDivPageHeaderRowDiv:AddNode(THtmlNode():New(oDivPageHeaderRowDiv,"/figure"))

    oScript:=oHTMLDoc:body:Main+"script"
    oScript:src:="./json-to-Bootstrap-Table/example/jsonToTable.min.js"

    oScript:=oHTMLDoc:body:Main+"script"
    TEXT INTO oScript:text
var dtbl=new createTable(
    {
        url:'./json-to-Bootstrap-Table/example/JSONToBootstrapTable.prg?file=dbf',
        wrapper:".createTableJSON"
    }
).create();
    ENDTEXT

    addHarbourPRGFileAsCodeText(oHTMLDoc:body:Main:div,AP_GetEnv("SCRIPT_FILENAME"))

    cHTML:=oHTMLDoc:toString(-9,4)

    ??cHTML

    return

{% MH_LoadFile('../pluggins/templates/tHTMLDocumentNew.prg') %}
{% MH_LoadFile('../pluggins/templates/addHarbourPRGFileAsCodeText.prg') %}
