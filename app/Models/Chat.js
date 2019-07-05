'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Chat extends Model {
    static get table () {
        return 'chats'
        }
        static get primaryKey () {
        return 'id'
        }
        user() {
            return this.belongsTo('App/Models/User')
        }
        room() {
            return this.belongsTo('App/Models/Room')
        }
}

module.exports = Chat
