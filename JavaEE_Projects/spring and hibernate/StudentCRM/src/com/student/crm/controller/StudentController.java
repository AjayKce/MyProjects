package com.student.crm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.student.crm.entity.Student;
import com.student.crm.service.StudentService;
import com.student.crm.service.UserService;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	UserService userService;
	
	@Autowired
	StudentService studentService;
	
	@GetMapping("/home")
	public String home() {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			request.setAttribute("owner",userService.getUser(userId));
			return "home";
		}
		else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/showStudentFormToAdd")
	public String showStudentFormToAdd(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			theModel.addAttribute("student",new Student());
			return "student-form";
		}
	}
	
	@RequestMapping("/addStudent")
	public String addStudent(@Valid @ModelAttribute("student") Student theStudent, BindingResult theBindingResult) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			if(theBindingResult.hasErrors()) {
				return "student-form";
			}
			else if(studentService.emailExists(theStudent.getEmail(),userId)) {
				request.setAttribute("emailError", "This email is already taken");
				return "student-form";
			}
			else if(studentService.rollNumberExists(theStudent.getRollNo(),userId)) {
				request.setAttribute("rollError", "This Roll number is already taken");
				return "student-form";
			}
			else if(studentService.phoneNumberExists(theStudent.getPhoneNumber(),userId)) {
				request.setAttribute("phoneError", "This Student phone number is already taken");
				return "student-form";
			}
			else {
				theStudent.setUserId(userId);
				studentService.addStudent(theStudent);
				request.setAttribute("addinfo","you have successully added "+theStudent.getRollNo());
				request.setAttribute("owner",userService.getUser(userId));
				return "home";
			}
		}
	}
	
	@RequestMapping("/showStudentPanelView")
	public String showStudentPanelView(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			List<Student> students = studentService.getStudents(userId);
			theModel.addAttribute("students", students);
			return "panelView";
		}
	}
	
	@GetMapping("/panelUpdate")
	public String panelUpdate(Model theModel,@RequestParam("id") int id,@RequestParam("command") String command) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("command", command);
			request.setAttribute("owner",userService.getUser(userId));
			theModel.addAttribute("student",studentService.getStudent(id));
			return "student-form-update";
		}
	}
	
	@RequestMapping("/updateStudent")
	public String updateStudent(@Valid @ModelAttribute("student") Student theStudent, BindingResult theBindingResult) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			if(theBindingResult.hasErrors()) {
				return "student-form-update";
			}
			else {
				studentService.addStudent(theStudent);
				return "redirect:/student/showStudentPanelView";
			}
		}
	}
	
	@RequestMapping("/updateStudentTable")
	public String updateStudentTable(@Valid @ModelAttribute("student") Student theStudent, BindingResult theBindingResult) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			if(theBindingResult.hasErrors()) {
				return "student-form-update";
			}
			else {
				studentService.addStudent(theStudent);
				return "redirect:/student/showStudentTableView";
			}
		}
	}
	
	@GetMapping("/panelDelete")
	public String panelDelete(Model theModel,@RequestParam("id") int id,@RequestParam("command") String command) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			request.setAttribute("id",id);
			request.setAttribute("command", command);
			theModel.addAttribute("student",studentService.getStudent(id));
			return "student-delete-confirmation";
		}
	}
	
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			Student student = studentService.getStudent(id);
			studentService.deleteStudent(student);
			return "redirect:/student/showStudentPanelView";
		}
	}
	
	@GetMapping("/deleteStudentTable")
	public String deleteStudentTable(@RequestParam("id") int id) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			Student student = studentService.getStudent(id);
			studentService.deleteStudent(student);
			return "redirect:/student/showStudentTableView";
		}
	}
	
	@GetMapping("/showStudentTableView")
	public String showStudentTableView(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			List<Student> students = studentService.getStudents(userId);
			theModel.addAttribute("students", students);
			return "tableView";
			
		}
	}
	
	@RequestMapping("/showStudentFilterView")
	public String showStudentFilterView(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			List<Student> students = studentService.getStudents(userId);
			theModel.addAttribute("students", students);
			request.setAttribute("owner",userService.getUser(userId));
			return "filterView";
		}
	}
	
	@PostMapping("/filterUser")
	public String filterUser(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			String query = "from Student s where s.userId='"+userId+"'";
			String view = request.getParameter("view");
			String rollNumber = request.getParameter("rollNumber");
			String gender = request.getParameter("gender");
			String bloodGroup = request.getParameter("bloodGroup");
			String department = request.getParameter("department");
			String year = request.getParameter("year");
			String semester = request.getParameter("semester");
			if(rollNumber!="") {
				query=query+" and s.rollNo='"+rollNumber+"'";
			}
			if(gender!="") {
				query=query+" and s.gender='"+gender+"'";
			}
			if(bloodGroup!="") {
				query=query+" and s.bloodGroup='"+bloodGroup+"'";
			}
			if(department!="") {
				query=query+" and s.department='"+department+"'";
			}
			if(year!="") {
				query=query+" and s.currentYear='"+year+"'";
			}
			if(semester!="") {
				query=query+" and s.currentSemester='"+semester+"'";
			}
			System.out.println(query);
			List<Student> students = studentService.getFilteredStudents(query);
			theModel.addAttribute("students", students);
			if(view.equals("PANEL")) {
				return "panelView";
			}
			else {
				return "tableView";
			}
		}
	}
}
