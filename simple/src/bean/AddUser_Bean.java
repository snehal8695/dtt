package bean;

public class AddUser_Bean {
	
	private int UD_Id;
	private int User_Id;
	
	public int getUD_Id() {
		return UD_Id;
	}
	public int getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(int user_Id) {
		User_Id = user_Id;
	}
	public void setUD_Id(int UD_Id) {
		this.UD_Id = UD_Id;
	}
	private String name , aliesname , contact , email , password ,role; 
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setName( String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return name;
	}
	public String getAliesname() {
		return aliesname;
	}
	public void setAliesname(String aliesname) {
		this.aliesname = aliesname;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
