<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

  <%if (rowsPerPage<rowNumber) {%>
    <%if(pageIndex>=rowsPerPage){%>
        <A href="<%=request.getRequestURI()%>?whichPage=1">FrontPage</A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>">  Previous  </A>&nbsp;
    <%}%>
  
    <%if(pageIndex<pageIndexArray[pageNumber-1]){%>
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>">  Next  </A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">LastPage</A>&nbsp;
    <%}%>
  <%}%>  

<br><br>

  <%if (pageNumber>1) {%>
    <FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">   
       <select size="1" name="whichPage">
         <%for (int i=1; i<=pageNumber; i++){%>
            <option value="<%=i%>">Page<%=i%>
         <%}%> 
       </select>
       <input type="submit" value="�T�w" >  
    </FORM>
  <%}%>