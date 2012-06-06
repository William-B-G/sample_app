module SessionsHelper
	def sign_in(user)
		# sign the user in
		cookies.permanent[:remember_token] =  user.remember_token
		# which is equivalent to the following code
		# cookies[:remember_token] = { value: user.remember_token,
		# 			expires: 20.years.from_now }

		current_user = user
	end

	def signed_in?
		!current_user.nil?		
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_remember_token
	end

	def sign_out
		current_user = nil
		cookies.delete(:remember_token)
	end

	private
		def user_from_remember_token
			remember_token = cookies[:remember_token]
			User.find_by_remember_token(remember_token) unless remember_token.nil?
		end	
end
