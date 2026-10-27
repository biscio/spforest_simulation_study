from HidKim_APP import augmented_permanental_process as APP
from HidKim_APP import parameter_initializer as p_init
from scipy.interpolate import LinearNDInterpolator
import math
from pylab import *
import numpy as np
np.math = math
import pandas as pd

def runapp(data, section='41'):
  w = np.array([1/3, 1/2, 1, 2, 3])
  a, b = meshgrid(w, w)
  if section == '41':
    tmesh = np.array([ravel(a)] + 2 * [ravel(b)]).T
  if section == '42' or section == '43':
    tmesh = np.array([ravel(a)] + 10 * [ravel(b)]).T 
  
  # sheets = [xls.parse(i).to_numpy() for i in xls.sheet_names[:4]]
  # data = {"t":foot.to_numpy(), "cov":foocov.to_numpy(), "spk":foospk.to_numpy().tolist(), "spk_cov":foospk_cov.to_numpy(), "obs":[[0,1],[0,1]]}
  data['spk'] = data['spk'].tolist()
  data["obs"] = [[0,1],[0,1]]
  lin = LinearNDInterpolator(data['t'], data['cov'], fill_value=0)
  init_par = p_init(data['spk'], data['obs'], lin(data['spk']))
  
  # set_par = np.array([ravel(a), ravel(b), ravel(b)]).T * init_par
  set_par = tmesh * init_par

  model = APP(kernel='Gaussian', eq_kernel='RFM',eq_kernel_options={'cov_sampler':'Sobol', 'n_cov':1500, 'n_rfm':100})
  model.fit(data['spk'], data['obs'], lin, set_par)
  # _ = model.fit(data['spk'], data['obs'], fun_cov, set_par)

  r1 = model.predict(data['spk_cov'], conf_int=[0.5])
  r_med = model.predict(data['cov'], conf_int=[0.5])
  
  cov = data['cov']

  return r_med[0]


#  
# def runapp42(data, alpha, beta):
#   w = np.array([1/3, 1/2, 1, 2, 3])
#   a, b = meshgrid(w, w)
#   tmesh = np.array([ravel(a)] + 10 * [ravel(b)]).T 
#   
#   # sheets = [xls.parse(i).to_numpy() for i in xls.sheet_names[:4]]
#   # data = {"t":foot.to_numpy(), "cov":foocov.to_numpy(), "spk":foospk.to_numpy().tolist(), "spk_cov":foospk_cov.to_numpy(), "obs":[[0,1],[0,1]]}
#   data['spk'] = data['spk'].tolist()
#   data["obs"] = [[0,1],[0,1]]
#   lin = LinearNDInterpolator(data['t'], data['cov'], fill_value=0)
#   init_par = p_init(data['spk'], data['obs'], lin(data['spk']))
#   
#   # set_par = np.array([ravel(a), ravel(b), ravel(b)]).T * init_par
#   set_par = tmesh * init_par
# 
#   model = APP(kernel='Gaussian', eq_kernel='RFM',eq_kernel_options={'cov_sampler':'Sobol', 'n_cov':1500, 'n_rfm':100})
#   model.fit(data['spk'], data['obs'], lin, set_par)
#   # _ = model.fit(data['spk'], data['obs'], fun_cov, set_par)
# 
#   r1 = model.predict(data['spk_cov'], conf_int=[0.5])
#   r_med = model.predict(data['cov'], conf_int=[0.5])
#   
#   cov = data['cov']
#   rmiae = abs(r_med[0] - alpha*exp(beta*(cov[:,0] + cov[:,1]*cov[:,2]/2 + exp(cov[:,3])/6 + cov[:,4]**2/2 + 3*sin(cov[:,5])))).sum()/128**2
#   
#   return rmiae
