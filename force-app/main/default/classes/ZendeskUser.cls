public class ZendeskUser {
	public List<Users> users;
	public String next_page;
	public String previous_page;
	public Integer count;

	public class Thumbnails {
		public String url;
		public Long id;
		public String file_name;
		public String content_url;
		public String mapped_content_url;
		public String content_type;
		public Integer size;
		public Integer width;
		public Integer height;
		public Boolean inline;
		public Boolean deleted;
	}

	public class Photo {
		public String url;
		public Long id;
		public String file_name;
		public String content_url;
		public String mapped_content_url;
		public String content_type;
		public Integer size;
		public Integer width;
		public Integer height;
		public Boolean inline;
		public Boolean deleted;
		public List<Thumbnails> thumbnails;
	}

	public class Users {
		public Long id;
		public String url;
		public String name;
		public String email;
		public String created_at;
		public String updated_at;
		public String time_zone;
		public String iana_time_zone;
		public String phone;
		public String shared_phone_number;
		public Photo photo;
		public Integer locale_id;
		public String locale;
		public Long organization_id;
		public String role;
		public Boolean verified;
		public String external_id;
		public List<Tags> tags;
		public String alias;
		public Boolean active;
		public Boolean shared;
		public Boolean shared_agent;
		public String last_login_at;
		public String two_factor_auth_enabled;
		public String signature;
		public String details;
		public String notes;
		public Integer role_type;
		public Long custom_role_id;
		public Boolean moderator;
		public String ticket_restriction;
		public Boolean only_private_comments;
		public Boolean restricted_agent;
		public Boolean suspended;
		public Long default_group_id;
		public Boolean report_csv;
		public Tags user_fields;
	}

	public class Tags {
	}

	
	public static ZendeskUser parse(String json) {
		return (ZendeskUser) System.JSON.deserialize(json, ZendeskUser.class);
	}

}