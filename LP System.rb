=begin
LP System v0.0, by Feldherren (rpaliwoda@googlemail.com)

Running into error with collect method? Not touching it. Teak also wants to know what's weird.
=end
module LP
  # Default maximum LP values for actors and enemies; if no value is supplied in the notebox for either, actors and enemies will have these
  DEFAULT_ACTOR_LP = 6
  DEFAULT_ENEMY_LP = 2
  # whether or not to allow the use of LP for skills if character cannot afford normal resource cost entirely
  USE_LP_FOR_SKILLS = false
  # whether to recover LP from 0 when staying in an inn
  # whether to game-over if marked characters drop to 0 LP?
  # or maybe just do this as a notebox tag
  # match patterns for LP stuff
  MATCH_MAX_LP = /<maxLP:\s*(\d*)>/i
end

class Game_BattlerBase
  attr_reader   :lp
  
  def mlp;  param(8);   end
  
  alias :initialize_LP :initialize
  def initialize
    :initialize_LP
    @lp = 0
  end
  # should I add MLP to params, so param_base, param_plus, param_min et cetera can get at it?
  
  # this is just copying HP, MP methods
  def lp=(lp)
    @lp = lp
    refresh
  end
  
  # something like change_hp here? For events.
  
  # this is just copying HP, MP methods
  alias :refresh_LP :refresh
  def refresh
    @lp = [[@lp, mlp].min, 0].max
    :refresh_LP
  end
  
  # this is just copying HP, MP methods
  alias :recover_all_LP :recover_all
  def recover_all
    :recover_all_LP
    @lp = mlp
  end
end