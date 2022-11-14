type TrainingType = {
    trained_muscle_groups: string[],
    exercises: string[]
};

type Training = {
    start_timestamp: string | Date,
    end_timestamp: string | Date,
    gym_name: string,
    type_id: number,
    did_all_the_exercises: boolean
};

export {
    TrainingType,
    Training
};