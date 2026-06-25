const express = require("express");

const app = express();


app.use(express.static("public"));


app.get("/api", (req,res)=>{

    res.json({

        message:"Node application running"

    });

});


app.listen(3000,()=>{

    console.log("Server started");

});
