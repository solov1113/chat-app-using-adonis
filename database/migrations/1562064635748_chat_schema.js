'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ChatSchema extends Schema {
  up () {
    this.create('chats', (table) => {
      table.increments()
      table.string('text').nullable()
      table
      .integer('user_id')
      .unsigned()
      .references('id')
      .inTable('users')
      table
      .integer('room_id')
      .unsigned()
      .references('id')
      .inTable('rooms')
      table.timestamps()
    })
  }

  down () {
    this.drop('chats')
  }
}

module.exports = ChatSchema
