package com.example.md3_exam.service;

import com.example.md3_exam.model.Department;
import com.example.md3_exam.model.Staff;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentService {
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
    public void create(Department department) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into department(name) values (?)")) {
            preparedStatement.setString(1, department.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public boolean update(Department department) throws SQLException {
        boolean rowUpdate;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement("update staff set name= ? where idDepartment = ?");
            statement.setString(1, department.getName());
            statement.setInt(2, department.getIdDepartment());
            rowUpdate = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    public Department findById(int id) {
        Department department = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select name from department where idDepartment =?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                department = new Department(name);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return department;
    }
    public List<Department> displayAll() {
        List<Department> departmentList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from department")){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idDepartment = rs.getInt("idDepartment");
                String name = rs.getString("name");
                departmentList.add(new Department(idDepartment, name));
            }
        } catch (SQLException e) {
        }
        return departmentList;
    }
}
