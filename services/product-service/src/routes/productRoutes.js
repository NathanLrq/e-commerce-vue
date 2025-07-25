import express from 'express';
import * as productController from '../controllers/productController.js';

const router = express.Router();

router.get('/ping', (req, res) => {
  res.json({ message: 'Product service is reachable' });
});

router.get('/', productController.getAllProducts);
router.get('/:id', productController.getProductById);
router.post('/', productController.createProduct);
router.put('/:id', productController.updateProduct);
router.delete('/:id', productController.deleteProduct);

export default router;