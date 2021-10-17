<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Quote Querying Service </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</head>

<body>
	<h1>Get your instant quote now!</h1>
	<form id="quote-query" action="/quote">
	    <p>
	        <label> Pickup Postcode</label>
	        <input type="text" name="pickupPostcode" value="SW1A1AA"/>
        </p>

        <p>
            <label>Delivery Postcode</label>
            <input type="text" name="deliveryPostcode" value="EC2A3LT"/>
        </p>

        <p>
            <label path="vehicle">Vehicle</label>
            <select name="vehicle" id="vehicles">
              <option value="bicycle">Bicycle</option>
              <option value="motorbike">Motorbike</option>
              <option value="parcel_car">Parcel Car</option>
              <option value="small_van">Small Van</option>
              <option value="large_van">Large Van</option>
            </select>
        </p>

	</form>
	<p id="price"></p>

    <button id="submit-button" type="button">Submit</button>
</body>
</html>