// server.js
// // server.js

const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

mongoose.connect('mongodb://localhost:27017/flutter_login', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const UserSchema = new mongoose.Schema({
  name: String,
  phone: String,
  email: { type: String, unique: true },
  dob: String,
  password: String,
});

const User = mongoose.model('User', UserSchema);

app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email, password });
  if (user) {
    res.status(200).send({ message: 'Login successful' });
  } else {
    res.status(401).send({ message: 'Invalid credentials' });
  }
});

app.post('/google-login', async (req, res) => {
  const { email, name } = req.body;
  let user = await User.findOne({ email });

  if (!user) {
    user = new User({ name, email });
    await user.save();
  }

  res.status(200).send({ message: 'Google Login successful' });
});

app.post('/register', async (req, res) => {
  const { name, phone, email, dob, password } = req.body;
  try {
    const user = new User({ name, phone, email, dob, password });
    await user.save();
    res.status(200).send({ message: 'Registration successful' });
  } catch (error) {
    res.status(400).send({ message: 'Registration failed', error });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});










// const express = require('express');
// const mongoose = require('mongoose');
// const bodyParser = require('body-parser');
// const cors = require('cors');
// const nodemailer = require('nodemailer');
// const randomize = require('randomatic'); // For OTP generation
// require('dotenv').config(); // Load environment variables

// const app = express();
// app.use(bodyParser.json());
// app.use(cors());

// mongoose.connect('mongodb://localhost:27017/flutter_login', {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });

// const UserSchema = new mongoose.Schema({
//   name: String,
//   phone: String,
//   email: { type: String, unique: true },
//   dob: String,
//   password: String,
//   otp: String, // New field for storing OTP
//   otpExpiry: Date, // New field for OTP expiration
// });

// const User = mongoose.model('User', UserSchema);

// // Nodemailer configuration
// const transporter = nodemailer.createTransport({
//   service: 'Gmail', // Replace with your email service provider
//   auth: {
//     user: process.env.EMAIL_USER, // Your email address from .env
//     pass: process.env.EMAIL_PASS // Your email password from .env
//   }
// });

// // Function to send OTP email
// async function sendOTPEmail(email, otp) {
//   try {
//     // Send email with defined transport object
//     let info = await transporter.sendMail({
//       from: process.env.EMAIL_USER, // Sender address
//       to: email, // List of receivers
//       subject: 'OTP Verification', // Subject line
//       text: `Your OTP for registration is: ${otp}` // Plain text body
//     });

//     console.log('Email sent: %s', info.messageId);
//     return true;
//   } catch (error) {
//     console.error('Error sending email:', error);
//     return false;
//   }
// }

// // Endpoint to generate OTP and send email
// app.post('/generate-otp', async (req, res) => {
//   const { email } = req.body;

//   try {
//     // Generate OTP
//     const otp = randomize('0', 6); // Generate 6-digit OTP
//     const otpExpiry = new Date(); // OTP expiration time (e.g., 5 minutes)
//     otpExpiry.setMinutes(otpExpiry.getMinutes() + 5); // Expiry after 5 minutes

//     // Update user with OTP and OTP expiry
//     await User.findOneAndUpdate({ email }, { otp, otpExpiry });

//     // Send OTP via email
//     await sendOTPEmail(email, otp);

//     res.status(200).send({ message: 'OTP sent successfully' });
//   } catch (error) {
//     console.error('Error generating OTP:', error);
//     res.status(500).send({ message: 'Failed to generate OTP' });
//   }
// });

// // Endpoint to register user with OTP verification
// app.post('/register', async (req, res) => {
//   const { name, phone, email, dob, password, enteredOTP } = req.body;

//   try {
//     // Find user by email
//     const user = await User.findOne({ email });

//     // Check if OTP matches and is not expired
//     if (!user || user.otp !== enteredOTP || user.otpExpiry < new Date()) {
//       return res.status(400).send({ message: 'Invalid OTP' });
//     }

//     // Create new user
//     const newUser = new User({ name, phone, email, dob, password });
//     await newUser.save();

//     // Clear OTP fields after successful registration
//     await User.findOneAndUpdate({ email }, { otp: '', otpExpiry: null });

//     res.status(200).send({ message: 'Registration successful' });
//   } catch (error) {
//     console.error('Error registering user:', error);
//     res.status(500).send({ message: 'Registration failed' });
//   }
// });

// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => {
//   console.log(`Server is running on port ${PORT}`);
// });












// const express = require('express');
// const mongoose = require('mongoose');
// const bodyParser = require('body-parser');
// const cors = require('cors');

// const app = express();
// app.use(bodyParser.json());
// app.use(cors());

// mongoose.connect('mongodb://localhost:27017/flutter_login', {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });

// const UserSchema = new mongoose.Schema({
//   name: String,
//   phone: String,
//   email: { type: String, unique: true },
//   dob: String,
//   password: String,
// });

// const User = mongoose.model('User', UserSchema);

// app.post('/login', async (req, res) => {
//   const { email, password } = req.body;
//   const user = await User.findOne({ email, password });
//   if (user) {
//     res.status(200).send({ message: 'Login successful' });
//   } else {
//     res.status(401).send({ message: 'Invalid credentials' });
//   }
// });

// app.post('/register', async (req, res) => {
//   const { name, phone, email, dob, password } = req.body;
//   try {
//     const user = new User({ name, phone, email, dob, password });
//     await user.save();
//     res.status(200).send({ message: 'Registration successful' });
//   } catch (error) {
//     res.status(400).send({ message: 'Registration failed', error });
//   }
// });

// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => {
//   console.log(`Server is running on port ${PORT}`);
// });








