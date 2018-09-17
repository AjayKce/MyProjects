package com.dragon.aspect;

import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CRMLoggingAspect {

	//add logger
	private Logger myLogger = Logger.getLogger(getClass().getName());
	
	//add Pointcut declaration
	@Pointcut("execution(* com.dragon.springdemo.*.*(..))")
	private void forControllerPackage() {}
	
	@Pointcut("execution(* com.dragon.service.*.*(..))")
	private void forServicePackage() {}
	
	@Pointcut("execution(* com.dragon.dao.*.*(..))")
	private void forDaoPackage() {}
	
	@Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
	private void forAppFlow() {}
	
	@Before("forAppFlow()")
	private void before(JoinPoint theJoinPoint) {
		String theMethod = theJoinPoint.getSignature().toShortString();
		myLogger.info("===>@Before : method :="+theMethod);
		//System.out.println(theMethod);
		Object[] args = theJoinPoint.getArgs();
		for(Object temp:args) {
			myLogger.info("===>@Before : Argument :="+temp);
		}
	}
	
	@AfterReturning(
			pointcut = "forAppFlow()",
			returning = "theResult"
			)
	public void after(JoinPoint theJoinPoint,Object theResult) {
		String theMethod = theJoinPoint.getSignature().toShortString();
		myLogger.info("===>@After : method :="+theMethod);
		myLogger.info("===>Result : ="+theResult);
	}
	
}
