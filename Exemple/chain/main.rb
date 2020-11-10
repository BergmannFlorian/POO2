require './chain/form'
require './chain/validation'

form = UserForm.new
form.addInputData('test@test.test')

p form.isValid?