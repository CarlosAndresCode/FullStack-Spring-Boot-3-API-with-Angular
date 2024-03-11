App requirements

* App user:
	1. User new user (Unique email address)
		* Account verification (Verify email address)
		* User profile image
		* User details (name, email, position, bio, phone, address, etc)
		* Being able to update user details information
	
	2. User reset password (Without begin logged in)
		* Password reset link should expire within 24 hours

	3. User login (Using email and password)
		* Token based authentication JWT Token
		* Refresh Token seamlessly

	4. Brute force attack mitigation (Account lock machanism)
		* Lock account on 3 failed login attempts

	5. Role and Permission based application access (ACL)

		* Protect app resources using roles and permission
	
	6. Two-factor authentication (Using user phone number)
		* Send verifitation code to user's phone

	7. Kee tack of user activities (Login, account change, etc)
		*Ability to report suspicious activities

		*Tracking information (Ip Address, Device, Browser, Date, Type)

* App Customers

	1. Customer information
		* Manage customer information (name,addres, etc)
		* Customer can b a erson or an institution
		* Customer should have a status
		* Customer will have invoices
		* Print customers in spreadsheet
	2. Search Customers
		* Be able to search customers by name

* App Invoices
	1. Manage invoices
		* Create new invoices
		* Add invoics to customer
		* Print invoices for mailing
		* Prnnt invoices in spreadsheet
		* Download invoices as PDF

  
