# Deployment

<br>
---

# Agenda

- Networks
- Domain Names
- Hosting Options
- Heroku

<br>
---

# Networks

## LANs and the Internet

### LAN
<pre>
Local Area Network
</pre>

Most LANs we use are contained within a single building:

- home
- office
- school (e.g. Bitmaker)
- retailers, restaurants, coffee shops, etc. (e.g. Starbucks)
- etc.

### Internet
<pre>
a global computer network providing a variety of information and communication facilities, consisting of interconnected networks using standardized communication protocols
</pre>

![](https://raw.githubusercontent.com/bitmakerlabs/wdi-march-2017/master/45-deployment/imgs/lans-and-the-internet.png)

## OSI Model

<pre>
The Open Systems Interconnection model (OSI model) is a conceptual model that characterizes and standardizes the communication functions of a telecommunication or computing system without regard to their underlying internal structure and technology.
</pre>

The OSI Model is a conceptual model, like MVC. It's used when communicating and understanding the various aspects of networking.

### OSI Model Functionality

![](https://raw.githubusercontent.com/bitmakerlabs/wdi-march-2017/master/45-deployment/imgs/osi-model.png)

### OSI Model In Relation To The Internet

![](https://raw.githubusercontent.com/bitmakerlabs/wdi-march-2017/master/45-deployment/imgs/osi-model-in-relation-to-the-internet.png)

## IP
<pre>
Internet Protocol
</pre>

IP is used to get data from point A to B.

The two versions of IP in use today are IPv4 and IPv6.


### IPv4

You'll likely be most familiar with the IPv4 addressing scheme.

IPv4 addresses are made up of four *octets*:

`0-255` `.` `0-255` `.` `0-255` `.` `0-255`

and range from :

`0.0.0.0` to `255.255.255.255`

For example:

```
192.168.0.1
10.0.1.3
127.0.0.1
52.84.143.6
208.67.222.222
```

In total, IPv4 supports 4,294,967,296 addresses (256 * 256 * 256 * 256 or 256^4).

### IPv6

IPv6 was created as IPv4 was running out of IP addresses

IPv6 addresses are made up of 8 *hextets* (two octets combined). You'll likely not come across these in your day to day work.

An  IPv6 example:

```
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

In total there are 340,282,366,920,938,463,463,374,607,431,768,211,456 addresses!

<br>
---

### Class Exercise: Identify your IP address

### Mac

- Hold down `option` and click the WIFI symbol in your toolbar.
- Look down the list to your WIFI connection to see the details. You will see an IP address (e.g. `10.0.1.201`). That's your IP!

### Linux

*(this also works on Mac)*

- from the command line:

```
$ ifconfig
```

- look for the WIFI connection and see what `inet addr` is set to

<br>
---
### Class Exercise: Ping

Ping is a tool used to test connectivity between two computers.

Test to see if your computer can talk to your classmate by pinging their IP address using the `ping` command:

For example:

```
$ ping 10.0.1.201
```

You'll see how long it takes the send an ICMP packet to their computer and return to your computer.

You can watch pings to your computer with `tcpdump`, and networking tool for watching traffic over your computer:

```
tcpdump -nni eth0 icmp
```

*You may need to change `eth0` to the interface of your connection

Try pinging me and see if you can spot your IP address in my tcpdump!

<br>
---

### Private, Public and Reserved IP addresses

#### Private

When you're on a LAN, you're likely using a private IP address. These IP blocks are reserved for private networks:

```
10.0.0.0 - 10.255.255.255
172.16.0.0 - 172.31.255.255
192.168.0.0 - 192.168.255.255
```

Anyone can use the private network blocks for their LANs, but they can't advertise these blocks to the Internet.

#### Public IPs

Public IPs are accessable to anyone on the Internet.

<br>
---
##### Class Exercise: Identify your public IP

Google "What's my IP?":

[https://www.google.ca/search?hl=en&safe=off&q=what+is+my+ip](https://www.google.ca/search?hl=en&safe=off&q=what+is+my+ip)

It's likely we all have the same public IP address. This is because we're all on the same LAN and going through the same router that's connected directly to the Internet.

<br>
---

#### Localhost

No doubt you've seen `127.0.0.1`. This is because `127.x.x.x` IPs are reserved for use by your computer. You can think of `127.0.0.1` as the network equalvalent of `self` in Ruby and `this` in JavaSccript.

When you access `127.0.0.1`, you're saying "I want my computer to communicate with itself".

### Port Numbers

When your packet finally gets to its destination and knocks on the server's door, it supplies a port # to let the server know what *service* this packet is for. On the public web, this is port `80`. On your local development computer, this is port `3000`. Postgres runs on port `5432`.

Here's some more well-known port #s:

22 - SSH (secure shell)
25 - SMTP (simple mail transfer protocol)
123 - NTP (network time protocol)
443 - HTTPS (Hypertext Transfer Protocol over TLS/SSL)

### NAT
<pre>
Network Address Translation
</pre>

If your computer uses a private IP address like `10.0.1.201`, how do web servers route the traffic back to you?

The router connected to the Internet, converts your IP address to the public IP, and when the server responds, it translates it back to the private IP address.

![](https://raw.githubusercontent.com/bitmakerlabs/wdi-march-2017/master/45-deployment/imgs/nat.jpg)

<br>
---
# Domain Names
<pre>
A domain name is an identification string that defines a realm of administrative autonomy, authority or control within the Internet.
</pre>

In other words, a domain name is a *place* on the Internet and is usually something one human can remember and communicate easily to another human. Without domain names, we'd have to tell each other *"Hey, I'm at IP address 206.129.54.3. Can you remember that?""*

Domain name examples:

```
bitmaker.co
generalassemb.ly
google.ca
```

## TLD (Top Level Domains)
<pre>
the last segment of a domain name
</pre>

The TLD is made up of the characters after the final period `.` in the domain. They can be purpose specific, country specific and nowadays even corporation specific. Whoever administers the TLD controls how domains using that TLD are doled out.

TLD examples:

```
.ca
.com
.org
.io
```

## Subdomains
<pre>
a domain that is a part of a main domain
</pre>

For example:

```
www.google.ca       # www is the subdomain
alexa.bitmaker.co   # alexa is the subdomain
```

A subdomain can be pointed to the main domain, as is usually the case with `www`, or can be pointed to a different IP address than the root domain.

## Registrar
<pre>
an entity that manages the reservation of Internet domain names
</pre>

*GoDaddy* is the most well-known registrar. I personally use *[namecheap.com](http://namecheap.com)*. For domains on common TLDs (`.com`, `.ca`, etc.), it costs around $10 to $15 per year.

[https://instantdomainsearch.com](https://instantdomainsearch.com) is a handy tool to see if a domain is available.

## Domain Name Service (DNS)

DNS is responsible for converting a name to an IP.

Your ***registrar*** likely provides this service, but you can also use third parties (e.g. *Cloudflare*, *DNS Made Easy*).

You point your *domain name* to the IP address of the server your website is on. Common DNS record types are:

#### A Record
<pre>
points a domain to an IP address
</pre>

#### CNAME
<pre>
aliases a name to another name (another CNAME or A Record usually)
</pre>

#### MX
<pre>
Mail Record
</pre>

Examples:

```
Domain             TTL    Type     Priority       Destination
------             ---    ----     --------       -----------
smallcity.ca       1800   A                       45.33.65.179
www.smallcity.ca   1800   CNAME                   smallcity.ca
smallcity.ca       60     MX       5              alt1.aspmx.l.google.com
smallcity.ca       60     MX       10             aspmx3.googlemail.com
```

- TTL (time-to-live) tells anything looking up this domain how long it should keep it cached before refreshing
- MX records have a priority. The lower the number, the higher the priority. Mail will first try to deliver to the highest priority mail server, and if that fails, then try to deliver the mail to a backup server.


Note that there's a distinction between configuring your computer to use DNS Servers and pointing your domain name to an IP address: setting up your computer with DNS tells your computer where to check to look up any domain name (e.g. that you might type into a web browser), where as configuring DNS for your domain tells computers looking up domains where your domain lives on the Internet.


## Dig

Dig is a tool to lookup DNS records. For example:

```
# lookup the `smallcity.ca` domain
dig smallcity.ca

# lookup the `www` subdomain of `smallcity.ca`
dig www.smallcity.ca

# lookup the mail records for `smallcity.ca`
dig smallcity.ca mx

# lookup the `smallcity.ca` domain on a particular name server
# (in this case, the `smallcity.ca` authority server)
dig smallcity.ca @dns1.registrar-servers.com
```

Notice the *TTL* changes in some of the lookups if you repeatedly look it up!

## Whois

Whois is a tool you can use to see who owns a domain:

```
whois bitmaker.co
whois bitmakerlabs.com
whois generalassemb.ly
```

Here we can see the owners and the Name Servers they're configured to use.

### A simplified version of how a computer figures out the IP address of a domain:

1. Your computer looks at its `/etc/hosts` file to see if this domain is on record
1. If not, your computer asks its configured DNS servers the IP address of a domain
1. The DNS Server checks its cache: if it already knows about the domain, it gives the cache result back as an answer
1. If it doesn't know about the domain, the DNS server does a `whois` to find out what name server is the authority for the domain, and then asks that authority server what the IP address for that domain is
1. It sends the result back to the computer requesting the lookup, and then caches the result for the next lookup
1. When the TTL expires for a domain, the DNS server removes it from its cache


<br>
---
# Servers

Servers provide Internet services.

For example:
- web
- email
- ssh (login remotely)
- DNS
- slack
- database

They operate with using a conceptual *client -- server* relationship.

For example:

- when you develop with Rails, Chrome is the client, Puma is the web server.
- on Mac, if you use the *Apple Mail* application, then the *Apple Mail* is the client, and gmail might be the server

<br>
---
# Hosting Options

There are many ways to host a website on the Internet:

### 1. setup your own server
  - in your bedroom
  - colocation
  - virtual private server

### 2. Managed Servies

### 3. Platform as a Service

## Setup your server directly up on the Internet

- dedicated IP address is best for this
- I did this with [yip.org](http://yip.org), a server I shared with friends. We had it in ourliving room. There's a chance it still lives in my friend's bedroom in Montreal
- This option includes the most responsibilities:
    - buy a computer
    - obtain a static IP address from your Internet Service Provider (ISP)
    - install the operating system (usually linux)
    - setup the computer
        - https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04
        - networking
        - security
        - applications (web server and database)
        - configure web server software (usually Apache or Nginx)
    - ensure your server is always on
    - on-going maintenance (security updates, database backups, cleaning up old logs files, etc.)
    - ensure the server can survive an attack -- i.e. a DDOS (Distributed Denial of Service attack), where malicious entities have control of malware infected computer and make tens of thousands of requests to your service all at once in an attempt to crash it
- ensure there's enough bandwidth to your server
    - usually home connections aren't ideal as they're setup to allow much more throughput in vs. out: your download speed may be 10+ times higher than your upload speed, as normally you want to download much more than you upload. The server's case is the opposite: it normally wants to send much more than it receives to the Internet. e.g. it receives a tiny HTTP request, and then delivers a web page with all the assets
- this option is usually only reserved for hardcore techies and those who don't need a reliable website

## Colocation

- Colocation companies would get a fat pipe to the Internet, and provide rack space for you to install server on
- http://www.datacentermap.com/canada/toronto/ is a list of data centres in Toronto that offer colocation
- 151 Front Street is where all the telcos have setup. This building is dedicated to Internet and telecommunication connections
    - http://www.151frontstreet.com/en_tenantdirectory.htm
- cocolations offer high security and other amenties geared towards housing servers and networking equipment
- expensive to do in both cost and labour: you have to physically setup your own server and then go in and mount it to a rack yoursel
- this option is for apps with specific needs (high security and / or bandwidth demands)
- same responsibilities as setting up a server directly on the Internet except you don't need to worry about power and bandwidth

## Virtual Private Servers (VPS)

- companies sell *virtual* servers. They run big computers that partition up hundreds of smaller virtual servers
- popular VPS providers are Digital Ocean, Linode, Amazon Web Services
- quick to setup (you provide them your credit card and choose a server)
- you can scale up your server to a point
    - for a Ruby on Rail application, you might get away with a 512MB Memory plan, but likely want at least 1GB
- relatively inexpensive when compared to colocations
    - https://www.digitalocean.com/pricing/
- if your website demands become high, you may have to split your website amongst many servers:
    - several servers dedicated to database
    - several serversdedicate to your application
    - You'd then need to setup load balancing across the servers, and this can be very challenging and require a certain level of expertise

## Managed Services

- some companies offer managed services: you provide them your application, and they take care of running it for you
- this is the most expensive option, but may be cheaper than hiring staff to do this for you
- *Engine Yard* has been doing this for Rails applictions for a long time

## Platform as a Service (PaaS)

- these are services that take care of the computing for you. They run the infrastructure required to run your website. AWS and Heroku are two popular PaaS
- very easy to scale up if there are increased demands on your website, but can become quite costly
- less control as you don't have directly access to a server
- some pricing structures only bill you for the computing cycles you use
- Heroku offers a free teir which we'll take advantage of today to get your web app online!

<br>
---
# Web Server Software

If you're setting up your own server, you'll need to run web server software.

The two most popular are Apache HTTP Server and NGINX.

## Apache
- has been around for the longest (created in 1995)
- often comes installed on Unix-flavoured computers

## NGINX
- newer (created in 2002 in Russia)
- known for its ability to handle high traffic demands

### Which one should you choose?

If you're just getting started, and know nothing about either, I recommend going with NGINX. It'll be a similar learning curve as Apache.
*I personally use Apache though because I know how to set it up and configure it.*

<br>
---
# App Server Software

Along with a web your server, you'll need to run *app server* software. Your app server software can sometimes double as web server software. The advantages of using Web Server softare like Apache or NGINX are:

- you can run multiple websites
- you can use different frameworks (WordPress, Ruby on Rails)
- they're faster at serving static assets (i.e. files in your `/public` Rails app folder)

## Puma

- this is what runs on your local development computer. It's also doubling as a web server when it's running on your local computer.
- https://github.com/puma/puma

## WEBrick

- this is included with the Ruby standard library, and what Rails used previously to 5.0
- http://ruby-doc.org/stdlib-2.4.1/libdoc/webrick/rdoc/WEBrick.html

<br>
---
# Rack

Along with your web server and app server, you'll also need to run Rack. This is the library that lets your app server communicate with Rails.

- this is the most popular ruby gem there is (more popular than Rails, as everytime Rails is installed, Rack is installed), plus Rack is used with other frameworks like Sinatra
- https://github.com/rack/rack

<br>
---
# Setting it up

For the most part, unless your application has special requirements, you usually don't care too much about the internals of any of the above software, and just set it up and let it be. As a web developer, your main focus is usually developing the application.


<br>
---
# Dev Ops

Dev Ops is a newer job title that combines the roles of a web developer and server adminstrator. They're the experts at setting up and ensuring your application runs smoothly. At medium and larger sized companies, you'll usually leave the setup of your appliction to a dev ops engineer.

<br>
---
# Deployment Scripts

Often deployment scripts are written to automate putting your application online. They're responsible for:

- logging into your server
- created the necessary folders
- downloading your code from a git hosting company
- running database migrations

## Capistrano

Capistrano is the most popular Ruby deployment gem.

[http://capistranorb.com/](http://capistranorb.com/)


## Mina

[https://github.com/mina-deploy/mina](https://github.com/mina-deploy/mina)

The Mina gem, which shares name only in common with Bitmaker's Mina, is a newer deployment library.

<br>
---
# Heroku

- popular PaaS (Platform as a Service) with startups
- Matz, the creator of Ruby, works here
- has a free tier

## Getting Setup With Heroku

### Sign up

Everyone should signup for a Heroku account:
[https://signup.heroku.com/](https://signup.heroku.com/)

### Login to the Heroku website

If you're not logged in to Heroku, login now:
[https://id.heroku.com/login](https://id.heroku.com/login)

### Install the Heroku CLI

Formerly known as the Heroku Toolbelt, the Heroku CLI (Command Line Interface) let's you use heroku directly from your command line.

#### Mac Installation

```
brew install heroku
```

#### Linux Installation

[https://devcenter.heroku.com/articles/heroku-cli](https://devcenter.heroku.com/articles/heroku-cli)

### Login through the command line

```
heroku login
```

You'll see:
```
Enter your Heroku credentials:
Email: <your email address>
Password: <same password you use to login into heroku.com>
```

<br>
---
# Tiny CMS

Let's go through the steps now to put a sample application I've created called `Tiny CMS` onto Heroku.

## Setup Tiny CMS on your computer

Go into the Tiny CMS folders

```
cd 45-deployment/tiny-cms
```

Take a look at the files:

```
ls
```

Run bundle:

```
bundle
```

Note: if you don't have ruby 2.4.1 installed, switch the ruby version specified at the top of the `Gemfile` to a version you have install.

```ruby
ruby '2.4.1'
```

Create the databases:

```
rails db:setup
```

Start up the server on your local machine:

```
rails server
```

Go to the website and test it out:
[http://localhost:3000/](http://localhost:3000/)

Commit any changes:

```
git add --all
git commit -m 'making it work on my local dev machine'
```


## Setup Tiny CMS on Heroku

Turn it into a heroku app:

```
heroku create
```

Set it to use the ruby build pack:

```
heroku buildpacks:set heroku/ruby
```

Push the code to heroku:

```
git push heroku
```

Setup the database:

```
heroku addons:create heroku-postgresql:hobby-dev
heroku run rake db:migrate
heroku run rake db:seed
```

Find out the URL of your deployed Tiny CMS:

```
heroku info
```

And see if it worked!

## Setup Your Application for Heroku

***Only one person on your team should do this.***

### Postgres Configuration

If you haven't already, switch your app to use Postgres, as Heroku doesn't support sqlite3.

#### Switch your `Gemfile` over to Postgres

- comment out the `sqlite3` gem
- add the `pg` gem

```ruby
# ...

# gem 'sqlite3'
gem 'pg'

# ...

```

- run `bundle`

#### Update your `database.yml` to use Postgres

- replace databasse.yml config with the following:

```yaml
<% app_name = Rails.application.class.parent_name.underscore %>

development:
  adapter: postgresql
  database: <%= app_name %>_development

test:
  adapter: postgresql
  database: <%= app_name %>_test

production:
  adapter: postgresql
  database: <%= app_name %>_production
```

### Create and Push to Heroku

```
heroku create
heroku buildpacks:set heroku/ruby
git push heroku
heroku addons:create heroku-postgresql:hobby-dev
heroku run rake db:migrate
heroku run rake db:seed
heroku info
```

And go the Web URL!

***Warning: chances are, it won't work!***

## Setup Remainder of Team

- commit your code
- rest of team should pull and setup Postgres in their local if necessary
- add team using the heroku:

```
heroku access:add joe@example.com
```

## Have a backup

I suggest creating to instances of your app on heroku, and when you deploy, first deploy to instance A, then deploy to instance B, and then back to A and so on. This way, if one of your deployments doesn't go well, you'll still have the backup working instance you've deployed to.

## Remaining Steps and Troubleshooting

### Setup Environment Variables

If you're app has environment variables set:

#### Figaro Option

```
figaro heroku:set -e production
```

#### Manuel Setup

```
heroku config:set google_analytics_key=UA-35722661-5
```

or set variables through the web interface:

```
https://dashboard.heroku.com/apps/<--your heroku subdomain-->/settings
```

### Images and Files

If users can upload an image or other file to your application, you won't be able to store those on Heroku. One option is to use Amazon's S3 service. You'll need to research how to do this yourself.

### Logs

View most recent logs:

```
heroku logs
```

Keep a running log:

```
heroku logs -t
```

### Warnings

You may see warnings when you deploy to Heroku. Some of these can be ignored, but you may want to figure out how to address them.


### Further help

```
heroku help
```
