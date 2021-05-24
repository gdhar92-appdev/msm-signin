Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index" })
  
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/movies", { :controller => "movies", :action => "index" })

  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  
  get("/actors/:path_id", { :controller => "actors", :action => "show" })

  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" })

  get("/insert_movie", { :controller => "movies", :action => "create" })

  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })

  get("/insert_director", { :controller => "directors", :action => "create" })

  get("/delete_actor/:path_id", { :controller => "actors", :action => "destroy" })

  get("/insert_actor", { :controller => "actors", :action => "create" })

  get("/modify_movie/:path_id", { :controller => "movies", :action => "update" })

  get("/modify_director/:path_id", { :controller => "directors", :action => "update" })

  get("/user_sign_in", { :controller => "users", :action => "sign_in"})

  get("/user_sign_up", { :controller => "users", :action => "sign_up"})

  get("/insert_user_record", { :controller => "users", :action => "create"})

  post("/verify_credentials", { :controller => "users", :action => "authenticate"})

  get("/bookmarks", { :controller => "bookmarks", :action => "show"})

  get("/user_sign_out", { :controller => "users", :action => "sign_out"})

  post("/insert_bookmark", { :controller => "bookmarks", :action => "create"})  

  get("/delete_bookmark/:bookmark_id", { :controller => "bookmarks", :action => "delete_record"})
end
