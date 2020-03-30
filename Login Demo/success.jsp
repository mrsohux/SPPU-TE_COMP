<%
    if ((session.getAttribute("userid1") == null) || (session.getAttribute("userid1") == "")) 
    {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%
	}
    else
   {
%>
	Welcome <%=session.getAttribute("userid1")%>
	<a href='logout.jsp'>Log out</a>
<%
    }
%>