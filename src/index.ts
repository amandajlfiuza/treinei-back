import express from "express";
import trainingsRouters from "./routers/trainings.routers.js";

const server = express();
server.use(express.json());
server.use(trainingsRouters);

server.get("/status", (req, res) => {
    res.send("ok");
});

const PORT: number = 4005;
server.listen(PORT, () => console.log(`Listening on port ${PORT}`));