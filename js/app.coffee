# configs
bappHost     = "bapp.ab.mkvd.net"
mailHost     = "mail_tally.ab.mkvd.net" # mail_tally.ab4.northeurope.cloudapp.azure.com

contractName = 'contact_form'

# setup code
c =  console || { log: -> }


mailUrl = "http://#{mailHost}/mail"

methodPost = (name) ->
  host = "http://#{bappHost}"
  "#{host}/api/#{contractName}/#{name}"

# TODO: TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO
# TODO: a better option is to get the type from the parameter name     # TODO
# TODO: TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO


postJSON = (url, params, callback) ->
  $.post url, params, callback, 'json'

formElem = $("form#contact")

getParam = (param, params) ->
  par = _(params).find (p) ->
    p.name == param
  par.value

spinner = $ ".spinner"
info    = $ ".message"
submit  = $ "form#contact input[type='submit']"

setLoading = ->
  submit.attr "disabled", true
  spinner.css
    visibility: "visible"
  info.html "loading..."

setLoaded = (contract_address) ->
  spinner.css
    visibility: "hidden"
  info.html "We have received your message and we'll contact you shortly."

formElem.on "submit", (evt) ->
  evt.preventDefault()
  setLoading()

  params = formElem.serializeArray()

  email     = getParam "email",    params
  firstName = getParam "first",    params
  lastName  = getParam "last",     params
  message   = getParam "message",  params

  # TODO: remove <br>s ^^
  message = message.split("\n").join "<br>"
  body = message

  values = {
    values: [email    , firstName, lastName ]
    types:  ["bytes32", "bytes32", "bytes32"]
  }


  if email
    c.log "addContact(#{values.values.join(", ")}) called!"

    mailArgs =
      from_name:    "#{firstName} #{lastName} <#{email}>"
      from_address: email,
      body:         body

    postJSON mailUrl, mailArgs, (resp) ->
      if resp.success
        c.log "Email sent!"
        setLoaded()

    postJSON methodPost("addContact"), values, (resp) ->
      c.log "addContact() //=> '#{JSON.stringify resp}'"
      if resp.success
        c.log "Success!!"
