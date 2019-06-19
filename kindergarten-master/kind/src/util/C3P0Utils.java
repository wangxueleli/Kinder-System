package util;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.KeyedHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {
	// 鍒涘缓杩炴帴姹�
	private static DataSource dataSource = null;
	// 鍒涘缓杩炴帴
	private static Connection conn = null;
	// QueryRunner鎵ц瀵硅薄
	private static QueryRunner queryRunner = null;
	static {
		//dataSource璧勬簮鍙垵濮嬪寲涓�娆�  鍙互涓嶈getDataSource()
		dataSource = new ComboPooledDataSource("c3p0-config");
	}
	// 鑾峰彇杩炴帴姹犲璞�
	private static void getDataSource() {
		if(dataSource==null){
			dataSource = new ComboPooledDataSource("c3p0-config");
		}
	}
	//鑾峰緱鏍稿績绫籷ueryRunner
	private static void getQueryRunner() {
		//getDataSource();
		if(queryRunner==null){
			queryRunner = new QueryRunner(dataSource); //杩欎竴姝ュ彲浠ユ浛浠etConnection()
			//鏋勯�犲嚱鏁帮紙1锛夛細QueryRunner() (2)锛歈ueryRunner(Datasource ds)
		}
	}
	// 鑾峰彇杩炴帴瀵硅薄
	private static void getConnection() {
		//getDataSource();
		try {
			if (conn == null || conn.isClosed()) {
				conn = dataSource.getConnection();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("鑾峰彇杩炴帴澶辫触");
		}
	}

	/**
	 * 浜嬪姟+澧炲垹鏀�
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static boolean update(String sql, Object... params) {
		getConnection();
		try {
			// 寮�鍚簨鍔�
			conn.setAutoCommit(false);
			// 鏍稿績绫�
			QueryRunner Runner = new QueryRunner();

			int i=Runner.update(conn, sql, params);
			// 鎻愪氦骞跺叧闂璕unner  寮傚父寮�鍚�  
			DbUtils.commitAndCloseQuietly(conn);
			if(i==0) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			DbUtils.rollbackAndCloseQuietly(conn);
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try{
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	/**
	 * 涓嶅甫conn鐨勬洿鏂�
	 */
	public static boolean update1(String sql, Object... params) {
		getQueryRunner();
		try {
			//寮�鍚簨鍔�
			conn.setAutoCommit(false);
			// 鏍稿績绫�
			//QueryRunner Runner = new QueryRunner();

			queryRunner.update(sql, params);
			//  鎻愪氦骞跺叧闂璕unner
			DbUtils.commitAndCloseQuietly(conn);
			return true;
		} catch (SQLException e) {
			DbUtils.rollbackAndCloseQuietly(conn);
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try{
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	/**
	 * 浜嬪姟+鎵瑰鐞�+澧炲垹鏀�
	 * @param sql
	 * @param params
	 * @return
	 */
	public static boolean updateBybatch(String sql, Object[][] params) {
		getConnection();
		try {
			//寮�鍚簨鍔�
			conn.setAutoCommit(false);
			// 鏍稿績绫�
			QueryRunner Runner = new QueryRunner();

			Runner.batch(conn, sql, params);
			// 鎻愪氦骞跺叧闂璕unner
			DbUtils.commitAndCloseQuietly(conn);
			return true;
		} catch (SQLException e) {
			DbUtils.rollbackAndCloseQuietly(conn);
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try{
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	/**
	 *灏嗘煡璇㈡瘡涓�鏉℃暟鎹皝瑁呭埌鎸囧畾JavaBean锛屽湪灏咼avaBean灏佽鍒癓ist闆嗗悎涓� 鏈�鍚庤繑鍥為泦鍚�
	 * 
	 * @param sql
	 * @param t
	 * @param params
	 * @return
	 */
	public static <T> List<T> beanListHandler(String sql, Class<T> t, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new BeanListHandler<T>(t), params);// Person Person.class
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**鏌ユ壘list 瀹炰綋
	 * @param 
	 *
	 */
	public static <T> List<T> beanListHandler1(String sql, Class<T> t, Object... params) {
		getConnection();
		try {
			QueryRunner Runner = new QueryRunner();
			return Runner.query(conn,sql, new BeanListHandler<T>(t), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try{
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	/**
	 * 灏嗘煡璇㈢殑涓�鏉℃暟鎹皝瑁呭埌鎸囧畾JavaBean锛屽苟杩斿洖javabean瀹炰緥
	 * 
	 * @param sql
	 * @param t
	 * @param params
	 * @return
	 */
	public static <T> T beanHandler(String sql, Class<T> t, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new BeanHandler<T>(t), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 澶勭悊涓�琛屼竴鍒楃粨鏋滈泦锛屼篃灏辨槸涓�涓崟鍏冩牸锛屽崟涓暟鎹�(涓嶆槸涓�鏉℃暟鎹�)锛�(鑱氬悎)鍑芥暟
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static Object scalarHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new ScalarHandler<>(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 灏嗘煡璇竴鏉¤褰曟墍鏈夋暟鎹皝瑁呭埌鏁扮粍涓�
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static Object[] arrayHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new ArrayHandler(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 灏嗘煡璇㈢殑鎵�鏈夎褰曟瘡鏉¤褰曞垎鍒皝瑁呭埌鏁扮粍涓紝鍦ㄥ皢鏁扮粍灏佽鍒發ist闆嗗悎涓紝鏈�鍚庤繑鍥為泦鍚�
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Object[]> arrayListHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new ArrayListHandler(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 灏嗘墽琛屽垪灏佽鍒發ist闆嗗悎涓紝杩斿洖list闆嗗悎
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Object> columnListHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new ColumnListHandler<>(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 *  灏嗕竴鏉¤褰曞皝瑁呭埌map 骞惰繑鍥瀖ap
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static Map<String, Object> mapHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new MapHandler(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 灏嗘瘡鏉¤褰曢兘鍒嗗埆灏佽鍒癕ap涓紝鐒跺悗灏哅ap娣诲姞鍒癓ist闆嗗悎涓紝鏈�鍚庤繑鍥瀕ist闆嗗悎
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Map<String, Object>> MapListHandler(String sql, Object... params) {
		getQueryRunner();
		try {
			return queryRunner.query(sql, new MapListHandler(), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 灏嗘瘡涓�鏉¤褰曞皝瑁呭埌Map<String,Object>A涓紝鍦ㄥ皢mapA 灏佽鍒癿apB涓紝mapB.value 灏辨槸mapA mapB.key
	 * 灏辨槸鎸囧畾鐨刱ey
	 * 
	 * @param sql
	 * @param key
	 * @param params
	 * @return
	 */
	public static Map<Object, Map<String, Object>> keyedHandler(String sql, String key, Object... params) {
		getQueryRunner();//灏嗙粨鏋滈泦涓瘡鏉¤褰曞皝瑁呭埌Map<String,Object> ,鍦ㄥ皢杩欎釜map闆嗗悎鍋氫负鍙︿竴涓狹ap 鐨剉alue, 鍙︿竴涓狹ap闆嗗悎鐨刱ey鏄寚瀹氱殑瀛楁鍊笺��
		try {
			return queryRunner.query(sql, new KeyedHandler<>(key), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
