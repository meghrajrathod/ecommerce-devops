const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const users = [
  { id: 1, name: "Meghraj", role: "DevOps Engineer" },
  { id: 2, name: "John", role: "Developer" }
];

app.get('/users', (req, res) => {
  res.json(users);
});

app.get('/', (req, res) => {
  res.send("User Service is running");
});

app.listen(3000, () => {
  console.log("User Service running on port 3000");
});
