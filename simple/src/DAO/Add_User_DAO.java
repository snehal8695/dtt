package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.AddUser_Bean;
import connection.dbconnection;


public class Add_User_DAO {
	
	static Connection con ;
	public static int insert(AddUser_Bean obj) 
	{
		int status=0;
		con=dbconnection.getConnection();
		try {
			PreparedStatement ps2=con.prepareStatement("insert into usr_master (Role) values (?)");
			ps2.setString(1, obj.getRole());
			status=ps2.executeUpdate();
			
			String roll=obj.getRole();
			PreparedStatement ps=con.prepareStatement("select UD_Id from usr_master where Role='"+roll+"'");
			
			ResultSet rs=ps.executeQuery();
			
			System.out.println("For selecting id");
			
			int i=0;
			while(rs.next())
			{
				i=rs.getInt(1);
				
			}
			
			System.out.println("insert values in u_detail");
			PreparedStatement ps1=con.prepareStatement("insert into usr_details (UD_Id,User_Name,Contact_num,Email,Alias_Name) values (?,?,?,?,?)");
			ps1.setInt(1, i);
			ps1.setString(2, obj.getName());
			ps1.setString(3, obj.getContact());
			ps1.setString(4, obj.getEmail());
			ps1.setString(5, obj.getAliesname());
			status=ps1.executeUpdate();
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	
	}

}
