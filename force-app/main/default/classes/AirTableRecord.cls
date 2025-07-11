public class AirTableRecord {
	public class Fields {
		public String District_Emails;
		public String Benchmarks;
		public String SFTP;
		public String Districts;
		public String Workdocs;
		public String SFTP_Frequency;
	}

	public List<Records> records;
	public String offset;

	public class Records {
		public String id;
		public String createdTime;
		public Fields fields;
	}

	public class Fields_Z {
		public String District_Emails;
		public String School;
		public String Benchmarks;
		public String Districts;
		public String School_Emails;
		public String Workdocs;
		public String Teacher_Names;
		public String Teachers_Email;
		public String Frequency;
	}

	
	public static AirTableRecord parse(String json) {
		return (AirTableRecord) System.JSON.deserialize(json, AirTableRecord.class);
	}
}