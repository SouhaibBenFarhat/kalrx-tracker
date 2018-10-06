# README

This README would normally document whatever steps are necessary to get the
application up and running.

This repository is created for a coding challenge reason, it's basically a ruby&rails server that receive time tracking requests and persist them into an SQLite database in order to track how much time users spent into a certain website

#Endpoints:


  post 'auth/login', to: 'authentication#authenticate'<br>
  post 'signup', to: 'users#create'<br>
  post 'visit/init', to: 'visit#init'<br>
  post 'visit/ping', to: 'visit#ping'<br>
  get 'visit', to: 'visit#visits'<br>
