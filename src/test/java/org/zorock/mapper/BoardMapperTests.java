package org.zorock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java ������ ���
// @ContextConfiguration(classes = { org.zerock.config.RootConfig.class })
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		log.info("-------------------------------------------");
		boardMapper.getList();
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("yoontitle");
		vo.setContent("yooncontent");
		vo.setWriter("yoon12");
		boardMapper.insert(vo);
		log.info("-------------------------------------------");
		log.info("after insert"+vo.getBno());
		
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("yoontitle2222");
		vo.setContent("yooncontent222");
		vo.setWriter("yoon3333");
		boardMapper.insertSelectKey(vo);
		
		log.info("-------------------------------------------");
		log.info("after insert selectKey"+vo.getBno());
	}
	
	@Test
	public void testRead() {
		BoardVO vo = boardMapper.read(10L);
		log.info(vo);
	}
	
	
	@Test
	public void testDelete() {
		int count = boardMapper.delete(15L);
		log.info("count: "+count);
		
		
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(17L);
		vo.setTitle("updatetitle2222");
		vo.setContent("updateContent");
		vo.setWriter("updateUser");
		log.info("count: "+ boardMapper.update(vo));
		
		
	}
	
	@Test
	public void testPaging() {
		// 1 ~10
		Criteria cri = new Criteria();
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	}
	
	
	@Test
	public void testPageDTO() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(25);
		
		PageDTO pageDTO = new PageDTO(cri, 251);
		
		log.info(pageDTO);
	}
	
	@Test
	public void testSearchPaging() {
		// 1 ~10
		
		
		Criteria cri = new Criteria();
		cri.setType("TCW");
		//cri.setKeyword("Test");
		
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	}
	
	
	
	
	
	
	
	
}
