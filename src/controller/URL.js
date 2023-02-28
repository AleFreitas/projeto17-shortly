import { db } from "../config/database.js";
import { nanoid } from 'nanoid'

export async function postUrl(req, res) {
    const authorization = req.headers.authorization;
    const token = authorization.replace('Bearer ', '');
    const { url } = req.body;
    try {
        if (!token) {
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
        `, [url, shortUrl, userId]);
        const urlTable = await db.query(`
            SELECT id, "shortUrl" FROM "ShortenedUrls"
            WHERE "shortUrl" = $1   
        `, [shortUrl]);
        return res.status(201).send(urlTable.rows[0]);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function getUrlById(req, res) {
    try {
        const {id} = req.params;
        const query = await db.query(`
            SELECT id,"shortUrl",url FROM "ShortenedUrls"
            Where id=$1
        `,[id]);
        if(query.rows.length === 0){
            return res.sendStatus(404);
        }
        return res.status(200).send(query.rows[0]);
    } catch (err) {
        return res.status(500).send(err.message);
    }
}

export async function redirectToUrl(req,res){
    try{
        const {shortUrl} = req.params;
        const url = await db.query(`
            SELECT id,url,"userId","visitCount" FROM "ShortenedUrls"
            Where "shortUrl"=$1
        `,[shortUrl]);
        if(url.rows.length === 0){
            return res.sendStatus(404);
        }
        await db.query(`
            UPDATE "ShortenedUrls" 
            SET "visitCount"=$1
            WHERE id=$2
        `,[url.rows[0].visitCount+1, url.rows[0].id]);
        const user = await db.query(`
            SELECT "visitCount" FROM "Users"
            WHERE id=$1
        `,[url.rows[0].userId]);
        await db.query(`
            UPDATE "Users"
            SET "visitCount"=$1
            WHERE id=$2
        `,[user.rows[0].visitCount+1, url.rows[0].userId]);
        return res.redirect(url.rows[0].url);
    }catch(err){
        return res.status(500).send(err.message);
    }

}

export async function deleteShortUrl(req,res){
    try{
        const authorization = req.headers.authorization;
        const token = authorization.replace('Bearer ', '');
        const {id} = req.params;
        if(!token){
            return res.status(401);
        }
        const userExists = await db.query(`
            SELECT "userId" FROM "Sessions" 
            WHERE token=$1;
        `, [token]);
        if (userExists.rows.length === 0) {
            return res.sendStatus(401);
        }
        const urlExists = await db.query(`
            SELECT * FROM "ShortenedUrls" 
            WHERE id=$1;
        `, [id]);
        if(urlExists.rows.length === 0){
            return res.sendStatus(404);
        }
        if(urlExists.rows[0].userId === userExists.rows[0].userId){
            await db.query(`
                DELETE FROM "ShortenedUrls"
                WHERE id=$1
            `,[id]);
            return res.sendStatus(204);
        }else{
            return res.sendStatus(401);
        }
    }catch(err){
        return res.status(500).send(err.message);
    }
}

export async function getUserData(req,res){
    try{
        const authorization = req.headers.authorization;
        const token = authorization.replace('Bearer ', '');
        if(!token){
            return res.status(401);
        }
        const userExists = await db.query(`
            SELECT "userId" FROM "Sessions" 
            WHERE token=$1;
        `, [token]);
        if (userExists.rows.length === 0) {
            return res.sendStatus(401);
        }
        const user = await db.query(`
            SELECT id, name, "visitCount" FROM "Users"
            WHERE id=$1
        `,[userExists.rows[0].userId]);
        const urls = await db.query(`
            SELECT id,"shortUrl",url,"visitCount" FROM "ShortenedUrls"
            WHERE "userId"=$1
        `,[userExists.rows[0].userId]);
        const userData = user.rows[0];
        userData.shortenedUrls = urls.rows;
        res.send(userData);
    }catch(err){
        return res.status(500).send(err.message);
    }
}

export async function getRanking(req,res){
    try{
        const rankList = await db.query(`
            SELECT "Users".id,"Users".name,
            COUNT("ShortenedUrls".id) as "linksCount", "Users"."visitCount" 
            FROM "Users" 
            Left JOIN "ShortenedUrls" 
            ON "Users".id = "ShortenedUrls"."userId"
            GROUP BY "Users".id
            ORDER BY "Users"."visitCount" DESC, "Users"."createdAt" ASC
            LIMIT 10;
        `);
        res.status(200).send(rankList.rows);
    }catch(err){
        res.status(500).send(err.message);
    }
}