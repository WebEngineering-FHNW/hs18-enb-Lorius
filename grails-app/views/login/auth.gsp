<html>
<head>
    <title><g:message code='springSecurity.login.title'/></title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:javascript src="bootstrap.js" />
    <style>
        #container {
            margin:  auto;
            width:   25%;
            padding: 10px;
        }
    </style>
</head>

<body>
<div id="container" class="border border-primary">
            <div id="fheader">
                <h1>
                    <g:message code='springSecurity.login.header'/>
                </h1>
            </div>

            <g:if test='${flash.message}'>
                <div class="alert alert-danger" role="alert">${flash.message}</div>
            </g:if>

            <form action="/login/authenticate" method="POST" id="login-form" class="cssform" autocomplete="off">
                <div class="form-group">
                    <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                    <input type="text" class="form-control" name="username" id="username"/>
                </div>

                <div class="form-group">
                    <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                    <input type="password" class="form-control" name="password" id="password"/>
                </div>

                <div class="form-group form-check">
                    <input type="checkbox" class="chk" name="remember-me" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                    <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                </div>

                <input type="submit" class="btn btn-primary" style="margin-left: auto"value="${message(code: 'springSecurity.login.button')}"/>

            </form>

</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>