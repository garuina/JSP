package kr.co.college.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.college.bean.StudentBean;
import kr.co.college.bean.registerBean;
import kr.co.college.db.DBCP;
import kr.co.college.db.Sql;

public class StudentDAO {
	private static StudentDAO instance = new StudentDAO();
	public static StudentDAO getInstance() {
		return instance;
	}
	
	private StudentDAO(){}
	
	
	public List<StudentBean> selectstudent() {
		
		List<StudentBean> students = new ArrayList<>(); 	
		
		try{
			Connection conn = DBCP.getConnection();
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.Select_student);
			
		while(rs.next()){
			StudentBean sb = new StudentBean();
			
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			students.add(sb);
		}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return students;
		
	}
	
	public registerBean selectArticle(String stdNo) {
		registerBean rb = null;
		
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.Select_register_serch);
			psmt.setString(1, stdNo);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				rb = new registerBean();
	
				rb.setRegStdNo(rs.getString(1));
				rb.setRegLecNo(rs.getInt(2));
				rb.setRegMidScore(rs.getInt(3));
				rb.setRegFinalScore(rs.getInt(4));
				rb.setRegTotalScore(rs.getInt(5));
				rb.setRegGrade(rs.getString(6));
				rb.setStdName(rs.getString(7));
				rb.setLecName(rs.getString(8));
			}
			
			rs.close();
			psmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return rb;
	}

}
