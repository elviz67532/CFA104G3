package com.member.dao;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.member.model.MemberDAO;
import com.member.model.MemberDAOJDBCImpl;
import com.member.model.MemberVO;

public class TestMemberDAO {
	private MemberDAO dao;

	@BeforeEach
	public void before() {
		dao = new MemberDAOJDBCImpl();
	}

	@AfterEach
	public void after() {
		dao = null;
	}

	@Test
	public void testInsert() {
		MemberVO vo = new MemberVO();

		byte[] data = new byte[2];
		data[0] = 0x05;
		data[0] = 0x06;
		
		vo.setEmail("jacklyn90@gmail.com");
		vo.setAccount("napoleon675");
		vo.setPassword("g5Wi0b37");
		vo.setNickname("jacklyn90");
		vo.setName("景宇文");
		vo.setPhone("0907-798808");
		vo.setGender(1);
		vo.setCity("桃園市");
		vo.setCityArea("觀音區");
		vo.setAddress("桃園市觀音區中山西路82巷534弄459號88樓");
		vo.setCode("0A5G1D5B4");
		vo.setAvatar(data);
		vo.setRegisterDate(Timestamp.valueOf("2022-10-05 15:00:06"));
		vo.setStatus(0);

		int row = dao.insert(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testDeleteById() {
		int row = dao.deleteById(1);
		assertNotEquals(row, 0);
	}

	@Test
	public void testUpdate() {
		MemberVO vo = new MemberVO();

		byte[] data = new byte[2];
		data[0] = 0x07;
		data[0] = 0x08;
		
		vo.setId(1);
		vo.setEmail("jacklyn909@gmail.com");
		vo.setAccount("napoleon678");
		vo.setPassword("g5Wi0b378");
		vo.setNickname("jacklyn900");
		vo.setName("景宇文1");
		vo.setPhone("0907-798800");
		vo.setGender(2);
		vo.setCity("台中市");
		vo.setCityArea("大里");
		vo.setAddress("台中市大里區爽文路002號");
		vo.setCode("0A5G1D5dd");
		vo.setAvatar(data);
		vo.setRegisterDate(Timestamp.valueOf("2022-10-05 15:00:07"));
		vo.setStatus(1);

		int row = dao.update(vo);
		assertNotEquals(row, 0);
	}

	@Test
	public void testSelectById() {
		MemberVO vo = dao.selectById(1);
		assertNotNull(vo);
	}

	@Test
	public void testSelectAll() {
		List<MemberVO> vos = dao.selectAll();
		assertTrue(vos.size() > 0);
	}
}
