package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	// 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
	
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from `board_user` where `uid`=? and `pass`=sha2(?, 256)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(1, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setUid(rs.getString("uid"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRdate(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
