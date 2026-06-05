import {login} from "./auth"
export default tag Login
	def handleSubmit(e\SubmitEvent)
		e.preventDefault()
		if !$email.value.trim() or !$password.value.trim()
			return
		try
			await login($email.value.trim(), $password.value.trim())
			# clear inputs after successful login
			$email.value = ""
			$password.value = ""
		catch e
			# TODO: show that login failed
			console.log("Could not log in")
		

	<self>
		<form @submit=handleSubmit>
			<label> "Email"
			<input$email> 
			<label> "Password"
			<input$password type="password">
			<button type="submit"> "Login"