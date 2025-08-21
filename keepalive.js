const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("✅ n8n Keepalive Server Running!");
});

// Health check endpoint
app.get("/ping", (req, res) => {
  res.send("pong");
});

app.listen(3000, () => {
  console.log("🚀 Keepalive server running on port 3000");
});
