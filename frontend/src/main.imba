import PocketBase from 'pocketbase';
# global css body c:warm2 bg:warm8 ff:Arial

const pb = new PocketBase('http://127.0.0.1:8090')

let loggedIn = pb.authStore.isValid

pb.authStore.onChange do(token, record)
	loggedIn = pb.authStore.isValid


def login usernameOrEmail, password
		const authData = await pb.collection('users').authWithPassword(usernameOrEmail, password);
def logout
	pb.authStore.clear()

tag App
	<self>
		<div> "Logged in: {loggedIn}"
		<button @click=logout> "Log Out"

imba.mount <App>
