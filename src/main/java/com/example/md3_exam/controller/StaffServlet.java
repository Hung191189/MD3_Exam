package com.example.md3_exam.controller;

import com.example.md3_exam.model.Department;
import com.example.md3_exam.model.Staff;
import com.example.md3_exam.service.DepartmentService;
import com.example.md3_exam.service.StaffService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StaffServlet", value = "/StaffServlet")
public class StaffServlet extends HttpServlet {
    StaffService staffService = new StaffService();
    DepartmentService departmentService = new DepartmentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
        switch (action){
            case "create":
                showCreateStaff(request,response);
                break;
            case "update":
                showUpdateStaff(request, response);
                break;
            case "delete":
                deleteStaff(request, response);
                break;
            default:
                showAllStaff(request, response);
                break;
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAllStaff(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("homePage.jsp");
        List<Staff> staffList = staffService.displayAll();
        List<Department> departmentList = findAllDepartment(staffList);
        request.setAttribute("staffList", staffList);
        request.setAttribute("departmentList", departmentList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("idStaff"));
        staffService.delete(id);
        List<Staff> staffList = staffService.displayAll();
        request.setAttribute("staffList", staffList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("homePage.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showUpdateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("idStaff"));
        Staff staff = staffService.findById(id);
        List<Department> departmentList = departmentService.displayAll();
        RequestDispatcher dispatcher;
        if(staff == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("departmentList", departmentList);
            request.setAttribute("staff", staff);
            dispatcher = request.getRequestDispatcher("updateStaff.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showCreateStaff(HttpServletRequest request, HttpServletResponse response) {
        List<Department> departmentList = departmentService.displayAll();
        request.setAttribute("departmentList", departmentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("createStaff.jsp");
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
                    saveStaff(request, response);
                    break;
                case "update":
                    updateStaff(request, response);
                case "findByName":
                    findByName(request, response);
                    break;
                default:
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private void findByName(HttpServletRequest request, HttpServletResponse response) {
        String a = request.getParameter("nameSearch");
        List<Staff> staffList = staffService.findByNameNew(a);
        List<Department> departmentList = findAllDepartment(staffList);
        request.setAttribute("departmentList", departmentList);
        request.setAttribute("staffByName", staffList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewFindByName.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("idStaff"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        int salary = Integer.parseInt(request.getParameter("salary"));
        int idDepartment = Integer.parseInt(request.getParameter("idDepartment"));
        Staff staff = new Staff(id, name, email, address, phoneNumber, salary, idDepartment);
        staffService.update(staff);
        showAllStaff(request, response);
    }

    private void saveStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        int salary = Integer.parseInt(request.getParameter("salary"));
        int idDepartment = Integer.parseInt(request.getParameter("department"));
        staffService.create(new Staff(name, email, address, phoneNumber, salary, idDepartment));
        showAllStaff(request, response);
    }
    private List<Department> findAllDepartment(List<Staff> staffList) {
        List<Department> list = new ArrayList<>();
        for (Staff staff : staffList) {
            Department department = departmentService.findById(staff.getIdDepartment());
            list.add(department);
        }
        return list;
    }
}