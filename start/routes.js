'use strict'

const Route = use('Route')

Route.get('/', () => {
  return { greeting: 'Hello world in JSON' }
})

Route.group(()=>{
  Route.get('users', 'UserController.index').middleware(['auth:jwt'])
  Route.get('users/withroom', 'UserController.showwithroom').middleware(['auth:jwt'])
  Route.get('users/:id', 'UserController.show').middleware(['auth:jwt'])
  Route.post('users','UserController.store')
  Route.put('users/:id', 'UserController.update').middleware(['auth:jwt'])
  Route.delete('users/:id', 'UserController.delete').middleware(['auth:jwt'])

  
}).prefix('api/')

Route.group(()=>{
  Route.get('chats', 'ChatController.index')
  Route.get('chats/:id', 'ChatController.show')
  Route.get('chats/byroom/:id', 'ChatController.showbyroom')
  Route.post('chats','ChatController.store')
  Route.put('chats/:id', 'ChatController.update')
  Route.delete('chats/:id', 'ChatController.delete')

  Route.get('rooms', 'RoomController.index')
  Route.get('rooms/:id', 'RoomController.show')
  Route.post('rooms','RoomController.store')
  Route.put('rooms/:id', 'RoomController.update')
  Route.delete('rooms/:id', 'RoomController.delete')
}).prefix('api/').middleware(['auth:jwt'])
Route.group(() => {
  Route.post('login', 'AuthController.postLoginJwt').as('loginJwt')
  Route.post('refresh', 'AuthController.postRefreshTokenJwt').as('refreshTokenJwt').middleware(['auth:jwt'])
  Route.post('logout', 'AuthController.postLogoutJwt').as('loginJwt').middleware(['auth:jwt'])
  Route.get('profile', 'AuthController.getProfileJwt').as('profileJwt').middleware(['auth:jwt'])
}).prefix('api/auth')