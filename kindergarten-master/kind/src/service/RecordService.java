package service;

import util.C3P0Utils;

public class RecordService {

    public boolean update(Object[][] objects){
        String sql="update record set studentId=?,studentName=?,clas=?,priceType=?,state=?,person=?,time=?,description=? where id=?";
        return C3P0Utils.updateBybatch(sql,objects);
    }
}
