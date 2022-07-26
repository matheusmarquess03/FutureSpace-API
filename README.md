# FUTURE SPACE API :rocket:

The Challenge Future Space API is intended to test the developer's knowledge of the developer's backend with Ruby on Rails.
A routine was developed to import Project data: https://ll.thespacedevs.com/2.0.0/launch/ and a REST API was also created with a CRUD using the imported data.

## Technical Description

  * Ruby version:  2.7.1
  * Rails version: 6.0.3

## Settings

## :information_source: How To Use

```shell
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
run it: rails s
```

## :information_source: Activate cron

After running `bundle install` and checking if the cron library is installed, run:

```shell
bundle exec whenever --update-crontab;
```
Depois, para verificar, basta usar o comando: 

```shell
crontab -l;
```

## :information_source: Use How To Run Tests

```shell
rspec
```
ou

```shell
 rspec spec/path_to_file
```

> This is a challenge by (Coodesh)[https://coodesh.com/]

