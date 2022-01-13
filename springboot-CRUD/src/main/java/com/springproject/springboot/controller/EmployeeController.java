package com.springproject.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springproject.springboot.entity.Employee;
import com.springproject.springboot.service.EmployeeService;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

	private EmployeeService employeeService;
	
	@Autowired
	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	// add mapping for "/list"
	@GetMapping("/list")
	public String listEmployees(Model model) {
		
		// get employees from the db
		List<Employee> theEmployees = employeeService.findAll();
		
		// add to model
		model.addAttribute("employees", theEmployees);
		
		return "employees/list-employees";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		// create model attribute to bind form data
		Employee theEmployee = new Employee();
		
		model.addAttribute("employee", theEmployee);
		
		return "employees/employee-form";
	}
	
	@PostMapping("/save")
	public String saveEmployee(@ModelAttribute ("employee") Employee theEmployee) {
		
		// save the employee
		employeeService.save(theEmployee);
		
		// use a redirect to prevent duplicate submission
		return "redirect:/employees/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("employeeId") int id, Model model) {
		
		// get the employee from service
		Employee theEmployee = employeeService.findById(id);
		
		// set employee as a model attribute to pre-populate the form
		model.addAttribute("employee", theEmployee);
		
		// send over to our form
		return "/employees/employee-form";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("employeeId") int id) {
		employeeService.deleteById(id);
		// send over to our form
		return "redirect:/employees/list";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam ("employeeName") String name, Model model) {
		
		List<Employee> theEmployees = employeeService.searchBy(name);
		
		model.addAttribute("employees", theEmployees);
		
		return "/employees/list-employees";
	}
	
}
