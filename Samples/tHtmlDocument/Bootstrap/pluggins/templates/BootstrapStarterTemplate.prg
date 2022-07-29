function BootstrapStarterTemplate(cBackURL as character)

   local cHTML as character

   hb_default(@cBackURL,"../tables/index.prg")

   TEXT INTO cHTML
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--  -->
        <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--  -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <!--  -->
        <!-- https://materializecss.com -->
            <!-- Compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
            <!-- Compiled and minified JavaScript -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
                    <!-- https://materializecss.com/floating-action-button.html -->
                    $(document).ready(function(){
                        $('.fixed-action-btn').floatingActionButton();
                    });
                    <!-- https://materializecss.com/tooltips.html -->
                    $(document).ready(function(){
                        $('.tooltipped').tooltip();
                    });
                </script>
            </div>
        </footer>
    </body>
</html>
   ENDTEXT
   
   cHTML:=strTran(cHTML,"cBackURL",cBackURL)
   
   return(cHTML)
