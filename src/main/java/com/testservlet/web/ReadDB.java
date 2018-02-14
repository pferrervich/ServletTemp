package com.testservlet.web;

import java.sql.*;
import java.util.ArrayList;

public class ReadDB extends Restaurants {

    public static ArrayList<Restaurants> readRestaurants (String search) {
        ArrayList arrl = new ArrayList();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@35.205.41.45:1521:XE", "usuari", "usuari");

            PreparedStatement preparedStatement;

            if ((search != null) && !search.equals("")) {
                preparedStatement = con.prepareStatement("SELECT * FROM (SELECT R.RES_NOM, R.RES_ADRECA, R.RES_WEB, R.RES_TELEFON, R.RES_URL_IMG, R.RES_MITJANA ,R.RES_CODI, T.TRS_DESCRIPCIO FROM RESTAURANTS R, TRESTAURANTS T WHERE RES_TRS_CODI = TRS_CODI AND LOWER(R.RES_NOM) LIKE ? ORDER BY RES_MITJANA DESC) WHERE ROWNUM <= 6");
                preparedStatement.setString(1, "%" + search.toLowerCase() + "%");
            } else {
                preparedStatement = con.prepareStatement("SELECT * FROM (SELECT R.RES_NOM, R.RES_ADRECA, R.RES_WEB, R.RES_TELEFON, R.RES_URL_IMG, R.RES_MITJANA ,R.RES_CODI, T.TRS_DESCRIPCIO FROM RESTAURANTS R, TRESTAURANTS T WHERE RES_TRS_CODI = TRS_CODI ORDER BY RES_MITJANA DESC) WHERE ROWNUM <= 6");
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nom = rs.getString("RES_NOM");
                String adreca = rs.getString("RES_ADRECA");
                String web = rs.getString("RES_WEB");
                String tel = rs.getString("RES_TELEFON");
                String tipus = rs.getString("TRS_DESCRIPCIO");
                String foto = rs.getString("RES_URL_IMG");
                String codi = rs.getString("RES_CODI");
                String puntuacio = rs.getString("RES_MITJANA");

                Restaurants rst = new Restaurants();
                rst.setNom(nom);
                rst.setAdreca(adreca);
                rst.setWeb(web);
                rst.setTel(tel);
                rst.setTipus(tipus);
                rst.setFoto(foto);
                rst.setCodi(codi);
                rst.setPuntuacio(puntuacio);

                arrl.add(rst);
            }
            con.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return arrl;
    }



}
