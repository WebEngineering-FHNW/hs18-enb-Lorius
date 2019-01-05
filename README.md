# WebEngineering Module, Graded Exercise

## Commit Proposal

### Matriculation Number:
15-941-461

### Project idea short description:
Eine Webseite auf der man mindestens 1 Blog führen kann.
Die Webseite sollte folgendes beinhalten:
- einen Admin Bereich für das Verwalten des Blogs
- einen Rich Text Editor für das Erstellen der Blog-Einträge
- "About Page"

Mögliche Erweiterungen:
- Mehrere Blogs für mehrere User
- Kommentare für die einzelnen Blog-Einträge
- Profile für die Nuter


## Project confirmation

Great idea. Before doing the admin zone, let's concentrate on the blog space.

You might start.

## Project delivery <to be filled by student>

### How to start the project:
`grailsw run-app` oder `grailsw.bat run-app`

### How to test the project: 
`grailsw test-app` oder `grailsw.bat test-app`

### Hand-written\, static HTML 
### project description:
`index.html`

### External contributions:
- a few icons

### Other comments: 
You should view the website in the Google Chrome Browser.

### I'm particulary proud of:
- The WISIWIG editor that I made all by myself.
- THe fact that the role-based-security-based-rest-interface actually works.

## Project grading

* `./grailsw run-app` and `./grailsw test-app` both work. However we only have very few tests.
* Commit log is VERY good.
* _index.html_ page is valid. However, some errors have been discovered when validating the generated **HTML** pages.
* **CR(~~UD~~)** operations available.
* Usage of _layout_ and `<g:message ...>`
* To improve:
  - I am able to generate _empty_ posts (which do NOT appear as such afterwards).
* Some service methods are exposed. I tested as following:
  1. `curl -i -H "Content-Type: application/json" -X POST -d '{"username":"admin","password":"admin"'} localhost:8080/api/login`
  1. `curl -H "X-Auth-Token: <token-previously-returned>" localhost:8080/api/post`  
  As I was able to list my posts. Nice!
  
Congratulations! I am awarding three extra points for the WISIWIG editor. Unfortunately no extra point for the _artistic value_... :smiley:
  
Grade: **5.4**