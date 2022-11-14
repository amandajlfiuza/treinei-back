import express from "express";
import { insertTrainingTypes, insertTrainingCompleted, getTrainingCount } from "../controllers/trainings.controllers.js";

const router = express.Router();

router.post("/types", insertTrainingTypes);
router.post("/trainings", insertTrainingCompleted);
router.get("/trainings", getTrainingCount);

export default router;