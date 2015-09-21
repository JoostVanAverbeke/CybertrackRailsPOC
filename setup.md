# Setup

## Rails Setup
Create a new rails application without db connection:

  * rails new CybertrackRailsPOC -O
    

## Devise Setup

More info in [devise](https://github.com/plataformatec/devise)

Execute the following rails generator:

  * rails generate devise:install

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"
       
       Here I have configured it to root to: "home#patients"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

## Devise Remote Client Setup

  * Create your <b>User</b> model in the app/models/user.rb with the following content:
  
> class User  
> &nbsp;&nbsp;include ActiveModel::Model #required because some before_validations are defined in devise  
> &nbsp;&nbsp;extend ActiveModel::Callbacks #required to define callbacks  
> &nbsp;&nbsp;extend Devise::Models  
>  
> &nbsp;&nbsp;define_model_callbacks :validation #required by Devise  
>  
> &nbsp;&nbsp;devise <b>:remote_authenticatable</b>  
>   
> &nbsp;&nbsp;attr_accessor :id, :authentication_token, :email, :password  
> end  

  * Add <b>devise_for :users</b> in your config/routes.rb file
  
  * Add your remote authentication method in the config/initializers/devise.rb file

> config.remote_authenticatable.authentication_method do |authentication_hash|  
> &nbsp;&nbsp;if authentication_hash[:password] == '1234_password'  
> &nbsp;&nbsp;&nbsp;&nbsp;remote_resoure = RemoteResource.new(authentication_hash[:email], authentication_hash[:password])  
> &nbsp;&nbsp;end  
> end

### Cybertrack uses the login field instead of email to authenticate

Devise has configuration options to change the key to authenticate a user.  
Set the following options in the initializer devise.rb:
  
  * <i>config</i>.authentication_keys = [:login]
  * <i>config</i>.case_insensitive_keys = [:login]
  * <i>config</i>.strip_whitespace_keys = [:login]
     
## Rails Controllers
  
### Patients controller
    
Create a Patients controller to view the patients
    
  * rails generate scaffold_controller Patients
  
Create a Menu controller to view the menu of the application.

  * rails generate controller Menu
  
### Add Kendo UI to the rails project

  Download Kendo UI from the internet. You can find it [here](http://www.telerik.com/kendo-ui)  
  
  * Copy the javascript telerik subdirectory to your vendor/assets/javascripts directory
  * Copy the stylesheet telerik subdirectory to your vendor/assets/stylesheets directory
  
### Add Kendo UI in your rails assets pipeline

  Add the following line in your app/assets/javascripts/application.js file  
  
  * //= require telerik/kendo.all.min

  preferable before your <i>//=require_tree .</i>
  
  Add the following line in your app/assets/stylesheets/application.css file  
  
 * *= require telerik/kendo.common.min
 * *= require telerik/kendo.default.min

  preferable before your <i>*=require_tree .</i>
  
  
## Configure your application menu via yaml
  
  More info on [yaml](http://www.yaml.org/YAML_for_ruby.html)
  
### Example menu yaml file

The cybertrack.menu.yml file is located  'config/menu/cybertrack.menu.yml'  

> \-  
> &nbsp;&nbsp;text: "Routine"  
> &nbsp;&nbsp;items:  
> &nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "Patients"  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items:  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "By Surname, First name"  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url: "/patients"  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "By Birth Date"  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url: "/patients"  
> &nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "Blood transfusions"  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items:  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "identification"  
> \-  
> &nbsp;&nbsp;text: "Configuratie"  
> &nbsp;&nbsp;items:  
> &nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "Users"  
> &nbsp;&nbsp;&nbsp;&nbsp;\-  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text: "Physicians"  
> \-  
> &nbsp;&nbsp;text: "Google"  
> &nbsp;&nbsp;url: "http://www.google.com"  
> \-  
> &nbsp;&nbsp;text: "Kendo UI"  
> &nbsp;&nbsp;url: "http://www.kendoui.com"&nbsp;&nbsp;  
 
### Rendering the application menu

The application controller (class ApplicationController) contains a before_action build_menu.  
The build_menu method loads the  'config/menu/cybertrack.menu.yml' file.  

I have created a <b>views/menu/index.html.erb</b> file which creates a <i>div</i> containing the data attribute <i>menu</i> 
which gets the json representation of the menu. The div also contains an ul element with id "menu".  


I render the menu in the <b>layouts/application.html.erb</b> by rendering the 'menu/index' view.  
The rendering of the 'menu/index' view will finally trigger the coffeescript file assets/javascripts/menu.coffee.  

The menu.coffee script file contains the code to render the kendoMenu in the ul element "menu"  

### Adding the logout action to the menu

Devise will create by default HTTP method 'DELETE' to sign out a resource.  
The kendoMenu can only execute HTTP 'GET' methods. If we want to add our sign out action in the menu, we need to change
the HTTP method of the devise sign out action.  
This can realized by changing the following config option in the <b>config/initializers/devise.rb</b> initializer:  

> config.sign_out_via = :get

## Styling Forms Like a Pro with Kendo UI

You can find more info [here](http://www.telerik.com/blogs/styling-forms-like-a-pro-with-kendo-ui)

To style the login form we need to generate the devise views.  
This can be done by executing the following rails generator command:  
> rails generate devise:views

The generator will generate a list of views, but we only need the <b>views/devise/sessions/new.html.erb</b>  

I have added some basic kendo UI styling in that view.
  
## Building a REST API with Spring

### Basic and Digest Authentication for a REST Service with Spring Security

You can find more info [here](http://www.baeldung.com/2011/11/20/basic-and-digest-authentication-for-a-restful-service-with-spring-security-3-1/)

In the article, the author has created a project on github (project [eugenp/REST](https://github.com/eugenp/REST#readme)  

When you follow the 'Quick Start' instructions, it downloads via maven, lots of stuff. But the resulting application works like a charm.  
You can start to communicate with the application via curl.  

## RSpec: Behaviour Driven Development for Ruby

### Let's get started

Add the following to your Gemfile, if it isn't yet present.

> group :development, :test do  
> &nbsp;&nbsp;gem 'rspec', '~> 3.3.0'  
> &nbsp;&nbsp;gem 'rspec-rails', '~> 3.3.3'  
> end  

More info you can find [here](http://www.rubydoc.info/gems/rspec-rails/file/README.md)

Run the following rails generator:

> rails generate rspec:install

This adds the following files which are used for configuration:

    .rspec
    spec/spec_helper.rb
    spec/rails_helper.rb
    
## Kendo UI Globalization

Not all kendo ui components are globalized

Here is a list of widgets which depends on the current culture:

    Calendar
    DatePicker
    TimePicker
    DateTimePicker
    NumericTextBox
    MaskedTextBox (globalized mask literals)
    Scheduler
    Gantt

The kendo ui GRID is NOT globalized
Some more info 
http://www.telerik.com/forums/complete-solution-for-language-localization-of-all-text-strings-in-an-app


 




