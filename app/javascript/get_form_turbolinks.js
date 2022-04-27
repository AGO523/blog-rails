import Turbolinks from "turbolinks";

document.addEventListener("turbolinks:load", function (post) {
  const forms = document.querySelectorAll("form[method=get][data-remote=true]")
  for (const form of forms) {
    form.addEventListener("ajax:beforeSend", function (post) {
      const options = post.detail[1]

      Turbolinks.visit(options.url)
      post.preventDefault()
    })
  }
})
