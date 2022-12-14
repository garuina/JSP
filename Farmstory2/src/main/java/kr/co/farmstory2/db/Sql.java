package kr.co.farmstory2.db;

public class Sql {
	
	// user
	public static final String INSERT_USER = "insert into `board_user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String SELECT_USER = "select * from `board_user` where `uid`=? and `pass`=sha2(?, 256)";
	public static final String SELECT_COUNT_UID = "select count(`uid`) from `board_user` where `uid`=?";
	public static final String SELECT_COUNT_NICK = "select count(`nick`) from `board_user` where `nick`=?";
	public static final String SELECT_TERMS = "select * from `board_terms`";
	public static final String SELECT_USER_FOR_FIND_ID = "select `uid`, `name`, `email`, `rdate` from `board_user` where `name`=? and `email`=?";
	public static final String SELECT_USER_FOR_FIND_PW = "select count(`uid`) from `board_user` where `uid`=? and `email`=?";
	public static final String SELECT_USER_BY_SESSID = "select * from `board_user` where `sessId`=? and `sessLimitDate` > NOW()";
	
	public static final String UPDATE_USER_PASSWORD = "update `board_user` set `pass`=SHA2(?, 256) where `uid`=?";
	public static final String UPDATE_USER_FOR_SESSION = "update `board_user` set `sessId`=?, `sessLimitDate`= DATE_ADD(NOW(), INTERVAL 3 DAY) where `uid`=?";
	public static final String UPDATE_USER_FOR_SESSION_OUT = "update `board_user` set `sessId`=null, `sessLimitDate`= null where `uid`=?";
	
	// board
	public static final String INSERT_ARTICLE = "insert into `board_article` set "
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=now()";
			
	public static final String INSERT_FILE = "insert into `board_file` set "
											+ "`parent`=?,"
											+ "`newName`=?,"
											+ "`oriName`=?,"
											+ "`rdate`=now()";
	public static final String INSERT_COMMENT = "insert into `board_article` set "
											+"`parent`=?,"
											+"`content`=?,"
											+"`uid`=?,"
											+"`regip`=?,"
											+"`rdate`=now()";
	
	public static final String SELECT_MAX_NO = "select max(`no`) from `board_article`";
	public static final String SELECT_COUNT_TOTAL = "select count(`no`) from `board_article` where `parent`=0 and `cate`=?";
	public static final String SELECT_COUNT_TOTAL_FOR_SEARCH = "SELECT COUNT(`no`) FROM `board_article` AS a "
																+ "JOIN `board_user` AS b "
																+ "ON a.uid = b.uid "
																+ "WHERE `parent`=0 AND `cate`=? AND "
																+ "(`title` LIKE ? OR "
																+ "`nick` LIKE ?)";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `board_article` AS a "
												  + "JOIN `board_user` as b ON a.uid = b.uid "
												  + "WHERE `parent` = 0 and `cate`=? "
												  + "ORDER BY `no` desc "
												  + "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.`fno`, b.`oriName`, b.`download` "
													+ "FROM `board_article` AS a "
													+ "LEFT JOIN `board_file` AS b "
													+ "ON	a.`no` = b.`parent` "
													+ "WHERE `no`=?";
	
	public static final String SELECT_ARTICLE_BY_KEYWORD = "SELECT a.*, b.nick FROM `board_article` AS a "
													+"JOIN `board_user` AS b ON a.uid = b.uid "
													+"WHERE `parent`=0 AND `cate`=? and "
													+"(`title` LIKE ? OR "
													+"`nick` LIKE ?) "
													+"order by `no` desc "
													+"limit ?,10";
	
	public static final String SELECT_FILE = "SELECT * FROM `board_file` WHERE `fno`=?";
	public static final String SELECT_FILE_WITH_PARENT = "SELECT * FROM `board_file` WHERE `parent`=?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.`nick` FROM `board_article`AS a "
													+ "JOIN `board_user` AS b USING(`uid`) "
													+ "WHERE `parent`=? ORDER BY `no` asc";
	
	public static final String SELECT_LATESTS = "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='grow' ORDER BY `no` DESC LIMIT 5) "
			+ "UNION "
			+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='school' ORDER BY `no` DESC LIMIT 5) "
			+ "UNION "
			+ "(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='story' ORDER BY `no` DESC LIMIT 5)";
	
	
	public static final String SELECT_LATEST = "SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 3";
	
	
	public static final String SELECT_COMMENT_LATEST = "SELECT a.*, b.`nick` FROM `board_article` AS a "
													+"JOIN `board_user` AS b USING(`uid`) "	
													+"WHERE `parent` != 0 ORDER BY `no` DESC LIMIT 1";
	
	public static final String UPDATE_ARTICLE = "UPDATE `board_article` SET `title`= ?, `content`= ?, `rdate`=now() "
												+ "WHERE `no`=?";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` SET `hit`= `hit` + 1 where `no`=?";
	public static final String UPDATE_FILE_DOWNLOAD = "update `board_file` set `download` = `download` + 1 where `fno`=?";
	
	public static final String UPDATE_COMMENT = "UPDATE `board_article` SET `content`= ?, `rdate`= NOW() WHERE `no`=?";
	
	public static final String DELETE_ARTICLE = "DELETE FROM `board_article` WHERE `no`=? or `parent`=?";
	public static final String REMOVE_COMMENT = "DELETE FROM `board_article` WHERE `no`=?";
	public static final String DELETE_FILE = "delete from `board_file` where `parent`=?";



}