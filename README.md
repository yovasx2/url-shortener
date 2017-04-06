# URL shortener

### Content

* [Description](#description)

* [Installation](#installation)

* [Requirements](#requirements)

* [Run project](#run-project)

* [Contribute](#contribute)

* [Author](#author)

* [License](#license)

<a name="description"/>

### Description

This project is used to short and enlarge URLs, this is very basic so collisions
are not avoided, Problem is specified in PROBLEM.html

<a name="installation">

## Installation

Just execute in console

  $ bundle install

<a name="requirements"/>

### Requirements

In order to execute this project you need to install:

* [Ruby 2.2.3](https://www.ruby-lang.org/es/news/2015/08/18/ruby-2-2-3-released/)

  You can check this with `ruby -v`
* [Rails 4.2.6](http://rubyonrails.org/)

  You can check this with `rails -v`

<a name="run-project"/>

### Run project

1. Clone the repo

      $ git clone https://github.com/yovasx2/url-shortener

2. Move into it and install dependencies

      $ cd url-shortener

3. Execute

      $ rails server

Two roots are available:

* Short URL:
http://localhost:3000/shorten?url=https://example.com

* Enlarge URL (automatic redirection to URL):
http://localhost:3000/d5c49f

<a name="contribute"/>

### Contribute

You can contribute to this project in many forms:

* [Reporting bugs](https://github.com/yovasx2/url-shortener/issues)

* [Writing issues](https://github.com/yovasx2/url-shortener/issues)

* [Features](https://github.com/yovasx2/url-shortener/pulls)

<a name="author"/>

### Author

1. Giovanni Alberto García

    * <a href="mailto:delirable@gmail.com">delirable@gmail.com</a>

    * [github.com/yovasx2](http://github.com/yovasx2)

<a name="license"/>

### License

[MIT License](http://choosealicense.com/licenses/mit/)