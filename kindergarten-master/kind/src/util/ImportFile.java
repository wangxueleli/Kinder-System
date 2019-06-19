package util;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import bean.Student;

public class ImportFile {
    /**
     * @param cell һ����Ԫ��Ķ���
     * @return ���ظõ�Ԫ����Ӧ�����͵�ֵ
     */
    @SuppressWarnings("deprecation")
	public static String getRightTypeCell(Cell cell){
        cell.setCellType(Cell.CELL_TYPE_STRING);
        return cell.getStringCellValue();
    }
    /**
     * ��ȡ��filePath�е�����������Ϣ
     * @param filePath excel�ļ��ľ���·��
     */
    @SuppressWarnings("resource")
	public static List<Student> getDataFromExcel2(String filePath){
    	filePath="D:\\"+filePath;
    	System.out.println(filePath);
        //�ж��Ƿ�Ϊexcel�����ļ�
        if(filePath.lastIndexOf(".xls")==-1&&filePath.lastIndexOf(".xls")==-1){
            System.out.println("�ļ�����excel����");
            return null;
        }
        FileInputStream fis =null;
        Workbook wookbook = null;
        int lineNum = 0;
        Sheet sheet = null;
        try{
            //��ȡһ�����Ե�ַ����
            fis = new FileInputStream(filePath);
            //2003�汾��excel����.xls��β, 2007�汾��.xlsx
            if(filePath.endsWith(".xls")){
                wookbook = new HSSFWorkbook(fis);//�õ�������
            }else{
                wookbook = new XSSFWorkbook(fis);//�õ�������
            }
            //�õ�һ��������
            sheet = wookbook.getSheetAt(0);
            //��ñ�ͷ
            Row rowHead = sheet.getRow(0);
            //����
            int rows = rowHead.getPhysicalNumberOfCells();
            //����
            lineNum = sheet.getLastRowNum();
            if(0 == lineNum){
                System.out.println("Excel��û�����ݣ�");
                return null;
            }
           return getData(sheet, lineNum, rows);
        } catch (Exception e){
           System.err.println("ϵͳ�Ҳ���ָ�����ļ�");
            return null;
        }
    }
    public static  List<Student>  getData(Sheet sheet, int lineNum, int rowNum){
        //�����������
    	  List<Student>listall=new ArrayList<>();
    	 
        for(int i = 1; i <= lineNum; i++){
            //��õ�i�ж���
            Row row = sheet.getRow(i);
            Student student=new Student();
            List<String> list = new ArrayList<>();
            for(int j=0; j<rowNum; j++){
                String str = getRightTypeCell(row.getCell(j));
                list.add(str);
            }
            student.setName(list.get(0));
            student.setSex(list.get(1));
            student.setAge(Integer.valueOf(list.get(2)));
            student.setClasssort(list.get(3));
            student.setClassname(list.get(4));
            student.setParentname(list.get(5));
            student.setPhone(list.get(6));
            student.setAddress(list.get(7));
            student.setChefei(list.get(8));
            student.setXuefei(list.get(9));
            student.setChifei(list.get(10));
            student.setCarno(list.get(11));
            listall.add(student);
            System.out.println(student);
        }
        	return listall;
    }
    /*public static void main(String[] arg){
         //xlsx�ᱨ��
    	//Student student=new Student();
        List<Student>list=getDataFromExcel2("D:\\sss.xls");//��������Ϊ���ø÷������
        System.out.println(list.size());
        Object[][]objects=new Object[list.size()][];
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getStuno());
			objects[i]=new Object[]{list.get(i).getStuno(),list.get(i).getName(),list.get(i).getAge(),list.get(i).getIsdao()};
		}
		String sql="insert into stuinfo(stuno,name,age,isdao) values(?,?,?,?)";
		if(C3P0Utils.updateBybatch(sql, objects)) {
			System.out.println("�ɹ�");
		}
    }*/
}
