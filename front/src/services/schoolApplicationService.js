import apiClient from './apiClient';

export const createApplication = async (applicationData) => {
  const response = await apiClient.post('/applications', applicationData); // Matches router.post('/')
  return response.data;
};

export const getMyApplications = async () => {
  const response = await apiClient.get('/applications'); // Matches router.get('/')
  return response.data;
};

export const getApplicationById = async (id) => {
  const response = await apiClient.get(`/applications/${id}`);
  return response.data;
};

export const getActivePeriod = async () => {
  const response = await apiClient.get('/applications/active-period');
  return response.data;
};


