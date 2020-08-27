package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.ItemEmptyException;
import exception.SnsException;
import logic.User;

@Component
@Aspect
@Order(2)
public class ItemAspect {
	@Around("execution(* controller.Item*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser ==null) {
			throw new ItemEmptyException("로그인 후 거래하세요","list.shop");
		}
		return joinPoint.proceed();
	}
	
	
}
