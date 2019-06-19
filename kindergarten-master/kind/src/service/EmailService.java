package service;

import util.C3P0Utils;

public class EmailService {

    public Object[] getdata(String name){
        String sql="select email,password from admin where loginName=?";
        return C3P0Utils.arrayHandler(sql,name);
    }
}
