Rails.application.routes.draw do

get("/users", { controller: "users", action: "index" })

get("/users/:path_user", { controller: "users", action: "show" })

get("/photos", { controller: "photos", action: "index" })

get("/photos/:path_photo", { controller: "photos", action: "show" })

get("/delete_photo/:path_id", { controller: "photos", action: "destroy" })

get("/photos_record", { controller: "photos", action: "create" })
end
