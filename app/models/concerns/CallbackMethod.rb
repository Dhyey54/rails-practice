module CallbackMethod
  # Methods used in different callbacks
  def callback_after_initialize
    puts "Callback called after Initialization"
  end

  def callback_after_find
    puts "Callback called after Finding"
  end

  def callback_before_validation
    puts "Callback called before validation"
  end

  def callback_after_validation
    puts "Callback called after validation"
  end

  def callback_before_saving
    puts "Callback called before saving"
  end

  def callback_around_saving
    puts "Callback inside around_save(before)"
    yield
    puts "Callback inside around save(after)"
  end

  def callback_after_rollback
    puts "Callback after rollback"
  end

  def callback_before_create
    puts "Callback before create"
  end

  def callback_after_create
    puts "Callback after create"
  end

  def callback_around_create
    puts "Callback around create(before)"
    yield
    puts "Callback around create(after)"
  end

  def callback_after_save
    puts "Callback after save"
  end

  def callback_before_update
    puts "Callback before update"
  end

  def callback_after_update
    puts "Callback after update"
  end

  def callback_around_update
    puts "Callback around update(before)"
    yield
    puts "Callback around update(after)"
  end

  def callback_before_destroy
    puts "Callback before destroy"
  end

  def callback_after_destroy
    puts "Callback after destroy"
  end

  def callback_around_destroy
    puts "Callback around destroy(before)"
    yield
    puts "Callback around destroy(after)"
  end

  def callback_after_commit
    puts "Callback after commit"
  end
end