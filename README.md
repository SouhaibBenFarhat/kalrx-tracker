# README

This repository is created for a coding challenge reason, it's basically a ruby&rails server that receive time tracking requests and persist them into an SQLite database in order to track how much time users spent into a certain website<br>

  ``
  rails s -p 4000
  `` to run the server. Please make sure to use a port different than 3000 since the frontend is using that port.


# Endpoints:

  - post 'auth/login'
  - post 'signup'
  - post 'visit/init'<br>
  This endpoint is for initiating a session with the server to start logging time for a specific time slot.
   - post 'visit/ping':<br>
  This endpoint get triggered every fixed amount of time to increment the duration of a visit.
  - get 'visit'<br>
  Get all visits.
  - delete 'visit'<br>
  clear Visit table.
  
  ### Models:
  ```ruby
  class User 
        t.string "username"
        t.string "password_digest"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
  end
  ```
  
  ```ruby
class Visit
    t.string "session_hash"
    t.string "user_hash"
    t.integer "duration", default: 0
    t.string "site"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
end
```
  
  ### Workflow description:
  1. Every one second, the script (library) send a request ping {session_hash:'QSDLaiuae'} 
  2. The backend fetch the `visit` entry from the database based on the `session_hash` value and update the duration.

### Draft: