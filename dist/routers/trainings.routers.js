import express from "express";
import { insertTrainingCompleted, getTrainingCount } from "../controllers/trainings.controllers.js";
var router = express.Router();
router.post("/trainings", insertTrainingCompleted);
router.get("/trainings", getTrainingCount);
export default router;
