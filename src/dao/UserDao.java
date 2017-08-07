package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import daomain.User;
import utils.DataSourceUtils;

/**
 * 
 * @author: qlq
 * @date : 2017年7月6日上午11:57:56
 * @description:chuli yonghu xinxi
 */
public class UserDao {

	public User findUserByNamePassword(String name, String password) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where name='" + name + "' and password = '" + password + "'";
		User user = null;
		try {
			user = runner.query(sql, new BeanHandler<User>(User.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<User> findAllUser() {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user";
		List<User> userList = null;
		try {
			userList = runner.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	// 获得全部的用户条数，返回一个整数
	public int getTotalCount() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from user";
		Long query = (Long) runner.query(sql, new ScalarHandler());
		return query.intValue();
	}

	public List<User> findUserListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user limit ?,?";
		List<User> query = runner.query(sql, new BeanListHandler<User>(User.class), index, currentCount);
		return query;
	}

	public User findUserByName(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where name= ?";
		return (User) runner.query(sql, new BeanHandler<User>(User.class), username);
	}

	// 模糊查询用户名字，并将名字取出后存入一列中
	public List<Object> findUserName(String word) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select name from user where name like ? limit 0,8";
		List<Object> objList = runner.query(sql, new ColumnListHandler("name"), "%" + word + "%");
		return objList;
	}

}
