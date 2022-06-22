import express, {Express} from "express";
import { router } from "./routes";

const app: Express = express();
app.use(express.json());
app.use(router)


app.listen('8080', ()=> {
    console.log("Server is runing at port 8080")
})