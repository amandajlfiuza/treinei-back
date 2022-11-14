import { Request, Response } from "express";
import { TrainingType, Training } from "../protocols/types.protocols.js";

function insertTrainingTypes(req: Request, res: Response) {
    const trainingType = req.body as TrainingType;

}
function insertTrainingCompleted(req: Request, res: Response) {
    const training = req.body as Training;

}
function getTrainingCount(req: Request, res: Response) {

}

export {
    insertTrainingTypes,
    insertTrainingCompleted,
    getTrainingCount
}