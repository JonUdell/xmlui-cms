function transformStops(stops) {
  return stops.map(stop => {
    // Helper to extract a value from additionalProperties by key
    const getProp = (key) => {
      const prop = stop.additionalProperties && stop.additionalProperties.find(p => p.key === key);
      return prop ? prop.value : '';
    };

    return {
      name: stop.commonName,
      zone: getProp('Zone'),
      wifi: getProp('WiFi'),
      toilets: getProp('Toilets'),
      lifts: getProp('Lifts'),
      escalators: getProp('Escalators'),
      cash_machines: getProp('Cash Machines'),
      lines: stop.lines ? stop.lines.map(line => line.name).join(', ') : ''
    };
  });
}