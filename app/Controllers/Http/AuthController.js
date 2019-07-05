'use strict'

class AuthController {
    async postLoginJwt({ request, auth }) {
        const { email, password } = request.all()
        return auth
          .authenticator('jwt')
          .withRefreshToken()
          .attempt(email, password)
      }
      
      async getProfileJwt({ response, auth }) {
        return response.send(auth.current.user)
      }
      
      async postRefreshTokenJwt({ request, auth }) {
        const refreshToken = request.input('refresh_token')
        return await auth
          .newRefreshToken()
          .generateForRefreshToken(refreshToken)
      }
      
      async postLogoutJwt({ auth, response }) {
        const apiToken = auth.getAuthHeader()
        await auth
          .authenticator('jwt')
          .revokeTokens([apiToken])
        return response.send({ message: 'Logout successfully!'})
      }
}

module.exports = AuthController
