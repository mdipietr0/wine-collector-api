Rails API Template

Process/Progress

DAY 1:
  - ER Diagrams
  - User stories
  - BDD development of Wine resource
    - no generate commands
    - created passing unit tests for all routes
    - manually created all routes
    - created passing unit tests for all controller
    - manually created all controller methods
    - created passing feature tests for wine API
  - Add curl scripts for wines resource
  - Add user reference to wines and require authentication on request
    - Run bin/rails generate migration AddUserToWines user:references
    - Run bin/rails db:migrate
    - Add had_many :wines to User class
    - Add belongs_to :user to wines class
    - Update feature tests to authenticate user before request

DAY 2:
  - Add color query to wines controller
  - Add curl script to test the query param
  - Scaffold tastings resource and write passing feature tests
TODO documentation for API
