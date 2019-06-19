package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

public class ApacheDBUtil {
	
	//���
	  //private static DataSource dataSource = null; ���ӳ�
	  private static String url="jdbc:mysql://localhost:3306/mms?useUnicode=true&characterEncoding=utf-8";
	  private static String driver="com.mysql.jdbc.Driver";
	  private static  String user="root";
	  private static  String password="qwer";
	  //����
	  private Connection connection=null;
	  //�̳߳ض���
	  private ThreadLocal<Connection>  local=new ThreadLocal();

	  //��һ������
	  static{
		  try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.err.println("---------��û����,��ݿ�û��,����ûȨ��.....");
		}
	  }
	/**
	   * �������
	   * @return
	   */
	  public Connection getConnection(){
		  //���ж� �̳߳ض���  ��û�����Ӷ���
		  connection=local.get();
		  try {
			  //���ӳ����ɶ������Ӷ���        ���Ҹ����Ӷ���û�б��ر�
			if(connection!=null  && !connection.isClosed()){
				  return connection;
			 }else{
				 connection=DriverManager.getConnection(url, user, password);
			 }
		} catch (SQLException e) {
			System.err.println("--��������������,�û����������---");
			//e.printStackTrace();
		}
		return connection;
		  
	  }
	
	public Object[]  findArrayObject(String  sql ,Object [] param){//dao
		  //ִ�ж���
		  QueryRunner   queryRunner=new  QueryRunner();
		  //ȷ�����ص�����
		  ArrayHandler   hanler= new  ArrayHandler();
		  try {
			 return queryRunner.query(getConnection(), sql, param, hanler);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	  }
	
	public List<Object[]>  findListArray(String  sql ,Object [] param){//dao
		  try {
			 return new  QueryRunner().query(getConnection(), sql, param, new ArrayListHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	 }
	
	public<T> T  findBean(String  sql ,Object [] param,Class<T> cl){
		//����ִ�ж���
		QueryRunner  queryRunner=new  QueryRunner();
		BeanHandler<T>   benaHandler=new  BeanHandler<>(cl);
		try {
			return  queryRunner.query(getConnection(), sql, param,benaHandler );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public<T> List<T> findListBean(String  sql ,Object [] param,Class<T> cl){
		//����ִ�ж���
		QueryRunner  queryRunner=new  QueryRunner();
		BeanListHandler<T>   benaBeanListHandler=new  BeanListHandler<>(cl);
		try {
			return  queryRunner.query(getConnection(), sql, param,benaBeanListHandler );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public  List<Object>  findColumn(String  sql ,Object [] param){
		//����ִ�ж���
				QueryRunner  queryRunner=new  QueryRunner();
				ColumnListHandler   columnListHandler=new  ColumnListHandler<>();
				try {
					return  (List<Object>) queryRunner.query(getConnection(), sql, param,columnListHandler );
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;
	} 
	
	public  Map<String,Object> findMap(String  sql ,Object [] param){//����һ�����  ���е���������ֵ
		//����ִ�ж���
		QueryRunner  queryRunner=new  QueryRunner();
		MapHandler   mapHandler=new  MapHandler();
		try {
			return  queryRunner.query(getConnection(), sql, param,mapHandler );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public  List<Map<String,Object>> findMapList(String  sql ,Object [] param){//���ض������  ���е���������ֵ
		//����ִ�ж���
		QueryRunner  queryRunner=new  QueryRunner();
		MapListHandler   mapListHandler=new  MapListHandler();
		try {
			return  queryRunner.query(getConnection(), sql, param,mapListHandler );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public  int update(String  sql ,Object [] param){
		//����ִ�ж���
				QueryRunner  queryRunner=new  QueryRunner();
				 try {
					return queryRunner.update(getConnection(), sql,param);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 return  0;	 
	}
	
	//MapListHandler��������е�ÿһ����ݶ���װ��һ��Map�Ȼ���ٴ�ŵ�List
	//MapHandler��������еĵ�һ����ݷ�װ��һ��Map�key������value���Ƕ�Ӧ��ֵ��
	//ColumnListHandler���������ĳһ�е���ݴ�ŵ�List�С�List<Date>  sql="select birthday from customer"
	
	//BeanListHandler��������е�ÿһ����ݶ���װ��һ����Ӧ��JavaBeanʵ���У���ŵ�List�List<Customer>
	//BeanHandler��������е�ĳһ����ݷ�װ��һ����Ӧ��JavaBeanʵ���С� Customer sql="select * from customer where id=?"
	  
	 //ArrayHandler���ѽ���еĵ�һ�����ת�ɶ������顣 Object[]  sql="select name from customer where id=?"

	//  ArrayListHandler���ѽ���е�ÿһ����ݶ�ת��һ�����飬�ٴ�ŵ�List�С� List<Object[]>   
	  //sql="select id from customer where id like ?"
	

}
