require('coffee-script')
Users = require('./models/UserModel').Users
sequelize = require('sequelize')

class Authentication
    
    Users.sync()

    login: (username, password, cb) ->

        callback = if cb then cb else () ->
        Users.find(
            where:
                username: username
                password: password
        ).success( (result) ->
          
            if !result then return callback(null, false, "This is my message")
            return callback(null, result)
        ).error( (error) ->

            return callback(error)
        )

           
exports.Auth = Authentication
