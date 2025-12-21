package org.example.teamproject.DAO;

import org.example.teamproject.vo.PostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    // 학생 일기 목록
    // ✅ 학생이 쓴 일기 목록 조회
    public List<PostVO> findStudentDiaries(int userId, String classCode) {

        String sql = """
            SELECT post_id, user_id, class_code, title, created_at, views
            FROM post
            WHERE user_id = ?
              AND class_code = ?
              AND category = 'DIARY'
            ORDER BY created_at DESC
        """;

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {
                    PostVO post = new PostVO();
                    post.setPostId(rs.getInt("post_id"));
                    post.setUserId(rs.getInt("user_id"));
                    post.setClassCode(rs.getString("class_code"));
                    post.setTitle(rs.getString("title"));
                    post.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                    post.setViews(rs.getInt("views"));
                    return post;
                },
                userId,
                classCode
        );
    }
    // 일기 상세
    public PostVO findById(int postId) {
        String sql = "SELECT * FROM post WHERE post_id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {
                    PostVO p = new PostVO();
                    p.setPostId(rs.getInt("post_id"));
                    p.setUserId(rs.getInt("user_id"));
                    p.setClassCode(rs.getString("class_code"));
                    p.setTitle(rs.getString("title"));
                    p.setContent(rs.getString("content"));
                    p.setCategory(rs.getString("category"));
                    p.setImagePath(rs.getString("image_path"));
                    p.setViews(rs.getInt("views"));
                    p.setCreatedAt(
                            rs.getTimestamp("created_at").toLocalDateTime()
                    );
                    return p;
                },
                postId
        );
    }
    public void increaseViews(int postId) {
        String sql = "UPDATE post SET views = views + 1 WHERE post_id = ?";
        jdbcTemplate.update(sql, postId);
    }
    public void deleteById(int postId) {
        String sql = "DELETE FROM post WHERE post_id = ?";
        jdbcTemplate.update(sql, postId);
    }
}