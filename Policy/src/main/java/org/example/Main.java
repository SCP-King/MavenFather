package org.example;

import org.example.pojo.Policy;
import org.example.utils.PolicySelect;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        PolicySelect select=new PolicySelect();
        List<Policy> list=select.select(null,null,null,null);
        for (Policy i:list){
            System.out.println(i.toString());
        }
    }
}