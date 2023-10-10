package com.example.md3_exam.service;

import com.example.md3_exam.model.Staff;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffService {
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
    public void create(Staff staff){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into staff (name, email, address, phoneNumber, salary, idDepartment) values (?, ?, ?, ?, ?, ?)")){
            preparedStatement.setString(1, staff.getName());
            preparedStatement.setString(2, staff.getEmail());
            preparedStatement.setString(3, staff.getAddress());
            preparedStatement.setInt(4, staff.getPhoneNumber());
            preparedStatement.setInt(5, staff.getSalary());
            preparedStatement.setInt(6, staff.getIdDepartment());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public boolean update(Staff staff) throws SQLException {
        boolean rowUpdate;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement("update staff set name= ?, email =?, address=?, phoneNumber=?, salary=?, idDepartment=? where idStaff = ?");
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getAddress());
            statement.setInt(4, staff.getPhoneNumber());
            statement.setInt(5, staff.getSalary());
            statement.setInt(6, staff.getIdDepartment());
            statement.setInt(7, staff.getIdStaff());
            rowUpdate = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }
    public boolean delete(int id) throws SQLException {
        boolean rowDelete;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("delete from staff where idStaff = ?;");
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }
    public List<Staff> displayAll() {
        List<Staff> staffList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from staff")){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idStaff");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int phoneNumber = rs.getInt("phoneNumber");
                int salary = rs.getInt("salary");
                int idDepartment = rs.getInt("idDepartment");
                staffList.add(new Staff(id, name, email, address, phoneNumber, salary, idDepartment));
            }
        } catch (SQLException e) {
        }
        return staffList;
    }
    public Staff findById(int id) {
        Staff staff = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select idStaff, name, email, address, phoneNumber, salary, idDepartment from staff where idStaff =?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int idStaff = rs.getInt("idStaff");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int phoneNumber = rs.getInt("phoneNumber");
                int salary = rs.getInt("salary");
                int idDepartment = rs.getInt("idDepartment");
                staff = new Staff(idStaff, name, email, address, phoneNumber, salary, idDepartment);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return staff;
    }

    public List<Staff> findByName(String a) {
        List<Staff> staffList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from staff ");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                if (name.contains(a)) {
                    int id = rs.getInt("idStaff");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    int phoneNumber = rs.getInt("phoneNumber");
                    int salary = rs.getInt("salary");
                    int idDepartment = rs.getInt("idDepartment");
                    staffList.add(new Staff(id, name, email, address, phoneNumber, salary, idDepartment));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

}
