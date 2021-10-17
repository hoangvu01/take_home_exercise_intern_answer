<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Quote Querying Service </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Get your instant quote now!</h1>
	<form:form method="POST" action="/q" modelAttribute="quote">
	    <p>
	        <form:label path="pickupPostcode">Pickup Postcode</form:label>
	        <form:input type="text" path="pickupPostcode"/>
        </p>

        <p>
            <form:label path="deliveryPostcode">Delivery Postcode</form:label>
            <form:input type="text" path="deliveryPostcode"/>
        </p>

        <p>
            <form:label path="vehicle">Vehicle</form:label>
            <form:input type="text" path="vehicle"/>
        </p>

        <input type="submit" value="Submit"/>
	</form:form>
</body>
</html>