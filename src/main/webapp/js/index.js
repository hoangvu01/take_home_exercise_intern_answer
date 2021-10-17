$(document).ready(function(){
    $("#submit-button").click(submitQuery);
});

function submitQuery(e){
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
}