package com.mystudy.net_multi2;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Iterator;

public class TCPServerMutilChar {
	HashMap <String, DataOutputStream> clients; //접속자 명단
	
	

	public static void main(String[] args) {
		
		new TCPServerMutilChar().serverStart();
		
		
	}
	
	public TCPServerMutilChar() {
		clients = new HashMap<>();
		
	}
	
	//서버 소켓 생성하고 대기하다가 
	//클라이언트가 접속하면 메시지를 받기위한 읽기 전용 쓰레드생성
	public void serverStart () {
		
		ServerSocket serverSocket = null;
		Socket socket = null;
		
		try {
			serverSocket = new ServerSocket(10000);
			System.out.println(">>서버가 시작되었습니다. ");
			System.out.println(">>IP주소: 포트 번호 -"
					+InetAddress.getLocalHost() 
					+":"+serverSocket.getLocalPort() );
			
		while(true) {	
			socket = serverSocket.accept();
			System.out.println(socket.getInetAddress() + ":" + socket.getPort() + "] 접속");

			// 접속된 클라이언트에 대한 처리 : 쓰레드 생성(읽기 쓰레도)
			ServerReceiver thread = new ServerReceiver(socket);
			thread.start();
		}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//ServerReceiver : 전달받은 Socket 이용 메시지 받고, 전체에게 전달
	//생성될 때 : 필드 Clients에 추가
	//종료될 때 : 필드 Clients에서 삭제 처리 
	private class ServerReceiver extends Thread {
		Socket socket;
		DataInputStream in;
		DataOutputStream out;
		String ip;
		String name;
		
		 ServerReceiver(Socket socket) {
			 this.socket = socket;
			 
			 try {
				in = new DataInputStream(socket.getInputStream());
				out = new DataOutputStream(socket.getOutputStream());
				
				ip = socket.getInetAddress().getHostAddress();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			 
		}

		@Override
		public void run() {
			//생성될 때 : 필드 Client에 추가
			//종료될 때 : 필드 Client에서 삭제 처리
			//메시지 받고, 전체에게 전달
			//클라이언트로부터 받은 첫 메시지
			
			
			try {
				//클라이언트로부터 받은 첫 메시지 : 별명(아이디) 입력
				name = in.readUTF();
				System.out.println("접속자 >> " + name);
				
				//접속자 정보 등록(clients 필드)
				clients.put(name, out);
				System.out.println("접속자 명단 " + clients);
				
				//메시지 읽고, 전체에게 전달(반복)
				
				while (true) {
					String msg = in.readUTF();
					System.out.println(name + "> " + msg); // 서버 화면

					// 전체에게 보내기(접속자 전원)
					sendToAll(msg);
				}
				
			} catch (IOException e) {
				//e.printStackTrace();
			} finally {
				//클라이언트가 접속 종료시 처리
				//종료할 때 clients에서 삭제
				clients.remove(name);
				String outMsg = "<" + name +">님이 나갔습니다.";
				sendToAll(outMsg);
				System.out.println(outMsg);
				
			}
		}
		
		private void sendToAll(String msg) {
			//접속된 전체 인원에게 메시지 전달
			Iterator<String> ite = clients.keySet().iterator();
			while(ite.hasNext()) {
				String key = ite.next();
				DataOutputStream out = clients.get(key);
				try {
					out.writeUTF(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			//개선된 for문 작성
			  for(String key : clients.keySet()) {
		            DataOutputStream out = clients.get(key);
		         }
				
			}
			
			
			
		}
		
		
		
	}
	

