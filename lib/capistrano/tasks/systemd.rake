namespace :systemd do
  desc 'Stop backend'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute 'sudo systemctl stop bullet-backend'
        execute 'sudo systemctl stop bullet-sidekiq'
      end
    end
  end

  desc 'Start backend'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute 'sudo systemctl start bullet-backend'
        execute 'sudo systemctl start bullet-backend-sidekiq'
      end
    end
  end

  desc 'Restart backend'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute 'sudo systemctl restart bullet-backend'
        execute 'sudo systemctl restart bullet-backend-sidekiq'
      end
    end
  end
end
