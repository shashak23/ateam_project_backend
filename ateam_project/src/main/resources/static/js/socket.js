/**
 * 채팅 관련 JS 라이브러리
 */
var sock = undefined
var chatModal = undefined;

function inviteUser(send, userName, userEmail, otherUserName) {
	var roomName = Math.random() + "";
	send({
            roomName: roomName,
            sendType: "invite",
            userName: userName,
            userEmail: userEmail,
            to: otherUserName,
            message: userName + "님이 대화에 초대했습니다. 대화에 응하시겠습니까?"
    })
    
    var modal = new Modal("모달 제목", '<input type="text" id="chatMessage"/><button id="sendBtn">보내기</button></div><div class="chat-box">', false);
    if (chatModal) {
		modal.close($);
		chatModal = undefined;
	}
    
    chatModal = modal.show($, "body");
    chatModal.find("#sendBtn").click(function() {
    	send({
    		"roomName": roomName,
    		"sendType": "all",
    		"userName": userName,
    		"userEmail": email,
    		"message": chatModal.find("#chatMessage").val()
    	})
    })
};

function enterRoom(send, userName, userEmail, roomName) {
	var modal = new Modal("모달 제목", '<input type="text" id="chatMessage"/><button id="sendBtn">보내기</button></div><div class="chat-box">', false);
    
    if (chatModal) {
		modal.close($);
		chatModal = undefined;
	}
    
    chatModal = modal.show($, "body");
    chatModal.find("#sendBtn").click(function() {
    	send({
    		"roomName": roomName,
    		"sendType": "all",
    		"userName": userName,
    		"userEmail": email,
    		"message": chatModal.find("#chatMessage").val()
    	})
    })
    
    
	send({
            roomName: roomName,
            sendType: "enter",
            userName: userName,
            userEmail: userEmail,
            message: userName + "님이 대화에 참여했습니다."
    })
}

function connectSocket(userName, userEmail, receiveCallback) {
    // 채팅서버 연결
    sock = new SockJS("/chat");
    
    // 소켓서버 연결 완료 콜백
    sock.onopen = function() {
        
        // send : connection으로 message를 전달
        // connection이 맺어진 후 가입(JOIN) 메시지를 전달
        send({
                roomName: "main",
                sendType: "connect",
                userName: userName,
                userEmail: userEmail,
                message: userName + "님이 로그인 했습니다."
        })
        
        // onmessage : message를 받았을 때의 callback
        sock.onmessage = function(e) {
            var content = JSON.parse(e.data);
            if (content.sendType == "all" 
            		|| content.sendType == "enter"
            		|| content.sendType == "leave"
            		|| content.sendType == "invite" ) {
                receiveCallback(send, content);
            }
            else if (content.sendType == "connect") {
                AlertBox(content.message);
            }
        }
    }
    
    // 일반 메시지 전송
    var send = function(message) {
        var msg = {
            roomName : message.roomName,
            sendType : message.sendType,
            userName : userName,
            userEmail: userEmail,
            message : message.message
        };
        
        if (message.to) {
			msg.to = message.to;
		}
        
        sock.send(JSON.stringify(msg));
    }
    
    
    return send;
    
}