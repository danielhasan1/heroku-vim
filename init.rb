require 'heroku/helpers'
require 'heroku/command'
require 'heroku/command/run'

class Heroku::Command::Vim < Heroku::Command::Run

  # vim
  # 
  # Run bash on heroku with vim
  #  
  def index
    run_attached(vim_cmd)
  end

  protected

  def vim_cmd
    <<-CMD
mkdir /app/nano
curl https://github.com/Ehryk/heroku-nano/raw/master/heroku-nano-2.5.1/nano.tar.gz --location --silent | tar xz -C /app/nano
export PATH=$PATH:/app/nano
bash
    CMD
  end

end
