def biggerThan3 text
    return text.length > 3
end
def isMail mail
    return mail =~ /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
end