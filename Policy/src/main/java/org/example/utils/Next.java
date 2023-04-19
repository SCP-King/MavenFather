package org.example.utils;

import org.example.pojo.Policy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Next extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int k=(int)req.getSession().getAttribute("k");
        List<Policy> policies= (List<Policy>) req.getSession().getAttribute("policies");
        if(k<policies.size()-1){
            req.getSession().setAttribute("k",++k);
        }
        resp.sendRedirect("/");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
