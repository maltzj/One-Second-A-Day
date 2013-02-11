require('coffee-script')
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
app.use(express.bodyParser())
app.use(passport.initialize())
app.use(passport.session())

app.get('/login', (req, res) ->
    
    res.render('../templates/login.jade',
        username: 'James'
    )
    res.end()
)

app.post('/login',
   passport.authenticate('local',
       failureRedirect: '/login'
   ), (req, res) ->

       console.dir(req)
       console.dir(res)
       res.write('Success')
       res.end()
   )
   


app.listen(8080)
console.log('listening on 8080')
