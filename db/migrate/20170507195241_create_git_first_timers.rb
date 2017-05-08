class CreateGitFirstTimers < ActiveRecord::Migration[5.1]
  def change
    create_table :git_first_timers do |t|

      t.timestamps
    end
  end
end
