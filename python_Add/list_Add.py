__author__ = 'Azure_figure'

numbers = range(10)
size = len(numbers)
evens = []
i = 0
while i < size:
    if i % 2 == 1:
        evens.append(i)
    i += 1
print evens

#
a = [i for i in range(10) if i % 2 == 0]

print a
