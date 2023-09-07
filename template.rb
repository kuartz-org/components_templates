def source_paths
  [__dir__]
end

directory "app/components/common", force: true
directory "app/javascript/controllers", force: true
directory "test/components/previews/common", force: true
directory "test/components/docs", force: true

run "importmap pin 'chart.js'"
run "importmap pin 'date-fns'"
run "importmap pin 'date-fns/locale'"
run "importmap pin 'chartjs-adapter-date-fns'"
