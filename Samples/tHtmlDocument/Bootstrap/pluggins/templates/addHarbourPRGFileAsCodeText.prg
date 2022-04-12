procedure addHarbourPRGFileAsCodeText(oParent,cPRGFile)

    local cPRGText

    local oFigureHighlight as object
    local oFigureHighlightPre as object
    local oFigureHighlightPreH4 as object
    local oFigureHighlightPreCode as object

    oFigureHighlight:=oParent:AddNode(THtmlNode():New(oParent,"figure"))
    oFigureHighlight:attr:='class="highlight"'

        oFigureHighlightPre:=oFigureHighlight+"pre"
        oFigureHighlightPreH4:=oFigureHighlightPre+"h4"
        oFigureHighlightPreH4:text:="Harbour Code Used"

        oFigureHighlightPreCode:=oFigureHighlightPre+"code"

        cPRGText:=hb_MemoRead(cPRGFile)
        cPRGText:=strTran(cPRGText,"<","&lt;")
        cPRGText:=strTran(cPRGText,">","&gt;")

        oFigureHighlightPreCode:text:=cPRGText

    oFigureHighlight:=oParent:AddNode(THtmlNode():New(oParent,"/figure"))

return
