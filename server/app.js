import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import postRouter from ".";

async function init() {
  const app = express();
  const port = 4000;
  app.use(cors());
  app.use(bodyParser.json());
  app.use("/posts", postRouter);

  app.get("/", (req, res) => {
    res.send("Connected");
  });

  app.get("*", (req, res) => {
    res.status(404).send("NOT FOUND");
  });

  app.listen(port, () => {
    console.log(`Server is running at ${port}`);
  });
}

init();
