import express from "express";
import cors from "cors";
import trainingsRouters from "./routers/trainings.routers.js";
var server = express();
server.use(cors());
server.use(express.json());
server.use(trainingsRouters);
server.get("/status", function (req, res) {
    res.send("ok");
});
server.listen(4000, function () { return console.log("Listening on port 4000"); });
