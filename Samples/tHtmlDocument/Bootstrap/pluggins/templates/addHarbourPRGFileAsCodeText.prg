/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

procedure addHarbourPRGFileAsCodeText(oParent,cPRGFile)

    local cPRGText

    local oFigureHighlight as object
    local oFigureHighlightPre as object
    local oFigureHighlightPreH4 as object
    local oFigureHighlightPreCode as object

    oFigureHighlight:=oParent:AddNode(THtmlNode():New(oParent,"figure"))
    oFigureHighlight:attr:='class="highlight"'

        oFigureHighlightPreH4:=oFigureHighlight+"h4"
        oFigureHighlightPreH4:text:="Harbour Code Used"

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreCode:=oFigureHighlightPre+"code"

        cPRGText:=hb_MemoRead(cPRGFile)
        cPRGText:=strTran(cPRGText,"<","&lt;")
        cPRGText:=strTran(cPRGText,">","&gt;")

        oFigureHighlightPreCode:text:=cPRGText

    oFigureHighlight:=oParent:AddNode(THtmlNode():New(oParent,"/figure"))

return
