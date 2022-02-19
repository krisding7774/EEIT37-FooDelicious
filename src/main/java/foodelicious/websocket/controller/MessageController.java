package foodelicious.websocket.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import foodelicious.websocket.model.Message;
import foodelicious.websocket.model.OutputMessage;

@Controller
public class MessageController {
	
		
	
	@MessageMapping("/chat")
	@SendTo({"/topic/messages"})
	public  OutputMessage processMessage(Message message) {
		String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
		return new OutputMessage(message.getFrom(), message.getText(), time);
	}
	
	@MessageMapping("/chat/{chatId}")
	@SendTo({"/topic/messages"})
	public  OutputMessage processChatRoomMessage(Message message) {
		System.out.println(message);
		String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
		System.out.println(time);
		System.out.println("--------------------------");
		return new OutputMessage(message.getFrom(), message.getText(), time);
	}
	
	
	
}
