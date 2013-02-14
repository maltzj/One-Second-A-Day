require('coffee-script')
flash = require('connect-flash')
express = require('express')
passport = require('passport')
LocalStrategy = require('passport-local').Strategy
auth = require('../lib/auth').Auth


passport.serializeUser( (user, done) ->
   
    return done(null, user.id)
)



passport.use(new LocalStrategy(
    (username, password, done) ->
        
        authentication = new auth()
        authentication.login(username, password, done)
))

app = express()
app.configure(
    app.use(express.bodyParser())
    app.set('view engine', 'jade')
    app.use(express.cookieParser('keyboard cat'))
    app.use(express.session({cookie: {maxAge: 60000}}))
    app.use(passport.initialize())
    app.use(passport.session())
    app.use(flash())
)

app.get('/', (req, res) ->

    res.write('Hello World')
    res.end()
)

app.get('/login', (req, res) ->
   
    res.render('../templates/login.jade', {}, (err, html) ->
        
        res.write(html)
    )
    res.end()
)

app.post('/login',
   passport.authenticate('local',
       failureRedirect: '/login'
       failureFlash: true
   ), (req, res) ->

       console.dir(req)
       console.dir(res)
       res.write('Success')
       res.end()
   )
  


app.listen(8080)
console.log('listening on 8080')
