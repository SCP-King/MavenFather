package org.example.utils;

import org.example.pojo.Policy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class NewNum extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int k=Integer.valueOf(req.getParameter("kind"));
        List<Policy> Pol= (List<Policy>) req.getSession().getAttribute("Pol");
        List<List<Policy>> policies=new ArrayList<>();
        List<Policy> temp=new ArrayList<>();
        for(int i=0;i< Pol.size();i++){
            if(temp.size()<k){
                temp.add(Pol.get(i));
            }
            else{
                policies.add(temp);
                temp=new ArrayList<>();
                i--;
            }
        }
        if(Pol.size()%k>0) policies.add(temp);
        req.getSession().setAttribute("policies",policies);
        resp.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
