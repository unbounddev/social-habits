import {pb} from './pb'

export let loggedIn = pb.authStore.isValid
export let user = null

if loggedIn
	user = pb.authStore.record

pb.authStore.onChange do(token, record)
	loggedIn = pb.authStore.isValid
	if loggedIn
		user = record
	else
		user = null

export def login usernameOrEmail, password
	await pb.collection('users').authWithPassword(usernameOrEmail, password)
export def logout
	pb.authStore.clear()