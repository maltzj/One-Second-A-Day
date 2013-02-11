Sequelize = require('sequelize')
config = require('../../config/config.coffee').config

sequelize = new Sequelize(config.database.database,
    config.database.username,
    config.database.password)

Users = sequelize.define('Users',
    
    username:
        type: Sequelize.STRING
        allowNull: false
    password:
        type: Sequelize.STRING
        allowNull: false
    id:
        type: Sequelize.STRING
        primaryKey: true
        autoIncrement: true
)

exports.Users = Users
