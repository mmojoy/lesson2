class Gop
  attr_accessor :name

  def initialize
    @name = nil 
    @health = 100 # Выносливосит вашего гопника (при 0 гопник умрет)
    @energy = 100 # Энергия вашего гопника (при 0 гопник не сможет никого грабить)
    @respect = 100 # Понты вашего гопника (чем больше тем лучше)
    @angry = 20 # Злой гопник получает больше денег
    @money = 0 # Деньги и в африке деньги 
    @live = false
  end

  def method_main
    puts 'Решайся типочек:'
    case gets.to_i
    when 1 then gop_new
    when 2 then get_semki if exist?
    when 3 then get_yaga if exist?
    when 4 then get_gopstop if exist?
    when 5 then get_studie if exist?
    when 6 then status if exist?
    when 7 then help
    when 0 then exit
    else puts 'Ну че ты тупишь братан?'      
    end
  end

  def gop_new
    if exist?
      puts 'Я непонял братан что за понты?'
    else
      puts 'Чет я призабыл, как меня зовут?'
      @name = gets.chomp
      @live = true
      puts "\nGop #{@name} , точняк, именно так меня и зовут"
    end
  end

  def get_semki
    if feeded?
      time
      puts 'Спасибо братан, хавчик не нужен!'
    else
      time
      @health += 20
      @respect += 5
      @energy -= 5
      @money -= 5
      @angry -= 5
      puts 'Уважил братан, хавка норм!'
    end
  end

  def get_yaga
    time
    if full_energy?
      puts 'Втопку ягу братан, я полон сил'
    else
      time
      @energy += 20
      @respect += 5
      @angry += 5
      @money -= 5
      @health -= 5
      puts 'Яга зашла, пора кого-нибудь гопнуть'
    end
  end

  def get_gopstop
    if full_angry?
      time
      @money += 50
      @respect += 20
      @energy -= 10
      @health -= 20
      puts 'Гони бабки козлина'
    else 
      time
      @money += 30
      @respect += 20
      @energy -= 20
      @health -= 30
      puts 'Вот так то лучше лошара'
    end
  end

  def get_studie
    time
    @angry += 20
    @health += 10
    @energy -= 5
    @respect -= 5 
    puts 'Сон на парах - приятно!'
  end

  def status
    puts "Гопник #{@name} готов к бою!!!"
    puts "Здоровье: #{@health}"
    puts "Энергия: #{ @energy}" 
    puts "Уважение: #{@respect}"
    puts "Злость: #{@angry}"
    puts "Деньги: #{@money}"
  end

  def help
    puts "1 - Создай нового гопника"
    puts "2 - Дай ему семок"
    puts "3 - Дай ему яги"
    puts "4 - Гопни лоха"
    puts "5 - Поспи на парах"
    puts "6 - Статус"
    puts "7 - Помощь"
    puts "0 - exit"
  end

  private

  def exist?
    if @live
      true
    else
      puts 'Гопник умер'
      false
    end
  end 

  def feeded?
    @health >= 100
  end

  def full_energy?
    @energy >= 100
  end

  def full_angry?
    @angry >= 100
  end


  def time
    @health -= 5
    @energy -= 5
    @respect -= 5
    @angry -= 5
    @money -= 5
  end
end

gop = Gop.new
gop.help
loop do
  gop.method_main
end