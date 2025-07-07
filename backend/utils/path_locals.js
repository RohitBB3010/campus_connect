import path, { dirname } from 'path';
import { fileURLToPath } from 'url';

const __fileName = fileURLToPath(import.meta.url);
const __dirname = dirname(__fileName);

const parentDir = path.resolve(__dirname, '..');

export default parentDir;