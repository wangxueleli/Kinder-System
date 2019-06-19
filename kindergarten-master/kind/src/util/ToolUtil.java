package util;


import java.text.SimpleDateFormat;
import java.util.Date;

public class ToolUtil {
	public static String  getTime(Date date) {
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ss=simpleDateFormat.format(date);
		return ss;
		
	}

}
