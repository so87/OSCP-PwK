# oscp
* This is my cheatsheet and scripts developed while taking the Offensive Security Penetration Testing with Kali Linux course.
* [Cheat Sheet](https://github.com/so87/OSCP-PwK/blob/master/Penetration%20Testing%20Tools.docx)

## docker container for portability
* kali-build contains the files necessary for running the essential kali linux tools in a docker container. 
* it is recommended that you install burp suite on your host OS along with firefox.
* tools like "gobuster" can be proxied through hostOS burp proxy via "http://host.docker.internal:8080"
* host.docker.internal is the hostname you use if you want to scan your own localhost machine

## web pentesting
* [List of vulnerable practice applications](https://owasp.org/www-project-vulnerable-web-applications-directory/)
* PHP: 
	* docker run --rm -p 10000:80 gjuniioor/owasp-bricks
	* docker run --rm -it -p 10000:80 vulnerables/web-dvwa:latest
  	* admin:password
* Java: docker run --rm -p 127.0.0.1:10000:8080 -p 127.0.0.1:10001:9090 webgoat/goatandwolf
	* WebGoat will be located at: http://127.0.0.1:10000/WebGoat 
	* WebWolf will be located at: http://127.0.0.1:10001/WebWolf
* NodeJS: 
	* docker run --rm --name dvna -p 10000:9090 -d appsecco/dvna:sqlite
	* docker run --rm -p 10000:3000 bkimminich/juice-shop
* rails: docker run --rm -p 10000:3000 contrastsecuritydemo/railsgoat:1.0
* Python/Django/API: docker container run -it --rm -p 10000:8000 tuxotron/tiredful-api
* web socket: docker run --rm -p 10000:80 -p 10080:8080 tssoffsec/dvws

## Building yourself a practice area and learning
I recommend you go on over to my [home lab notes](https://github.com/so87/Home-Lab) if you want to practice all of this yourself.  I also have [several great links for learning](https://github.com/so87/Links-for-Network-Security) these types of concepts.
