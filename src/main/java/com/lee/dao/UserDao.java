package com.lee.dao;


import com.lee.pojo.User;


import java.util.List;
import java.util.Map;

/**
 * user”√ªßdao
 * @author llq
 *
 */
public interface UserDao {
	public User findByUsername(String username);
	public int add(User user);
	public int edit(User user);
	public int editPassword(User user);
	public int delete(String ids);
	public List<User> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
}
