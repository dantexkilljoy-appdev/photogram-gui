Rails.application.routes.draw do

get("/users", { controller: "users", action: "index" })

get("/users/:path_user", { controller: "users", action: "show" })

get("/photos", { controller: "photos", action: "index" })

get("/photos/:path_photo", { controller: "photos", action: "show" })
end
