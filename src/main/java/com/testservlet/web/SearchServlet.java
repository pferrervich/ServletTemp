package com.testservlet.web;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        ArrayList<Restaurants> restaurants = null;
        String search = request.getParameter("search");
        restaurants = ReadDB.readRestaurants(search);

        response.setContentType("text/html");
        request.setAttribute("search",restaurants);
        request.getRequestDispatcher("search.jsp").forward(request, response);

    }
}
