Sequelize = require('sequelize')

Users = Sequelize.define('Users',
    
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
