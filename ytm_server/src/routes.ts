import { Router } from "express";
import YTMusic from "ytmusic-api";

const ytmusic = new YTMusic().initialize();
export const router = Router()

router.get('/search/:text', async (req, res)=> {
    const searchResult = await (await ytmusic).search('search' + req.params.text)
    res.send(searchResult);
} )


router.get('/getSearchSuggestions', async (req, res) => {
    const searchResult = await (await ytmusic).getSearchSuggestions('Home')
    res.send(searchResult);
})