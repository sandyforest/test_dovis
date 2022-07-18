package com.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.smhrd.domain.Chat;
import com.smhrd.web.WebSocketHandler;

@Controller
@ServerEndpoint("/echo.do")
public class WebSocketHandler extends TextWebSocketHandler {

	private static final List<Session> sessionList = new ArrayList<Session>();;
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	public WebSocketHandler() {
		// TODO Auto-generated constructor stub
		System.out.println("웹소켓 객체 생성");
	}

	@OnOpen
	public void onOpen(Session session) {
		logger.info("Open session id:" + session.getId());
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("join this socket : 채팅방 연결 성공~.");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}

	/*
	 * 모두에게 메세지 보내기
	 * 
	 * @param self
	 * 
	 * @param sender
	 * 
	 * @param message
	 */

	private void sendAllSessionToMessage(Session self, String sender, String message) {

		try {
			// 만약에 보낸이가 아닌 다른 사람이 보낸경우 전송~
			for (Session session : WebSocketHandler.sessionList) {
				if (!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(sender + " : " + message);
					System.out.println(sender);
					System.out.println(message);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	/*
	 * 메세지 받은 경우
	 * 
	 * @param message
	 * 
	 * @param session
	 */
	@OnMessage
	public void onMessage(String message, Session session) {

		// Gson을 이용하여 받아온 채팅을 JAVA객체로 변환
		Gson gson = new Gson();
		Chat chatting = gson.fromJson(message, Chat.class);

		logger.info(chatting.getTalker() + " : " + chatting.getTalk());
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(chatting.getTalker() + " : " + chatting.getTalk());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		// 세션, 작성자 내용을 모아 모두에게 전송
		sendAllSessionToMessage(session, chatting.getTalker(), chatting.getTalk());
	}

	@OnError
	public void onError(Throwable e, Session session) {

	}

	@OnClose
	public void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		sessionList.remove(session);
	}

}
