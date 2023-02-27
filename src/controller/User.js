import { db } from "../config/database.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

export async function signUp(req, res) {
    const {name, email, password, confirmPassword} = req.body;
    const hashPassword = bcrypt.hashSync(password, 10);
    const visitCount = 0;
    try {
        if(password !== confirmPassword){
            return res.sendStatus(422);
        }
        const emailTaken = await db.query(`
            SELECT * FROM "Users" 
            WHERE email = $1
        `,[email]);
        if(emailTaken.rows.length !== 0){
            return res.sendStatus(409);
        }
        await db.query(`
            INSERT INTO "Users" 
            (name,email,password,"visitCount","createdAt") 
            VALUES ($1,$2,$3,$4,NOW())
        `,[name, email, hashPassword, visitCount]);
        return res.sendStatus(201);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function signIn(req, res) {
    try {
        const {email, password} = req.body;
        const userExists = await db.query(`
            SELECT * FROM "Users" 
            WHERE email=$1
        `,[email]);
        if (!(userExists.rows.length === 0) && bcrypt.compareSync(password, userExists.rows[0].password)) {
            const token = uuid();
            await db.query(`
                DELETE FROM "Sessions" 
                WHERE "userId" = $1
            `,[userExists.rows[0].id]);
            await db.query(`
                INSERT INTO "Sessions" 
                (token,"userId","createdAt") 
                VALUES ($1, $2,NOW())
            `,[token,userExists.rows[0].id]);
            res.status(200).send({token});
        } else {
            return res.sendStatus(401);
        }
    } catch (err) {
        res.status(500).send(err.message);
    };
}

