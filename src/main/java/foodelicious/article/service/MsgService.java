package foodelicious.article.service;

import java.util.List;
import java.util.Map;

import foodelicious.article.model.MsgArea;

public interface MsgService {

	void insertMsg(Map<String, String> params);

	List<MsgArea> useIdFindAllMSG(Integer articleId);

	void likeOrNot(Map<String, String> params);

	void unlikeArticle(Map<String, String> params);

	boolean checkLike(Long userId, Integer articleId);

	void updateMessage(Long id, String string);

	void deleteMessage(Long id);

}
