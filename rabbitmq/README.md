Rabbit MQ
=======
localhost 15672 
user guest
pw guest


```bash
# Config
[
 {rabbit,
  [
   %% The default "guest" user is only permitted to access the server
   %% via a loopback interface (e.g. localhost).
   %% {loopback_users, [<<"guest">>]},
   %%
   %% Uncomment the following line if you want to allow access to the
   %% guest user from anywhere on the network.
   {loopback_users, []},
   {default_vhost,       "/"},
   {default_user,        "guest"},
   {default_pass,        "guest"},
   {default_permissions, [".*", ".*", ".*"]}
  ]}
].
```
