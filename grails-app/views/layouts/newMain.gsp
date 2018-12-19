<!doctype html>
<html lang="en">
<head>
    <title><g:layoutTitle default="BlogThread"/></title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:javascript src="bootstrap.js" />
    <asset:stylesheet src="app.css"/>

    <g:layoutHead/>
</head>
<body>
    <h1 id="site-title">BlogThread</h1>
    <nav>
        <a id="about-link" href="/about" title="About Page"><g:message code="main.aboutPage"/></a>
        <a id="index-link" href="/" title="Homepage"><g:message code="default.home.label" /></a>
        <a id="logout-link" href="/logout" title="Logout"><g:message code="default.home.label" /></a>
    </nav>
    <g:layoutBody/>
</body>
</html>
