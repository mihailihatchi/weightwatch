# To change this template, choose Tools | Templates
# and open the template in the editor.

@weights = Weight.all
@weights.each  { |w| puts w.weight  }