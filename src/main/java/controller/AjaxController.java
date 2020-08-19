package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import logic.Board;
import logic.Comment;
import logic.GoogleChartService;
import logic.Line;
import logic.ShopService;
import logic.Sns;
import logic.Todolist;
import logic.User;

//view를통하지 않고 바로 클라이언트로 전달(just data) : @Controller + @ResponseBody
@RestController
@RequestMapping("ajax")
public class AjaxController {
	@Autowired
	ShopService service;
	
	@RequestMapping(value="graph1", produces="text/plain; charset=UTF8")
	public String graph1() {
		//알고리즘을 통해서 json 형태로 재편집(this script) -> parser로해서 ajax로 보내줌(next script)
		//map : ("이지은", 10),("장만월",8) ...
		Map<String, Object> map = service.graph1();
		/*
		 * json : [{"name":"이지은","cnt":"10"}, 
		 * {"name":"장만월","cnt":"8"}, 
		 */
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map.Entry<String, Object> me : map.entrySet()) {
	         json.append("{\"name\":\""+me.getKey()+"\","
	               + "\"cnt\":\""+me.getValue()+"\"}");
	         i++;
	         if(i<map.size())
	            json.append(",");
	      }
	      json.append("]");
	      System.out.println(json);
	      return json.toString(); //클라이언트에 전달될 데이터
	}
	@RequestMapping(value="graph2", produces="text/plain; charset=UTF8")
	public String graph2() {
		Map<String, Object> map = service.graph2();
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map.Entry<String, Object> me : map.entrySet()) {
	         json.append("{\"regdate\":\""+me.getKey()+"\","
	               + "\"cnt\":\""+me.getValue()+"\"}");
	         i++;
	         if(i<map.size())
	            json.append(",");
	      }
	      json.append("]");
	      System.out.println(json);
	      return json.toString();
	}
	
	@RequestMapping(value="exchange1", produces="text/plain; charset=UTF8")
	public String exchange1() {
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".tc"); //국가코드, 환율값 태그 선택
			Elements e2 = doc.select(".tl2.bdl"); //국가이름
			for(int i=0; i<e1.size(); i++) {
				if(e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html());//USD 정보 저장
					for(int j=1; j<=6; j++) {
						list.add(e1.get(i+j).html());
					}//2nd for
					break;
				}//if
			}//for
			for (Element ele : e2) {
				if(ele.html().contains("미국")) { //미국이 들어가있는 단어
					list2.add(ele.html());
				}//if
			}//for
		} catch (IOException e) {
			e.printStackTrace();
		}
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		StringBuilder html = new StringBuilder();
		html.append("<table class='w3-table-all'>");
		html.append("<caption>수출입은행:" + today + "</caption>");
		html.append("<tr><td colspan='3' class='w3-center'>" + list2.get(0)+ ":" + list.get(0)+"</td></tr>");
		html.append("<tr><th>기준율</th><th>받을때</th><th>파실때</th></tr>");
		html.append("<tr><td>"+list.get(3)+"</td>");
		html.append("<td>"+list.get(1)+"</td>");
		html.append("<td>"+list.get(2)+"</td></tr></table>");
	      return html.toString();
	}
	@RequestMapping(value="exchange2", produces="text/plain; charset=UTF8")
	public String exchange2() {
		Map<String,List<String>> map = new HashMap<>();
		StringBuilder html = null;
		try {
			String kebhana =Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
			String strJson = kebhana.substring(kebhana.indexOf("{"));
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim()); //array임
			
			JSONArray array = (JSONArray)json.get("리스트"); //리스트의 value값이 array에 담김
			for(int i = 0; i< array.size(); i++) {
				JSONObject obj = (JSONObject)array.get(i); //!!
				if(obj.get("통화명").toString().contains("미국")||
					obj.get("통화명").toString().contains("일본")||
					obj.get("통화명").toString().contains("유로")||
					obj.get("통화명").toString().contains("중국")	) {
					String str = obj.get("통화명").toString();
					String[] sarr = str.split(" ");
					String key = sarr[0];
					String code = sarr[1];
					List<String> list = new ArrayList<String>();
					list.add(code);
					list.add(obj.get("매매기준율").toString());
					list.add(obj.get("현찰사실때").toString());
					list.add(obj.get("현찰파실때").toString());
					map.put(key, list); //(미국, {code, 매매기준율값, 현찰사실때값, 현찰파실때 값})
				}//if
					
			}//for
			html = new StringBuilder();
			html.append("<table class='w3-table-all'>");
			html.append("<caption>KEB하나은행("+json.get("날짜").toString()+")</caption>");
			html.append("<tr><th rowspan='2' style='vertical-align: middle;'>코드</th>");
			html.append("<th rowspan='2' style='vertical-align:middle;'>기준율</th>");
			html.append("<th colspan='2' class='w3-center'>현찰</th></tr>");
			html.append("<tr><th>파실때</th><th>사실때</th></tr>");
			for(Map.Entry<String, List<String>> m : map.entrySet()) {
				html.append("<tr><td class='w3-center'>"+m.getKey()+"("+m.getValue().get(0) + ")</td>");
				html.append("<td>"+m.getValue().get(1)+"</td><td>"+m.getValue().get(2)+"</td><td>"+m.getValue().get(3)+"</td></tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} //try and catch
		return html.toString();
	}
	

	@RequestMapping(value="main", produces="text/plain; charset=UTF8")
	public List<Sns> main(String ksb,String type,String searchcontent,HttpServletRequest request) {
		if(searchcontent == null || searchcontent.trim().contentEquals("")) {
			searchcontent = null;
		}
		int pageNum = Integer.parseInt(request.getParameter("listAmount"));
		int limit = pageNum*20;
		System.out.println(pageNum+","+limit);
		List<Sns> itemss = service.getSnsList(ksb,type,pageNum,limit,searchcontent);		
		return itemss;
	}
	
	//[admin] 구글차트 0814
	@Autowired
	GoogleChartService googleChart;
	
	//[admin] dashboard index 2-1 주간 매출 0814
	@RequestMapping("weeklyrevenue")
    public JSONObject weeklyrevenue() {
		JSONObject json = googleChart.getChartData();
		//System.out.println(json);
        return json;
    }
	//[admin] dashboard index 2-2 최근 4주간 매출 0815
	@RequestMapping("monthlyrevenue")
	 public JSONObject monthlyrevenue() {
		JSONObject json = googleChart.getChartData2();
		//System.out.println(json);
	   return json;
	}
	//[admin] widgets index 2-1 이번 달 최다 구매 회원 랭킹 0816
	@RequestMapping("monthlyheavyusers" )
		public JSONObject monthlyheavyusers() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData3();
		//System.out.println(json);
		return json;
	}
	//[admin] widgets index 2-2 올해 최다 구매 회원 랭킹 0817
	@RequestMapping("yearlyheavyusers" )
		public JSONObject yearlyheavyusers() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData4();
		//System.out.println(json);
		return json;
	}
	//[admin] widgets index 3-1 우수 입점 스토어 차트 0817
	@RequestMapping("topthreestores" )
		public JSONObject topthreestores() {
		//System.out.println("ajax 연결");
		JSONObject json = googleChart.getChartData5();
		//System.out.println(json);
		return json;
		}
	//[admin] dashboard index 3-1 To-do list add 0817
	@RequestMapping("addtodolist")
    @ResponseBody
    public String addTodolist(@ModelAttribute("line") Line line, HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        //Line loginVO = (LoginVO)session.getAttribute("loginVO");
        try{
            //boardVO.setWriter(loginVO.getUser_id());        
            service.addtodolist(line);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "success";
    }
	
	//[admin] dashboard index 3-2 To-do list show 0817
	//@RequestMapping(value="/board/commentList.do", produces="application/json; charset=utf8")
	/*
	@RequestMapping("showtodolist")
    @ResponseBody
    public ResponseEntity showtodolist(@ModelAttribute("line") Todolist todo, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 TDL
        List<Todolist> tdlVO = service.selectTodolistByCode(line);
        
        if(tdlVO.size() > 0){
            for(int i=0; i<tdlVO.size(); i++){
                HashMap <String, String> hm = new  HashMap<String, String>();
                hm.put("No", ""+tdlVO.get(i).getNo());
                hm.put("duedate", ""+tdlVO.get(i).getDuedate());
                hm.put("content", tdlVO.get(i).getContent()); 
                hm.put("fin", tdlVO.get(i).getFin());
                
                hmlist.add(hm);
            }   
        }
        JSONArray json = new JSONArray(hmlist);        
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }



    */
	//[admin] charts index 3 Yearly : 연 매출 현황 0818
	@RequestMapping("yearlyrevenue")
		public JSONObject yearlyrevenue() {
		JSONObject json = googleChart.getChartData7();
		//System.out.println(json);
		return json;
	}
		
		
	//[admin] charts index 4 지역별 매출 평균 >later drawChart4 getChartData8
	
	//[admin] charts index 5 구매건 기준 매출 산점도
	@RequestMapping("scatterplot")
		public JSONObject scatterplot() {
		JSONObject json = googleChart.getChartData9();
		return json;
	}
	
	
	/**
	 * Board
	 */
	@RequestMapping(value="nd", produces="text/plain; charset=UTF8")
	public String noticeData() { 
		List<Board> list = service.getBoardList(1);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}
	
	@RequestMapping(value="qd", produces="text/plain; charset=UTF8")
	public String qnaData() { 
		List<Board> list = service.getBoardList(2);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}
	
	@RequestMapping(value="commentlist",produces="text/plain; charset=UTF8")
	public String commentlist(int sns_no) {
		StringBuilder html = new StringBuilder();
		List<Comment> list = service.getCommentList(sns_no);
		for(Comment c : list) {
			User user = service.getUser(c.getUserid());
			html.append("<tr style=\"margin-bottom : 10px;\"><td style=\"width:10%;\"><img src=\""+user.getImgurl()+"\" width=\"30px\" height=\"30px\"></td>");
			html.append("<td style=\"width:20%;\">"+user.getUserid()+"</td>");
			html.append("<td>"+c.getContent()+"</td>");
			String regdate = new SimpleDateFormat("yy.MM.dd").format(c.getRegdate());
			html.append("<td style=\"width:20%; font-size:13px;\">"+regdate+"</td>");
		}
		return html.toString();
	}
	
	@RequestMapping(value="like",produces="text/plain; charset=UTF8")
	public String likeSns(int sns_no,String userid) {
		System.out.println(sns_no+userid);
		StringBuilder html = new StringBuilder();
		service.addlike(sns_no,userid);
		int likenum = service.getlikenum(sns_no);
		html.append("<img src=\"../assets/img/test7.PNG\" width=\"30px\" height=\"30px\">"+likenum);
		return html.toString();
	}
	
}
