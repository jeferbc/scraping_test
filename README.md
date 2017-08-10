# Scraping test

This project parses a HTML document and store in database the contents of ```<h1>, <h2>, <h3>, <a>``` tags

## Setup

This is a Rails 5 project that uses PostgreSQL as the database. Once you have that installed, download the project by cloning it from Git:

```
$ git@github.com:jeferbc/scraping_test.git
```

Then, install the dependencies with:

```
$ bundle
```

Create the database and run the migrations by executing:

```
$ rails db:create
$ rails db:migrate
```
## High level architecture

The project is composed of the following components:

* An API that allows the users to store ```<h1>, <h2>, <h3>, <a>``` contents and urls. Allow to retrieve webpages already parsed and its contents.

### API

Users can use the API to analyze a HTML webpage and store in the database ``` <h1>, <h2>, <h3>, <a> ``` contents. Also user can retrieve stored objects

The API has the following endpoints:
```
|------------------|------------------------------------------------|
| POST /contents   | Analyze a webpage                              |
| GET /contents    | Get all the contents and url stored            |
| GET /webpage     | Get all webpages url analyzed and its contents |
| GET /webpage/:id | Get a webpage url analyzed and its contents    |
```

This link shared an example for each endpoint using POSTMAN

https://www.getpostman.com/collections/e2f7494f8b45d2ada024

### Test

In order to run the tests type the following instruction:

```
bundle exec rspec
```

## Contributing

The workflow for contributing to this project is the following:

**1. Identify an issue you want to work on**

Checkout our [Waffle board](https://waffle.io) to identify the issues that are ready for work (they are ordered by priority). Once you have selected one, assign it to yourself (you can`t have more than **two** issues assigned to you at the same time).

**2. Create a branch**

```
$ git checkout master
$ git pull
$ git checkout -b xx-short-description
```

The name of the branch should start with the number of the issue, followed by max three keywords that describe the issue (e.g. `23-fix-homepage`, `56-change-font`, etc.).

**3. Work on the branch**

Commit often and try to create small commits, just be sure that the tests are passing before commiting. Rebase against the upstream frequently to prevent your branch from diverging significantly:

```
$ git fetch origin
$ git rebase origin/master
```

Once you finish, you can push the branch and initiate a pull request.

**Note:** remember that an issue is not finished until it's fully tested!

**4. Push the branch and initiate the pull request**

When you are done, and you have organized your commits locally, it's time to push the branch.

```
$ git push -u origin xx-short-description
```

Open a pull request (PR) on Github.

### Writing good commit messages

A commit message has a first line, a blank line and an optional body. For example (taken from the Rails repository):

```
Make flash messages cookie compatible with Rails 4

In #xxx we removed the discard key from the session hash used to flash
messages and that broke compatibility with Rails 4 applications because they
try to map in the discarded flash messages and it returns nil.

Fixes #xxx.
```

Notice that the first line and the body are capitalized. The first line should be 50 characters or less and should start with a verb (e.g. make, fix, create, implement, add, etc.).

The body should be wrapper to 72 characters and you can reference any issue and [use keywords to close them](https://help.github.com/articles/closing-issues-via-commit-messages/).

**Tip:** Think about sending an e-mail to a colleague where the first line is the subject of the email, and the body is the body of the e-mail.
