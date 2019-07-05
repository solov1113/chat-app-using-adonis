'use strict'
const User = use('App/Models/User')
var jwtDecode = require('jwt-decode');
class UserController {

    async index ({response}) {
        let users = await User.all()
        return response.json(users)
    }
    async store ({request, response}) {
        const userInfo = request.only(['username', 'email', 'password','avatar'])
        const user = new User()
        user.username = userInfo.username
        user.email = userInfo.email
        user.password = userInfo.password
        user.avatar = userInfo.avatar
        await user.save()
        return response.status(201).json(user)
    }
    async show ({params, response}) {
        const user = await User.find(params.id)
        if (!user) {
            return response.status(404).json({data: 'Resource not found'})
            }
        return response.json(user)
    }
    
    async showwithroom ({params, response, auth}) {
        const token = await auth.getAuthHeader()
        const decoded = jwtDecode(token)

        const user = await User.query().select('id','username').where({id:decoded.uid})
        // .with('room', groupQuery => groupQuery.with('user',childUserQuery => childUserQuery.select('id','username')))
        .with('room.chat.user')
        .first()

        if (!user) {
            return response.status(404).json({data: 'Resource not found'})
            }
        return response.json(user)
    }


    async update ({params, request, response}) {
        const userInfo = request.only(['username', 'email', 'password','avatar'])
        const user = await User.find(params.id)
         if (!user) {
            return response.status(404).json({data: 'Resource not found'})
            }
            user.username = userInfo.username
            user.email = userInfo.email
            user.password = userInfo.password
            user.avatar = userInfo.avatar
            await user.save()
            return response.status(200).json(user)
    }
    async delete ({params, response}) {
        const user = await User.find(params.id)
        if (!user) {
        return response.status(404).json({data: 'Resource not found'})
        }
        await user.delete()
        return response.status(204).json({'messages': 'data deleted'})
        }
}

module.exports = UserController
