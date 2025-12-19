package org.example.teamproject.DAO;

import org.example.teamproject.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.ArrayList;

@Repository
public class NoticeDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 지금은 일단 비워두자 (추후 구현)
    public List<NoticeVO> findByClassCode(String classCode) {
        return new ArrayList<>();
    }
}
