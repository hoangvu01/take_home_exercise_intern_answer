package com.shutl.controller;

import com.shutl.model.Quote;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.HashMap;
import java.util.Map;

@RestController
public class QuoteController {

    private static final Map<String, Double> VEHICLE_MARKUPS = createMarkupRatio();

    @RequestMapping(value = "/quote", method = POST)
    public @ResponseBody
    ResponseEntity<Quote> quote(@RequestBody Quote quote) {

        String vehicle = quote.getVehicle();

        if (vehicle == null || !VEHICLE_MARKUPS.containsKey(vehicle.toLowerCase())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(quote);
        }

        long price = Math.abs((Long.valueOf(quote.getDeliveryPostcode(), 36) - Long.valueOf(quote.getPickupPostcode(), 36))/100000000);
        price = Math.round(price * VEHICLE_MARKUPS.get(vehicle.toLowerCase()));
        quote = new Quote(quote.getPickupPostcode(), quote.getDeliveryPostcode(), quote.getVehicle(), price);
        return ResponseEntity.ok(quote);
    }

    private static Map<String, Double> createMarkupRatio() {
        Map<String, Double> map = new HashMap<>();
        map.put("bicycle", 1.1);
        map.put("motorbike", 1.15);
        map.put("parcel_car", 1.2);
        map.put("small_van", 1.3);
        map.put("large_van", 1.4);
        return map;
    }

}
