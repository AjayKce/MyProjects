package com.student.crm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.student.crm.email.ForgetSendMail;
import com.student.crm.email.SendMail;
import com.student.crm.entity.User;
import com.student.crm.salt.RandomString;
import com.student.crm.service.StudentService;
import com.student.crm.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userService;
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	HttpServletRequest request;
	
	RandomString salt = new RandomString();
	
	SendMail sendMail = new SendMail();
	
	ForgetSendMail sendForgetMail = new ForgetSendMail();
	
	@RequestMapping("/")
	public String signup(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
		request.setAttribute("success",null);
		theModel.addAttribute("login",new User());
		return "signup";
		}
	}
	
	@RequestMapping("/login")
	public String signin(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
		request.setAttribute("successLogout",request.getParameter("successLogout"));
		request.setAttribute("success",null);
		return "login";
		}
	}
	
	@PostMapping("/addStudent")
	public String add(@Valid @ModelAttribute("login") User theUser,BindingResult theBindingResult,HttpServletRequest request) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
		if(theBindingResult.hasErrors()) {
			return "signup";
		}
		else if(!(theUser.getPassword().equals(request.getParameter("rePassWord")))) {
			theUser.setPassword(null);
			request.setAttribute("passError","password doesn't matches please try again" );
			return "signup";
		}
		else if(userService.emailExists(theUser.getEmail())){
			theUser.setEmail(null);
			request.setAttribute("emailError","email id already exists please try with another email" );
			return "signup";
		}
		else if(userService.userExists(theUser.getUsername())){
			theUser.setUsername(null);
			request.setAttribute("userError","username already exists please try with another username" );
			return "signup";
		}
		else {
		if("valid".equals(theUser.getValidate())) {
			request.setAttribute("success","Your password is successfully resetted");
			return "login";
		}
		theUser.setValidate(salt.getSaltString());
		theUser.setForgetPassword(salt.getSaltString());
		userService.addStudent(theUser);
		String email = theUser.getEmail();
		int id=userService.getUserId(theUser.getUsername(),theUser.getPassword());
		String validator = userService.getValidator(id);
		if(sendMail.send(email,id,validator)) {
			request.setAttribute("passError",null);
			request.setAttribute("emailError",null );
			request.setAttribute("userError",null );
			return "signUpSuccessForm";
		}
		else {
			request.setAttribute("emailError","Network Slow please try after sometimes" );
			return "signup";
		}
		}
	}
	}
	
	@PostMapping("/setPasswordStudent")
	public String setPasswordStudent(@Valid @ModelAttribute("login") User theUser,BindingResult theBindingResult,HttpServletRequest request) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
		if(theBindingResult.hasErrors()) {
			return "forgetsignup";
		}
		else if(!(theUser.getPassword().equals(request.getParameter("rePassWord")))) {
			theUser.setPassword(null);
			request.setAttribute("passError","password doesn't matches please try again" );
			return "forgetsignup";
		}
		else {
			request.setAttribute("success","Your password is successfully resetted");
			theUser.setForgetPassword(salt.getSaltString());
			theUser.setValidate("valid");
			userService.addStudent(theUser);
			return "login";
		}
		}
	}
	
	@RequestMapping("/verifyEmail")
	public String verifyEmail() {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = (User) userService.getUser(id);
		String validator1 = request.getParameter("validator");
		if(validator1.equals(user.getValidate())) {
			user.setValidate("valid");
			userService.addStudent(user);
			request.setAttribute("success","You were successfully Registered enter the details to log in");
			return "login";
		}
		else {
			return "login";
		}
	}
	
	@RequestMapping("/showForgetPasswordForm")
	public String showForgetPasswordForm() {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
			return "ForgetPasswordForm";
		}
	}
	
	@RequestMapping("/processForgetPasswordForm")
	public String processForgetPasswordForm() {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
			String email = request.getParameter("email");
			User user = userService.getExistingUser(email);
			if(user==null) {
				return "login";
			}
			else {
				String forgetCode = user.getForgetPassword();
				if(sendForgetMail.send(user.getEmail(),forgetCode)) {
					return "forgetPasswordSuccessForm";
				}
				else {
					return "login";
				}
			}
		}
	}
	
	@RequestMapping("/passwordReset")
	public String passwordReset(Model theModel) {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId!=0) {
			return "redirect:student/home";
		}
		else {
			String email=request.getParameter("email");
			String forgetCode=request.getParameter("forgetCode");
			User user = userService.getExistingUser(email);
			if(forgetCode.equals(user.getForgetPassword())) {
				user.setPassword(null);
				request.setAttribute("success",null);
				theModel.addAttribute("login",user);
				return "forgetsignup";
			}
			else {
				return "login";
			}
		}
	}
	
	@PostMapping("/checkLogin")
	public String checklogin(@RequestParam("username") String user,@RequestParam("password") String pass) {
		if(userService.authenticated(user,pass) && userService.verified(user,pass)) {
			session.setAttribute("userId",userService.getUserId(user,pass));
			request.setAttribute("authenticationError",null);
			return "redirect:/student/home";
		}
		else if(!userService.verified(user,pass)) {
			request.setAttribute("authenticationError","your account has not verified");
			return "login";
		}
		else {
			request.setAttribute("authenticationError","invalid username/password");
			return "login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", 0);
		return "redirect:/login?successLogout=You have successfully logged out!!!";
	}
	
	@RequestMapping("/showDeleteUserAccountForm")
	public String showDeleteUserAccountForm() {
		if(session.getAttribute("userId")==null) {
			session.setAttribute("userId",0);
		}
		int userId = (int) session.getAttribute("userId");
		if(userId==0) {
			return "redirect:/login";
		}
		else {
			request.setAttribute("owner",userService.getUser(userId));
			request.setAttribute("addinfo","Do you wish to delete Your Account");
			return "deleteUser";
		}
	}
	
	@RequestMapping("/deleteUserAccount")
	public String deleteUserAccount() {
			if(session.getAttribute("userId")==null) {
				session.setAttribute("userId",0);
			}
			int userId = (int) session.getAttribute("userId");
			if(userId==0) {
				return "redirect:/login";
			}
			else {
				userService.deleteUser(userId);
				studentService.deleteStudents(userId);
				session.setAttribute("userId", 0);
				return "redirect:/login";
			}
	}
	
}
