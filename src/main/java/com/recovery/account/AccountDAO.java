package com.recovery.account;

import java.io.File;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.recovery.main.DBManager;

public class AccountDAO {

	// 로그인
	public static boolean login(HttpServletRequest request) {
		
		String newid = (String) request.getAttribute("newid");
		String newpw = (String) request.getAttribute("newpw");
		
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		String oldPW = request.getParameter("oldPW");
		
		if (oldPW != null) {
			User user2 = (User) request.getSession().getAttribute("userAccount");
			userID = user2.getU_id();			
			userPW = oldPW;
		}
		
		if (newid != null) {
			userID = newid;
			userPW = newpw;
		}
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where u_id = ?";
		String dbUserPW = "";
		boolean Check = false;
		try {
			// 연결 시작
			con = DBManager.connect();
			System.out.println("연결 성공");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			// id, pw 맞는지 확인
			if (rs.next()) {
				dbUserPW = rs.getString("u_pw");
				if (userPW.equals(dbUserPW)) {
					System.out.println("로그인 성공");
					// User bean 에 유저 정보 입력
					User user = new User();
					user.setU_id(userID);
					user.setU_pw(userPW);
					user.setU_nicname(rs.getString("u_nicname"));
					user.setU_tel(rs.getString("u_tel"));
					user.setU_email(rs.getString("u_email"));
					user.setU_kanji_ln(rs.getString("u_kanji_ln"));
					user.setU_kanji_fn(rs.getString("u_kanji_fn"));
					user.setU_kata_ln(rs.getString("u_kata_ln"));
					user.setU_kata_fn(rs.getString("u_kata_fn"));
					user.setU_img(rs.getString("u_img"));
					user.setU_signout(rs.getString("u_signout"));
					Check = true;
					// 세션 생성
					HttpSession userHS = request.getSession();
					userHS.setAttribute("userAccount", user);
				} else {
					System.out.println("비밀번호 오류");
				}
			} else {
				System.out.println("존재하지 않는 회원");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("userLogin 서버 오류");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return Check;
	}
	
	// login 했는지 안했는지 확인(seller 포함)
	public static int loginCheck(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("userAccount");
		Seller seller = (Seller) request.getSession().getAttribute("sellerAccount");
		if (user != null) {
			request.setAttribute("loginChange", "lgh_account/loginButton/loginOK.jsp");
			return 1;
		} 
		else if (seller != null) {
			request.setAttribute("loginChange", "lgh_account/loginButton/sellerLoginOK.jsp");
			return 2;
		}
		else {
			request.setAttribute("loginChange", "lgh_account/loginButton/loginButton.jsp");
			return 0;
		}
	}
	
	public static void logout(HttpServletRequest request) {
		
		User user = (User) request.getSession().getAttribute("userAccount");
		HttpSession hs = request.getSession();
		if (user != null) {
			hs.removeAttribute("userAccount");
		}else {			
			hs.removeAttribute("sellerAccount");
		}
	};
	
	
	//id가 존재하는지 확인(user,seller 둘다 포함)
	public static int idCheck(HttpServletRequest request) {
		String table = request.getParameter("table");
		String inputID = request.getParameter("ID");
		String dbID = "s_id";
		System.out.println(table);
		if (table.equals("users")) {
			dbID = "u_id";
		}
		System.out.println("inputID: " + inputID);
		System.out.println(dbID);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + table + " WHERE " + dbID + " = ?";
		int idCheck = 0;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inputID);
			rs = pstmt.executeQuery();
			if (rs.next() || inputID.equals("")) {
				// 행이 존재 하거나 빈칸이면 존재하는 회원
				idCheck = 0;
			} else {
				// 행이 없거나 빈칸도 아니면 사용 가능
				idCheck = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return idCheck;
	}
	
	//db의 users / address에 정보 담기
	public static void regUser(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 유저
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?, 'N')";
		// 배송지
		String sql2 = "insert into address values(address_seq.nextval,?,?,?,?,?,?,?)";
		// 배송지 확인
		String sql3 = "select a_no from address where u_id = ?";
		// 기본 배송지
		String sql4 = "insert into delivery_address VALUES(?,?)";
		try {
			request.setCharacterEncoding("utf-8");
			String path = request.getServletContext().getRealPath("lgh_account/userImg");
			MultipartRequest mr = new MultipartRequest(request, path, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy()
					);
			String id = mr.getParameter("userID");
			String pw = mr.getParameter("userPW");
			String kanjiLast = mr.getParameter("userKanji_ln");
			String kanjiName = mr.getParameter("userKanji_fn");
			String kataLast = mr.getParameter("userKata_ln");
			String kataName = mr.getParameter("userKata_fn");
			String nicName = mr.getParameter("userNicname");
			String tel1 = mr.getParameter("userTel1");
			String tel2 = mr.getParameter("userTel2");
			String tel3 = mr.getParameter("userTel3");
			String telAll = tel1+"-"+tel2+"-"+tel3;
			String email = mr.getParameter("userEmail");
			String img = mr.getFilesystemName("userImg");
			
//			System.out.println(id);
//			System.out.println(pw);
//			System.out.println(kanjiLast);
//			System.out.println(kanjiName);
//			System.out.println(kataLast);
//			System.out.println(kataName);
//			System.out.println(nicName);
//			System.out.println(telAll);
//			System.out.println(email);
//			System.out.println(img);
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nicName);
			pstmt.setString(4, telAll);
			pstmt.setString(5, email);
			pstmt.setString(6, kanjiLast);
			pstmt.setString(7, kanjiName);
			pstmt.setString(8, kataLast);
			pstmt.setString(9, kataName);
			pstmt.setString(10, img);
			
			
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("유저 등록성공");
			}
			pstmt.close();
			String addrNum = mr.getParameter("userAddrN");
			String addrP = mr.getParameter("userAddrP");
			String addrCity = mr.getParameter("userAddrC");
			String addrDetail = mr.getParameter("userAddrD");
			if (addrDetail.isEmpty()) {
				addrDetail = "...";
			}
			System.out.println(addrNum);
			System.out.println(addrP);
			System.out.println(addrCity);
			System.out.println(addrDetail);
			
			
			pstmt = con.prepareStatement(sql2);
			
			pstmt.setString(1, addrNum);
			pstmt.setString(2, addrP+"!"+addrCity);
			pstmt.setString(3, addrDetail);
			pstmt.setString(4, kanjiLast+" "+kanjiName);
			pstmt.setString(5, telAll);
			pstmt.setString(6, "午前中(8:00~12:00)");
			pstmt.setString(7, id);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("배송지 등록 성공");
			}
			pstmt.close();
			
			pstmt = con.prepareStatement(sql3);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			int no = 0;
			if (rs.next()) {
				no = rs.getInt("a_no");

			}
			pstmt.close();
			rs.close();
			pstmt = con.prepareStatement(sql4);
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("기본 배송지 첫등록 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
				System.out.println("등록 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	
	// id 찾기
	public static boolean emailConfirm(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT u_id FROM users WHERE u_email= ? and "
				+ "u_kanji_ln = ? and u_kanji_fn = ?";
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String kanjiL = request.getParameter("f_name");
			String kanjiF = request.getParameter("s_name");
			System.out.println(email);
			System.out.println(kanjiL);
			System.out.println(kanjiF);
			
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, kanjiL);
			pstmt.setString(3, kanjiF);
			rs = pstmt.executeQuery();
			ArrayList<String> IDs = new ArrayList<String>();
			while (rs.next()) {
				System.out.println("id 찾기 성공");
				IDs.add(rs.getString("u_id"));
			}
			if (!IDs.isEmpty()) {
			    System.out.println(IDs);
			    request.setAttribute("IDs", IDs);
			    return true;
			} else {
			    System.out.println("id 찾기 실패");
			    request.setAttribute("resultMsg", "idが見つかりません");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("서버에러 ");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return false;
	}

	public static void createRandomPassword(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM users WHERE u_email= ? and u_id = ? and u_kanji_ln = ? and u_kanji_fn = ?";
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			String sei = request.getParameter("kanji_ln");
			String mei = request.getParameter("kanji_fn");
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			pstmt.setString(3, sei);
			pstmt.setString(4, mei);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("새 비밀번호 생성");
				
				// 비밀번호 생성하고 업데이트
				String randomPassword = changePW(request);
		        // 랜덤 비밀번호 전달 
		        request.setAttribute("randomPassword", randomPassword);
		    } else {
		    	System.out.println("맞는 사람이 없음");
		        // 조회 실패한 경우
		        // 예외 처리 또는 다른 로직 수행
		    	request.setAttribute("resultMsg", "存在されてません");
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("서버에러 ");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}
	
	
	public static String randomMix(int range) {
	    StringBuilder sb = new StringBuilder();
	    Random rd = new Random();

	    for(int i=0;i<range;i++){

	        if(rd.nextBoolean()){
	            sb.append(rd.nextInt(10));
	        }else {
	            sb.append((char)(rd.nextInt(26)+65));
	        }
	    }

	    return sb.toString();
	}

	
	// 정보 수정
	public static void updateUser(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		User user = (User) request.getSession().getAttribute("userAccount");
		
		
		String sql = "UPDATE users "
				+ "SET u_kanji_ln = ?, u_kanji_fn = ?, u_kata_ln = ?, u_kata_fn = ?, "
				+ "u_nicname = ?, u_tel = ?, u_email = ?, u_img = ? "
				+ "WHERE u_id = ?";
		try {
			request.setCharacterEncoding("utf-8");
			String path = request.getServletContext().getRealPath("lgh_account/userImg");
			MultipartRequest mr = new MultipartRequest(request, path, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy()
					);
			String kanjiLast = mr.getParameter("userKanji_ln");
			String kanjiName = mr.getParameter("userKanji_fn");
			String kataLast = mr.getParameter("userKata_ln");
			String kataName = mr.getParameter("userKata_fn");
			String nickName = mr.getParameter("userNickname");
			String tel1 = mr.getParameter("userTel1");
			String tel2 = mr.getParameter("userTel2");
			String tel3 = mr.getParameter("userTel3");
			String telAll = tel1+"-"+tel2+"-"+tel3;
			String email = mr.getParameter("userEmail");
			
			// 이미지 새로 들어왔는지 안들어왔는지 체크 
			String newImg = mr.getFilesystemName("userImg");
			String img = newImg != null ? newImg : user.getU_img();
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kanjiLast);
			pstmt.setString(2, kanjiName);
			pstmt.setString(3, kataLast);
			pstmt.setString(4, kataName);
			pstmt.setString(5, nickName);
			pstmt.setString(6, telAll);
			pstmt.setString(7, email);
			pstmt.setString(8, img);
			pstmt.setString(9, user.getU_id());
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("수정 성공");
				
				// 기존 이미지 삭제 
				if (newImg != null) {
					File f = new File(path+"/"+user.getU_img());
					f.delete();
				}
				
				// 세션 업데이트
				request.setAttribute("newid", user.getU_id());
				request.setAttribute("newpw", user.getU_pw());
				login(request);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	// 비밀번호 정보수정
	public static String changePW(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// 비밀번호 찾기 값
		String confirmID = request.getParameter("id");
		String randomPassword = randomMix(10);
		String newPW = randomPassword;
		// 마이페이지 정보수정 - 비밀번호 값
		if (confirmID == null) {
			User user = (User) request.getSession().getAttribute("userAccount");
			confirmID = user.getU_id();
			newPW = request.getParameter("newPW");
		}
		
		String sql = "UPDATE users SET u_pw = ? WHERE u_id = ?";
		try {
			
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPW);
			pstmt.setString(2, confirmID);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("비밀번호 수정 성공");
				
				
				// 정보 수정일 때만 세션 업데이트 되게 하기 
				if (newPW == request.getParameter("newPW")) {
					// 세션 업데이트
				request.setAttribute("newid", confirmID);
				request.setAttribute("newpw", newPW);
				login(request);
				}
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
		return randomPassword;
	}

}
