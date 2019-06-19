package service;


import bean.PageBean;
import bean.Record;
import util.C3P0Utils;


import java.util.List;

public class PageService {
    Integer pageSize=10;//瀹氫箟姣忛〉鏁版嵁閲�
    Integer pageIndexNum=5;//瀹氫箟椤电爜瀵艰埅鏁伴噺

    public PageBean getPageBean(String id,String studentId,String studentName,String clas,
                                String[] priceType,String state,String person,String time,
                                String description, Integer pageNum) {

        Integer recordCount= findWhereCount(id,studentId,studentName,clas,
                priceType,state,person,time,
                description);
        if(recordCount<=0)recordCount=1;
        //鎬婚〉鐮�
        Integer pageCount = (recordCount + pageSize - 1) / pageSize;
        if(pageNum<=0){
            pageNum=1;
        }else if(pageNum>pageCount){
            pageNum=pageCount;
        }
        List<Record> records=findWhereLimit(id,studentId,studentName,clas,
                priceType,state,person,time,
                description, pageNum);
        return new PageBean(pageNum,pageSize,recordCount,records,pageIndexNum);
    }


    public List<Record> findByLimit(Integer start, Integer end){
        String sql="select * from record order by updatatime desc limit ?,?";
        return C3P0Utils.beanListHandler(sql,Record.class,start,end);
    }

    private List<Record> findWhereLimit(String id, String studentId, String studentName, String clas, String[] priceType, String state, String person, String time, String description, Integer pageNum){
        if(id==null || id.equals(""))id="%";
        if(studentId==null || studentId.equals(""))studentId="%";
        if(studentName==null || studentName.equals(""))studentName="%";
        if(clas==null || clas.equals(""))clas="%";
        String sqlType="";
        if(priceType==null || priceType.length==0) {
            sqlType = "pricetype like '%%%' and ";
        } else {
        	sqlType += " ( ";
            for (String s : priceType) {
                sqlType += "pricetype like '%"+s+"%' or ";
            }
            sqlType = sqlType.substring(0, sqlType.lastIndexOf("or"));
            sqlType += " ) and ";
        }
        if(state==null || state.equals(""))state="%";
        if(person==null || person.equals(""))person="%";
        if(time==null || time.equals(""))time="%";
        if(description==null || description.equals(""))description="%";
        String sql="select * from record where " +
                "id like '%"+id+"%' and "+
                "studentid like '%"+studentId+"%' and "+
                "studentname like '%"+studentName+"%' and "+
                "clas like '%"+clas+"%' and "+
                sqlType +
                "state like '%"+state+"%' and "+
                "person like '%"+person+"%' and "+
                "time like '%"+time+"%' and "+
                "description like '%"+description+"%' "+
                "order by updatatime desc limit ?,?";
        return C3P0Utils.beanListHandler(sql,Record.class,(pageNum-1)*pageSize,pageSize);
    }

    private Integer findWhereCount(String id, String studentId, String studentName, String clas, String[] priceType, String state, String person, String time, String description){
        if(id==null || id.equals(""))id="%";
        if(studentId==null || studentId.equals(""))studentId="%";
        if(studentName==null || studentName.equals(""))studentName="%";
        if(clas==null || clas.equals(""))clas="%";
        String sqlType="";
        if(priceType == null || priceType.length == 0) {
            sqlType = "pricetype like '%%%' and ";
        } else {
        	sqlType += " ( ";
            for (String s : priceType) {
                sqlType += "pricetype like '%"+s+"%' or ";
            }
            sqlType = sqlType.substring(0, sqlType.lastIndexOf("or"));
            sqlType += " ) and ";
        }
        if(state==null || state.equals(""))state="%";
        if(person==null || person.equals(""))person="%";
        if(time==null || time.equals(""))time="%";
        if(description==null || description.equals(""))description="%";
        String sql="select count(*) from record where " +
                "id like '%"+id+"%' and "+
                "studentid like '%"+studentId+"%' and "+
                "studentname like '%"+studentName+"%' and "+
                "clas like '%"+clas+"%' and "+
                sqlType +
                "state like '%"+state+"%' and "+
                "person like '%"+person+"%' and "+
                "time like '%"+time+"%' and "+
                "description like '%"+description+"%' "+
                "order by updatatime desc ";
        return Integer.valueOf( C3P0Utils.scalarHandler(sql).toString());
    }
}
