import mongoose from "mongoose";

const connectDB = async () => {
	try {
		const con = "mongodb+srv://burak123:burak123@clustere.ifmabdj.mongodb.net/threads?retryWrites=true&w=majority";
		const conn = await mongoose.connect(con, {
			// To avoid warnings in the console
			useNewUrlParser: true,
			useUnifiedTopology: true,
		});

		console.log(`MongoDB Connected: ${conn.connection.host}`);
	} catch (error) {
		console.error(`Error: ${error.message}`);
		process.exit(1);
	}
};

export default connectDB;
