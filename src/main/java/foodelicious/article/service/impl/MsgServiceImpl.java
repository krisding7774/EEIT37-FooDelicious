package foodelicious.article.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import foodelicious.article.model.MsgArea;
import foodelicious.article.repository.MsgRepository;
import foodelicious.article.service.MsgService;

@Service
@Transactional
public class MsgServiceImpl implements MsgService {

	MsgRepository msgRepository;
	
	public MsgServiceImpl(MsgRepository msgRepository) {
		this.msgRepository = msgRepository;
	}

	@Override
	public void insertMsg(Map<String, String> params) {
		msgRepository.insertMsg(params);
	}

	@Override
	public List<MsgArea> useIdFindAllMSG(Integer articleId) {
		return msgRepository.useIdFindAllMSG(articleId);
	}

	@Override
	public void likeOrNot(Map<String, String> params) {
		msgRepository.likeOrNot(params);
	}

	@Override
	public void unlikeArticle(Map<String, String> params) {
		msgRepository.unlikeArticle(params);
	}

	@Override
	public boolean checkLike(Long userId, Integer articleId) {
		return msgRepository.checkLike(userId, articleId);
	}

	@Override
	public void updateMessage(Long id, String string) {
		msgRepository.updateMessage(id, string);
	}

	@Override
	public void deleteMessage(Long id) {
		msgRepository.deleteMessage(id);
		
	}

}
