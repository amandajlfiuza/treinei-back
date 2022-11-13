import express from "express";
import trainingsRouters from "./routers/trainings.routers.js";

const server = express();
server.use(express.json());
server.use(trainingsRouters);

server.get("/status", (req, res) => {
    res.send("ok");
});

server.listen(4000, () => console.log("Listening on port 4000"));