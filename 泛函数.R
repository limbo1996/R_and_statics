#%%
#calc function with flow control

calc <- function(x, y, type){
    if(type == 'add'){
        x + y
    }else if (type == 'minus'){
        x - y
    }else if (type == 'multiply'){
        x * y
    }else if (type == 'divide'){
        x / y
    }else {
        stop('Unknow type of operation')
    }
}
