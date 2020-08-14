package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.mail.PasswordAuthentication;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.sun.net.httpserver.HttpExchange;

import exception.LoginException;
import logic.Buy;
import logic.Mail;
import logic.ShopService;
import logic.Statistics;
import logic.User;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	//객체 주입
	@Autowired
	private ShopService service;
	
	//회원 목록
	@RequestMapping("list")
	public ModelAndView check_list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> list = service.list();
		mav.addObject("list",list);
		return mav;
	}//check_list
	
	//대시보드
	@RequestMapping("dashboard")
	public ModelAndView check_dashboard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		long trimonth_revenue = service.salesdata();
		mav.addObject("trimonth_revenue",trimonth_revenue);
		return mav;
	}//check_dashboard
		
	//위젯
	@RequestMapping("widgets")
	public ModelAndView check_widgets(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}//check_widgets
	
	//차트
		@RequestMapping("charts")
		public ModelAndView check_charts(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			return mav;
		}//check_widgets
			
	//메일 폼 화면 열기 0710-2
	@RequestMapping("mailForm")
	public ModelAndView mailform (String[] idchks, HttpSession session) {
		//view는 admin/mail.jsp로 설정
		ModelAndView mav = new ModelAndView("admin/mail");
		if(idchks == null || idchks.length==0) {
			throw new LoginException("[AdminController] 메일을 보낼 대상자를 선택하세요","list.shop");
		}
		//list : 클릭한 User objects
		List<User> list = service.userlist(idchks);
		mav.addObject("list",list);
		return mav;
	}//mailform
	
	//메일 보내기 0710-2
	@RequestMapping("mail")
	public ModelAndView mail(Mail mail, HttpSession session) {
		ModelAndView mav = new ModelAndView("/alert");
		mailSend(mail);
		mav.addObject("msg","메일 전송이 완료 되었습니다.");
		mav.addObject("url","list.shop");
		return mav;
	}//mail
	
	//메일 인증 0710-2
	   private final class MyAuthenticator extends Authenticator {
		      private String id;
		      private String pw;
		      public MyAuthenticator(String id,String pw) {
		         this.id = id;
		         this.pw = pw;
		      }
		      @Override
		      protected PasswordAuthentication getPasswordAuthentication() {
		         return new PasswordAuthentication(id,pw);
		      }
		   }//MyAuthenticator
	
	//메일 전송 0710-2
	private void mailSend(Mail mail) {
		//네이버 메일 전송을 위한 인증 객체
		MyAuthenticator auth = new MyAuthenticator(mail.getNaverid(),mail.getNaverpw());
		Properties prop = new Properties();
		try {
			FileInputStream fis = new FileInputStream("D:/Spring/shop3/src/main/resources/mail.properties");
			prop.load(fis); //mail.properties의 내용을 Properties(Map)객체로 로드
			prop.put("mail.smtp.user", mail.getNaverid());
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		//메일 전송을 위한 객체
		Session session = Session.getInstance(prop,auth);
		
		//메일의 내용을 저장하는 객체
		MimeMessage mimeMsg = new MimeMessage(session);
		try {
			//보내는 사람
			mimeMsg.setFrom(new InternetAddress(mail.getNaverid()+"@naver.com"));
			List<InternetAddress> addrs = new ArrayList<InternetAddress>();
			//받는 사람
			String[] emails = mail.getRecipient().split(",");
			for(String email : emails) {
				try {
					
					/*
					 * new String(email.getBytes("utf-8"),"8859_1")
					 * email.getBytes("utf-8") : email 문자열을 byte[] 형태로 변경
					 * (utf-8 문자로 인식해서 배열의 형태로 저장)
					 * 8859_1 : byte[]배열을 8859_1로 변경해서 다시 문자열로 생성
					 * : 수신 메일 함의 한글을 깨지지 않게 하는 역할
					 */
					addrs.add(new InternetAddress(new String(email.getBytes("utf-8"),"8859_1")));
				} catch (UnsupportedEncodingException ue) {
					// TODO: handle exception
					ue.printStackTrace();
				}//catch
			}//for
			InternetAddress[] arr = new InternetAddress[emails.length];
			for(int i=0;i<addrs.size();i++) {
				arr[i] = addrs.get(i);
			}//for
			
			//보낸 날짜
			mimeMsg.setSentDate(new Date());
			//받는 사람
			mimeMsg.setRecipients(Message.RecipientType.TO, arr);
			//제목
			mimeMsg.setSubject(mail.getTitle());
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart message = new MimeBodyPart();
			//내용
			message.setContent(mail.getContents(),mail.getMtype());
			multipart.addBodyPart(message);
			//첨부파일
			for(MultipartFile mf : mail.getFile1()) {
				if((mf != null) && (!mf.isEmpty())) {
					multipart.addBodyPart(bodyPart(mf));
				}//if
			}//for
			mimeMsg.setContent(multipart);
			Transport.send(mimeMsg);
		} catch (MessagingException me) {
			// TODO: handle exception
			me.printStackTrace();
		}
	}//mailSend
	
	//메일 본문 0710-2
	private BodyPart bodyPart(MultipartFile mf) {
		MimeBodyPart body = new MimeBodyPart();
		//업로드 파일의 이름
		String orgFile = mf.getOriginalFilename();
		//업로드 위치
		String path = "d:/mailupload/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		//업로드된 내용을 저장하는 파일
		File f1 = new File(path + orgFile);
		try {
			//업로드 완성
			mf.transferTo(f1);
			//메일에 첨부
			body.attachFile(f1);
			//첨부파일이름 설정
			body.setFileName(new String(orgFile.getBytes("UTF-8"),"8859_1"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return body;
	}//bodyPart
	
	// 그래프 0716-1
	@RequestMapping("graph*")
	public ModelAndView graph(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = service.graph1();
		mav.addObject("map",map);
		return mav;
	}//graph


}
