<%-- 
    Document   : Upload
    Created on : Feb, 2016, 8:42:32 PM
    Author     : Anshul jhalani
--%>

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
        <form action="UploadServlet" method="post" enctype="multipart/form-data">
                <input type="file" name="file" /> 
                <input type="submit" value="upload" />
        </form>

    </body>
</html>
