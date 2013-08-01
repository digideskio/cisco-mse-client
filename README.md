# Ruby Facebook OAuth2 client


## Usage

    client = Facebook::Client.create(
      :access_token => YOUR_USER_ACCESS_TOKEN
    )
    user = client.people.me
    user = client.people.by_id(123)

    data = client.fql.query('SELECT name FROM user WHERE uid = me()')


## License
(c) Airbnb 2013
Released under the [MIT License](http://www.opensource.org/licenses/MIT).
