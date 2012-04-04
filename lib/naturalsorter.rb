require "naturalsorter/version"
require "natcmp"
require "versioncmp"

# naturalsorter.rb
#
# Natural order sorting for an array of strings or more advanced objects
#
# This implementation is Copyright (C) 2012 by Robert Reiz
#
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.

module Naturalsorter
  
  class Sorter
  
    # 'Natural order' sort for an simple string array
    def self.sort(array, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a,b,caseinsesitive) }
    end
    
    def self.sort_desc(array, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a, b| Natcmp.natcmp(b,a,caseinsesitive) }
    end
    
    
    # 'Natural order' sort for an array of objects. 
    def self.sort_by_method(array, method, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a.send(method),b.send(method),caseinsesitive) }
    end
    
    def self.sort_by_method_desc(array, method, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a, b| Natcmp.natcmp(b.send(method),a.send(method),caseinsesitive) }
    end    
    
    
    def self.sort_version(array)
      return nil if (array.nil? || array.empty?)
      array.sort { |a,b| Versioncmp.compare( a, b ) }
    end
    
    def self.sort_version_desc(array)
      return nil if (array.nil? || array.empty?)
      array.sort { |a,b| Versioncmp.compare( b, a ) }
    end
    
    
    
    def self.sort_version_by_method(array, method)
      return nil if (array.nil? || array.empty?)
      array.sort { |a,b| Versioncmp.compare(a.send(method), b.send(method)) }
    end
    
    def self.sort_version_by_method_desc(array, method)
      return nil if (array.nil? || array.empty?)
      array.sort { |a,b| Versioncmp.compare(b.send(method), a.send(method)) }
    end
    
    
    
    def self.get_newest_version(first, second)
      array = [first, second]
      array = array.sort { |a,b| Versioncmp.compare( a, b ) }
      array.last
    end
    
    def self.is_version_current?(version, current_version)
      version = version.gsub("~>", "")
      versions = version.split(".")
      currents = current_version.split(".")
      min_length = versions.size
      if currents.size < min_length
        min_length = currents.size
      end
      min_length = min_length - 2
      if min_length < 0
        min_length = 0
      end      
      (0..min_length).each do |z|
        ver = versions[z]
        cur = currents[z]
        if (cur > ver)
          return false
        end
      end
      if currents.size < versions.size
        ver = versions[min_length + 1]
        cur = currents[min_length + 1]
        if cur > ver
          return false
        end
      end
      true
    end
  
  end
  
end