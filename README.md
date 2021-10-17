# Take home exercise

## My solution

**Running the tests**
```shell
./gradlew test
```

#### Running the server
```shell
./gradlew bootRun
```

#### Endpoints
1. `/quote`: API endpoint to calculate the __price__ from _pick-up, delivery and vehicle_ data.
2. `/q`: basic form which requires refreshing the page to get the quote.
3. `/_q`: more advanced form with `jQuery` and `ajax` to display waiting message and quote price without refreshing the page. 

### Notes
- The solution here aims for minimum changes in the codebase required to achieve the requirements of the features.
- *Assumptions*: asking for a quote without `vehicle` is invalid so the server rejects the request
- Possible improvement: using `Serenity` or similar tools to test the UI


## Feedback

In the original `README` could have included a note on dependency requirements:
- `java` version 8
- `gradle` version < 7
which cost a lot of time to figure out from the error messages.