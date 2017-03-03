<%-- 
    Document   : Preview
    Created on : Feb 8, 2017, 7:48:37 PM
    Author     : Anshul jhalani
--%>


<%@page import="java.lang.String"%>
<%@page import="Actionclasses.Preview"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Actionclasses.Uploadbean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data">
    <tr>
        <tr><td><input name="Submit" type="submit" class="button" id="fileupload" value="File Upload" formaction="Upload.jsp" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<td><input name="Submit" type="submit" class="button" id="validate" value="Validate" formaction="Validate.jsp" accept=".xml" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<td><input name="Submit" type="submit" class="button" id="mailbody" value="Mail Body" formaction="Mailbody.jsp" accept=".xml"></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<td><input name="Submit" type="submit" class="button" id="preview" value="Preview"formaction="Preview.jsp" accept=".xml" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<td><input name="Submit" type="submit" class="button" id="proceed" value="Proceed" formaction="Proceed.jsp" accept=".xml" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</tr> 
        </tr></form>
        <p></p>
        <% 
             Class.forName("com.mysql.jdbc.Driver");
            //register the driver and get Connection
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ur database name","root","ur database password"); 
       Statement s=con.createStatement();
       Uploadbean u=new Uploadbean();
       String TableName;
       TableName=u.gettableName();
       ResultSet res=s.executeQuery("select emailid from "+TableName+" ");
       String email=null;
       while(res.next()){ 
              email= res.getString(1) ;
                out.print(email);        
       }
              Preview pre=new Preview();
              pre.setEmail(email);
                                %>
            
         
                  
        <form>
            To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="To"  value= <%=email%>  maxlength="50" style="width:200px"/>
            <p>Bcc:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Bcc" maxlength="50" style="width:200px"/></p>
            <p>From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="jhalani.anshul8025@gmail.com" maxlength="50" style="width:200px"</p>
            <p>Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Subject" maxlength="50" style="width:200px"/></p>
            <p>Mailbody:</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 
              <% String mail=request.getParameter("description");
              String startdate=request.getParameter("Startdate");
              String enddate=request.getParameter("Enddate");
              String PEno=request.getParameter("PE No");
              String Mail1=" We hope you will accept our apology for any inconvenience this work may cause you and your customers. Please contact the Global Cloud Xchange GNOC on +44(0) 208 282 1599/gnoc@globalcloudxchange.com should you require any additional information";
              String mailbody=mail+"from" +startdate+"to"+enddate+"PE No"+PEno+Mail1;
              Preview preview=new Preview();
              preview.setMail(mailbody);
              %>
<%=mail%> from <%=startdate%> to <%=enddate%> PE No <%=PEno%>
 . We hope you will accept our apology for any inconvenience this work may cause you and your customers. Please
 contact the Global Cloud Xchange GNOC on +44(0) 208 282 1599/gnoc@globalcloudxchange.com should you require any
 additional information. />


 <p><input type="Submit" name="PreviewOk" value="PreviewOk" formaction="PreviewServlet"  /> </p> 
            
      </form>
 
    </body>
    
</html>
