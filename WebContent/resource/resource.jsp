<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ack" uri="http://icts.uiowa.edu/AcknowledgementsTagLib"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person List</title>
<style type="text/css" media="all">    @import "<util:applicationRoot/>/resources/style.css";</style></head>
<body>
<div id="content"><jsp:include page="/header.jsp" flush="true" /> <jsp:include page="/menu.jsp" flush="true"><jsp:param name="caller" value="research" /></jsp:include><div id="centerCol">
   <ack:resource ID="${param.id}">
   <table>
    <tr><th>Resource</th><td><ack:resourceResource/></td></tr>
    <tr><th>UMLS ID</th><td><ack:resourceUmlsId/></td></tr>
    <tr><th>UMLS match string</th><td><ack:resourceUmlsMatchString/></td></tr>
    <tr><th>alternative UMLS ID</th><td><ack:resourceAltUmlsId/></td></tr>
    <tr><th>alternative UMLS match string</th><td><ack:resourceAltUmlsMatchString/></td></tr>
   </table>
   
   <c:if test="${ack:resourceHasProvider(param.id)}">
   <h4>Resource Providers</h4>
   <ol class="bulletedList">
   <ack:foreachProvider var="prov" usePerson="true" sortCriteria="last_name,first_name">
    <ack:provider>
        <ack:person ID="${ack:providerPersonIdValue()}">
            <li><a href="<util:applicationRoot/>/person/person.jsp?id=<ack:personID/>"><ack:personLastName/>, <ack:personFirstName/></a> (PMCID: <ack:providerPmcid/>)
        </ack:person>
    </ack:provider>
   </ack:foreachProvider>
   </ol>
   </c:if>

   <h4>Mentions</h4>
   <ol class="bulletedList">
   <ack:foreachResourceMention var="prov" sortCriteria="pmcid">
    <ack:resourceMention>
        <li>PMCID: <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/<ack:resourceMentionPmcid/>/"><ack:resourceMentionPmcid/></a>
    </ack:resourceMention>
   </ack:foreachResourceMention>
   </ol>

   </ack:resource>

<jsp:include page="/footer.jsp" flush="true" /></div></div></body>
</html>

