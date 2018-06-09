# Results

PostGraphile v4 is now in beta! https://github.com/graphile/postgraphile/releases/tag/v4.0.0-beta.0

Below are the results of running various GraphQL queries against [a sample database](db/reset.sh), with everything running on a Mid-2011 iMac.

- Query: the GraphQL query that we execute
- Version: which version of PostGraphQL/PostGraphile are we using?
- Conc: concurrency - how many requests do we try and make the server process in parallel?
- req/s: average requests per second - the total number of requests divided by the total number of seconds
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with `v4 cluster` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

<table>
<thead><tr>
<th><b>Query</b></th>
<th>Version</th>
<th>Conc</th>
<th>req/s</th>
<th><b>latency p50</b></th>
<th><b>latency p90</b></th>
<th><b>latency p99</b></th>
<th><b>max RSS</b></th>
</tr></thead>
<tbody>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>1</td>
<td>19.21</td>
<td>52</td>
<td>53</td>
<td>61</td>
<td>90228</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>10</td>
<td>77.4</td>
<td>126</td>
<td>147</td>
<td>187</td>
<td>91528</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>100</td>
<td>187</td>
<td>12</td>
<td>1530</td>
<td>1894</td>
<td>141592</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>18.57</td>
<td>52</td>
<td>56</td>
<td>97</td>
<td>68180</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>70.05</td>
<td>135</td>
<td>179</td>
<td>284</td>
<td>71108</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>190.33</td>
<td>13</td>
<td>1548</td>
<td>2082</td>
<td>72260</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>1</td>
<td>13.93</td>
<td>71</td>
<td>76</td>
<td>79</td>
<td>363776</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>10</td>
<td>51.5</td>
<td>189</td>
<td>222</td>
<td>343</td>
<td>395652</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>100</td>
<td>87.89</td>
<td>74</td>
<td>3115</td>
<td>3672</td>
<td>569756</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>1</td>
<td>372.32</td>
<td>2</td>
<td>3</td>
<td>5</td>
<td>117456</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>10</td>
<td>831.19</td>
<td>11</td>
<td>13</td>
<td>30</td>
<td>119492</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>100</td>
<td>756.87</td>
<td>111</td>
<td>177</td>
<td>352</td>
<td>173628</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>319.72</td>
<td>3</td>
<td>3</td>
<td>5</td>
<td>93088</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>869.12</td>
<td>7</td>
<td>9</td>
<td>30</td>
<td>99636</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>871.98</td>
<td>69</td>
<td>77</td>
<td>145</td>
<td>106856</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>1</td>
<td>180.86</td>
<td>5</td>
<td>6</td>
<td>10</td>
<td>290408</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>10</td>
<td>266.17</td>
<td>36</td>
<td>39</td>
<td>140</td>
<td>309948</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>100</td>
<td>251.82</td>
<td>363</td>
<td>492</td>
<td>558</td>
<td>359448</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>1</td>
<td>327.58</td>
<td>3</td>
<td>3</td>
<td>4</td>
<td>97648</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>10</td>
<td>612.73</td>
<td>15</td>
<td>17</td>
<td>37</td>
<td>101404</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>100</td>
<td>598.03</td>
<td>155</td>
<td>218</td>
<td>289</td>
<td>150136</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>271.02</td>
<td>3</td>
<td>4</td>
<td>6</td>
<td>91056</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>975.2</td>
<td>8</td>
<td>11</td>
<td>29</td>
<td>104108</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>963.75</td>
<td>87</td>
<td>98</td>
<td>439</td>
<td>106712</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>1</td>
<td>48.01</td>
<td>19</td>
<td>24</td>
<td>28</td>
<td>354396</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>10</td>
<td>77.19</td>
<td>126</td>
<td>143</td>
<td>283</td>
<td>443468</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>100</td>
<td>102.55</td>
<td>1401</td>
<td>1659</td>
<td>1763</td>
<td>691404</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>1</td>
<td>15.96</td>
<td>62</td>
<td>63</td>
<td>79</td>
<td>97976</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>10</td>
<td>34.13</td>
<td>291</td>
<td>357</td>
<td>457</td>
<td>99004</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>100</td>
<td>42.29</td>
<td>2663</td>
<td>2899</td>
<td>3865</td>
<td>138600</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>15.92</td>
<td>63</td>
<td>64</td>
<td>69</td>
<td>60732</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>60.5</td>
<td>161</td>
<td>226</td>
<td>289</td>
<td>68572</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>150.76</td>
<td>358</td>
<td>1778</td>
<td>2199</td>
<td>71816</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.89</td>
<td>507</td>
<td>645</td>
<td>652</td>
<td>541332</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>10</td>
<td>2.28</td>
<td>4065</td>
<td>4686</td>
<td>5139</td>
<td>651048</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>100</td>
<td>28.63</td>
<td>87</td>
<td>151</td>
<td>1282</td>
<td>1394484</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>1</td>
<td>173.32</td>
<td>5</td>
<td>6</td>
<td>8</td>
<td>100980</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>10</td>
<td>362.5</td>
<td>27</td>
<td>29</td>
<td>45</td>
<td>105244</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>100</td>
<td>344.45</td>
<td>286</td>
<td>329</td>
<td>381</td>
<td>152488</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>155.9</td>
<td>6</td>
<td>7</td>
<td>9</td>
<td>90396</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>634.07</td>
<td>15</td>
<td>19</td>
<td>39</td>
<td>89512</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>608.14</td>
<td>154</td>
<td>184</td>
<td>345</td>
<td>99708</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>1</td>
<td>21.47</td>
<td>45</td>
<td>47</td>
<td>134</td>
<td>321208</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>10</td>
<td>30.66</td>
<td>302</td>
<td>415</td>
<td>449</td>
<td>380196</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>100</td>
<td>60.82</td>
<td>142</td>
<td>3711</td>
<td>3784</td>
<td>576240</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>1</td>
<td>16.5</td>
<td>59</td>
<td>61</td>
<td>78</td>
<td>107208</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>10</td>
<td>31.99</td>
<td>310</td>
<td>344</td>
<td>449</td>
<td>114568</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>100</td>
<td>29.41</td>
<td>3446</td>
<td>3729</td>
<td>4371</td>
<td>237392</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>16.27</td>
<td>61</td>
<td>62</td>
<td>79</td>
<td>54204</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>56.91</td>
<td>173</td>
<td>224</td>
<td>268</td>
<td>61688</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>73.15</td>
<td>1703</td>
<td>2129</td>
<td>2993</td>
<td>67140</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.39</td>
<td>678</td>
<td>929</td>
<td>1091</td>
<td>1018628</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>10</td>
<td>1.43</td>
<td>5941</td>
<td>8653</td>
<td>9536</td>
<td>1367452</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>100</td>
<td>1.44</td>
<td>741</td>
<td>2569</td>
<td>20666</td>
<td>1780180</td>
</tr>
</tbody>
</table>
