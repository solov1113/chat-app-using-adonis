'use strict'
const Room = use('App/Models/Room')
const Database = use('Database')
class RoomController {
    async index ({response}) {
        const room = await Room.query()
        .with('chat.user')
        .orderBy('created_at', 'asc')
        .fetch()
        return response.json(room)
    }
    
    async store ({request, response}) {
        const roomInfo = request.only(['name', 'type'])
        const room = new Room()
        room.name = roomInfo.name
        room.type = roomInfo.type
        await room.save()
        return response.status(201).json(room)
    }
    async show ({params, response}) {
        const room = await Room.find(params.id)
        if (!room) {
            return response.status(404).json({data: 'Resource not found'})
            }
        return response.json(room)
    }
    async update ({params, request, response}) {
        const roomInfo = request.only(['name', 'type'])
        const room = await Room.find(params.id)
         if (!room) {
            return response.status(404).json({data: 'Resource not found'})
            }
            room.name = roomInfo.name
            room.type = roomInfo.type
            await room.save()
            return response.status(200).json(room)
    }
    async delete ({params, response}) {
        const room = await Room.find(params.id)
        if (!room) {
        return response.status(404).json({data: 'Resource not found'})
        }
        await room.delete()
        return response.status(204).json({'messages': 'data deleted'})
        }
}

module.exports = RoomController
