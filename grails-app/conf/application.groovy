// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'webec.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'webec.UserRole'
grails.plugin.springsecurity.authority.className = 'webec.Role'
grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugin.springsecurity.interceptUrlMap  = [
        [pattern: '/',               access: ['IS_AUTHENTICATED_FULLY']],
        [pattern: '/about',          access: ['permitAll']],
        [pattern: '/posts',          access: ['permitAll']],
        [pattern: '/error',          access: ['permitAll']],
        [pattern: '/index',          access: ['permitAll']],
        [pattern: '/login/**',       access: ['permitAll']],
        [pattern: '/index.gsp',      access: ['permitAll']],
        [pattern: '/shutdown',       access: ['permitAll']],
        [pattern: '/assets/**',      access: ['permitAll']],
        [pattern: '/**/js/**',       access: ['permitAll']],
        [pattern: '/**/css/**',      access: ['permitAll']],
        [pattern: '/**/images/**',   access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],
        [pattern: '/api/login',      access: ['permitAll']],
        [pattern: '/api/logout',     access: ['ROLE_ADMIN']],
        [pattern: '/api/post',       access: ['ROLE_ADMIN']],
        [pattern: '/**',             access: ['ROLE_ADMIN']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
    [pattern: '/api/**',         filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter'],
    [pattern: '/**',             filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter']
]

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.rest.logout.endpointUrl = '/api/logout'
grails.plugin.springsecurity.rest.token.validation.useBearerToken = false
grails.plugin.springsecurity.rest.token.validation.headerName = 'X-Auth-Token'
grails.plugin.springsecurity.rest.token.storage.memcached.hosts = 'localhost:11211'
grails.plugin.springsecurity.rest.token.storage.memcached.username = ''
grails.plugin.springsecurity.rest.token.storage.memcached.password = ''
grails.plugin.springsecurity.rest.token.storage.memcached.expiration = 86400
