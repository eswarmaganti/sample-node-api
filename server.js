import express from "express";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.set("view engine", "ejs");

const PORT = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.render("index");
});

app.listen(PORT, () => {
  console.log(`*** Server is running on PORT ${PORT}`);
});
