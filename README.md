## Intro

Assume that we have a server which
- can raise issues
- can vote agree or disagree for each issue
- can observe the voting results

## How to use

### set up application
```ruby
# setup dependencies
bundle install

# create a PostgreSQL DB, using docker container
docker run --name db -d -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres

rails db:create
rails db:migrate

# launch the Rails server
rails s
```

### make api request

```ruby
# get all issues
curl http://localhost:3000/api/v1/issues

# get an issue by issue_id
curl http://localhost:3000/api/v1/issues/:issue_id

# create an issue
curl -X POST http://localhost:3000/api/v1/issues?user_id=:user_id
     -d '{"issue": {"title": "TOO","description": "Hi, guys. This is my first issue."}}'

# vote for an issue
curl -X POST http://localhost:3000/api/v1/issues/:issue_id/vote
     -d '{"user_id": :user_id, "vote": "agree"}'
```

### run test

```ruby
rspec spec/requests
```
