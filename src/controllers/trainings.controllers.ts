import { Request, Response } from "express";
import { TrainingType, TrainingStarted, TrainingFinished } from "../protocols/types.protocols.js";
import { insertTrainingTypeInDB, insertTrainingStartedInDB, updateTrainingInDB, getTrainingInDB } from "../repositories/trainings.repositories.js";

async function insertTrainingTypes(req: Request, res: Response) {
    const { trained_muscle_groups, exercises } = req.body as TrainingType;

    try {
        const response = await insertTrainingTypeInDB(trained_muscle_groups, exercises);
        return res.status(201).send(response);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function insertTrainingStarted(req: Request, res: Response) {
    const { gym_name, type_id } = req.body as TrainingStarted;

    try {
        const response = await insertTrainingStartedInDB(gym_name, type_id);
        return res.status(201).send(response.rows[0]);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function finishTraining(req: Request, res: Response) {
    const end_timestamp = new Date();
    const { did_all_the_exercises } = req.body as TrainingFinished;
    const { id } = req.params;

    try {
        await updateTrainingInDB(end_timestamp, did_all_the_exercises, id);
        return res.sendStatus(200);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function getTrainingCount(req: Request, res: Response) {
    const { start, end } = req.params;
    const start_date = new Date(start);
    const end_date = new Date(end);



    //try {
        const response = await getTrainingInDB();
        return res.send(response);

        // if (response === "There are no completed trainings") {
        //     return res.status(200).send(response);
        // }

        // const filterTraining = response.filter(training => (training.end_timestamp >= start_date && training.end_timestamp <= end_date));
        // return res.status(200).send(`${filterTraining.length} trainings were completed in this period`);

    // } catch (error) {
    //     return res.status(500).send(error);
    // }
}

export {
    insertTrainingTypes,
    insertTrainingStarted,
    finishTraining,
    getTrainingCount
}