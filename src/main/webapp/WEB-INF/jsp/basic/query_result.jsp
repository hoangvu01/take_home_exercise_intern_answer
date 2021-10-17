<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Quote Querying Service </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Your quote!</h1>
	<p> Pick-up:  ${quote.pickupPostcode} </p>
	<p> Delivery:  ${quote.deliveryPostcode} </p>
	<p> Vehicle:  ${quote.vehicle} </p>
	<p> Price: ${quote.price} </p>

	<p> A delivery from ${quote.pickupPostcode} to ${quote.deliveryPostcode} using a ${quote.vehicle} will cost you ${quote.price}. </p>


</body>
</html>