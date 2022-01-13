package com.springproject.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springproject.springboot.entity.Employee;

//@RepositoryRestResource(path="members")
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	// method to sort by last name
	public List<Employee> findAllByOrderByLastNameAsc();
	
	// method to search by first name or last name
	public List<Employee> findByFirstNameContainsOrLastNameContainsAllIgnoreCase(String firstName, String lastName);
}
