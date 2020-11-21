# puts "Hello world! Greetings from Includehelp.com"
# sleep 5
# puts "bye"
# u=1
# puts(u)
# p="es"+u.to_s
# puts(p)
# puts(1.to_s+1.to_s)

i=0
u=0
d=0
c=0
while (i<999) do
    sleep 1
    u=u+1
    if(u==10)
        u=0
        d=d+1
    else
        if(d==10)
            u=0
            d=0
            c=c+1
        else
            if(c==10)
                u=9
                d=9
                c=9

            end
        end
    end
    puts(c.to_s+d.to_s+u.to_s)
    i=i+1
end
