<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (rowsPerPage < rowNumber) {
%>
<%
if (pageIndex >= rowsPerPage) {
%>
<A href="<%=request.getRequestURI()%>?whichPage=1"><button
		type="button" class="btn btn-outline-primary">FrontPage</button>
	&nbsp; <A
	href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 1%>">
		<button type="button" class="btn btn-outline-primary">Previous</button>
</A> &nbsp; <%
 }
 %> <%
 if (pageIndex < pageIndexArray[pageNumber - 1]) {
 %> <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 1%>">
		<button type="button" class="btn btn-outline-primary">Next</button>
</A> &nbsp; <A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>"><button
			type="button" class="btn btn-outline-primary">LastPage</button>
		&nbsp; <%
 }
 %> <%
 }
 %> <br> <br> <%
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
				
			</select> <input type="submit" value="確定">
		</FORM> <%
 }
 %>