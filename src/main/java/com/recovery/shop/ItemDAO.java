package com.recovery.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.recovery.main.DBManager;

public class ItemDAO {

	private static ArrayList<ItemDTO> items;
	
	// ���θ� ������ 9���� ����¡�ϱ�
	public static void shopPagin(int page, HttpServletRequest request) {
		
		request.setAttribute("curPageNo", page);
	    int cnt = 9;    // �� �������� ������ ����
	    int total = items.size(); // �� ������ ����

	    // �� ��������
	    int pageCount = (int) Math.ceil((double) total / cnt);
	    request.setAttribute("pageCount", pageCount);

	    int start = total - (cnt * (page - 1)) - 1;
	    int end = (page == pageCount) ? -1 : start - cnt;

	    ArrayList<ItemDTO> pagedItems = new ArrayList<ItemDTO>();
	    for (int i = start; i > end && i >= 0; i--) {
	        pagedItems.add(items.get(i));
	    }

	    request.setAttribute("items", pagedItems);
		
	}
	
	
	// ���θ� ���������� ��ǰ �����ֱ�
	public static void getAllItems(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from item";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ItemDTO item = null;
			
			items = new ArrayList<ItemDTO>();
			while (rs.next()) {
				item = new ItemDTO();
				item.setI_no(rs.getInt("i_no"));
				item.setI_name(rs.getString("i_name"));
				item.setI_img(rs.getString("i_img"));
				if (rs.getString("i_img2") != null) {
					item.setI_img2(rs.getString("i_img2"));
				} else if (rs.getString("i_img3") != null) {
					item.setI_img3(rs.getString("i_img3"));
				} else if (rs.getString("i_img4") != null) {
					item.setI_img4(rs.getString("i_img4"));
				}
				item.setI_des(rs.getString("i_des"));
				item.setI_category(rs.getInt("i_category"));
				item.setI_enddate(rs.getDate("i_ed"));
				item.setI_price(rs.getInt("i_price"));
				item.setI_stock(rs.getInt("i_stock"));
				item.setI_star_avg(rs.getDouble("i_avg"));
				items.add(item);
//				System.out.println(rs.getString("i_name"));
//				System.out.println(rs.getString("i_price"));
//				System.out.println(rs.getString("i_img"));
			}
			request.setAttribute("items", items);
				
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
	}


	public static void getItem(HttpServletRequest request) {
		
		String paramNo = request.getParameter("no");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from item where i_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, paramNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ItemDTO i = new ItemDTO();
				i.setI_no(rs.getInt("i_no"));
				i.setI_name(rs.getString("i_name"));
				i.setI_img(rs.getString("i_img"));
				if (rs.getString("i_img2") != null) {
					i.setI_img2(rs.getString("i_img2"));
				} else if (rs.getString("i_img3") != null) {
					i.setI_img3(rs.getString("i_img3"));
				} else if (rs.getString("i_img4") != null) {
					i.setI_img4(rs.getString("i_img4"));
				}
				i.setI_des(rs.getString("i_des"));
				i.setI_category(rs.getInt("i_category"));
				i.setI_enddate(rs.getDate("i_ed"));
				i.setI_price(rs.getInt("i_price"));
				i.setI_stock(rs.getInt("i_stock"));
				i.setI_star_avg(rs.getDouble("i_avg"));
				request.setAttribute("item", i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
	}


	public static void addItem(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String img2 = "";
		String img3 = "";
		String img4 = "";
		String sql = "insert into item values (item_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, 0.0)";
	
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			String path = request.getServletContext().getRealPath("itemFolder");
			MultipartRequest mr = new MultipartRequest(request, path, 30*1024*1024 , "utf-8" , new DefaultFileRenamePolicy());
			
			String name = mr.getParameter("name");
			String story = mr.getParameter("story");
			String type = mr.getParameter("type");
			String id = mr.getParameter("id");
			String img = mr.getFilesystemName("img");
			
			if (mr.getFilesystemName("img2") != null) {
				img2 = mr.getFilesystemName("img2");
				pstmt.setString(4, img2);
			} else if (mr.getFilesystemName("img2") == null) {
				img2 = null;
			}
			
			if (mr.getFilesystemName("img3") != null) {
				img2 = mr.getFilesystemName("img3");
				pstmt.setString(5, img3);
			} else if (mr.getFilesystemName("img3") == null) {
				img2 = null;
			}
			
			if (mr.getFilesystemName("img4") != null) {
				img2 = mr.getFilesystemName("img4");
				pstmt.setString(6, img4);
			} else if (mr.getFilesystemName("img4") == null) {
				img2 = null;
			}
			
			String date = mr.getParameter("enddate");
			String price = mr.getParameter("price");
			String stock = mr.getParameter("stock");
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, img);
			pstmt.setString(7, story);
			pstmt.setString(8, type);
			pstmt.setString(9, date);
			pstmt.setString(10, price);
			pstmt.setString(11, stock);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
			}
			
			
		} catch (Exception e) {
			System.out.println("등록실패");
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		
		
	}
	
	
	
	

}
