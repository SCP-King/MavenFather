package org.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Policy {
    private long id;
    private String name;
    private String type;
    private String category;
    private String range;
    private String document;
    private String form;
    private String organ;
    private Date viadata;
    private Date pubdata;
    private Date perdata;
    private String field;
    private String theme;
    private String  keyword;
    private String superior;
    private String precursor;
    private String succeed;
    private String state;
    private String text;
    private String pdf;
    private String redundancy;
    private String rank;
    private String policykey;
    private String newrank;
    private String year;
    private String newkey;
    private String secondtheme;
    private int allsum;
}
