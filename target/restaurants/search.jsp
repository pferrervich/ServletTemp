<%@ page import="com.testservlet.web.ReadDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.testservlet.web.Restaurants" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center">
    <h1>Bon profit!</h1>
    <p>Aquets son els millors restaurants que pots trobar a Mallorca</p>
</div>

<%
ReadDB readDB = new ReadDB();

ArrayList<Restaurants> arrl = (ArrayList<Restaurants>) request.getAttribute("search");

Iterator iter = arrl.iterator();

    while (iter.hasNext()) {
        Restaurants rst = (Restaurants) iter.next();

        out.println("<div class=\"container\">" +
                "<div class=\"row\" >" +
                    "<div class=\"col-sm-4\">"+
                        "<h3>" + rst.getNom() + "</h3>" +
                        "<p>Web: " + rst.getWeb() + "</p>"+
                        "<p>Tipus: " + rst.getTipus() + "</p>" +
                        "<p>Direccio: " + rst.getAdreca() + "</p>" +
                        "<p>Puntuacio: " + rst.getPuntuacio() + "</p>" +
                        "<p>Telefon: " + rst.getTel() + "</p>" +
                    "</div>" +
                "</div>" +
                "</div>");

    }

%>
</body>
</html>