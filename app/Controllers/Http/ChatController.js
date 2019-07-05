'use strict'
var jwtDecode = require('jwt-decode');
const Chat = use('App/Models/Chat')
const Database = use('Database')
class ChatController {

    async index ({response}) {
        const chat = await Chat.query()
        .with('user')
        .with('room')
        .fetch();
    return response.json(chat)
    }
    
    async store ({request, response, auth}) {
        const token = await auth.getAuthHeader()
        const decoded = jwtDecode(token)
        const chatInfo = request.only(['text','room_id'])
        const chat = new Chat()
        chat.text = chatInfo.text
        chat.user_id = decoded.uid
        chat.room_id = chatInfo.room_id
        await chat.save()
        return response.status(201).json(chat)
    }
    async show ({params, response}) {
        const chat = await Chat.find(params.id)
        if (!chat) {
            return response.status(404).json({data: 'Resource not found'})
            }
        return response.json(chat)
    }
    async showbyroom ({params, response}) {
        const chat = await Database
        .raw(`SELECT
                chats.id,
                chats.text,
                chats.user_id,
                chats.room_id,
                chats.created_at,
                chats.updated_at,
                users.username,
                users.avatar
                FROM
                chats
                INNER JOIN rooms ON chats.room_id = rooms.id
                INNER JOIN users ON chats.user_id = users.id
                WHERE room_id = ${params.id}
                ORDER BY created_at ASC`)
        // from('chats')
        // .innerJoin('users', 'chats.user_id', 'users.id')
        // .where({ room_id: params.id })
        // const chat = await Chat.find(params.room_id)
        if (!chat) {
            return response.status(404).json({data: 'Resource not found'})
            }
        return response.json(chat)
    }
    async update ({params, request, response}) {
        const chatInfo = request.only(['text', 'user_id','room_id'])
        const chat = await Chat.find(params.id)
         if (!chat) {
            return response.status(404).json({data: 'Resource not found'})
            }
            chat.text = chatInfo.text
            chat.user_id = chatInfo.user_id
            chat.room_id = chatInfo.room_id
            await chat.save()
            return response.status(200).json(chat)
    }
    async delete ({params, response}) {
        const chat = await Chat.find(params.id)
        if (!chat) {
        return response.status(404).json({data: 'Resource not found'})
        }
        await chat.delete()
        return response.status(204).json({'messages': 'data deleted'})
        }
   
}
module.exports =ChatController