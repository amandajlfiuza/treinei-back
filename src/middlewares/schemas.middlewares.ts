import joi from "joi";
import { Request, Response, NextFunction } from "express";

const TrainingTypeSchema = joi.object({
    trained_muscle_groups: joi.array().required(),
    exercises: joi.array().required()
});

const TrainingStartedSchema = joi.object({
    gym_name: joi.string().required(),
    type_id: joi.number().required()
});

const TrainingFinishedSchema = joi.object({
    did_all_the_exercises: joi.boolean().required()
});

function trainingTypesValidation (req: Request, res: Response, next: NextFunction) {
    const validation = TrainingTypeSchema.validate(req.body, {abortEarly: false});

    if (validation.error) {
        const errors = validation.error.details.map(details => details.message);
        return res.status(422).send(errors);
    }

    next();
}

function trainingStartedValidation (req: Request, res: Response, next: NextFunction) {
    const validation = TrainingStartedSchema.validate(req.body, {abortEarly: false});

    if (validation.error) {
        const errors = validation.error.details.map(details => details.message);
        return res.status(422).send(errors);
    }

    next();
}

function trainingFinishedValidation (req: Request, res: Response, next: NextFunction) {
    const validation = TrainingFinishedSchema.validate(req.body, {abortEarly: false});

    if (validation.error) {
        const errors = validation.error.details.map(details => details.message);
        return res.status(422).send(errors);
    }

    next();
}

export {
    trainingTypesValidation,
    trainingStartedValidation,
    trainingFinishedValidation
}