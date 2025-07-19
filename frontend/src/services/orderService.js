import axios from 'axios';

const API_URL = import.meta.env.VITE_ORDER_SERVICE_URL || '/api/orders';

export const orderService = {
  // Récupérer toutes les commandes
  getOrders: async () => {
    const token = localStorage.getItem('token');
    const response = await axios.get(`${API_URL}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  },

  // Créer une nouvelle commande
  createOrder: async (orderData) => {
    const token = localStorage.getItem('token');
    const response = await axios.post(`${API_URL}`, orderData, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  },

  // Mettre à jour le statut d'une commande
  updateOrderStatus: async (orderId, status) => {
    const token = localStorage.getItem('token');
    const response = await axios.patch(
      `${API_URL}/${orderId}/status`,
      { status },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );
    return response.data;
  },
};
