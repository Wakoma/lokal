# Redirect

Issue permanent HTTP redirect (code 301) from `redirect_from` to `redirect_to`.

`redirect_from` must be a hostname - it will be used as `app_domain` - the input host matching.

`redirect_to` should be in form `protocol://host` with optional `/path` suffixed.

In case of a PATH given in the request, it will be retained. You can change this behaviour
by setting `redirect_path` to `false`.