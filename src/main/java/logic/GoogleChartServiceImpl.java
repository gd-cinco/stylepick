package logic;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class GoogleChartServiceImpl implements GoogleChartService {

	@Autowired
	ShopService service;
	//샵 서비스에 있는 값들을 가져오기 위해서 의존성을 주입
	
	//{"변수명" : [{},{},{}], "변수명" : "값"}
	
	//[admin] dashboard index 2-1 주간 매출
    @Override
    public JSONObject getChartData() {//제이슨 오브젝트를 리턴하는 것
        // getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.weeklyrevenue(); //it works
    	
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","주문일"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 주문일","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject orderdate = new JSONObject(); //json오브젝트 객체를 생성
            orderdate.put("v", dto.getOrderdateinString()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(orderdate); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }

    //[admin] dashboard index 2-2 최근 4주간 매출
    @Override
    public JSONObject getChartData2() {//제이슨 오브젝트를 리턴하는 것
        // getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.monthlyrevenue(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","주"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 주","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject userid = new JSONObject(); //json오브젝트 객체를 생성
            userid.put("v", dto.getUserid()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(userid); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] widgets index 2-1 이번 달 최다 구매 회원 랭킹
    @Override
    public JSONObject getChartData3() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.monthlyheavyusers(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","아이디"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject userid = new JSONObject(); //json오브젝트 객체를 생성
            userid.put("v", dto.getUserid()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(userid); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] widgets index 2-2 올해 최다 구매 회원 랭킹
    @Override
    public JSONObject getChartData4() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.yearlyheavyusers(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","아이디"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject userid = new JSONObject(); //json오브젝트 객체를 생성
            userid.put("v", dto.getUserid()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(userid); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    
    //[admin] widgets index 3-1 우수 입점 스토어 차트
    @Override
    public JSONObject getChartData5() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Line> items = service.topthreestores(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","스토어명"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "평점 평균");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Line dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject com_name = new JSONObject(); //json오브젝트 객체를 생성
            com_name.put("v", dto.getCom_name()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getEvaluation()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(com_name); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 1 회원현황
    //getChartData6
    
    //[admin] charts index 3 Yearly : 연 매출 현황
    @Override
    public JSONObject getChartData7() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.yearlyrevenue(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","월"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject month = new JSONObject(); //json오브젝트 객체를 생성
            month.put("v", dto.getMonth()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(month); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    
    //[admin] charts index 5 구매건 기준 매출 산점도
    @Override
    public JSONObject getChartData9() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.yearlyrevenue(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","월"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject month = new JSONObject(); //json오브젝트 객체를 생성
            month.put("v", dto.getMonth()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(month); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
}