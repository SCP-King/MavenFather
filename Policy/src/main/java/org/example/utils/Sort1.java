package org.example.utils;

import org.example.pojo.Policy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Sort1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Policy> Pol= (List<Policy>) req.getSession().getAttribute("Pol");
        Pol.sort(new Comparator<Policy>() {
            @Override
            public int compare(Policy o1, Policy o2) {
                int k=o1.getPubdata().compareTo(o2.getPubdata());
                return k;
            }
        });
        List<List<Policy>> policies=new ArrayList<>();
        List<Policy> temp=new ArrayList<>();
        for(int i=0;i< Pol.size();i++){
            if(temp.size()<10){
                temp.add(Pol.get(i));
            }
            else{
                policies.add(temp);
                temp=new ArrayList<>();
                i--;
            }
        }
        if(Pol.size()%10>0) policies.add(temp);
        req.getSession().setAttribute("policies",policies);
        req.getSession().setAttribute("Pol",Pol);
        req.getSession().setAttribute("Num",Pol.size());
        resp.sendRedirect("/");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
