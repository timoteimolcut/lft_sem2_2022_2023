from turtle import *
color('red', 'yellow')
# begin_fill()
# while True:

degree = 90
length = 100
for a in range(10):
    left(a/2*degree)
    for _ in range(4):
        forward(a*length)
        left(degree)


    # if abs(pos()) < 1:
        # break
# end_fill()
done()