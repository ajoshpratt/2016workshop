import numpy 

def pull_data(n_iter, iter_group):
    '''
    This function reshapes the progress coordinate and 
    auxiliary data for each iteration and retuns it to
    the tool.
    '''

    pcoord  = iter_group['pcoord'][:,:,0]
    
    data = pcoord[:,:,numpy.newaxis]

    #auxdata = iter_group['auxdata']['end_to_end_dist'][...]
    #pcoord  = iter_group['pcoord'][:,:,0]
    
    #data = numpy.dstack( (pcoord, auxdata) )

    return data

def pull_data_assign(n_iter, iter_group):
    '''
    This function reshapes the progress coordinate and 
    auxiliary data for each iteration and retuns it to
    the tool.
    '''

    pcoord  = iter_group['pcoord'][:,:,0]
    
    data = pcoord[:,:,numpy.newaxis]

    return data
