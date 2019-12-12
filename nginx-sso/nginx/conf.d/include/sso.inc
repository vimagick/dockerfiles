# Protect this location using the auth_request
auth_request /sso-auth;

# Redirect the user to the login page when they are not logged in
error_page 401 = @error401;

location /sso-auth {
    # Do not allow requests from outside
    internal;

    # Access /auth endpoint to query login state
    proxy_pass http://172.17.0.1:8082/auth;

    # Do not forward the request body (nginx-sso does not care about it)
    proxy_pass_request_body off;
    proxy_set_header Content-Length "";

    # Set custom information for ACL matching: Each one is available as
    # a field for matching: X-Host = x-host, ...
    proxy_set_header X-Origin-URI $request_uri;
    proxy_set_header X-Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}

# If the user is lead to /logout redirect them to the logout endpoint
# of ngninx-sso which then will redirect the user to / on the current host
location /sso-logout {
    return 302 https://login.yourdomain.com/logout?go=$scheme://$http_host/;
}

# Define where to send the user to login and specify how to get back
location @error401 {
    return 302 https://login.yourdomain.com/login?go=$scheme://$http_host$request_uri;
}
