import express from "express";
import { insertTrainingTypes, insertTrainingStarted, finishTraining, getTrainingCount } from "../controllers/trainings.controllers.js";
import { trainingTypesValidation, trainingStartedValidation, trainingFinishedValidation } from "../middlewares/schemas.middlewares.js";

const router = express.Router();

router.post("/types", trainingTypesValidation, insertTrainingTypes);
router.post("/trainings", trainingStartedValidation, insertTrainingStarted);
router.put("/trainings/:id", trainingFinishedValidation, finishTraining);
router.get("/trainings/:start/:end", getTrainingCount);

export default router;