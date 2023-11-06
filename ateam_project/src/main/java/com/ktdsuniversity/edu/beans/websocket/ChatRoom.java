package com.ktdsuniversity.edu.beans.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.ktdsuniversity.edu.follow.dao.FollowDAO;

public class ChatRoom {

	private Map<String, List<ChatUser>> sessions;
	private Gson gson;
	public ChatRoom() {
		sessions = new HashMap<>();
		gson = new Gson();
	}

	public String getMyRoomName(WebSocketSession session) {
		for (Entry<String, List<ChatUser>> entry: sessions.entrySet()) {
			String key = entry.getKey();
			List<ChatUser> value = entry.getValue();
			
			for (ChatUser chatUser : value) {
				if (chatUser.getSession().getId() == session.getId()) {
					return key;
				}
			}
		}
		
		return "";
	}

	public ChatUser getChatUser(WebSocketSession session) {
		return sessions.entrySet()
						.stream()
						.flatMap(entry -> entry.getValue().stream())
						.filter(user -> user.getSession() == session)
						.findFirst()
						.orElse(null);
	}
	
	public boolean isAlreadyLogin(String userEmail) {
		return sessions.entrySet()
															.stream()
															.flatMap(entry -> entry.getValue().stream())
															.filter(user -> user.getUserEmail().equals(userEmail))
															.count() > 0;
	}

	public void enter(WebSocketSession session, Message receiveMessage) {
		String roomName = receiveMessage.getRoomName();
		String userName = receiveMessage.getUserName();
		String userEmail = receiveMessage.getUserEmail();
		
		if (!sessions.containsKey(roomName)) {
			sessions.put(roomName, new ArrayList<>());
		}

		ChatUser chatUser = new ChatUser(session, userName, userEmail);
		if (isAlreadyLogin(userEmail) && roomName.equals("main")) {
			sessions.entrySet().forEach(entry -> {
				List<ChatUser> eachUserList = entry.getValue();
				for (int i = 0; i < eachUserList.size(); i++) {
					ChatUser user = eachUserList.get(i);
					if (user.getUserEmail().equals(userEmail)) {
						eachUserList.set(i, chatUser);
					}
				}
			});
		}
//		else if (isAlreadyLogin(userEmail) && !roomName.equals("main")) {
//			sessions.entrySet().forEach(entry -> {
//				String eachRoomName = entry.getKey();
//				List<ChatUser> eachUserList = entry.getValue();
//				for (int i = 0; i < eachUserList.size(); i++) {
//					ChatUser user = eachUserList.get(i);
//					if (user.getUserEmail().equals(userEmail)) {
//						eachUserList.set(i, chatUser);
//					}
//				}
//			});
//		}
		else {
			sessions.get(roomName).add(chatUser);
		}
	}

	public void leave(WebSocketSession session) {
		String roomName = this.getMyRoomName(session);
		ChatUser user = this.getChatUser(session);

		if (this.sessions.containsKey(roomName) && user != null) {
			this.sessions.get(roomName).removeIf(logoutUser -> logoutUser.getSession().getId() == session.getId());

			if (this.sessions.get(roomName).size() == 0) {
				this.sessions.remove(roomName);
			}
		}
	}

	public void sendToMe(WebSocketSession me, Message message) {
		TextMessage textMessage = new TextMessage(gson.toJson(message));
		try {
			me.sendMessage(textMessage);
		} catch (IOException e) {}
	}

	public void sendToFollowers(WebSocketSession me, Message message, FollowDAO followDao) {
		TextMessage textMessage = new TextMessage(gson.toJson(message));
		
		// 지금 로그인한 사용자 이메일
		String loginUserEmail = message.getUserEmail();
		
		// 지금 로그인한 사용자를 팔로우 하는 회원들의 이메일
		List<String> followersEmail = followDao.getAllFollowee(loginUserEmail)
											   .stream()
											   .map(follow -> follow.getFollowee())
											   .collect(Collectors.toList());
		
		
		if (sessions.containsKey(message.getRoomName())) {
			sessions.get(message.getRoomName())
					.parallelStream()
					.filter(user -> followersEmail.contains(user.getUserEmail()))
					.map(user -> user.getSession())
					.filter(session -> session != null)
					.filter(session -> session.isOpen() && !session.getId().equals(me.getId()))
					.forEach(session -> {
						try {
							session.sendMessage(textMessage);
						} catch (IOException e) {}
					});
		}
	}
	
	public void sendAll(WebSocketSession me, Message message) {
		TextMessage textMessage = new TextMessage(gson.toJson(message));
		
		if (sessions.containsKey(message.getRoomName())) {
			sessions.get(message.getRoomName())
					.parallelStream()
					.map(user -> user.getSession())
					.filter(session -> session != null)
					.filter(session -> session.isOpen() && !session.getId().equals(me.getId()))
					.forEach(session -> {
						try {
							session.sendMessage(textMessage);
						} catch (IOException e) {}
					});
		}
	}
	
	public void sendTo(Message message) {
		TextMessage textMessage = new TextMessage(gson.toJson(message));
		
		if (sessions.containsKey("main")) {
			sessions.get("main")
					.parallelStream()
					.filter(user -> user.getUserEmail().equals(message.getTo()))
					.map(user -> user.getSession())
					.filter(session -> session != null)
					.filter(session -> session.isOpen())
					.forEach(session -> {
						try {
							session.sendMessage(textMessage);
						} catch (IOException e) {}
					});
		}
	}

}