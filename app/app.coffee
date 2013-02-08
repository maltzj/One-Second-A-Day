require('coffee-script')
express = require('express')

app = express()

app.get('/login', (req, res) ->
    
    res.render('../templates/login.jade',
        username: 'James'
    )
    res.end()
)

app.listen(8080)
console.log('listening on 8080')
