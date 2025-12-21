package org.example.teamproject.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.teamproject.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private SqlSession sqlSession;

    // 로그인
    public UserVO findByUsernameAndPassword(String username, String password) {
        UserVO param = new UserVO();
        param.setUsername(username);
        param.setPassword(password);

        return sqlSession.selectOne(
                "UserMapper.findByUsernameAndPassword",
                param
        );
    }

    // 회원가입
    public void insertUser(UserVO user) {
        sqlSession.insert("UserMapper.insertUser", user);
    }

    // 🔥 학생 목록
    public List<UserVO> findStudentsByClassCode(String classCode) {
        return sqlSession.selectList(
                "UserMapper.findStudentsByClassCode",
                classCode
        );
    }

    // 🔥 학부모 목록
    public List<UserVO> findParentsByClassCode(String classCode) {
        return sqlSession.selectList(
                "UserMapper.findParentsByClassCode",
                classCode
        );
    }
<<<<<<< HEAD
=======

    // 사용자 ID로 조회 (학생/학부모/교사 공용)
    public UserVO findById(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";

        try {
            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {
                        UserVO user = new UserVO();
                        user.setId(rs.getInt("id"));
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password"));
                        user.setEmail(rs.getString("email"));
                        user.setRole(rs.getString("role"));
                        user.setClassCode(rs.getString("class_code"));
                        return user;
                    },
                    id
            );
        } catch (Exception e) {
            return null;
        }
    }


>>>>>>> c9369106ae7ba320b2b388db08f41325ecef48cc
}
