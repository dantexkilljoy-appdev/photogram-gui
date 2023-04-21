Rails.application.routes.draw do

get("/", { controller: "users", action: "index" })

get("/users", { controller: "users", action: "index" })

get("/users/:path_user", { controller: "users", action: "show" })

get("/photos", { controller: "photos", action: "index" })

get("/photos/:path_photo", { controller: "photos", action: "show" })

get("/delete_photo/:path_id", { controller: "photos", action: "destroy" })

get("/photos_record", { controller: "photos", action: "create" })

get("/user_record",  { controller: "users", action: "add" })

get("/comment_record", { controller: "photos", action: "comment" })

get("/update_photo/:modify_id", { controller: "photos", action: "update" })

get("/update_user/:update_id", { controller: "users", action: "update" })
end
