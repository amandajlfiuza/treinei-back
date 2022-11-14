import connection from "../database/db.js";

function insertTrainingTypeInDB (trained_muscle_groups, exercises) {
    return connection.query(`
        INSERT INTO
            training_types (trained_muscle_groups, exercises)
        VALUES
            ($1, $2) RETURNING id;
    `, [trained_muscle_groups, exercises]);
}

function insertTrainingStartedInDB (gym_name, type_id) {
    return connection.query(`
        INSERT INTO
            trainings (gym_name, type_id)
        VALUES
            ($1, $2) RETURNING id;
    `, [gym_name, type_id]);
}

function updateTrainingInDB (end_timestamp, did_all_the_exercises, id) {
    return connection.query(`
        UPDATE
            trainings
        SET
            end_timestamp = $1, did_all_the_exercises = $2
        WHERE
            id = $3;
    `, [end_timestamp, did_all_the_exercises, id]);
}

async function getTrainingInDB () {
    const response = await connection.query(`
        SELECT * FROM trainings;
    `);

    if (response.rows !== undefined) {
        return response.rows;
    }

    return "There are no completed trainings";
}

export {
    insertTrainingTypeInDB,
    insertTrainingStartedInDB,
    updateTrainingInDB,
    getTrainingInDB
}