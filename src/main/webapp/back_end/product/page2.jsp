<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%
if (rowsPerPage < rowNumber) {
%>
<%
if (pageIndex >= rowsPerPage) {
%>
<A href="<%=request.getRequestURI()%>?whichPage=1"><input
	type="submit" value="FrontPage"></A>
&nbsp;
<A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 1%>">
	<input type="submit" value="Previous">
</A>
&nbsp;
<%
}
%>

<%
if (pageIndex < pageIndexArray[pageNumber - 1]) {
%>
<A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 1%>">
	<input type="submit" value="Next">
</A>
&nbsp;
<A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>"><input
	type="submit" value="LastPage"></A>
&nbsp;
<%
}
%>
<%
}
%>

<br>
<br>

<%
if (pageNumber > 1) {
%>
<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
	<select size="1" name="whichPage">
		<%
		for (int i = 1; i <= pageNumber; i++) {
		%>
		<option value="<%=i%>">Page<%=i%>
			<%
			}
			%>
		
	</select> <input type="submit" value="½T©w">
</FORM>
<%
}
%>