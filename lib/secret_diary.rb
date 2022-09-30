# frozen_string_literal: true

class SecretDiary
  # diary is an instance of Diary
  def initialize(diary)
    @diary = diary
    @is_locked = true
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    raise 'Go away!' if @is_locked

    @diary.read
  end

  def lock
    @is_locked = true
  end

  def unlock
    @is_locked = false
  end
end
