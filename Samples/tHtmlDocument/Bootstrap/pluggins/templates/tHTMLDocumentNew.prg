#ifdef __PLATFORM__WINDOWS
   #include "c:\harbour\include\hbhrb.ch"
#else
   #include "/usr/include/harbour/hbhrb.ch"
#endif

/*
    replace default tHTMLDocument class with new tHTMLDocument class. 
    Source code: https://github.com/naldodj/naldodj-hb/tree/main/contrib/hbtip
*/
{% MH_LoadHRB( '../pluggins/contrib/thtml.hrb' ) %}

function tHTMLDocumentNew(cHTML,pHrbLoad)

    local cNameSpace:=ProcName() as character
    
    local oTHTMLDocument as object

    try
        pHrbLoad:=MH_HashGet("pHrbLoad",,cNameSpace)
        if (empty(pHrbLoad))
            oTHTMLDocument:=THtmlDocument():New(cHTML)
        else
            hb_hrbDo(pHrbLoad)
            oTHTMLDocument:=THtmlDocument():New(cHTML)
            MH_HashSet("pHrbLoad",pHrbLoad,cNameSpace)
         endif
    catch
        cHRBFile:="../pluggins/contrib/thtml.hrb"
        cHrbLoad:=hb_GetEnv('PRGPATH')+"/"+cHRBFile
        pHrbLoad:=hb_HRBLoad(HB_HRB_BIND_OVERLOAD,cHrbLoad)
        if (!empty(pHrbLoad))
            hb_hrbDo(pHrbLoad)
            oTHTMLDocument:=THtmlDocument():New(cHTML)
            MH_HashSet("pHrbLoad",pHrbLoad,cNameSpace)
        endif
    end

return(oTHTMLDocument)