package com.mystudy.interface1;

/*클래스 만들기 실습
전화기 만들기
-속성 : 타입 (type), 전화번호(phoneNo)
-기능 
1. 전화정보 확인(view)
2. 전화 걸기(call)
3. 전화 받기(receiveCall)
4. 메세지 보내기
5. 메세지 받기 

*/

//표준을 잡을 때 사용하는 interface 
//예 메세지 보낼때 클래스 명 - sendSMS - sendSMS (을 쓰게 하는 것)


public class Phone {
	//필드 (속성) ---------------------------
	
		private String type; //전화 타입(형태)
		private String phoneNo;
		
		//생성자 --------------------------
		public Phone(String phoneNo) {
			this.type = "Phone 타입";
			this.phoneNo = phoneNo;
		}

		

		public Phone(String type, String phoneNo) {
			super();
			this.type = type;
			this.phoneNo = phoneNo;
		}

		//메소드 --------------------------------------
		public String getType() {
			return type;
		}


		public String getPhoneNo() {
			return phoneNo;
		} 
		
		//=============================================
		//전화 걸기 기능
		public void call() {
			System.out.println(">>전화 걸기 ");
			
		}
		//전화 받기 기능
		public void receiveCall() {
			System.out.println(">>전화 받기");
		}
		//전화 정보 보기
		public void view () {
			System.out.println("타입 :  " + type + ", 전화번호: " + phoneNo);
			
		}
		//메세지 보내기(sendSms, sendMessage, sendMsg.....)
		public void sendSms(String message) {
			System.out.println(">>보낸 메세지 :" + message);
			
		}
		//메세지 받기(receiveSms, receiveMessage, receiveMsg...)
		public void receiveSme(String message) {
			System.out.println(">>받은 메세지 :" + message + "라는 메시지 1건을 받으셨습니다.");
		}
	
	
	

}
