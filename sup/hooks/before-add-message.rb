if message.from.email.end_with?('mariaines.dff@gmail.com', 'pacopenedo@yahoo.es', 'francisco.penedo@meyss.es', 'pacopenedo@hotmail.es')
    message.add_label :personal
end

if message.recipients.any? { |person| person.email.start_with? 'francisco.penedo@estudiante.uam.es' }
    message.add_label :uam
end

if message.recipients.any? { |person| person.email.start_with? 'franp@bu.edu' }
    message.add_label :bu
end

if message.from.email.end_with? '@bu.edu' 
    message.add_label :bu
end

if message.from.email.end_with?('@bpl.org', '@bibliocommons.com', '@minlib.net') or message.recipients.any? { |person| person.email.end_with? '@bpl.org' }
    message.add_label :library
end

if message.from.email.end_with? '@bbva.com' 
    message.add_label :bbva
end

if message.from.email.end_with? '@alerts.santander.us'
    message.add_label :santander
end


