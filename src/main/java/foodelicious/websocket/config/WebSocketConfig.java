package foodelicious.websocket.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		 // 新增一個WebSocket節點，並啟用對SockJS的支援。
		registry.addEndpoint("/chatting").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 設定一個Message broke的filter，也就是Client端訂閱Message broker的路徑前墜
		registry.enableSimpleBroker("/topic");
		// 設定Client發送訊息給Message broker的@MessageMapping的路徑前墜
		registry.setApplicationDestinationPrefixes("/app");
	}
	
	
}
