package org.example.utils;

import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.example.pojo.Policy;

public class PolicySelect {
    private Boolean check(Object o){
        return o==null||o.equals("");
    }
    @SneakyThrows
    private  Connection getConnection(){
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3307/exam?useSSL=false";
        String username="root";
        String password="123456";
        return DriverManager.getConnection(url,username,password);
    }
    @SneakyThrows
    public  List<Policy> select(String name, String document, String organ, String text){
        name="%"+name+"%";
        document="%"+document+"%";
        organ="%"+organ+"%";
        text="%"+text+"%";
        System.out.println(name+" "+document+" "+organ+" "+text);
        String sql="select * from policy";
        int k=1;
        List<String> p=new ArrayList<>();
        if(!check(name)){
            if(k==1) sql+=" where ";
            else sql+=" and ";
            sql+="name like ?";
            p.add(name);
            k++;
        }
        if(!check(document)){
            if(k==1) sql+=" where ";
            else sql+=" and ";
            sql+="document like ?";
            p.add(document);
            k++;
        }
        if(!check(organ)){
            if(k==1) sql+=" where ";
            else sql+=" and ";
            sql+="organ like ?";
            p.add(organ);
            k++;
        }
        if(!check(text)){
            if(k==1) sql+=" where ";
            else sql+=" and ";
            sql+="text like ?";
            p.add(text);
            k++;
        }
        System.out.println(sql);
        PreparedStatement preparedStatement=getConnection().prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        for(int i=0;i<p.size();i++){
            preparedStatement.setString(i+1,p.get(i));
        }
        ResultSet resultSet=preparedStatement.executeQuery();
        List<Policy> policies=new ArrayList<>();
        while (resultSet.next()){
            int u=1;
            policies.add(new Policy(
                    resultSet.getLong(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getDate(u++),
                    resultSet.getDate(u++),
                    resultSet.getDate(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getString(u++),
                    resultSet.getInt(u++)
            ));
        }
        preparedStatement.close();
        return policies;
    }
}
