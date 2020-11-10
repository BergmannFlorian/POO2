# --------------------------------------------------------------------------------------------------------------------
puts "---- Exe 1 (propre en trichant) ----"
# --------------------------------------------------------------------------------------------------------------------

def findAllFilePathsStartingWith starts, path
    listFile = []
    Dir.each_child(path){|elem|
        if File.file?(path+"/"+elem) 
            listFile << path+"/"+elem if elem.start_with?(starts)
        else
            listFile += findAllFilePathsStartingWith(starts, path+"/"+elem)
        end
    }
    listFile
end
listFile = findAllFilePathsStartingWith('read', 'C:/git/POO/POO2/test')
puts listFile

# --------------------------------------------------------------------------------------------------------------------
puts "---- Exe 2 (propre en trichant) ----"
# --------------------------------------------------------------------------------------------------------------------

def findAllFilePathsOfDepthStartingWith starts, path, fromDepth, toDepth, lvl=0
    listFile = []
    Dir.each_child(path){|elem|
        if File.file?(path+"/"+elem) 
            listFile << path+"/"+elem if (elem.start_with?(starts) && lvl >= fromDepth && lvl <= toDepth)
        else
            listFile += findAllFilePathsOfDepthStartingWith(starts, path+"/"+elem, fromDepth, toDepth, lvl+1)
        end
    }
    listFile
end
listFile = findAllFilePathsOfDepthStartingWith('read', 'C:/git/POO/POO2/test', 2, 3)
puts listFile

# --------------------------------------------------------------------------------------------------------------------
puts "---- Exe 2 v2 (sans tricher) ----"
# --------------------------------------------------------------------------------------------------------------------

def findAllFilePathsOfDepthStartingWithV2 starts, path, fromDepth, toDepth  
    return findAllFile(starts, path, fromDepth+path.count("/"), toDepth+path.count("/"))
end

def findAllFile starts, path, fromDepth, toDepth
    listFile = []
    Dir.each_child(path){|elem|
        if File.file?(path+"/"+elem)
            listFile << path+"/"+elem if (elem.start_with?(starts) && path.count("/") >= fromDepth && path.count("/") <= toDepth)
        else
            listFile += findAllFile(starts, path+"/"+elem, fromDepth, toDepth)
        end
    }
    listFile
end

listFile = findAllFilePathsOfDepthStartingWithV2('read', 'C:/git/POO/POO2/test', 2, 3)
puts listFile