import Login from './login'
import {loggedIn, logout, user} from './auth'
# global css body c:warm2 bg:warm8 ff:Arial

tag App
	<self>
		if loggedIn
			<div> "Hello {user.name or user.email}"
			<button @click=logout> "Log Out"
		else
			<Login>


imba.mount <App>
