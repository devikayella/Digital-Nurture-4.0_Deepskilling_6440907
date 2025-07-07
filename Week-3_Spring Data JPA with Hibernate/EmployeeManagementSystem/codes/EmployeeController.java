package com.example.employeemanagementsystem.controller;

import com.example.employeemanagementsystem.entity.Employee;
import com.example.employeemanagementsystem.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping
    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    @PostMapping
    public Employee create(@RequestBody Employee employee) {
        return employeeRepository.save(employee);
    }

    @GetMapping("/{id}")
    public Employee getById(@PathVariable Long id) {
        return employeeRepository.findById(id).orElseThrow();
    }

    @PutMapping("/{id}")
    public Employee update(@PathVariable Long id, @RequestBody Employee e) {
        Employee emp = employeeRepository.findById(id).orElseThrow();
        emp.setName(e.getName());
        emp.setEmail(e.getEmail());
        emp.setDepartment(e.getDepartment());
        return employeeRepository.save(emp);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        employeeRepository.deleteById(id);
    }
}
