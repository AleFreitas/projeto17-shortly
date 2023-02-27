import { db } from "../config/database.js";
import { nanoid } from 'nanoid'

export async function postUrl(req, res) {
    const authorization = req.headers.authorization;
    const token = authorization.replace('Bearer ', '');
    const { url } = req.body;
    try {
        if(!token){
            return res.sendStatus(401);
        }
        const userExists = await db.query(`
            SELECT "userId" FROM "Sessions" 
            WHERE token=$1;
        `, [token]);
        if (userExists.rows.length === 0) {
            return res.sendStatus(401);
        }
        const userId = userExists.rows[0].userId;
        const shortUrl = nanoid();
        await db.query(`
            INSERT INTO "ShortenedUrls" 
            (url,"visitCount","shortUrl","userId","createdAt")
            VALUES ($1,0,$2,$3,NOW())
        `,[url,shortUrl,userId]);
        const urlTable = await db.query(`
            SELECT id, "shortUrl" FROM "ShortenedUrls"
            WHERE "shortUrl" = $1   
        `,[shortUrl]);
        return res.send(urlTable.rows[0])
    } catch (err) {
        return res.status(500).send(err.message);
    }
}