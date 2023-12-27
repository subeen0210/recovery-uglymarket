package com.recovery.shop;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.recovery.account.Seller;
import com.recovery.main.DBManager;

import oracle.jdbc.proxy.annotation.Pre;

public class ItemDAO {

	
	// 전체 상품 조회 밑 검색 상품 조회 기능
	public static String getAllItems(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from item where i_name like '%'||?||'%' order by i_no desc";
		String name = request.getParameter("name");
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			if(name == null) {
				pstmt.setString(1, "");
			}else {
				pstmt.setString(1, name);
			}
			rs = pstmt.executeQuery();
			ItemDTO item = null;
			
			ArrayList<ItemDTO> items = new ArrayList<ItemDTO>();
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
		return	convertItemsToJSON(items);	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;
		
		
	}
	
	// 위 전체 조회 배열 JSON
	public static String convertItemsToJSON(ArrayList<ItemDTO> items) {
	    Gson gson = new Gson();
	    return gson.toJson(items);
	}


	// 제품 상세 페이지 기능
	public static void getItem(HttpServletRequest request, HttpServletResponse res) {
		
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
				
				Gson g = new Gson();
				String jsonData = g.toJson(i);
				res.setContentType("application/json");
			    res.setCharacterEncoding("UTF-8");
			    res.getWriter().write(jsonData);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
	}

	
	// 사업자 마이페이지 상품 추가 기능
	public static void addItem(HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		Seller id = (Seller) request.getSession().getAttribute("sellerAccount");
		
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String img2 = "";
	    String img3 = "";
	    String img4 = "";
	    String sql = "insert into item values (item_seqence.nextval, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, 0)";

	    try {
	        con = DBManager.connect();
	        pstmt = con.prepareStatement(sql);
	        String path = request.getServletContext().getRealPath("itemFolder");
	        MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

	        String name = mr.getParameter("name");
	        String story = mr.getParameter("story");
	        String type = mr.getParameter("type");
	        String[] imgArray = new String[4];

	        for (int i = 1; i <= 4; i++) {
	            String fileName = mr.getFilesystemName("img" + i);
	            imgArray[i - 1] = fileName != null ? fileName : null;
	            pstmt.setString(2 + i, imgArray[i - 1]);
	        }

	        String date = mr.getParameter("enddate");
	        String price = mr.getParameter("price");
	        String stock = mr.getParameter("stock");
	        

	        pstmt.setString(1, id.getS_id());
	        pstmt.setString(2, name);
	        pstmt.setString(7, story);
	        pstmt.setString(8, type);
	        pstmt.setString(9, date);
	        pstmt.setString(10, price);
	        pstmt.setString(11, stock);

	        if (pstmt.executeUpdate() == 1) {
	            System.out.println("등록 성공");
	        }

	    } catch (Exception e) {
	        System.out.println("등록 ~~");
	        e.printStackTrace();
	    } finally {
	        DBManager.close(con, pstmt, null);
	    }
	}

	
	// 사업자 마이 페이지 상품 삭제 기능
	public static void deleteItem(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from item where i_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("no"));
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제 성공");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
		}
		
	}
	
	
	// 사업자 마이 페이지 상품 조회 기능
	public static void selectItem(HttpServletRequest request, HttpServletResponse res) {
		
		HttpSession hs = request.getSession();
		Seller seller = (Seller) request.getSession().getAttribute("sellerAccount");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select i_no, i_name, i_price, i_ed, i_stock from item "
				+ "where item.s_id = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, seller.getS_id());
			System.out.println(seller.getS_id());
			rs = pstmt.executeQuery();
			
			ArrayList<ItemDTO> sellerItems = new ArrayList<ItemDTO>();
			ItemDTO sellerItem;
			
			while (rs.next()) {
				sellerItem = new ItemDTO();
				sellerItem.setI_no(rs.getInt("i_no"));
				sellerItem.setI_name(rs.getString("i_name"));
				sellerItem.setI_price(rs.getInt("i_price"));
				sellerItem.setI_stock(rs.getInt("i_stock"));
				sellerItem.setI_enddate(rs.getDate("i_ed"));
				sellerItems.add(sellerItem);
			}
			request.setAttribute("sellerItems", sellerItems);
			System.out.println("조회성공");
			
			Gson g = new Gson();
			String jsonData = g.toJson(sellerItems);
			res.setContentType("application/json");
		    res.setCharacterEncoding("UTF-8");
		    res.getWriter().write(jsonData);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("조회실패");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
	}
	
	
	// 사업자 마이 페이지 상품 업데이트(수정) 기능
	public static void updateItem(HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		Seller seller = (Seller) request.getSession().getAttribute("sellerAccount");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update item set "
					+ "i_name = ?, i_des = ?, i_category = ?, i_ed = TO_DATE(?, 'YYYY-MM-DD'), "
					+ "i_img = ?, i_img2 = ?, i_img3 = ? , i_img4 = ?, i_price = ?, i_stock =? "
					+ "where s_id = ? and i_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			String path = request.getServletContext().getRealPath("itemFolder");
			MultipartRequest mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			
			String no = mr.getParameter("no");
			String name = mr.getParameter("name");
			String story = mr.getParameter("story");
			String type = mr.getParameter("type");
			String date = mr.getParameter("enddate");
			String stock = mr.getParameter("stock");
			String price = mr.getParameter("price");
			String[] imgArray = new String[4];

			 // 이미지를 수정할 때
		    for (int i = 1; i <= 4; i++) {
		        String fileName = mr.getFilesystemName("img" + i);
		        imgArray[i - 1] = fileName != null ? fileName : null;
		        pstmt.setString(2 + i, imgArray[i - 1]);
		    }
		    
		    String[] oldImgArray = new String[4];
		    
		    // 이미지를 수정하지 않을 때
		    for (int i = 1; i <= 4; i++) {
		        if (imgArray[i - 1] == null) {
		            oldImgArray[i - 1] = request.getParameter("oldImg" + i); 
		            pstmt.setString(2 + i, oldImgArray[i - 1]);
		        }
		    }
		       
		    System.out.println(name);
		    System.out.println(story);
		    System.out.println(price);
		    System.out.println(stock);
		    System.out.println(type);
		    System.out.println(imgArray);
		    System.out.println(date);
		    System.out.println(oldImgArray);
		    System.out.println(seller.getS_id());
		    System.out.println(no);
		    
		    
		    pstmt.setString(1, name);
		    pstmt.setString(2, story);
		    pstmt.setString(3, type);
		    pstmt.setString(4, date);
		    pstmt.setString(9, price);
		    pstmt.setString(10, stock);
		    pstmt.setString(11, seller.getS_id());
		    pstmt.setString(12, no);
		    
		    if (pstmt.executeUpdate() == 1) {
				System.out.println("상품 수정 성공");
				for (int i = 1; i <= 4; i++) {
			        if (oldImgArray[i - 1] != null) {
			            File oldImgFile = new File(path, oldImgArray[i - 1]);

			            // 파일이 존재하면 삭제
			            if (oldImgFile.exists()) {
			                if (oldImgFile.delete()) {
			                    System.out.println("기존 이미지 파일 삭제 성공: " + oldImgArray[i - 1]);
			                } else {
			                    System.out.println("기존 이미지 파일 삭제 실패: " + oldImgArray[i - 1]);
			                }
			            } else {
			                System.out.println("기존 이미지 파일이 존재하지 않음: " + oldImgArray[i - 1]);
			            }
			        }
			    }
			}
		    
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	

}
