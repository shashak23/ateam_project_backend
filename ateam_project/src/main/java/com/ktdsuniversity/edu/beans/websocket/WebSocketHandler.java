package com.ktdsuniversity.edu.beans.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.ktdsuniversity.edu.follow.dao.FollowDAO;

@Component
public class WebSocketHandler extends TextWebSocketHandler {

	private ChatRoom chatRoom;
	private Gson gson;
	
	@Autowired
	private FollowDAO followDAO;

	public WebSocketHandler() {
		chatRoom = new ChatRoom();
		gson = new Gson();
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Message receiveMessage = gson.fromJson(message.getPayload(), Message.class);

		String sendType = receiveMessage.getSendType().toLowerCase(); 
		if (sendType.equals(ChatType.CONNECT)) {
			boolean isAlreadyLogin = chatRoom.isAlreadyLogin(receiveMessage.getUserEmail());
			chatRoom.enter(session, receiveMessage);
			if (!isAlreadyLogin) {
				chatRoom.sendToFollowers(session, receiveMessage, followDAO);
			}
		}
		else if (sendType.equals(ChatType.INVITE)) {
			chatRoom.enter(session, receiveMessage);
			chatRoom.sendTo(receiveMessage);
		}
		else if (sendType.equals(ChatType.ENTER)) {
			chatRoom.enter(session, receiveMessage);
			chatRoom.sendAll(session, receiveMessage);
		}
		else if (sendType.equals(ChatType.ALL)) {
			chatRoom.sendAll(session, receiveMessage);

			receiveMessage.setSendToMe(true);
			chatRoom.sendToMe(session, receiveMessage);
		}
		else if (sendType.equals(ChatType.LEAVE)) {
			chatRoom.leave(session);
			chatRoom.sendAll(session, receiveMessage);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String roomName = chatRoom.getMyRoomName(session);
		ChatUser user = chatRoom.getChatUser(session);
		
		if (user != null) {
			Message message = new Message();
			message.setMessage(user.getUserName() + "님이 방을 나갔습니다.");
			message.setRoomName(roomName);
			message.setSendType(ChatType.LEAVE);
			message.setUserEmail(user.getUserEmail());
			message.setUserName(user.getUserName());
			
			chatRoom.leave(session);
			chatRoom.sendAll(session, message);
		}
	}

}