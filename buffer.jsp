<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.FileReader" %>

<%!
Connection conn; 
public void init() 
{
try {Class.forName("oracle.jdbc.driver.OracleDriver");} 
catch (ClassNotFoundException e) {e.printStackTrace(); } 
} 
public void setConnection() 
{
try{conn = DriverManager.getConnection("jdbc:oracle:thin:@xx.xx.xx.xx:1521:orcl", "xx", "xx");} 
catch (SQLException e) {e.printStackTrace();} 
}
%>

<%
	request.setCharacterEncoding("UTF-8");
	Statement stmt = null;
	int su = 0;
	this.setConnection();
	try{
	
	String  path = "/path";
	FileReader fr = new FileReader(path);
	BufferedReader br = new BufferedReader(fr);
	String line = null;
	String[] splitedStr = null;
	while((line = br.readLine()) != null) {
            splitedStr = null;
			splitedStr = line.split(",");
			
			for(int i = 0; i < splitedStr.length; i++){
				splitedStr[i] = splitedStr[i].trim();
			}
	String sql = "insert into xxx(x1,x2,x3,x4,x5,x6) VALUES("+splitedStr[0]+",'"+splitedStr[1]+"','"+splitedStr[2]+"','"+splitedStr[3]+"','"+splitedStr[4]+"','"+splitedStr[5]+"')";
    stmt = conn.createStatement();
	  su = stmt.executeUpdate(sql);	
    }
	stmt.close(); 
	conn.close(); 
	br.close();
	} catch (FileNotFoundException fnf) {
		fnf.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
%>
