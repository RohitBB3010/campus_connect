import fs from 'fs';

const deletePathFromFile = (filePath) => {
    
    try{
        if(fs.existsSync(filePath)){
            fs.unlinkSync(filePath);
        } else {
            console.log(`File at path "${filePath}" does not exist. Nothing to remove.`);
        }
    } catch (err) {
        console.error(`Error while attempting to remove file at "${filePath}":`, err.message);
    }
}

export default deletePathFromFile;