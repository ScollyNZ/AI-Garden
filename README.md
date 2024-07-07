# AI-Garden

## Introdution

I need a project to use to experiment with Google Cloud Services. The services I'm most interested in are

1. IoT
1. Data storage / querying
1. AI / ML
1. Data transportation / ETL (pub/sub, data flow, ...)

I need it to be useful and real.

I have basic electronics skills as well as embedded software development experience.

I enjoy eating food, especially freshly grown food out of my garden. I have a reasonable sized property (2500 sq m) on the edge of Christchurch, NZ.

I prefer to grow everything from seed, rather than buying seedlings, because I'm cheap.

I've always found it difficult to plan ahead sufficiently to make the most of the growing season. Generally I have plenty of output towards the end of the growing season, having spent most of the season growing seedlings.

## The Goal

How do I optimise seed planting time, across a variety of environments and micro-climates to optimise output?

## Initial Thoughts

1. Build some basic IoT type sensors using the ESP32. Initial configuration of temperature, soil moisture and humidity (possibly, if I have any in my draw...)
2. Record data from these sensors using Google services. Probably IoT Hub --> Pub/Sub --> Data Flow --> Big Query. I'm not aiming for an optimised data pipeline, I'm aiming to use common services so I can learn about them.
3. Add a light sensor
4. Place seed trays with written labels on them in with the sensor, take a photo one (or twice) a day. Feed the photo into Gemini to extract the label and when the seedlings first appear.
5. Record seedling types, environmental conditions and time to emerge
6. For bonus points, include a guage in the photo and use Gemini to measure the growth rate.
