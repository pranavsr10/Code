import multiprocess
import ray
def function(a):
    c = a*2
    return c


a = []
for i in range (0,10000000):
    a.append(i)
if __name__ == "__main__":
 with multiprocess.Pool(7) as pool:
    print(pool.map(function,a))

    
