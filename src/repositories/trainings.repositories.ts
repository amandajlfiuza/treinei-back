import prisma from "../database/db.js";

function insertTrainingTypeInDB (trained_muscle_groups: string[], exercises: string[]) {
    return prisma.training_types.create({
        data: {
            trained_muscle_groups: trained_muscle_groups,
            exercises: exercises
        },
    });
}

function insertTrainingStartedInDB (gym_name: string, type_id: number) {
    return prisma.trainings.create({
        data: {
            gym_name: gym_name,
            type_id: type_id
        },
    });
}

function updateTrainingInDB (end_timestamp: Date, did_all_the_exercises: boolean, id: number) {
    return prisma.trainings.update({
        where: {
            id: id,
        },
        data: {
            end_timestamp: end_timestamp,
            did_all_the_exercises: did_all_the_exercises
        },
    });
}

async function getTrainingInDB () {
    const response = await prisma.trainings.findMany();

    if (response.length !== 0) {
        return response;
    }

    return "There are no completed trainings";
}

export {
    insertTrainingTypeInDB,
    insertTrainingStartedInDB,
    updateTrainingInDB,
    getTrainingInDB
}