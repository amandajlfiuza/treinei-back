type TrainingType = {
    trained_muscle_groups: string[],
    exercises: string[]
};

type TrainingStarted = {
    gym_name: string,
    type_id: number
};

type TrainingFinished = {
    did_all_the_exercises: boolean
};

export {
    TrainingType,
    TrainingStarted,
    TrainingFinished
};