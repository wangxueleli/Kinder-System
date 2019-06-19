package service;

import bean.Admin;
import util.C3P0Utils;

public class LoginService {

    public Admin loginTF(String name,String password){
        String sql="select * from admin where loginName=? and password=?";
        return C3P0Utils.beanHandler(sql,Admin.class,name,password);
    }
}
