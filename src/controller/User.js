import { db } from "../config/database.js";

export async function signUp(req, res) {
    const {name, email, password, confirmPassword} = req.body;
    const visitCount = 0;
    try {
        if(password !== confirmPassword){
            return res.sendStatus(422);
        }
        const emailTaken = await db.query(`SELECT * FROM "Users" WHERE email = $1`,[email]);
        if(emailTaken.rows.length !== 0){
            return res.sendStatus(409);
        }
        await db.query(`INSERT INTO "Users" (name,email,password,"visitCount","createdAt") VALUES ($1,$2,$3,$4,NOW())`,[name, email, password, visitCount]);
        return res.sendStatus(201);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}