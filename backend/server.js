// server.js

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







// const express = require('express');
// const mongoose = require('mongoose');
// const bodyParser = require('body-parser');
// const cors = require('cors');
// const { OAuth2Client } = require('google-auth-library');

// const app = express();
// app.use(bodyParser.json());
// app.use(cors());

// // Replace with your MongoDB connection string
// mongoose.connect('mongodb://localhost:27017/flutter_login', {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });

// const UserSchema = new mongoose.Schema({
//   email: String,
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

// const oAuth2Client = new OAuth2Client('92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com');

// app.post('/login_with_google', async (req, res) => {
//   const { idToken } = req.body;
//   try {
//     const ticket = await oAuth2Client.verifyIdToken({
//       idToken,
//       audience: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com'// Replace with your client ID
//     });
//     const payload = ticket.getPayload();
//     const email = payload['email'];
//     // Check if the email exists in your database
//     const user = await User.findOne({ email });
//     if (user) {
//       res.status(200).send({ message: 'Login successful' });
//     } else {
//       // Create a new user with the provided email
//       const newUser = new User({ email });
//       await newUser.save();
//       res.status(200).send({ message: 'User created and logged in' });
//     }
//   } catch (error) {
//     console.error('Error verifying Google ID token:', error);
//     res.status(401).send({ message: 'Invalid Google ID token' });
//   }
// });

// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => {
//   console.log(`Server is running on port ${PORT}`);
// });
