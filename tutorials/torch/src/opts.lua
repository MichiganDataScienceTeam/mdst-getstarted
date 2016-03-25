projectDir = projectDir or '/scratch/jiadeng_flux/stroud/randomsearch'

local M = { }

function M.parse(arg)
    local cmd = torch.CmdLine()
    cmd:text()
    cmd:text(' ---------- General options ------------------------------------')
    cmd:text()
    cmd:option('-dataDir',  projectDir .. '/data', 'Data directory')
    cmd:option('-dataset',   'rectangle', 'Dataset choice rectangle | rectangle_im | convex')
    cmd:option('-manualSeed',         -1, 'Manually set RNG seed')
    cmd:option('-GPU',                -1, 'Default preferred GPU, if set to -1: no GPU')
    cmd:text()
    cmd:text(' ---------- Model options --------------------------------------')
    cmd:text()
    cmd:option('-filterSize',          3, 'Filter size')
    cmd:option('-poolingType',     'max', 'Pooling type')
    cmd:option('-activationFn',   'relu', 'Activation function relu | sigmoid')
    cmd:option('-nHidden1',           16, 'Number of channels, conv layer 1')
    cmd:option('-nHidden2',           32, 'Number of channels, conv layer 2')
    cmd:option('-nHidden3',           16, 'Number of channels, conv layer 3')
    cmd:option('-nHidden4',          200, 'Number of channels, fc layer 4')
    cmd:option('-nHidden5',          100, 'Number of channels, fc layer 5')
    cmd:text()
    cmd:text(' ---------- Hyperparameter options -----------------------------')
    cmd:text()
    cmd:option('-dropoutRatio',      0.5, 'Dropout ratio')
    cmd:option('-LR',             2.5e-4, 'Learning rate')
    cmd:option('-LRdecay',           0.0, 'Learning rate decay')
    cmd:option('-momentum',         0.95, 'Momentum')
    cmd:option('-weightDecay',      1e-5, 'Weight decay')
    cmd:option('-optMethod',   'rmsprop', 'Optimization method: sgd | nag | adadelta')
    cmd:text()
    cmd:text(' ---------- Training options -----------------------------------')
    cmd:text()
    cmd:option('-nEpochs',           100, 'Total number of epochs to run')
    cmd:option('-batchSize',          32, 'Mini-batch size (1 = pure stochastic)')
    cmd:text()
    cmd:text(' ---------- Testing options ------------------------------------')
    cmd:text()
    cmd:option('-testBatchSize',       1, 'Mini-batch size for testing/validation')
    cmd:text()
    cmd:text(' ---------- Data options ---------------------------------------')
    cmd:text()
    cmd:option('-inputRes',           28, 'Input image resolution')
    cmd:option('-nTrain',           1000, 'Number of training samples')
    cmd:option('-nValid',            200, 'Number of validation samples')
    cmd:option('-nTest',            1000, 'Number of test samples')
    
    local opt = cmd:parse(arg or {})
    opt.dataDir = paths.concat(opt.dataDir, opt.dataset)
    return opt
end

return M