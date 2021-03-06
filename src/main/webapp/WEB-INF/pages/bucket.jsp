<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="foot" uri="/WEB-INF/tld/footer.tld" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<fmt:setLocale value="${sessionScope.currentLocale}"/>
<fmt:setBundle basename="JSPBundle"/>
<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="bucketTitle"/></title>
    <link rel="stylesheet"
          type="text/css"
          href="<c:url value='resources/css/style.css'/>">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="resources/js/bucket.js"> </script>
</head>

<body>
<div class="body">
    <jsp:include page="/WEB-INF/pages/_header.jsp"/>
    <div class="wrapper">
        <div class="bucket">
            <p class="error"> ${cartEmpty}</p>
            <div class="bucketTable">
                <div class="flightList">
                    <form id="payInvoice" name="payInvoice" action="invoicePay" method="post">
                        <div>
                            <c:forEach items="${requestScope.flights}" var="flight">
                                <div class="flight">
                                    <div class="flightInfo">
                                        <fmt:message key="tabFlight"/>: <b>${flight.flightNumber}</b> <fmt:message
                                            key="tabFrom"/>:
                                        <b>${flight.departureAirport.code} (${flight.departureAirport.airportName})</b>
                                        <fmt:message key="tabTo"/>: <b>${flight.arrivalAirport.code}
                                        (${flight.arrivalAirport.airportName})</b>.
                                        <p><fmt:message key="tabDateTime"/>: <b>${flight.dateTime}</b> <fmt:message
                                                key="tabAirplane"/>:
                                            <b>${flight.airplane.name}</b></p>
                                    </div>

                                    <c:forEach items="${flight.tickets}" var="ticket">
                                        <div class="passenger">
                                            <p class="passengerNum"><fmt:message key="passenger"/></p>
                                            <table class="buckettable">
                                                <tr>
                                                    <th><fmt:message key="name"/>(in English)</th>
                                                    <th><fmt:message key="passport"/></th>
                                                    <th><fmt:message key="lugg"/></th>
                                                    <th><fmt:message key="place"/></th>
                                                    <th><fmt:message key="price"/></th>
                                                    <th><fmt:message key="busClass"/></th>
                                                    <th class="tableButDel"></th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input class="passengerfield" pattern="[A-Za-z\s]{1,45}" type="text" name="passengerName"
                                                               value="${ticket.passengerName}">
                                                    </td>
                                                    <td><input type="text" name="passport" pattern="[\-\d\w\s]{1,25}" value="${ticket.passport}"
                                                    ></td>
                                                    <td>
                                                        <div class="tableBucketField">
                                                            <input class="checkbox" type="checkbox"
                                                            <c:if test="${ticket.luggage eq true}">
                                                                   checked="checked" </c:if>
                                                                   value="luggage" name="lugBox"
                                                                   id="lug${ticket.ticketId}"
                                                                   onclick="calc(${ticket.ticketId});">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="tableBucketField">${ticket.sittingPlace}</div>
                                                    </td>
                                                    <td>
                                                        <div class="tableBucketField">
                                                            <p id="price${ticket.ticketId}">${ticket.price}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <c:if test="${ticket.businessClass==true}"><fmt:message
                                                                key="yes"/></c:if>
                                                        <c:if test="${ticket.businessClass==false}"><fmt:message
                                                                key="no"/></c:if>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <input type="hidden" name="ticketId"
                                                                   value="${ticket.ticketId}">
                                                            <a href="ticketDelete?ticketId=${ticket.ticketId}"
                                                               class="buttonDelete"><fmt:message key="delete"/> </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${ticketsInBucket != null && ticketsInBucket != 0}">
                            <p class="error">${setFields}
                            <p class="error">${changesSaved}</p>
                            <p class="error"><fmt:message key="checkInfo"/></p>
                            <div class="butPay">
                                <div class="pCostTotal"><fmt:message key="total"/> :</div>
                                <div class="costTotal"><p id="totalSum">${totalSum}</p></div>

                                <input class="buttonBucketPay" type="submit" value="<fmt:message key="pay"/> "
                                       form="payInvoice"/>
                            </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <foot:show/>
</div>
</body>
</html>
