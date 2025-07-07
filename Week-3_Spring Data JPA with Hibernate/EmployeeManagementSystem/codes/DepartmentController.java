package com.example.employeemanagementsystem.controller;

import com.example.employeemanagementsystem.entity.Department;
import com.example.employeemanagementsystem.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentRepository departmentRepository;

    @GetMapping
    public List<Department> getAll() {
        return departmentRepository.findAll();
    }

    @PostMapping
    public Department create(@RequestBody Department department) {
        return departmentRepository.save(department);
    }

    @GetMapping("/{id}")
    public Department getById(@PathVariable Long id) {
        return departmentRepository.findById(id).orElseThrow();
    }

    @PutMapping("/{id}")
    public Department update(@PathVariable Long id, @RequestBody Department dept) {
        Department d = departmentRepository.findById(id).orElseThrow();
        d.setName(dept.getName());
        return departmentRepository.save(d);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        departmentRepository.deleteById(id);
    }
}
