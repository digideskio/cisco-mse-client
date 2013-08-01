# Ruby Facebook OAuth2 client


## Usage
```ruby
client = Facebook::Client.create(
  :access_token => YOUR_USER_ACCESS_TOKEN
)
user = client.people.me
user = client.people.by_id(123)

data = client.fql.query('SELECT name FROM user WHERE uid = me()')
```


## Testing

### from your project
In your spec_helper.rb, include the following snippet.
```ruby
Facebook::Client.stub!
```
This will prevent `facebook-client` from reaching out to Facebook's live servers.
Instead, endpoints will return back [local stubbed data](lib/facebook-client/stub.rb).

### the facebook-client gem
* Copy spec/_creds.stub.rb to spec/_creds.rb
* Update it to include a valid token
* bundle exec rspec


## License
(c) Airbnb 2013
Released under the [MIT License](http://www.opensource.org/licenses/MIT).
