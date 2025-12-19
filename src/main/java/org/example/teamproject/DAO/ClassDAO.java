package org.example.teamproject.DAO;

import org.example.teamproject.vo.ClassVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Random;

@Repository
public class ClassDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 🔥 6자리 코드 생성 (중복 검사 포함)
    public String generateClassCode() {
        String code;
        do {
            code = randomCode();
        } while (existsByClassCode(code));
        return code;
    }

    private String randomCode() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random r = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(chars.charAt(r.nextInt(chars.length())));
        }
        return sb.toString();
    }

    private boolean existsByClassCode(String code) {
        String sql = "SELECT COUNT(*) FROM class WHERE class_code = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, code);
        return count != null && count > 0;
    }

    // 학급 생성
    public void insertClass(ClassVO clazz) {
        String sql = "INSERT INTO class (class_code, class_name, teacher_id) VALUES (?, ?, ?)";
        jdbcTemplate.update(
                sql,
                clazz.getClassCode(),
                clazz.getClassName(),
                clazz.getTeacherId()
        );
    }

    // 선생님이 만든 학급 목록
    public List<ClassVO> findByTeacherId(int teacherId) {
        String sql = "SELECT * FROM class WHERE teacher_id = ? ORDER BY created_at DESC";

        return jdbcTemplate.query(sql,
                (rs, rowNum) -> {
                    ClassVO c = new ClassVO();
                    c.setId(rs.getInt("id"));
                    c.setClassName(rs.getString("class_name"));
                    c.setClassCode(rs.getString("class_code"));
                    c.setTeacherId(rs.getInt("teacher_id"));
                    return c;
                },
                teacherId
        );
    }

    public void deleteByIdAndTeacherId(int classId, int teacherId) {
        String sql = "DELETE FROM class WHERE id = ? AND teacher_id = ?";
        jdbcTemplate.update(sql, classId, teacherId);
    }

    // 학급 단건 조회 (classId)
    public ClassVO findById(int classId) {
        String sql = "SELECT * FROM class WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {
                    ClassVO c = new ClassVO();
                    c.setId(rs.getInt("id"));
                    c.setClassCode(rs.getString("class_code"));
                    c.setClassName(rs.getString("class_name"));
                    c.setTeacherId(rs.getInt("teacher_id"));
                    return c;
                },
                classId
        );
    }


}
