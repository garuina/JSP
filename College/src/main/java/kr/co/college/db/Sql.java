package kr.co.college.db;

public class Sql {
	public static final String Select_lecture = "SELECT * FROM `lecture`";

	public static final String Select_register = "SELECT a.*,  b.`stdName`, c.`lecName` FROM `register` AS a "
											   + "JOIN `student` AS b ON a.regStdNO = b.stdNo "
											   + "JOIN `lecture` AS c ON a.regLecNo = c.lecNO";

	public static final String Select_register_serch = "SELECT a.*,  b.`stdName`, c.`lecName` FROM `register` AS a "
											   + "JOIN `student` AS b ON a.regStdNO = b.stdNo "
											   + "JOIN `lecture` AS c ON a.regLecNo = c.lecNO "
											   + "Where `stdNo`=?";
	
	
	public static final String Select_student = "SELECT * FROM `student`";






}
