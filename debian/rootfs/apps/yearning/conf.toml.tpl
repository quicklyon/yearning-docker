[Mysql]
Db = "{{DB_NAME}}"
Host = "{{DB_HOST}}"
Port = "{{DB_PORT}}"
Password = "{{DB_PASSWORD}}"
User = "{{DB_USER}}"

[General]
SecretKey = "{{SecretKey}}"
Hours = 4


[Oidc]
Enable = false
ClientId = "yearning"
ClientSecret = "fefehelj23jlj22f3jfjdfd"
Scope = "openid profile"
AuthUrl = "https://keycloak.xxx.ca/auth/realms/master/protocol/openid-connect/auth"
TokenUrl = "https://keycloak.xxx.ca/auth/realms/master/protocol/openid-connect/token"
UserUrl = "https://keycloak.xxx.ca/auth/realms/master/protocol/openid-connect/userinfo"
RedirectUrL = "http://127.0.0.1:8000/oidc/_token-login"
UserNameKey = "preferred_username"
RealNameKey = "name"
EmailKey = "email"
SessionKey = "session_state"
