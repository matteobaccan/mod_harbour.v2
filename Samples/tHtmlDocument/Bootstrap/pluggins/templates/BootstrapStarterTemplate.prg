function BootstrapStarterTemplate(cBackURL as character)

    thread static t_cHTMLTemplate as character

    local cHTML as character
    local cNameSpace as character := ProcName()

    hb_default(@cBackURL,"./")

    t_cHTMLTemplate:=MH_HashGet("BootstrapStarterTemplate",t_cHTMLTemplate,cNameSpace)

    if (empty(t_cHTMLTemplate))

        TEXT INTO t_cHTMLTemplate
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--  -->
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!--  -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://releases.jquery.com/git/jquery-git.slim.min.js" defer></script>
            <script src="https://releases.jquery.com/git/jquery-git.min.js" defer></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core/dist/umd/popper.min.js" defer></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js" defer></script>
        <!--  -->
        <!-- https://materializecss.com -->
            <!-- Compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
            <!-- Compiled and minified JavaScript -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js" defer></script>
            <!-- https://materializecss.com/icons.html -->
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <!--  -->
        <!--  -->
    </head>
    <body>
        <main>
        </main>
        <footer>
            <div class="fixed-action-btn right" id="ID_fixed-action-btn-arrow_back">
                <a class="btn-floating btn-large tooltipped" data-position="top" data-tooltip="Back" onclick="window.open('cBackURL','_top');">
                    <i id="ID_fixed-action-btn-i-arrow_back_icon" class="material-icons" style="user-select: none;">arrow_back</i>
                </a>
                <script>
                    /*<!-- https://materializecss.com/floating-action-button.html -->*/
                    $(document).ready(function(){
                        $('.fixed-action-btn').floatingActionButton();
                    });
                    /*<!-- https://materializecss.com/tooltips.html -->*/
                    $(document).ready(function(){
                        $('.tooltipped').tooltip();
                    });
                </script>
            </div>
        </footer>
    </body>
</html>
        ENDTEXT
        MH_HashSet("BootstrapStarterTemplate",t_cHTMLTemplate,cNameSpace)
    endif
   
    cHTML:=strTran(t_cHTMLTemplate,"cBackURL",cBackURL)
   
    return(cHTML)
