class AdmincontrollerController < ApplicationController
def adminhome

end
def adminrole
 @details=Detail.find(:all)
end
end
