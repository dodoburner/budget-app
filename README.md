# Purchase Tracker

This is a RoR mobile app created for tracking your expenses. It allows the user to:
- register and log in, so that the data is private to them.
- introduce new transactions associated with a category.
- see the money spent on each category.

## Built With

- Ruby on Rails
- Bootstrap
- PostgreSQL
- Devise
- Rspec
- Capybara

## Live

- https://rails-o4f2.onrender.com/

## Video Tour

- https://www.loom.com/share/a0c12c98f65a454d98ac7876c3e49e7d

## Getting Started

To get a local copy up and running follow these simple example steps.

## Prerequisites

- Ruby runtime environment
- PostgreSQL
- Rails

## ## 🛠 Installation & Set Up

If you dont have Ruby installed on your computer, you can download it from [here](https://www.ruby-lang.org/en/downloads/).

If you dont have Rails installed on your computer, you can download it from [here](https://rubyonrails.org/).

If you dont have PostgreSQL installed on your computer, you can download it from [here](https://www.postgresql.org/download/).

If you have installed git you can clone the code to your machine, or download a ZIP of all the files directly.

[Download the ZIP from this location](https://github.com/dodoburner/budget-app/archive/refs/heads/main.zip), or run the following [git](https://git-scm.com/downloads) command to clone the files to your machine:

- [ ] Once the files are on your machine, open the _blog-app_ folder in your code editor.
Run the following command in your terminal to install the required gems and run the application:

> `NOTE:` _You may need to run the following commands in the project directory to install the required gems and run the application:_

1. Install gem packages with:

```
bundle install
npm i
```

2. Open the config/database.yml file in the project directory and change the username and password to your PostgreSQL username and password.
Edit the default section of the file to look like this:
    
```
  default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <your PostgreSQL role username>
  password: <your PostgreSQL role password>

```

3. Create the database with:

```
rails db:create
```

4. Start the development server

```
foreman start -f Procfile.dev
```

5. Open the app in your browser at http://localhost:3000

## Author

👤 **Dorian Urem**

- GitHub: [@dodoburner](https://github.com/dodoburner)
- Twitter: [@DorianUrem](https://twitter.com/DorianUrem)
- LinkedIn: [Dorian Urem](https://www.linkedin.com/in/dorian-urem-252baa237/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/dodoburner/recipe-app/issues).

## Show your support

Give a ⭐️ if you like this project!
