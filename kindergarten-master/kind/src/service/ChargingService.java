package service;

import bean.Charging;
import util.C3P0Utils;

import java.util.List;

public class ChargingService {

    public List<Charging> findAll(){
        String sql="select * from charging";
        return C3P0Utils.beanListHandler(sql,Charging.class);
    }

    public boolean update(Object[][] objects){
        String sql="update charging set priceType=?,price=?,description=? where id=?";
        return C3P0Utils.updateBybatch(sql,objects);
    }
}
