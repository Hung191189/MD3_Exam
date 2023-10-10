package com.example.md3_exam.controller;

import com.example.md3_exam.model.Department;
import com.example.md3_exam.model.Staff;
import com.example.md3_exam.service.DepartmentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DepartmentServlet", value = "/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
    DepartmentService departmentService = new DepartmentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateDepartment(request,response);
                break;
            case "update":
                showUpdateDepartment(request, response);
                break;
            default:
//                    showAllDepartment(request, response);
                break;
        }
    }

    private void showUpdateDepartment(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateDepartment(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("createDepartment.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
            switch (action){
                case "create":
                    saveDepartment(request, response);
                    break;
                case "update":
                    updateDepartment(request, response);
                default:
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateDepartment(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Department department = new Department(id, name);
        departmentService.update(department);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateDepartment.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void saveDepartment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        departmentService.create(new Department(name));
        response.sendRedirect("/StaffServlet");
    }

}