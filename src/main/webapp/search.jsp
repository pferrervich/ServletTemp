<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.testservlet.web.Restaurants" %>
<!doctype html>
<head>
    <!-- Bootstrap -->
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
ArrayList<Restaurants> arrl = (ArrayList<Restaurants>) request.getAttribute("search");

Iterator iter = arrl.iterator();

    while (iter.hasNext()) {
        Restaurants rst = (Restaurants) iter.next();

        out.println("<div class=\"container\">" +
                "<div class=\"row\" >" +
                    "<div class=\"col-sm-4\">"+
                        "<h3>" + rst.getName() + "</h3>" +
                        "<p>Web: <a href=\"" + rst.getUrl() + "\">" + rst.getUrl() + "</a>" + "</p>"+
                        "<p>Telefon: " + rst.getPhone() + "</p>" +
                        "<p>Direccio: " + rst.getAddress() + "</p>" +
                        "<p>Tipus: " + rst.getType() + "</p>" +
                        "<p>Puntuacio: " + rst.getScore() + "</p>" +
                        "<hr>" +
                    "</div>" +
                "</div>" +
                "</div>");

    }

%>
</body>
</html>