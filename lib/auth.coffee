Users = require('./models/UserModel').Users
sequelize = require('sequelize')

class Authentication:
    
    Users.sync()

    login: (username, password, cb) ->

        callback = if cb then cb else () ->
        Users.find(
            where:
                username: username
                password: password
        ).success( (result) ->
            
            return callback(null, result)
        ).error( (error) ->

            return callback(error)
        )

            
