<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Quote Querying Service </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#submit-button").click(function(e){
            $("#price").val("0.00");

            let values = $("#quote-query").serializeArray();
            let data = {};
            values.forEach((x) => {
                data[x['name']] = x['value']
            });

            if (Object.values(data).some((x) => x === null || x === "")) {
                alert("Please fill in all fields");
                return;
            }

            let msgTemplate = "A delivery from <pickup_postcode> to <delivery_postcode> using a <vehicle> will cost you £<price>.";

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/quote",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(response){
                    console.log(response);
                    let msg = msgTemplate.replace("<pickup_postcode>", response.pickupPostcode);
                    msg = msg.replace("<delivery_postcode>", response.deliveryPostcode);
                    msg = msg.replace("<vehicle>", response.vehicle);
                    msg = msg.replace("<price>", response.price);

                    $("#price").text(msg);
                },
                error: function(xhr, error) {
                    switch (xhr.status) {
                        case 400:
                            alert("1 or more invalid parameters");
                            return;
                        case 500:
                            alert("Cannot process your request at the moment");
                            return;
                        default:
                            alert("Unknown error...");
                    }
                }
            });
            e.preventDefault();
        });
    });


</script>
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