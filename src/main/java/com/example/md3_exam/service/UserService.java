package com.example.md3_exam.service;

import com.example.md3_exam.model.Staff;
import com.example.md3_exam.model.User;

import java.sql.*;

public class UserService {
    protected Connection getConnection() {
        Connection connection = null;
        try {
            java.lang.Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff?useSSL=false", "root", "123456");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public void create(User user){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into user (name, password) values (?, ?)")){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public boolean checkLogin(String name, String password) throws Exception {
        boolean blCheck = false;
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement("select * from user where name = ? and password = ?");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                blCheck = true;
            }
        } finally {
            if (rs == null) {
                rs.close();
            }if(preparedStatement != null){
                preparedStatement.close();
            }if(connection != null){
                connection.close();
            }
        }
        return blCheck;
    }
}
