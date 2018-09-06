# Wine Collector (API)
This is an API for a wine tasting note app built with Ruby on Rails. Users can
sign up/in and select from a large list of wines and can create tasting notes
for each wine.
https://powerful-savannah-65213.herokuapp.com

Link to the client:
https://mdipietr0.github.io/wine-collector-client/

## Technologies Used:
  - Ruby on Rails
  - PostgreSQL
  - RSpec

## Planning and Development process:

For the development of this API I employed Test-Driven Development. My process
was as follows:

1. Write a feature test
2. Run the test and watch it fail
3. Write unit test for piece that is failing
4. Run the unit test and watch it fail
5. Write implementation code
6. Run the unit test (if it fails, refactor implementation)
7. Run the feature test again (if it fails, write another unit test)

For example, to create the /wine endpoint I first wrote a feature test testing
that I would get a valid response. This test fails because there is not a valid
route for the endpoint. I then wrote a unit test for the route. I ran both tests
and watched them fail. Then I wrote the implementation code. Then I ran the tests
again and the unit test passes but now the feature test fails for a new reason.
I continue this process until the feature test passes.

I followed this pattern for each endpoint as well as writing curl scripts to
test manually the responses.


Link to Entity Relationship Diagram (ERD).
![ERD](https://i.imgur.com/oFJxO1Z.png)


## Version 2 (Currently developing):

  - Add model validation
