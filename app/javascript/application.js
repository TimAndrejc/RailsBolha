// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"

document.addEventListener("trix-file-accept", (e)=>{
    e.preventDefault();
  });