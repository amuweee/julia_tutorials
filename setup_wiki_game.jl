using HTTP


HTTP.get("https://en.wikipedia.org/wiki/Julia_(programming_language)")
fieldnames(typeof(resp))

resp_body = String(resp.body)
