# Thought Publishing

Thought Publishing is a content management system for publishing different objects called "thoughts." Thoughts can be of different kinds: a note, a photo, a link.

  - Built on Rails
  - S3 for storage
  - Embedded worker for image processing (Sidekiq)
  - Opengraph parser for link information

### Version
0.1

### Installation

Clone the repository and setup Gems:
```sh
$ git clone https://github.com/roymckenzie/thought-publishing.git
$ cd thought-publishing
$ bundle install
```

Add .env file with variables:
```
S3_BUCKET_NAME=
S3_HOST_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
USER_EMAIL=
USER_PASSWORD=
DEVISE_SECRET_KEY=
REDISTOGO_URL=
```

Setup database and run:
```sh
$ rake db:setup
$ foreman s
```

### Development

Want to contribute? Great!

Open a pull request for enhancements and fixes.

License
----

MIT
