---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.569885, 0.04362577, -3.033859, 1, 0, 0, 1,
-2.895462, 0.4271719, -1.981717, 1, 0.007843138, 0, 1,
-2.693263, -0.8602822, -1.54412, 1, 0.01176471, 0, 1,
-2.663299, -0.7348714, -2.521413, 1, 0.01960784, 0, 1,
-2.585084, -0.8549243, -1.068146, 1, 0.02352941, 0, 1,
-2.46751, -1.030186, -1.444283, 1, 0.03137255, 0, 1,
-2.463895, 0.04738339, 0.1066988, 1, 0.03529412, 0, 1,
-2.418152, -2.319165, -3.884586, 1, 0.04313726, 0, 1,
-2.398885, 0.6802434, -3.507766, 1, 0.04705882, 0, 1,
-2.355226, -0.9329439, -3.413142, 1, 0.05490196, 0, 1,
-2.347991, -0.1225665, -3.270082, 1, 0.05882353, 0, 1,
-2.341305, -0.9979429, -2.906646, 1, 0.06666667, 0, 1,
-2.203268, -1.020756, -1.144436, 1, 0.07058824, 0, 1,
-2.181219, -2.877776, -3.399353, 1, 0.07843138, 0, 1,
-2.156579, -0.08186968, -1.643563, 1, 0.08235294, 0, 1,
-2.128078, 1.129715, -0.2952922, 1, 0.09019608, 0, 1,
-2.106148, -0.9841574, -3.247137, 1, 0.09411765, 0, 1,
-2.082599, 1.233326, -2.428205, 1, 0.1019608, 0, 1,
-2.074515, 0.9414125, -0.9636079, 1, 0.1098039, 0, 1,
-2.05438, 0.4520751, -2.227977, 1, 0.1137255, 0, 1,
-2.036942, -1.628719, -3.748393, 1, 0.1215686, 0, 1,
-2.027316, 0.758387, -0.8303066, 1, 0.1254902, 0, 1,
-1.99241, -0.9291641, -2.446804, 1, 0.1333333, 0, 1,
-1.977666, -0.2648316, -1.970449, 1, 0.1372549, 0, 1,
-1.92029, 0.6359845, -1.259, 1, 0.145098, 0, 1,
-1.913736, 2.01536, -1.085896, 1, 0.1490196, 0, 1,
-1.908917, 0.3773192, -0.4523777, 1, 0.1568628, 0, 1,
-1.89424, 0.9299031, -1.144273, 1, 0.1607843, 0, 1,
-1.893837, -0.742923, -2.336465, 1, 0.1686275, 0, 1,
-1.887175, -0.3345495, -2.17762, 1, 0.172549, 0, 1,
-1.880039, -1.459762, -2.445181, 1, 0.1803922, 0, 1,
-1.864933, 1.622364, -0.3001096, 1, 0.1843137, 0, 1,
-1.852405, 1.433069, -0.3844108, 1, 0.1921569, 0, 1,
-1.815853, 0.4747393, -2.77754, 1, 0.1960784, 0, 1,
-1.786021, 0.7116709, -1.498863, 1, 0.2039216, 0, 1,
-1.738919, -0.416983, -2.507396, 1, 0.2117647, 0, 1,
-1.734421, 0.4302899, -1.669815, 1, 0.2156863, 0, 1,
-1.732587, 0.4150146, -1.588045, 1, 0.2235294, 0, 1,
-1.720519, 1.743667, -1.042725, 1, 0.227451, 0, 1,
-1.698927, -0.6211892, -2.922734, 1, 0.2352941, 0, 1,
-1.697538, 0.7251197, -2.79689, 1, 0.2392157, 0, 1,
-1.68296, -0.1537943, -1.845973, 1, 0.2470588, 0, 1,
-1.682274, 0.3956059, -0.1873198, 1, 0.2509804, 0, 1,
-1.675798, 0.9933956, -2.670867, 1, 0.2588235, 0, 1,
-1.651213, -0.04478323, -3.333006, 1, 0.2627451, 0, 1,
-1.647711, -0.76986, -3.598722, 1, 0.2705882, 0, 1,
-1.64446, 1.240193, 1.312949, 1, 0.2745098, 0, 1,
-1.644085, -0.8732466, -1.565666, 1, 0.282353, 0, 1,
-1.641789, -1.997106, -2.301355, 1, 0.2862745, 0, 1,
-1.624265, 0.8674812, -1.603418, 1, 0.2941177, 0, 1,
-1.605561, -0.8085545, -3.096943, 1, 0.3019608, 0, 1,
-1.588621, -0.003959615, -1.678513, 1, 0.3058824, 0, 1,
-1.573686, -0.1636074, -3.066352, 1, 0.3137255, 0, 1,
-1.569294, -0.905143, -2.539981, 1, 0.3176471, 0, 1,
-1.566575, 1.35386, 1.841485, 1, 0.3254902, 0, 1,
-1.564825, 1.313715, -0.7814006, 1, 0.3294118, 0, 1,
-1.549279, 0.8344735, 0.5610195, 1, 0.3372549, 0, 1,
-1.534889, 0.3273929, -2.544293, 1, 0.3411765, 0, 1,
-1.522211, -0.2641909, -0.04456522, 1, 0.3490196, 0, 1,
-1.509684, -1.298288, -0.5957331, 1, 0.3529412, 0, 1,
-1.508169, 0.1176341, -0.4617419, 1, 0.3607843, 0, 1,
-1.49059, 0.4698323, -2.785074, 1, 0.3647059, 0, 1,
-1.489864, 1.537616, -0.0768297, 1, 0.372549, 0, 1,
-1.484444, 2.174653, -0.4969097, 1, 0.3764706, 0, 1,
-1.476175, 0.06171269, -1.509745, 1, 0.3843137, 0, 1,
-1.475219, -0.7736213, -2.639651, 1, 0.3882353, 0, 1,
-1.474056, -1.302688, -1.758481, 1, 0.3960784, 0, 1,
-1.472944, -0.08081818, -3.347426, 1, 0.4039216, 0, 1,
-1.46445, -0.2464143, -0.9777339, 1, 0.4078431, 0, 1,
-1.449737, -0.266322, -1.770651, 1, 0.4156863, 0, 1,
-1.440438, -0.07823756, -1.01951, 1, 0.4196078, 0, 1,
-1.428429, 0.2746175, -0.7812188, 1, 0.427451, 0, 1,
-1.426411, -0.397498, -2.863374, 1, 0.4313726, 0, 1,
-1.425016, -0.1201674, -1.815687, 1, 0.4392157, 0, 1,
-1.418088, -0.1381101, -1.196586, 1, 0.4431373, 0, 1,
-1.396226, -1.16539, -4.341803, 1, 0.4509804, 0, 1,
-1.393058, -0.3050458, -3.584695, 1, 0.454902, 0, 1,
-1.392561, 0.9240341, -1.926066, 1, 0.4627451, 0, 1,
-1.391953, -0.04342398, -0.2945846, 1, 0.4666667, 0, 1,
-1.389887, -0.6501448, -2.431165, 1, 0.4745098, 0, 1,
-1.38499, 0.4600594, -0.940513, 1, 0.4784314, 0, 1,
-1.384223, 0.1039951, -1.197649, 1, 0.4862745, 0, 1,
-1.379482, -1.158764, -1.669614, 1, 0.4901961, 0, 1,
-1.379468, 1.031404, -0.2390507, 1, 0.4980392, 0, 1,
-1.376464, -0.4529435, -2.354073, 1, 0.5058824, 0, 1,
-1.371085, -0.4541321, -1.963002, 1, 0.509804, 0, 1,
-1.369416, -0.08873082, -0.8252673, 1, 0.5176471, 0, 1,
-1.366155, -2.020983, -1.493925, 1, 0.5215687, 0, 1,
-1.362581, -0.9576248, -3.233431, 1, 0.5294118, 0, 1,
-1.358117, -0.7806752, -1.660794, 1, 0.5333334, 0, 1,
-1.353854, 1.710048, -2.038428, 1, 0.5411765, 0, 1,
-1.322525, -0.7333436, -0.5997137, 1, 0.5450981, 0, 1,
-1.314854, -1.812097, -2.735786, 1, 0.5529412, 0, 1,
-1.308316, 0.1469688, -3.748197, 1, 0.5568628, 0, 1,
-1.307096, -1.214164, -1.021153, 1, 0.5647059, 0, 1,
-1.298234, 0.7080747, -0.06556796, 1, 0.5686275, 0, 1,
-1.296544, 1.55016, -1.731014, 1, 0.5764706, 0, 1,
-1.2867, 1.223898, -0.7250631, 1, 0.5803922, 0, 1,
-1.280516, -0.1056938, -1.123566, 1, 0.5882353, 0, 1,
-1.269116, -0.04773437, -3.922439, 1, 0.5921569, 0, 1,
-1.258243, -0.9606171, -0.5727842, 1, 0.6, 0, 1,
-1.255762, -0.7148185, -2.302023, 1, 0.6078432, 0, 1,
-1.251284, -0.5141317, -0.1891164, 1, 0.6117647, 0, 1,
-1.250408, -0.2437587, -1.667955, 1, 0.6196079, 0, 1,
-1.250269, 0.7858925, -0.7353204, 1, 0.6235294, 0, 1,
-1.244802, -0.1852082, -1.47844, 1, 0.6313726, 0, 1,
-1.243964, 0.5086021, -1.691267, 1, 0.6352941, 0, 1,
-1.239299, -0.8347019, -2.080071, 1, 0.6431373, 0, 1,
-1.231429, -0.737863, -1.816154, 1, 0.6470588, 0, 1,
-1.230653, 0.7063931, -2.543312, 1, 0.654902, 0, 1,
-1.22997, -0.9305864, -1.061605, 1, 0.6588235, 0, 1,
-1.213562, -0.9775623, -2.798043, 1, 0.6666667, 0, 1,
-1.21112, 0.8029449, -1.296005, 1, 0.6705883, 0, 1,
-1.207132, -1.007139, -1.443748, 1, 0.6784314, 0, 1,
-1.203861, 0.3973346, -2.081606, 1, 0.682353, 0, 1,
-1.200593, -0.3779907, -0.1550133, 1, 0.6901961, 0, 1,
-1.194207, -0.2695066, -1.988184, 1, 0.6941177, 0, 1,
-1.193671, 0.1292364, -1.280268, 1, 0.7019608, 0, 1,
-1.182277, -0.2626819, -1.079201, 1, 0.7098039, 0, 1,
-1.177424, 1.093528, -1.726648, 1, 0.7137255, 0, 1,
-1.177236, -0.3155941, 0.2910247, 1, 0.7215686, 0, 1,
-1.173308, 1.181298, -1.587551, 1, 0.7254902, 0, 1,
-1.172211, -0.1561447, -2.53583, 1, 0.7333333, 0, 1,
-1.152432, -0.286998, -1.186224, 1, 0.7372549, 0, 1,
-1.146239, -1.46146, -1.352842, 1, 0.7450981, 0, 1,
-1.145331, 0.7106476, -1.839676, 1, 0.7490196, 0, 1,
-1.130376, 0.04905469, -0.9593866, 1, 0.7568628, 0, 1,
-1.12994, 0.3205921, 0.8920786, 1, 0.7607843, 0, 1,
-1.12245, -0.6355042, -2.279462, 1, 0.7686275, 0, 1,
-1.11139, 0.06442866, -2.250885, 1, 0.772549, 0, 1,
-1.111038, 0.4692544, -2.397335, 1, 0.7803922, 0, 1,
-1.110563, 1.118769, -3.496629, 1, 0.7843137, 0, 1,
-1.099493, -1.767682, -3.821824, 1, 0.7921569, 0, 1,
-1.096944, -2.17416, -3.676762, 1, 0.7960784, 0, 1,
-1.094517, -1.285604, -3.276189, 1, 0.8039216, 0, 1,
-1.082105, 0.4276517, -0.5010938, 1, 0.8117647, 0, 1,
-1.079983, -0.3719468, -1.556764, 1, 0.8156863, 0, 1,
-1.0796, 0.3165085, -0.5585786, 1, 0.8235294, 0, 1,
-1.074729, -0.7112775, -1.821622, 1, 0.827451, 0, 1,
-1.069582, -0.08842146, -1.838386, 1, 0.8352941, 0, 1,
-1.068801, -0.4039002, -2.740343, 1, 0.8392157, 0, 1,
-1.066622, 0.09967573, -0.4942723, 1, 0.8470588, 0, 1,
-1.060055, -0.8958092, -3.193213, 1, 0.8509804, 0, 1,
-1.056569, -0.1346906, -2.59592, 1, 0.8588235, 0, 1,
-1.050974, 1.36167, -0.1727091, 1, 0.8627451, 0, 1,
-1.036843, -0.3732264, -3.378836, 1, 0.8705882, 0, 1,
-1.029444, -0.09750915, -1.946195, 1, 0.8745098, 0, 1,
-1.028499, 1.295108, -0.1954313, 1, 0.8823529, 0, 1,
-1.026296, 0.8520331, -0.6822079, 1, 0.8862745, 0, 1,
-1.017281, -0.5265951, -2.611152, 1, 0.8941177, 0, 1,
-1.010844, 0.9551796, -1.515504, 1, 0.8980392, 0, 1,
-1.008861, 0.654572, -1.396277, 1, 0.9058824, 0, 1,
-0.9960563, -0.2606696, -2.081094, 1, 0.9137255, 0, 1,
-0.9958285, -0.7603589, -3.199298, 1, 0.9176471, 0, 1,
-0.9951041, 0.4248724, -0.9134493, 1, 0.9254902, 0, 1,
-0.9879661, -0.3908504, -1.166073, 1, 0.9294118, 0, 1,
-0.9849567, -0.2021691, -2.570328, 1, 0.9372549, 0, 1,
-0.9843704, -1.651188, -2.725893, 1, 0.9411765, 0, 1,
-0.9815484, -0.6365129, -3.060624, 1, 0.9490196, 0, 1,
-0.9793787, -0.9547899, -1.818051, 1, 0.9529412, 0, 1,
-0.9715195, -1.747302, -2.746115, 1, 0.9607843, 0, 1,
-0.9691427, -0.495663, -2.157761, 1, 0.9647059, 0, 1,
-0.9684078, 0.4665413, -2.868641, 1, 0.972549, 0, 1,
-0.9648266, -0.9597899, -3.873445, 1, 0.9764706, 0, 1,
-0.9635388, 0.5747295, -1.816851, 1, 0.9843137, 0, 1,
-0.9617804, -0.465749, -2.917132, 1, 0.9882353, 0, 1,
-0.9597751, -1.025438, -4.644269, 1, 0.9960784, 0, 1,
-0.9572055, -0.4607817, -2.165332, 0.9960784, 1, 0, 1,
-0.9555183, 1.970751, -0.1945744, 0.9921569, 1, 0, 1,
-0.950277, -2.896364, -1.30164, 0.9843137, 1, 0, 1,
-0.9468832, 0.1407953, -1.543769, 0.9803922, 1, 0, 1,
-0.9431393, -1.026443, -3.496382, 0.972549, 1, 0, 1,
-0.9396723, 1.810728, 0.2553397, 0.9686275, 1, 0, 1,
-0.9344954, 0.2810299, -1.007797, 0.9607843, 1, 0, 1,
-0.9316622, -0.7918739, -2.750978, 0.9568627, 1, 0, 1,
-0.9307386, 0.265045, -1.845664, 0.9490196, 1, 0, 1,
-0.9248573, -0.2960345, -2.713621, 0.945098, 1, 0, 1,
-0.9210207, 0.7387623, -0.6499879, 0.9372549, 1, 0, 1,
-0.9184378, -0.06089479, -0.6145543, 0.9333333, 1, 0, 1,
-0.9138194, 1.774983, -0.5211761, 0.9254902, 1, 0, 1,
-0.9107532, 0.2908357, 0.9059134, 0.9215686, 1, 0, 1,
-0.9093268, -1.655945, -1.913848, 0.9137255, 1, 0, 1,
-0.9062318, -1.176638, -3.117395, 0.9098039, 1, 0, 1,
-0.9043074, -0.4604923, -2.035391, 0.9019608, 1, 0, 1,
-0.8957931, -0.3626619, -1.875325, 0.8941177, 1, 0, 1,
-0.8924494, 0.7044299, 0.250406, 0.8901961, 1, 0, 1,
-0.8924128, 1.23026, 0.0650812, 0.8823529, 1, 0, 1,
-0.8842435, -2.007661, -3.562637, 0.8784314, 1, 0, 1,
-0.8786891, -0.6836305, -1.789345, 0.8705882, 1, 0, 1,
-0.8733129, 0.04068635, -1.724636, 0.8666667, 1, 0, 1,
-0.872044, -0.9418311, -2.19258, 0.8588235, 1, 0, 1,
-0.860216, -1.839012, -2.0637, 0.854902, 1, 0, 1,
-0.8594825, 0.1957369, -1.103077, 0.8470588, 1, 0, 1,
-0.8578459, -1.388209, -3.528627, 0.8431373, 1, 0, 1,
-0.8499007, -1.380189, -4.403286, 0.8352941, 1, 0, 1,
-0.846307, -0.5658462, -0.9838835, 0.8313726, 1, 0, 1,
-0.8407702, -1.140506, -2.059803, 0.8235294, 1, 0, 1,
-0.8360113, -1.318499, -3.922802, 0.8196079, 1, 0, 1,
-0.829169, 1.560163, 0.1454944, 0.8117647, 1, 0, 1,
-0.8289886, 1.326534, 0.08998111, 0.8078431, 1, 0, 1,
-0.8272592, -0.5512431, -1.355243, 0.8, 1, 0, 1,
-0.7978922, 0.1691209, -3.308104, 0.7921569, 1, 0, 1,
-0.7974215, 0.6320899, -2.293976, 0.7882353, 1, 0, 1,
-0.7964451, -0.8303558, -3.828002, 0.7803922, 1, 0, 1,
-0.7956187, -0.03522998, -0.6004665, 0.7764706, 1, 0, 1,
-0.7941483, -0.1382038, 0.315847, 0.7686275, 1, 0, 1,
-0.7939471, 0.3115155, 0.302999, 0.7647059, 1, 0, 1,
-0.7935898, -1.231015, -1.357075, 0.7568628, 1, 0, 1,
-0.7900634, 1.756362, 0.0660149, 0.7529412, 1, 0, 1,
-0.7868128, -1.565057, -1.865539, 0.7450981, 1, 0, 1,
-0.7851706, 0.6270129, -1.383414, 0.7411765, 1, 0, 1,
-0.7799206, 0.2272349, -0.8561336, 0.7333333, 1, 0, 1,
-0.7782182, -1.04111, -3.205155, 0.7294118, 1, 0, 1,
-0.7716305, -0.5805908, -2.774863, 0.7215686, 1, 0, 1,
-0.7704412, -1.963996, -2.617945, 0.7176471, 1, 0, 1,
-0.7640448, -1.283983, -1.144415, 0.7098039, 1, 0, 1,
-0.7626966, -0.8596865, -3.037781, 0.7058824, 1, 0, 1,
-0.7592363, -0.125701, -1.917258, 0.6980392, 1, 0, 1,
-0.758513, -2.466061, -3.887334, 0.6901961, 1, 0, 1,
-0.7566893, 0.5913262, -2.173097, 0.6862745, 1, 0, 1,
-0.755368, 0.926118, -0.9133615, 0.6784314, 1, 0, 1,
-0.7553216, -1.536366, -2.616813, 0.6745098, 1, 0, 1,
-0.7487122, 0.1234772, -0.7426491, 0.6666667, 1, 0, 1,
-0.7449635, -0.503026, -1.933513, 0.6627451, 1, 0, 1,
-0.7394301, -2.657439, -2.016431, 0.654902, 1, 0, 1,
-0.7384764, 1.565329, -0.2191153, 0.6509804, 1, 0, 1,
-0.7367814, -0.5208257, -2.715843, 0.6431373, 1, 0, 1,
-0.7355751, -0.002269774, -2.385633, 0.6392157, 1, 0, 1,
-0.7351774, 0.5382553, -1.843277, 0.6313726, 1, 0, 1,
-0.7304031, -0.7553365, -2.597388, 0.627451, 1, 0, 1,
-0.7288139, -0.1087653, -1.938775, 0.6196079, 1, 0, 1,
-0.7286304, 0.7176762, 0.6242225, 0.6156863, 1, 0, 1,
-0.7271818, 1.319098, -0.4284183, 0.6078432, 1, 0, 1,
-0.7251384, 0.584561, -0.3066786, 0.6039216, 1, 0, 1,
-0.7236253, -0.7399674, -2.528691, 0.5960785, 1, 0, 1,
-0.7202086, 0.7503094, 0.1649419, 0.5882353, 1, 0, 1,
-0.718818, 1.138241, -0.5811773, 0.5843138, 1, 0, 1,
-0.7162858, -1.008521, -4.198861, 0.5764706, 1, 0, 1,
-0.7112418, 1.917797, -1.924056, 0.572549, 1, 0, 1,
-0.7110731, 7.670892e-05, -2.252458, 0.5647059, 1, 0, 1,
-0.7109275, 0.8225335, -1.518485, 0.5607843, 1, 0, 1,
-0.7095763, 0.6862037, -0.09553356, 0.5529412, 1, 0, 1,
-0.7092863, 0.577402, -1.816791, 0.5490196, 1, 0, 1,
-0.7079495, 0.7674629, -1.095181, 0.5411765, 1, 0, 1,
-0.6993762, 0.530647, -0.5860838, 0.5372549, 1, 0, 1,
-0.6969427, -0.4934539, -1.345463, 0.5294118, 1, 0, 1,
-0.6871972, -0.4844978, -2.6261, 0.5254902, 1, 0, 1,
-0.685357, 1.566492, 0.4455858, 0.5176471, 1, 0, 1,
-0.6747773, 0.08364749, -1.894314, 0.5137255, 1, 0, 1,
-0.6721312, -0.1654442, -1.443037, 0.5058824, 1, 0, 1,
-0.6697132, -0.6494766, -2.986861, 0.5019608, 1, 0, 1,
-0.6634969, 0.1739419, -1.454741, 0.4941176, 1, 0, 1,
-0.6624807, 0.9412673, 0.02529597, 0.4862745, 1, 0, 1,
-0.6617367, 1.004187, -1.233282, 0.4823529, 1, 0, 1,
-0.6559715, -0.07779117, -2.810895, 0.4745098, 1, 0, 1,
-0.6557815, 0.7844496, -1.185174, 0.4705882, 1, 0, 1,
-0.6548396, -1.007698, -2.665983, 0.4627451, 1, 0, 1,
-0.6470023, 0.3858721, -1.233766, 0.4588235, 1, 0, 1,
-0.6459557, 1.451123, -0.9350299, 0.4509804, 1, 0, 1,
-0.643294, 0.6300505, 0.3830339, 0.4470588, 1, 0, 1,
-0.6405969, 0.7545212, -1.834311, 0.4392157, 1, 0, 1,
-0.6402312, 1.007489, -0.2189836, 0.4352941, 1, 0, 1,
-0.6368929, 1.584478, -0.7929885, 0.427451, 1, 0, 1,
-0.628684, -0.7739084, -2.8326, 0.4235294, 1, 0, 1,
-0.6229758, 0.71956, -1.785501, 0.4156863, 1, 0, 1,
-0.6212366, 0.4276382, -1.426233, 0.4117647, 1, 0, 1,
-0.6150727, -1.300928, -3.713054, 0.4039216, 1, 0, 1,
-0.6145168, 0.6170979, -0.3182899, 0.3960784, 1, 0, 1,
-0.610836, 1.185054, -0.317519, 0.3921569, 1, 0, 1,
-0.6073697, -0.6552479, -2.976635, 0.3843137, 1, 0, 1,
-0.6043002, 2.220072, -0.2185958, 0.3803922, 1, 0, 1,
-0.6010639, -2.131281, -3.965348, 0.372549, 1, 0, 1,
-0.5979484, 0.5740536, -2.047947, 0.3686275, 1, 0, 1,
-0.5934876, -0.7073611, -3.428856, 0.3607843, 1, 0, 1,
-0.5913844, 1.01304, -1.975415, 0.3568628, 1, 0, 1,
-0.5809578, -0.8263268, -2.572475, 0.3490196, 1, 0, 1,
-0.5807918, -0.1220287, -2.848003, 0.345098, 1, 0, 1,
-0.5728807, -0.05406499, -1.346024, 0.3372549, 1, 0, 1,
-0.5711311, 0.2405946, 0.233803, 0.3333333, 1, 0, 1,
-0.5687128, 0.8165949, -0.5128261, 0.3254902, 1, 0, 1,
-0.5646393, -0.1555374, -1.401918, 0.3215686, 1, 0, 1,
-0.5644529, -1.097772, -4.189271, 0.3137255, 1, 0, 1,
-0.564373, -0.8798852, -2.073886, 0.3098039, 1, 0, 1,
-0.5622171, -0.1280257, -2.27497, 0.3019608, 1, 0, 1,
-0.560558, -0.5170141, -2.84356, 0.2941177, 1, 0, 1,
-0.5599942, -0.9386103, -1.399072, 0.2901961, 1, 0, 1,
-0.5582719, 0.2936257, -0.997259, 0.282353, 1, 0, 1,
-0.5557361, -0.2831013, -1.761415, 0.2784314, 1, 0, 1,
-0.547637, 0.116343, -2.888577, 0.2705882, 1, 0, 1,
-0.5444141, -1.99095, -1.645348, 0.2666667, 1, 0, 1,
-0.5385827, -1.003598, -2.340015, 0.2588235, 1, 0, 1,
-0.537473, 1.111714, -0.6799825, 0.254902, 1, 0, 1,
-0.5366008, -0.3955756, -1.280292, 0.2470588, 1, 0, 1,
-0.5353589, -1.32532, -1.891051, 0.2431373, 1, 0, 1,
-0.5324255, 0.6537455, -1.171488, 0.2352941, 1, 0, 1,
-0.529482, 0.5869187, -1.540879, 0.2313726, 1, 0, 1,
-0.5278989, 0.2199572, -2.14799, 0.2235294, 1, 0, 1,
-0.5257384, 2.01759, -0.470706, 0.2196078, 1, 0, 1,
-0.5241926, -1.102246, -2.35233, 0.2117647, 1, 0, 1,
-0.5223022, 0.6015366, 1.11989, 0.2078431, 1, 0, 1,
-0.5142226, 0.593806, -0.1580108, 0.2, 1, 0, 1,
-0.5138842, 0.1297037, -0.2216749, 0.1921569, 1, 0, 1,
-0.5116944, -0.165461, -1.152296, 0.1882353, 1, 0, 1,
-0.5071546, -0.1275935, -2.949622, 0.1803922, 1, 0, 1,
-0.5067878, -0.7364914, -1.62459, 0.1764706, 1, 0, 1,
-0.5025347, -2.268337, -4.159044, 0.1686275, 1, 0, 1,
-0.4948543, 0.9005597, -1.031316, 0.1647059, 1, 0, 1,
-0.4924376, -1.439822, -2.379676, 0.1568628, 1, 0, 1,
-0.4908096, -0.3387819, -2.868038, 0.1529412, 1, 0, 1,
-0.4762969, 1.046825, 0.0932304, 0.145098, 1, 0, 1,
-0.4675232, -0.4892713, -2.090832, 0.1411765, 1, 0, 1,
-0.4670525, -1.035548, -3.711811, 0.1333333, 1, 0, 1,
-0.4665338, 0.003577139, -0.6371987, 0.1294118, 1, 0, 1,
-0.4665069, 0.07120455, 0.3190537, 0.1215686, 1, 0, 1,
-0.4594737, 0.7647729, 0.2484459, 0.1176471, 1, 0, 1,
-0.4531219, -0.5736963, -2.692869, 0.1098039, 1, 0, 1,
-0.4523388, 0.5710167, -0.3271285, 0.1058824, 1, 0, 1,
-0.4506619, 0.7227457, 0.9233381, 0.09803922, 1, 0, 1,
-0.4337066, 0.7615961, 0.3603817, 0.09019608, 1, 0, 1,
-0.4309907, -1.453426, -2.43364, 0.08627451, 1, 0, 1,
-0.430721, -1.072017, -2.503369, 0.07843138, 1, 0, 1,
-0.4298822, -0.3185968, -0.6021312, 0.07450981, 1, 0, 1,
-0.4278866, -0.2645943, -3.564812, 0.06666667, 1, 0, 1,
-0.42746, 1.547897, -0.343754, 0.0627451, 1, 0, 1,
-0.4263065, 0.7334683, 0.4937986, 0.05490196, 1, 0, 1,
-0.425658, -1.089167, -3.649828, 0.05098039, 1, 0, 1,
-0.4212687, 0.06034342, -1.622672, 0.04313726, 1, 0, 1,
-0.419949, -0.2373355, -2.59756, 0.03921569, 1, 0, 1,
-0.4197575, -0.06719467, -1.127339, 0.03137255, 1, 0, 1,
-0.4181037, 1.832655, -1.913086, 0.02745098, 1, 0, 1,
-0.4177851, -1.067227, -1.806062, 0.01960784, 1, 0, 1,
-0.410957, -1.81295, -3.250455, 0.01568628, 1, 0, 1,
-0.4086225, 0.7174087, -1.998632, 0.007843138, 1, 0, 1,
-0.4066819, 0.613334, -0.2341162, 0.003921569, 1, 0, 1,
-0.4033544, -0.4347748, -1.335413, 0, 1, 0.003921569, 1,
-0.4015912, -1.177186, -4.310483, 0, 1, 0.01176471, 1,
-0.3999507, -0.08336865, -1.158833, 0, 1, 0.01568628, 1,
-0.387702, -1.471198, -2.104933, 0, 1, 0.02352941, 1,
-0.3873332, 1.978269, -1.470027, 0, 1, 0.02745098, 1,
-0.3807395, 0.9807941, -1.802938, 0, 1, 0.03529412, 1,
-0.3798928, -1.788629, -3.787376, 0, 1, 0.03921569, 1,
-0.3728946, -1.016229, -3.269045, 0, 1, 0.04705882, 1,
-0.3674168, -0.1138116, -2.101739, 0, 1, 0.05098039, 1,
-0.3663571, -0.3199186, -1.276396, 0, 1, 0.05882353, 1,
-0.3625829, 1.919478, -0.2368946, 0, 1, 0.0627451, 1,
-0.362027, 0.8892972, -0.05644061, 0, 1, 0.07058824, 1,
-0.3607889, 0.4455811, -1.308273, 0, 1, 0.07450981, 1,
-0.3599406, -0.225283, -2.220378, 0, 1, 0.08235294, 1,
-0.3566307, 0.06173824, 0.277383, 0, 1, 0.08627451, 1,
-0.3532394, 0.8172488, 1.742797, 0, 1, 0.09411765, 1,
-0.3532374, -2.608531, -3.581419, 0, 1, 0.1019608, 1,
-0.350284, 0.7117023, -1.578922, 0, 1, 0.1058824, 1,
-0.3488278, -1.231788, -3.094095, 0, 1, 0.1137255, 1,
-0.3463364, 1.104239, -2.698194, 0, 1, 0.1176471, 1,
-0.346228, 0.3899668, -0.7885234, 0, 1, 0.1254902, 1,
-0.3451486, 1.351619, 0.514446, 0, 1, 0.1294118, 1,
-0.3433859, 0.8001372, 0.1119107, 0, 1, 0.1372549, 1,
-0.3413171, 0.9381546, 0.3212709, 0, 1, 0.1411765, 1,
-0.3356556, -0.6678351, -2.398671, 0, 1, 0.1490196, 1,
-0.3322104, -0.4361607, -3.795838, 0, 1, 0.1529412, 1,
-0.3299057, -0.3149795, -2.465249, 0, 1, 0.1607843, 1,
-0.3280122, 0.8884476, 0.4110125, 0, 1, 0.1647059, 1,
-0.3257634, 0.07791834, -1.178317, 0, 1, 0.172549, 1,
-0.3242977, 0.2414685, -1.251402, 0, 1, 0.1764706, 1,
-0.3228943, -0.2200468, -0.8959475, 0, 1, 0.1843137, 1,
-0.3196161, 0.1645496, -1.968808, 0, 1, 0.1882353, 1,
-0.3163985, -0.8964048, -4.252537, 0, 1, 0.1960784, 1,
-0.3127052, -0.8312618, -3.220986, 0, 1, 0.2039216, 1,
-0.310941, -1.151838, -2.477097, 0, 1, 0.2078431, 1,
-0.3095049, 0.03770368, -1.359534, 0, 1, 0.2156863, 1,
-0.3070392, -1.311677, -3.209266, 0, 1, 0.2196078, 1,
-0.3059456, 0.8032534, 0.002490911, 0, 1, 0.227451, 1,
-0.304496, 1.055238, -3.035591, 0, 1, 0.2313726, 1,
-0.3040054, -0.1214965, -0.883183, 0, 1, 0.2392157, 1,
-0.2997276, 1.098248, -2.052132, 0, 1, 0.2431373, 1,
-0.2967269, 0.6156304, -0.4781987, 0, 1, 0.2509804, 1,
-0.2919532, 1.638991, 0.9869942, 0, 1, 0.254902, 1,
-0.2916848, -0.3090206, -1.280595, 0, 1, 0.2627451, 1,
-0.2915014, -3.095349, -2.70055, 0, 1, 0.2666667, 1,
-0.2904598, 1.4154, -0.608372, 0, 1, 0.2745098, 1,
-0.287374, 0.5334027, -0.8768765, 0, 1, 0.2784314, 1,
-0.2865927, 0.8315994, 0.705129, 0, 1, 0.2862745, 1,
-0.2862883, -0.3297786, -2.006272, 0, 1, 0.2901961, 1,
-0.2853945, -1.6168, -2.380054, 0, 1, 0.2980392, 1,
-0.2843033, 0.4977359, -0.4017652, 0, 1, 0.3058824, 1,
-0.2806695, -0.05607316, -1.882572, 0, 1, 0.3098039, 1,
-0.2798555, 0.8792492, 0.1610976, 0, 1, 0.3176471, 1,
-0.2790957, -1.445407, -2.330893, 0, 1, 0.3215686, 1,
-0.2782542, 0.08124111, -0.4218639, 0, 1, 0.3294118, 1,
-0.2764553, 0.3717715, -1.262232, 0, 1, 0.3333333, 1,
-0.2728884, -0.6237198, -2.548099, 0, 1, 0.3411765, 1,
-0.2688513, 0.3115642, -0.4911837, 0, 1, 0.345098, 1,
-0.2687376, -0.620773, -1.655789, 0, 1, 0.3529412, 1,
-0.2667954, 0.6348699, 0.04679177, 0, 1, 0.3568628, 1,
-0.2587295, 0.7170659, -0.3700607, 0, 1, 0.3647059, 1,
-0.253767, -0.6345016, -3.187528, 0, 1, 0.3686275, 1,
-0.2512141, -0.3277801, -3.709529, 0, 1, 0.3764706, 1,
-0.249863, 0.1234869, -2.149984, 0, 1, 0.3803922, 1,
-0.2471337, 0.7022178, 0.2531492, 0, 1, 0.3882353, 1,
-0.2461336, -0.8842055, -3.488778, 0, 1, 0.3921569, 1,
-0.2426775, -1.6924, -3.240162, 0, 1, 0.4, 1,
-0.2415256, -0.08086498, -1.16289, 0, 1, 0.4078431, 1,
-0.2410627, 1.649995, 1.755852, 0, 1, 0.4117647, 1,
-0.2375326, 1.108176, -0.7782356, 0, 1, 0.4196078, 1,
-0.2325774, 2.381922, 0.1318513, 0, 1, 0.4235294, 1,
-0.2278173, -0.7610552, -2.162898, 0, 1, 0.4313726, 1,
-0.2277889, 0.5352968, -0.7475172, 0, 1, 0.4352941, 1,
-0.2249618, -0.4477504, -3.298626, 0, 1, 0.4431373, 1,
-0.2239738, 1.011134, -0.2188595, 0, 1, 0.4470588, 1,
-0.223264, 0.2365674, -1.50458, 0, 1, 0.454902, 1,
-0.2229629, 1.069796, 0.08578153, 0, 1, 0.4588235, 1,
-0.2219025, -0.7165596, -3.017149, 0, 1, 0.4666667, 1,
-0.2131946, 0.6103976, 0.3191479, 0, 1, 0.4705882, 1,
-0.2125592, 2.429295, -1.058715, 0, 1, 0.4784314, 1,
-0.2117808, -0.5208614, -2.311934, 0, 1, 0.4823529, 1,
-0.2114247, -0.748451, -3.483733, 0, 1, 0.4901961, 1,
-0.2106361, 2.302896, -2.412983, 0, 1, 0.4941176, 1,
-0.20981, 0.2853033, -1.239148, 0, 1, 0.5019608, 1,
-0.2085709, -1.717587, -3.949567, 0, 1, 0.509804, 1,
-0.2083257, 0.5333698, 0.5675877, 0, 1, 0.5137255, 1,
-0.205301, -0.7756741, -5.36863, 0, 1, 0.5215687, 1,
-0.195687, -0.2159861, -1.574987, 0, 1, 0.5254902, 1,
-0.1951791, -0.6181563, -2.71455, 0, 1, 0.5333334, 1,
-0.1899074, -0.3021878, -2.602654, 0, 1, 0.5372549, 1,
-0.1896622, 0.1982926, -1.845852, 0, 1, 0.5450981, 1,
-0.1880892, 0.3063978, -1.533656, 0, 1, 0.5490196, 1,
-0.1874544, 1.989358, 0.1565429, 0, 1, 0.5568628, 1,
-0.1872155, 0.6513813, 0.2497952, 0, 1, 0.5607843, 1,
-0.1869209, -0.4757565, -4.2959, 0, 1, 0.5686275, 1,
-0.1841613, 1.414562, -0.9723766, 0, 1, 0.572549, 1,
-0.1793655, 0.904698, 1.121379, 0, 1, 0.5803922, 1,
-0.1760906, -0.4957726, -2.632594, 0, 1, 0.5843138, 1,
-0.1737575, -0.9381663, -4.841346, 0, 1, 0.5921569, 1,
-0.1711783, 0.4738027, 0.2215732, 0, 1, 0.5960785, 1,
-0.1696365, -0.180033, -1.329219, 0, 1, 0.6039216, 1,
-0.1688979, 2.238181, 1.823801, 0, 1, 0.6117647, 1,
-0.167973, 0.7012993, 0.5717896, 0, 1, 0.6156863, 1,
-0.166834, 1.430231, 0.49466, 0, 1, 0.6235294, 1,
-0.1651236, -1.582279, -2.761371, 0, 1, 0.627451, 1,
-0.1623778, 2.071979, -1.468076, 0, 1, 0.6352941, 1,
-0.1580342, 0.847095, -1.017118, 0, 1, 0.6392157, 1,
-0.1576855, -1.253983, -4.614078, 0, 1, 0.6470588, 1,
-0.1541135, 1.050423, -0.106535, 0, 1, 0.6509804, 1,
-0.1491068, -0.09065632, -2.073209, 0, 1, 0.6588235, 1,
-0.1486458, 0.08989872, -2.991253, 0, 1, 0.6627451, 1,
-0.146695, 1.627882, 0.286738, 0, 1, 0.6705883, 1,
-0.1382507, 0.08257416, -0.8570333, 0, 1, 0.6745098, 1,
-0.1365539, 0.3406985, -1.18877, 0, 1, 0.682353, 1,
-0.1357317, 0.08543414, -1.811184, 0, 1, 0.6862745, 1,
-0.1291043, -1.851705, -4.343955, 0, 1, 0.6941177, 1,
-0.1283734, 0.9007727, 1.004889, 0, 1, 0.7019608, 1,
-0.1272867, 0.8915405, -0.4556649, 0, 1, 0.7058824, 1,
-0.1252575, 1.013361, -1.821648, 0, 1, 0.7137255, 1,
-0.1232311, -0.9265733, -3.226112, 0, 1, 0.7176471, 1,
-0.1206132, -0.1285795, -2.278854, 0, 1, 0.7254902, 1,
-0.115414, -1.642671, -2.905607, 0, 1, 0.7294118, 1,
-0.1138276, 0.9751189, -1.532369, 0, 1, 0.7372549, 1,
-0.110249, -0.3027636, -3.594019, 0, 1, 0.7411765, 1,
-0.1035881, -1.456413, -2.567416, 0, 1, 0.7490196, 1,
-0.1021004, -0.936273, -4.067398, 0, 1, 0.7529412, 1,
-0.09950936, 1.688877, 2.167855, 0, 1, 0.7607843, 1,
-0.0958355, 1.239499, -2.443227, 0, 1, 0.7647059, 1,
-0.09026249, 1.692409, 0.04390349, 0, 1, 0.772549, 1,
-0.08826001, -1.144657, -3.693815, 0, 1, 0.7764706, 1,
-0.08796522, -2.264933, -2.753836, 0, 1, 0.7843137, 1,
-0.08399789, 1.559666, -0.9435488, 0, 1, 0.7882353, 1,
-0.08138559, 0.676694, -2.065785, 0, 1, 0.7960784, 1,
-0.08131757, 0.1230317, -0.2824988, 0, 1, 0.8039216, 1,
-0.07750801, 1.438437, -0.2666455, 0, 1, 0.8078431, 1,
-0.07642046, 2.357558, -0.2529729, 0, 1, 0.8156863, 1,
-0.06819401, -0.1532681, -2.322856, 0, 1, 0.8196079, 1,
-0.06664836, 0.03758507, 0.7256656, 0, 1, 0.827451, 1,
-0.06106466, 1.617491, 1.050151, 0, 1, 0.8313726, 1,
-0.05856156, 0.01422963, -1.948523, 0, 1, 0.8392157, 1,
-0.05416104, -1.284484, -0.8232183, 0, 1, 0.8431373, 1,
-0.05188132, -1.43147, -3.135087, 0, 1, 0.8509804, 1,
-0.04846936, 0.8006059, 0.5597236, 0, 1, 0.854902, 1,
-0.04748767, -0.8253673, -1.987819, 0, 1, 0.8627451, 1,
-0.04477127, -1.151026, -4.156637, 0, 1, 0.8666667, 1,
-0.04407402, -0.6107087, -4.198123, 0, 1, 0.8745098, 1,
-0.04399932, 0.5738802, 0.0583251, 0, 1, 0.8784314, 1,
-0.04308921, 0.5626509, 1.103868, 0, 1, 0.8862745, 1,
-0.0389383, -0.1565089, -3.527307, 0, 1, 0.8901961, 1,
-0.03528304, -0.4424001, -3.541488, 0, 1, 0.8980392, 1,
-0.02993084, -0.8552169, -0.2803971, 0, 1, 0.9058824, 1,
-0.02944324, -0.9467542, -3.739254, 0, 1, 0.9098039, 1,
-0.02944315, 0.4471921, 0.06652725, 0, 1, 0.9176471, 1,
-0.02725117, 1.39643, 0.1926838, 0, 1, 0.9215686, 1,
-0.02667528, 0.5191211, -1.297719, 0, 1, 0.9294118, 1,
-0.0223856, 0.5040798, 0.2212719, 0, 1, 0.9333333, 1,
-0.01789221, -1.040544, -1.529361, 0, 1, 0.9411765, 1,
-0.0152992, 0.6484255, 0.4821232, 0, 1, 0.945098, 1,
-0.01242952, 0.5640993, -0.7815183, 0, 1, 0.9529412, 1,
-0.01196731, -1.467114, -3.104557, 0, 1, 0.9568627, 1,
-0.01151114, 2.658482, -0.07700506, 0, 1, 0.9647059, 1,
-0.01036125, -0.8865647, -3.97453, 0, 1, 0.9686275, 1,
-0.007067156, -1.283749, -3.492426, 0, 1, 0.9764706, 1,
-0.006360269, -2.332508, -2.042001, 0, 1, 0.9803922, 1,
-0.0001075146, -2.097053, -3.645993, 0, 1, 0.9882353, 1,
0.001763967, -1.119808, 2.818267, 0, 1, 0.9921569, 1,
0.005299149, 0.5607231, 0.3326361, 0, 1, 1, 1,
0.007328114, -1.13139, 0.5821456, 0, 0.9921569, 1, 1,
0.007518183, 0.5545555, 0.7982036, 0, 0.9882353, 1, 1,
0.008012544, 0.05989338, 0.9093828, 0, 0.9803922, 1, 1,
0.008763378, 0.6356439, -1.029715, 0, 0.9764706, 1, 1,
0.01002531, 2.64421, 0.5840098, 0, 0.9686275, 1, 1,
0.01155875, 1.440241, -1.071581, 0, 0.9647059, 1, 1,
0.01249083, -0.6891764, 2.653589, 0, 0.9568627, 1, 1,
0.01256522, -0.09279435, 2.278892, 0, 0.9529412, 1, 1,
0.01298332, -0.7921267, 1.642108, 0, 0.945098, 1, 1,
0.01502878, -0.973225, 3.508598, 0, 0.9411765, 1, 1,
0.01505854, 0.7772681, 0.4170535, 0, 0.9333333, 1, 1,
0.01797499, -0.4669053, 2.138477, 0, 0.9294118, 1, 1,
0.01815064, 1.452943, -0.1145487, 0, 0.9215686, 1, 1,
0.01916233, -0.1592863, 2.969126, 0, 0.9176471, 1, 1,
0.03016545, -0.6466243, 3.769757, 0, 0.9098039, 1, 1,
0.03097081, 0.1897243, 0.6514565, 0, 0.9058824, 1, 1,
0.03303993, 0.862153, -0.4356508, 0, 0.8980392, 1, 1,
0.03493126, -1.51626, 4.665992, 0, 0.8901961, 1, 1,
0.03499497, 1.070976, -0.8943685, 0, 0.8862745, 1, 1,
0.03680121, -1.187078, 3.397483, 0, 0.8784314, 1, 1,
0.03777219, 0.7713213, -0.8325235, 0, 0.8745098, 1, 1,
0.04198031, -1.792179, 4.325753, 0, 0.8666667, 1, 1,
0.04487181, 3.150455, 0.4934571, 0, 0.8627451, 1, 1,
0.04838895, 0.9834629, 1.53165, 0, 0.854902, 1, 1,
0.0629086, -0.7620903, 2.624729, 0, 0.8509804, 1, 1,
0.06641106, 0.4382568, 0.1977319, 0, 0.8431373, 1, 1,
0.06666876, 0.1190338, 0.3015365, 0, 0.8392157, 1, 1,
0.0721034, 0.5094911, 0.1666366, 0, 0.8313726, 1, 1,
0.07391133, 0.6815871, -0.7378076, 0, 0.827451, 1, 1,
0.07436823, 2.485417, 1.165753, 0, 0.8196079, 1, 1,
0.07505633, 0.5230622, -1.169151, 0, 0.8156863, 1, 1,
0.07588135, -0.5783418, 3.339118, 0, 0.8078431, 1, 1,
0.08139312, -1.306344, 3.230098, 0, 0.8039216, 1, 1,
0.08204252, 0.4471249, 1.243044, 0, 0.7960784, 1, 1,
0.08271022, -1.353084, 3.053371, 0, 0.7882353, 1, 1,
0.08612567, -1.208965, 1.91677, 0, 0.7843137, 1, 1,
0.09025511, -0.9513689, 4.790937, 0, 0.7764706, 1, 1,
0.09027505, 0.1236006, 0.4099432, 0, 0.772549, 1, 1,
0.09270985, 0.323852, 0.7787603, 0, 0.7647059, 1, 1,
0.0989401, -0.6816925, 3.929426, 0, 0.7607843, 1, 1,
0.1039213, 0.282292, 1.579241, 0, 0.7529412, 1, 1,
0.1044833, 1.972248, 0.02138636, 0, 0.7490196, 1, 1,
0.1046433, 1.128913, 0.1803476, 0, 0.7411765, 1, 1,
0.1049652, 2.305888, -0.07941021, 0, 0.7372549, 1, 1,
0.1054427, -1.104178, 2.392271, 0, 0.7294118, 1, 1,
0.109388, -0.4824476, 3.083685, 0, 0.7254902, 1, 1,
0.1107198, -1.692229, 4.202823, 0, 0.7176471, 1, 1,
0.1170008, -0.3320395, 1.692985, 0, 0.7137255, 1, 1,
0.1175743, -0.32936, 2.800523, 0, 0.7058824, 1, 1,
0.1181598, -0.03841791, 0.2677877, 0, 0.6980392, 1, 1,
0.121873, 2.772557, 1.310399, 0, 0.6941177, 1, 1,
0.1349828, -0.4547335, 4.017495, 0, 0.6862745, 1, 1,
0.1358123, 0.267305, 0.7127557, 0, 0.682353, 1, 1,
0.1419829, -1.413556, 3.539912, 0, 0.6745098, 1, 1,
0.1426673, 0.333689, 1.596725, 0, 0.6705883, 1, 1,
0.1440012, 0.1862127, -2.156447, 0, 0.6627451, 1, 1,
0.1485108, 0.395234, 0.3512856, 0, 0.6588235, 1, 1,
0.1498352, 2.316834, 0.9127052, 0, 0.6509804, 1, 1,
0.1535875, 0.7209274, 0.9012926, 0, 0.6470588, 1, 1,
0.162832, 1.846906, -1.026692, 0, 0.6392157, 1, 1,
0.1664009, 1.397368, -0.00271282, 0, 0.6352941, 1, 1,
0.1686853, -0.5689629, 2.512439, 0, 0.627451, 1, 1,
0.170587, -1.481798, 2.10955, 0, 0.6235294, 1, 1,
0.1721304, -0.4251069, 2.649086, 0, 0.6156863, 1, 1,
0.1737877, 0.00394798, 0.2258955, 0, 0.6117647, 1, 1,
0.1792689, 0.3780305, 1.284815, 0, 0.6039216, 1, 1,
0.1813776, 0.4880677, 1.830667, 0, 0.5960785, 1, 1,
0.1820576, 2.16465, -0.4954279, 0, 0.5921569, 1, 1,
0.1843568, -2.240051, 3.137121, 0, 0.5843138, 1, 1,
0.1844458, -0.8974807, 2.05917, 0, 0.5803922, 1, 1,
0.1847948, -0.2326779, 3.537776, 0, 0.572549, 1, 1,
0.1876688, -0.7702944, 2.958152, 0, 0.5686275, 1, 1,
0.1878997, 0.7066829, 0.09719411, 0, 0.5607843, 1, 1,
0.1900929, -0.5892162, 4.173715, 0, 0.5568628, 1, 1,
0.1905979, -0.7426485, 3.297097, 0, 0.5490196, 1, 1,
0.1968235, 0.739747, -2.018909, 0, 0.5450981, 1, 1,
0.1993742, 0.2471379, 0.04580039, 0, 0.5372549, 1, 1,
0.204412, -0.1272183, 3.75548, 0, 0.5333334, 1, 1,
0.2071161, 1.68174, 0.1401986, 0, 0.5254902, 1, 1,
0.2078961, -0.3655533, 2.303273, 0, 0.5215687, 1, 1,
0.2087509, 0.8340397, 0.5241188, 0, 0.5137255, 1, 1,
0.2123718, -3.256577, 2.775935, 0, 0.509804, 1, 1,
0.2171577, 1.154739, 1.340715, 0, 0.5019608, 1, 1,
0.21718, 0.3885226, -1.779389, 0, 0.4941176, 1, 1,
0.2214774, 1.260302, -0.3766057, 0, 0.4901961, 1, 1,
0.2216005, 0.2550353, 0.2295008, 0, 0.4823529, 1, 1,
0.2238281, 1.92431, 0.7995715, 0, 0.4784314, 1, 1,
0.2273185, 0.7599888, 0.5261908, 0, 0.4705882, 1, 1,
0.2349135, 0.4460945, -0.1951554, 0, 0.4666667, 1, 1,
0.2350905, 0.9792303, -1.573163, 0, 0.4588235, 1, 1,
0.2372301, -2.756761, 5.12297, 0, 0.454902, 1, 1,
0.2390382, 1.108846, -0.1525978, 0, 0.4470588, 1, 1,
0.2405585, 0.4151353, 0.1569196, 0, 0.4431373, 1, 1,
0.2469414, -0.4371878, 2.809983, 0, 0.4352941, 1, 1,
0.2530983, 2.986616, -0.5060976, 0, 0.4313726, 1, 1,
0.2626963, 0.3429827, 0.5411506, 0, 0.4235294, 1, 1,
0.2643257, -0.4085675, 2.915912, 0, 0.4196078, 1, 1,
0.2649983, 0.08755537, 0.08269509, 0, 0.4117647, 1, 1,
0.2670025, 0.00947858, 1.053794, 0, 0.4078431, 1, 1,
0.2671628, 0.3477665, 1.654172, 0, 0.4, 1, 1,
0.2678973, 0.0154631, 1.3837, 0, 0.3921569, 1, 1,
0.2688946, -0.1413896, 2.099657, 0, 0.3882353, 1, 1,
0.2698347, 0.7137438, -0.6930271, 0, 0.3803922, 1, 1,
0.2701854, -0.6783024, 1.741349, 0, 0.3764706, 1, 1,
0.2757651, 0.3322339, 0.3682563, 0, 0.3686275, 1, 1,
0.2788827, 0.4107116, 3.127137, 0, 0.3647059, 1, 1,
0.2816911, 0.3047542, 0.3815213, 0, 0.3568628, 1, 1,
0.2848588, -0.1892829, -1.206939, 0, 0.3529412, 1, 1,
0.2860598, -1.884035, 3.432733, 0, 0.345098, 1, 1,
0.2922638, 1.422156, 0.7581738, 0, 0.3411765, 1, 1,
0.293951, -0.6890483, 3.238442, 0, 0.3333333, 1, 1,
0.2954812, 0.6084309, 1.560969, 0, 0.3294118, 1, 1,
0.3004948, 1.572954, -1.26963, 0, 0.3215686, 1, 1,
0.307365, -0.01261633, 1.763595, 0, 0.3176471, 1, 1,
0.3094453, -0.5210311, 1.82397, 0, 0.3098039, 1, 1,
0.3101192, -0.2980584, 3.026873, 0, 0.3058824, 1, 1,
0.3112722, 0.9120457, -0.8121273, 0, 0.2980392, 1, 1,
0.3172273, -0.2639249, 0.5826827, 0, 0.2901961, 1, 1,
0.3176472, 0.4370618, 1.015404, 0, 0.2862745, 1, 1,
0.3207971, -0.852071, 1.770717, 0, 0.2784314, 1, 1,
0.3250079, 1.386743, 2.790457, 0, 0.2745098, 1, 1,
0.3266559, -0.3127564, 3.188787, 0, 0.2666667, 1, 1,
0.3296373, -0.1288615, 1.801671, 0, 0.2627451, 1, 1,
0.3305649, 2.633412, 0.8720875, 0, 0.254902, 1, 1,
0.336156, 1.172321, -0.3834139, 0, 0.2509804, 1, 1,
0.3437847, 1.287181, -0.09162164, 0, 0.2431373, 1, 1,
0.3480696, -0.5277613, 3.79055, 0, 0.2392157, 1, 1,
0.3529198, 0.8516567, 0.2392025, 0, 0.2313726, 1, 1,
0.3539867, 0.7998917, -0.2020099, 0, 0.227451, 1, 1,
0.3558741, 0.1677253, -0.04811349, 0, 0.2196078, 1, 1,
0.3582511, -1.370483, 3.004937, 0, 0.2156863, 1, 1,
0.3606805, 0.1558938, 1.045972, 0, 0.2078431, 1, 1,
0.3627901, 1.208973, -3.141433, 0, 0.2039216, 1, 1,
0.3645943, -0.3886972, 4.143798, 0, 0.1960784, 1, 1,
0.3648059, 0.5162374, 1.557596, 0, 0.1882353, 1, 1,
0.3679249, -0.1321711, 2.242244, 0, 0.1843137, 1, 1,
0.3716831, 0.3358146, 0.8856971, 0, 0.1764706, 1, 1,
0.3726165, 0.5646304, -0.6254478, 0, 0.172549, 1, 1,
0.3739675, 0.4786853, -0.3806323, 0, 0.1647059, 1, 1,
0.3778234, -1.57339, 3.096768, 0, 0.1607843, 1, 1,
0.3851787, 1.022261, 0.9311662, 0, 0.1529412, 1, 1,
0.3894419, 0.3458842, -0.1396328, 0, 0.1490196, 1, 1,
0.3956063, 0.4144965, 0.4020392, 0, 0.1411765, 1, 1,
0.3978932, 1.131246, -0.7482429, 0, 0.1372549, 1, 1,
0.4037524, 0.8428509, -0.1616732, 0, 0.1294118, 1, 1,
0.4043537, 0.0839683, 1.479178, 0, 0.1254902, 1, 1,
0.4110456, -1.550446, 4.363268, 0, 0.1176471, 1, 1,
0.4119302, 0.8710219, 1.486205, 0, 0.1137255, 1, 1,
0.4154822, 0.05235528, 2.087949, 0, 0.1058824, 1, 1,
0.4188571, -1.4117, 3.043765, 0, 0.09803922, 1, 1,
0.4214611, 1.08118, -0.051043, 0, 0.09411765, 1, 1,
0.4222843, -0.7564438, 2.625556, 0, 0.08627451, 1, 1,
0.4225103, 1.779083, -0.6065854, 0, 0.08235294, 1, 1,
0.4299626, -0.5788437, 3.357727, 0, 0.07450981, 1, 1,
0.4304906, -0.1541766, 1.648155, 0, 0.07058824, 1, 1,
0.4315077, 0.4044886, -0.07064506, 0, 0.0627451, 1, 1,
0.4322785, 0.3688082, -0.4062991, 0, 0.05882353, 1, 1,
0.4500797, -0.7477451, 2.648717, 0, 0.05098039, 1, 1,
0.4520933, 1.183721, 1.214188, 0, 0.04705882, 1, 1,
0.4524155, 0.2811504, 3.612123, 0, 0.03921569, 1, 1,
0.4550637, -1.622936, 3.978553, 0, 0.03529412, 1, 1,
0.4586273, -0.5569889, 2.990761, 0, 0.02745098, 1, 1,
0.4617376, -0.2302637, 1.440587, 0, 0.02352941, 1, 1,
0.4621029, -1.392403, 2.186071, 0, 0.01568628, 1, 1,
0.466638, -0.4420633, 1.939335, 0, 0.01176471, 1, 1,
0.4683608, 1.121194, 0.381248, 0, 0.003921569, 1, 1,
0.4715221, -0.3036488, 1.637588, 0.003921569, 0, 1, 1,
0.4828444, -0.4603713, 2.568928, 0.007843138, 0, 1, 1,
0.4852471, -0.2876464, 2.315926, 0.01568628, 0, 1, 1,
0.4862445, -0.04226156, 1.810687, 0.01960784, 0, 1, 1,
0.4922447, -0.4266727, 1.285316, 0.02745098, 0, 1, 1,
0.5009709, -3.113131, 3.76878, 0.03137255, 0, 1, 1,
0.5011575, 0.3044718, 1.641932, 0.03921569, 0, 1, 1,
0.5026312, -0.4710824, 1.480897, 0.04313726, 0, 1, 1,
0.5057701, -1.627779, 3.210396, 0.05098039, 0, 1, 1,
0.5129186, 0.9070525, 0.8943884, 0.05490196, 0, 1, 1,
0.5195356, -0.625164, 3.341353, 0.0627451, 0, 1, 1,
0.5222543, 0.4992967, 1.242647, 0.06666667, 0, 1, 1,
0.5228895, 1.306567, 1.373758, 0.07450981, 0, 1, 1,
0.5276269, -0.1904, 2.392451, 0.07843138, 0, 1, 1,
0.5277259, -0.2767434, 2.932984, 0.08627451, 0, 1, 1,
0.5285851, 0.9940588, 1.656329, 0.09019608, 0, 1, 1,
0.5307073, -1.527596, 3.091149, 0.09803922, 0, 1, 1,
0.5308357, -0.4039919, 1.134384, 0.1058824, 0, 1, 1,
0.5347416, 1.722652, -0.5574636, 0.1098039, 0, 1, 1,
0.5378951, 0.2207248, 0.3767323, 0.1176471, 0, 1, 1,
0.5462453, -0.6415606, 3.60565, 0.1215686, 0, 1, 1,
0.5549947, 1.019293, 1.575143, 0.1294118, 0, 1, 1,
0.5561622, -0.6017687, 2.76412, 0.1333333, 0, 1, 1,
0.5608395, 0.2143454, 1.227175, 0.1411765, 0, 1, 1,
0.5691512, 1.129437, 1.36013, 0.145098, 0, 1, 1,
0.5700132, 0.4532471, 1.041792, 0.1529412, 0, 1, 1,
0.5702195, -0.6448165, 1.327709, 0.1568628, 0, 1, 1,
0.5760459, 1.221649, 1.783337, 0.1647059, 0, 1, 1,
0.5901756, -0.7333352, 4.142316, 0.1686275, 0, 1, 1,
0.590257, 0.7266444, -1.504223, 0.1764706, 0, 1, 1,
0.5915505, -0.3275853, 1.597148, 0.1803922, 0, 1, 1,
0.5917591, -2.134179, 0.7011477, 0.1882353, 0, 1, 1,
0.5965223, -0.04803444, 2.559268, 0.1921569, 0, 1, 1,
0.5990296, -0.252735, 3.093941, 0.2, 0, 1, 1,
0.5992111, 0.5053084, 1.400654, 0.2078431, 0, 1, 1,
0.5998635, -0.8313541, 3.129216, 0.2117647, 0, 1, 1,
0.6043262, 1.597307, 2.013034, 0.2196078, 0, 1, 1,
0.6087057, -0.7594469, 4.393277, 0.2235294, 0, 1, 1,
0.6144642, -1.539502, 2.621042, 0.2313726, 0, 1, 1,
0.6146569, 0.243495, 0.5884925, 0.2352941, 0, 1, 1,
0.6232628, -0.4419671, 2.318728, 0.2431373, 0, 1, 1,
0.6240711, -1.009173, 1.485648, 0.2470588, 0, 1, 1,
0.6303495, 1.03596, 2.388411, 0.254902, 0, 1, 1,
0.6328398, -0.5584523, 2.213875, 0.2588235, 0, 1, 1,
0.6355467, -1.197542, 2.012845, 0.2666667, 0, 1, 1,
0.6449258, -0.7632902, 3.101146, 0.2705882, 0, 1, 1,
0.6489975, 0.19201, 2.421495, 0.2784314, 0, 1, 1,
0.6517738, -1.115749, 4.166337, 0.282353, 0, 1, 1,
0.6552463, 0.1303677, 1.55513, 0.2901961, 0, 1, 1,
0.6553649, 1.440477, 1.347445, 0.2941177, 0, 1, 1,
0.659452, 0.09781457, 1.062043, 0.3019608, 0, 1, 1,
0.6631899, 0.6365526, 1.143934, 0.3098039, 0, 1, 1,
0.6656161, 0.02580469, 2.108428, 0.3137255, 0, 1, 1,
0.6680172, 0.268292, -0.5534427, 0.3215686, 0, 1, 1,
0.6696947, -0.1032896, 1.373293, 0.3254902, 0, 1, 1,
0.6716673, 0.7612656, -0.5161723, 0.3333333, 0, 1, 1,
0.6719202, -0.002751483, -0.03402764, 0.3372549, 0, 1, 1,
0.6737538, -0.1057002, 1.716805, 0.345098, 0, 1, 1,
0.6782855, -0.963467, 3.495407, 0.3490196, 0, 1, 1,
0.6817109, -1.018799, 2.162823, 0.3568628, 0, 1, 1,
0.6833162, -0.1560121, 4.781818, 0.3607843, 0, 1, 1,
0.6839967, -0.4076745, 2.306463, 0.3686275, 0, 1, 1,
0.6853731, -0.7345454, 2.777367, 0.372549, 0, 1, 1,
0.6860834, 0.06019429, 0.4007289, 0.3803922, 0, 1, 1,
0.6869355, -1.155808, 2.075226, 0.3843137, 0, 1, 1,
0.6962851, -0.1507279, 1.002981, 0.3921569, 0, 1, 1,
0.6991934, 1.432086, -0.2763822, 0.3960784, 0, 1, 1,
0.7014551, -0.4204717, 2.035014, 0.4039216, 0, 1, 1,
0.7048408, 0.5394649, -0.03067485, 0.4117647, 0, 1, 1,
0.7067021, -0.4167988, 4.670889, 0.4156863, 0, 1, 1,
0.707914, -1.187229, 1.827695, 0.4235294, 0, 1, 1,
0.7120498, 0.2443941, 1.609651, 0.427451, 0, 1, 1,
0.7143682, 0.9545945, -1.012537, 0.4352941, 0, 1, 1,
0.7215695, -1.7713, 3.294297, 0.4392157, 0, 1, 1,
0.7229679, 1.295939, -0.004053317, 0.4470588, 0, 1, 1,
0.7230584, 0.7940108, 1.784645, 0.4509804, 0, 1, 1,
0.7283413, -0.03865872, 2.641661, 0.4588235, 0, 1, 1,
0.7292743, -0.4948154, 1.317498, 0.4627451, 0, 1, 1,
0.7321481, 1.101584, -0.9376385, 0.4705882, 0, 1, 1,
0.7342075, -0.1565353, 2.499694, 0.4745098, 0, 1, 1,
0.7376274, 0.2763456, 2.270607, 0.4823529, 0, 1, 1,
0.7440704, 0.3966002, 2.755312, 0.4862745, 0, 1, 1,
0.7457324, 1.085997, -0.9719088, 0.4941176, 0, 1, 1,
0.7521612, 0.9550431, 0.7078357, 0.5019608, 0, 1, 1,
0.7524704, -2.561916, 2.971101, 0.5058824, 0, 1, 1,
0.7533501, 0.1394279, -1.347607, 0.5137255, 0, 1, 1,
0.7534986, -0.7179746, 0.3702011, 0.5176471, 0, 1, 1,
0.7549197, -2.471285, 4.125086, 0.5254902, 0, 1, 1,
0.756139, 0.7675753, 1.382616, 0.5294118, 0, 1, 1,
0.7565736, -2.270882, 2.278113, 0.5372549, 0, 1, 1,
0.7577196, -0.5763963, 1.223523, 0.5411765, 0, 1, 1,
0.7662999, -0.3549787, 2.297827, 0.5490196, 0, 1, 1,
0.7665579, -0.01358292, 0.8123875, 0.5529412, 0, 1, 1,
0.7667518, -1.700975, 2.204043, 0.5607843, 0, 1, 1,
0.7722223, -0.8549527, 2.152075, 0.5647059, 0, 1, 1,
0.7726391, 0.3153367, 1.704816, 0.572549, 0, 1, 1,
0.7744265, -0.3779828, 0.315189, 0.5764706, 0, 1, 1,
0.7807612, -1.037983, 2.334888, 0.5843138, 0, 1, 1,
0.7815563, 2.918864, 0.8273404, 0.5882353, 0, 1, 1,
0.7825207, 0.08247945, 2.403016, 0.5960785, 0, 1, 1,
0.7839214, 0.5948617, 0.04642976, 0.6039216, 0, 1, 1,
0.7852085, -0.459768, 2.550311, 0.6078432, 0, 1, 1,
0.7989467, 0.5221722, 1.356438, 0.6156863, 0, 1, 1,
0.7998558, 1.324633, 0.6234559, 0.6196079, 0, 1, 1,
0.8031065, 0.8002394, -0.3849586, 0.627451, 0, 1, 1,
0.8071228, 0.354715, -0.6412032, 0.6313726, 0, 1, 1,
0.814796, -0.5571222, 1.699078, 0.6392157, 0, 1, 1,
0.820279, 0.3779892, 1.870008, 0.6431373, 0, 1, 1,
0.824273, 0.3455586, 0.9406149, 0.6509804, 0, 1, 1,
0.8295837, -2.565927, 3.227977, 0.654902, 0, 1, 1,
0.8334948, -0.8039034, 2.347883, 0.6627451, 0, 1, 1,
0.8349395, 0.5835698, 0.05785368, 0.6666667, 0, 1, 1,
0.8358884, 0.3293008, -0.02715926, 0.6745098, 0, 1, 1,
0.8370314, 1.057004, 0.9092836, 0.6784314, 0, 1, 1,
0.8383704, -1.987219, 3.970442, 0.6862745, 0, 1, 1,
0.8419251, -0.3764587, 1.263628, 0.6901961, 0, 1, 1,
0.8490025, 0.606749, 1.156482, 0.6980392, 0, 1, 1,
0.8509905, 1.244462, 0.5946665, 0.7058824, 0, 1, 1,
0.8537235, 1.029012, -0.6021578, 0.7098039, 0, 1, 1,
0.8543253, 0.1996281, 0.3318189, 0.7176471, 0, 1, 1,
0.8569093, 1.046516, 0.04591564, 0.7215686, 0, 1, 1,
0.8579281, 0.02355205, 1.010103, 0.7294118, 0, 1, 1,
0.859187, -0.146007, 2.435691, 0.7333333, 0, 1, 1,
0.8604856, 0.698718, 0.03304186, 0.7411765, 0, 1, 1,
0.8656997, 0.4286269, 0.7663924, 0.7450981, 0, 1, 1,
0.8662207, 1.076856, 1.483966, 0.7529412, 0, 1, 1,
0.8693404, 0.7366281, 1.460625, 0.7568628, 0, 1, 1,
0.8696029, -0.1125698, 2.896838, 0.7647059, 0, 1, 1,
0.8730592, -1.037141, 1.738118, 0.7686275, 0, 1, 1,
0.8762813, -0.9977579, 3.318003, 0.7764706, 0, 1, 1,
0.8769848, 0.536878, 0.9466783, 0.7803922, 0, 1, 1,
0.8770435, -0.222412, 3.464474, 0.7882353, 0, 1, 1,
0.8780284, 1.229092, 1.945173, 0.7921569, 0, 1, 1,
0.8937411, 1.731436, 1.246499, 0.8, 0, 1, 1,
0.8973864, -0.9639794, 2.670754, 0.8078431, 0, 1, 1,
0.9139087, 0.2845023, 0.336859, 0.8117647, 0, 1, 1,
0.9146119, 0.1856454, 0.03160866, 0.8196079, 0, 1, 1,
0.9154333, 1.397784, 0.9439227, 0.8235294, 0, 1, 1,
0.9201106, 1.334859, 1.164957, 0.8313726, 0, 1, 1,
0.928584, 1.273161, -1.115306, 0.8352941, 0, 1, 1,
0.9317328, -0.08412638, 2.658924, 0.8431373, 0, 1, 1,
0.9332784, -0.2054724, 2.743585, 0.8470588, 0, 1, 1,
0.9332886, -1.452712, 5.770085, 0.854902, 0, 1, 1,
0.9378291, 0.4146524, 0.9831024, 0.8588235, 0, 1, 1,
0.9462894, 0.6744797, 2.30839, 0.8666667, 0, 1, 1,
0.9478135, -0.8982219, 0.8356813, 0.8705882, 0, 1, 1,
0.9500736, 0.7410842, -0.1819229, 0.8784314, 0, 1, 1,
0.9760523, -0.2732334, 2.439473, 0.8823529, 0, 1, 1,
0.977793, -0.6126019, 1.442282, 0.8901961, 0, 1, 1,
0.9808203, -1.597355, 3.588491, 0.8941177, 0, 1, 1,
0.9827514, -0.9334204, 2.65119, 0.9019608, 0, 1, 1,
0.9856405, -1.185553, 0.6103398, 0.9098039, 0, 1, 1,
0.9860021, -0.390493, 2.670933, 0.9137255, 0, 1, 1,
0.9864479, 0.8130892, 1.758764, 0.9215686, 0, 1, 1,
0.9908353, -0.6853126, 1.765098, 0.9254902, 0, 1, 1,
0.9990945, 0.3080125, 2.288563, 0.9333333, 0, 1, 1,
1.011935, -0.1252916, 2.227751, 0.9372549, 0, 1, 1,
1.014101, -0.8390757, 2.592773, 0.945098, 0, 1, 1,
1.014956, 1.246781, 2.719012, 0.9490196, 0, 1, 1,
1.018621, -0.7186202, 2.268332, 0.9568627, 0, 1, 1,
1.033209, -0.7752527, 1.607605, 0.9607843, 0, 1, 1,
1.035262, 0.1774828, 2.691485, 0.9686275, 0, 1, 1,
1.037235, 1.77049, 1.089015, 0.972549, 0, 1, 1,
1.037889, -0.8405101, 2.302053, 0.9803922, 0, 1, 1,
1.045036, -0.4357633, 3.353639, 0.9843137, 0, 1, 1,
1.054831, 1.88701, 0.5064324, 0.9921569, 0, 1, 1,
1.057531, 1.810987, 0.5203253, 0.9960784, 0, 1, 1,
1.059191, 0.554605, 0.3927992, 1, 0, 0.9960784, 1,
1.063858, -0.4881801, 1.670205, 1, 0, 0.9882353, 1,
1.068756, -0.02891912, 2.913076, 1, 0, 0.9843137, 1,
1.069472, -0.4222428, 3.800734, 1, 0, 0.9764706, 1,
1.073291, -1.43408, 3.449501, 1, 0, 0.972549, 1,
1.073519, 0.6046972, 1.527815, 1, 0, 0.9647059, 1,
1.074628, -1.193891, 3.130019, 1, 0, 0.9607843, 1,
1.086719, -1.006254, 1.661574, 1, 0, 0.9529412, 1,
1.089283, 1.15641, -1.079769, 1, 0, 0.9490196, 1,
1.090538, 0.06016445, 1.746159, 1, 0, 0.9411765, 1,
1.091297, -0.3206778, 2.035775, 1, 0, 0.9372549, 1,
1.097433, 0.7850469, 3.7774, 1, 0, 0.9294118, 1,
1.098813, 0.9600103, -0.3145081, 1, 0, 0.9254902, 1,
1.10229, -0.3937579, 3.094506, 1, 0, 0.9176471, 1,
1.104516, -1.001051, 2.224803, 1, 0, 0.9137255, 1,
1.106642, -0.8977118, 2.810166, 1, 0, 0.9058824, 1,
1.109407, -2.358634, 3.721461, 1, 0, 0.9019608, 1,
1.109516, -0.4381707, 1.824931, 1, 0, 0.8941177, 1,
1.110902, 1.561066, 0.4296264, 1, 0, 0.8862745, 1,
1.113017, 0.1363881, 2.117761, 1, 0, 0.8823529, 1,
1.11332, -0.2108155, 2.493762, 1, 0, 0.8745098, 1,
1.113576, 1.075115, -0.8103838, 1, 0, 0.8705882, 1,
1.119244, -0.7490699, 1.19662, 1, 0, 0.8627451, 1,
1.121492, 0.5924389, 0.8687103, 1, 0, 0.8588235, 1,
1.12949, -1.297495, 3.453863, 1, 0, 0.8509804, 1,
1.13572, 1.304983, 2.854008, 1, 0, 0.8470588, 1,
1.13629, 0.1588224, 2.301153, 1, 0, 0.8392157, 1,
1.144312, 0.05662289, 2.329773, 1, 0, 0.8352941, 1,
1.148999, -0.7197399, 4.732257, 1, 0, 0.827451, 1,
1.150105, -0.04326246, 2.267624, 1, 0, 0.8235294, 1,
1.153602, -0.002648834, -0.4170533, 1, 0, 0.8156863, 1,
1.154748, -0.6053375, 1.152845, 1, 0, 0.8117647, 1,
1.158027, 1.200115, 2.206426, 1, 0, 0.8039216, 1,
1.160076, -0.02127217, 1.822697, 1, 0, 0.7960784, 1,
1.160734, -0.9918928, 3.75453, 1, 0, 0.7921569, 1,
1.16514, 1.483603, -0.2312635, 1, 0, 0.7843137, 1,
1.168884, -0.1420561, 1.567253, 1, 0, 0.7803922, 1,
1.170964, 0.9174427, 0.8719581, 1, 0, 0.772549, 1,
1.174047, -0.5267205, 1.350082, 1, 0, 0.7686275, 1,
1.187088, 1.478967, 0.1601844, 1, 0, 0.7607843, 1,
1.188268, 1.769855, 0.1520623, 1, 0, 0.7568628, 1,
1.192194, 0.9522289, -0.01693076, 1, 0, 0.7490196, 1,
1.20259, -0.6756694, 0.8677668, 1, 0, 0.7450981, 1,
1.203835, 0.7668378, 1.038292, 1, 0, 0.7372549, 1,
1.20543, -1.133821, 2.955266, 1, 0, 0.7333333, 1,
1.208737, 0.4653786, 2.446385, 1, 0, 0.7254902, 1,
1.214905, -0.2951663, 0.7851329, 1, 0, 0.7215686, 1,
1.222712, -0.2454946, 0.7772284, 1, 0, 0.7137255, 1,
1.224059, -0.9165703, 3.594981, 1, 0, 0.7098039, 1,
1.224212, 0.1078494, 3.06666, 1, 0, 0.7019608, 1,
1.226813, 0.1453837, 1.53103, 1, 0, 0.6941177, 1,
1.227775, -1.082305, 1.934766, 1, 0, 0.6901961, 1,
1.255056, -1.510561, 1.892965, 1, 0, 0.682353, 1,
1.257811, 0.9918861, 0.7894878, 1, 0, 0.6784314, 1,
1.276069, -0.6225101, 3.242344, 1, 0, 0.6705883, 1,
1.278955, 0.07471736, 3.710661, 1, 0, 0.6666667, 1,
1.286206, -0.5221388, 2.588438, 1, 0, 0.6588235, 1,
1.295015, -0.199953, 1.70005, 1, 0, 0.654902, 1,
1.295306, 1.352491, 1.659383, 1, 0, 0.6470588, 1,
1.300175, 0.03514107, 0.7680386, 1, 0, 0.6431373, 1,
1.301186, 0.3797334, 0.8173102, 1, 0, 0.6352941, 1,
1.315368, 1.921139, 0.6754965, 1, 0, 0.6313726, 1,
1.316496, 0.003301219, 2.087466, 1, 0, 0.6235294, 1,
1.330282, 2.827834, 0.5729828, 1, 0, 0.6196079, 1,
1.334279, -0.9547067, 0.6325573, 1, 0, 0.6117647, 1,
1.334394, -0.943377, 1.430689, 1, 0, 0.6078432, 1,
1.353848, 0.309657, 2.284737, 1, 0, 0.6, 1,
1.357522, -0.6232147, 0.4760358, 1, 0, 0.5921569, 1,
1.358364, -1.970891, 0.928309, 1, 0, 0.5882353, 1,
1.363443, 0.1483777, 1.587196, 1, 0, 0.5803922, 1,
1.364383, 0.2827548, 1.94029, 1, 0, 0.5764706, 1,
1.368217, -0.4352752, 2.102707, 1, 0, 0.5686275, 1,
1.372503, 0.7951296, 1.915048, 1, 0, 0.5647059, 1,
1.418398, 0.4495166, -0.9446217, 1, 0, 0.5568628, 1,
1.419145, -0.3838952, 2.456839, 1, 0, 0.5529412, 1,
1.424844, -0.3669442, 2.619094, 1, 0, 0.5450981, 1,
1.429005, -0.2336568, 1.371356, 1, 0, 0.5411765, 1,
1.429555, -1.314471, 1.243083, 1, 0, 0.5333334, 1,
1.429863, -1.91876, 2.361002, 1, 0, 0.5294118, 1,
1.441449, -0.3067672, 2.065372, 1, 0, 0.5215687, 1,
1.443046, -1.886374, 4.642426, 1, 0, 0.5176471, 1,
1.453413, -0.3360037, 2.703826, 1, 0, 0.509804, 1,
1.460113, -0.511628, 2.632883, 1, 0, 0.5058824, 1,
1.473487, 0.4596864, 1.682745, 1, 0, 0.4980392, 1,
1.488174, -1.023948, 1.477435, 1, 0, 0.4901961, 1,
1.491015, 0.4008832, 1.661758, 1, 0, 0.4862745, 1,
1.496133, 0.3225138, 1.739186, 1, 0, 0.4784314, 1,
1.499074, -0.1011476, 1.914318, 1, 0, 0.4745098, 1,
1.505988, 0.6918723, 1.596525, 1, 0, 0.4666667, 1,
1.508783, 0.3661183, 3.347822, 1, 0, 0.4627451, 1,
1.515158, 0.4687674, 1.605577, 1, 0, 0.454902, 1,
1.51979, -0.6091067, 1.710439, 1, 0, 0.4509804, 1,
1.528631, -1.727365, 1.72929, 1, 0, 0.4431373, 1,
1.531112, 0.9455922, 2.083794, 1, 0, 0.4392157, 1,
1.532621, -1.307883, 2.37169, 1, 0, 0.4313726, 1,
1.542098, -0.5823511, 0.8749048, 1, 0, 0.427451, 1,
1.548483, -0.5886113, 2.303925, 1, 0, 0.4196078, 1,
1.551892, -0.07052496, 1.483123, 1, 0, 0.4156863, 1,
1.552346, 0.9488048, 0.6417012, 1, 0, 0.4078431, 1,
1.55762, 0.1078088, 2.571899, 1, 0, 0.4039216, 1,
1.571014, -0.02424793, 2.345979, 1, 0, 0.3960784, 1,
1.578755, 0.4055519, 1.085243, 1, 0, 0.3882353, 1,
1.585407, 0.8796653, 2.312679, 1, 0, 0.3843137, 1,
1.585539, -0.538583, 2.542456, 1, 0, 0.3764706, 1,
1.593532, 0.3315614, 0.8806973, 1, 0, 0.372549, 1,
1.595901, 0.9198767, 0.9350863, 1, 0, 0.3647059, 1,
1.60691, 0.6085088, 0.1308552, 1, 0, 0.3607843, 1,
1.62051, -0.4281351, 1.691321, 1, 0, 0.3529412, 1,
1.622107, -0.1828795, 1.327665, 1, 0, 0.3490196, 1,
1.651827, -0.6771553, 1.214052, 1, 0, 0.3411765, 1,
1.66469, 0.2400476, 1.137017, 1, 0, 0.3372549, 1,
1.665335, 0.3534709, 1.753489, 1, 0, 0.3294118, 1,
1.673332, -0.8858809, 1.979651, 1, 0, 0.3254902, 1,
1.682067, 0.4722088, 3.341238, 1, 0, 0.3176471, 1,
1.690708, -2.511517, 2.493398, 1, 0, 0.3137255, 1,
1.694957, -0.9145361, 2.928668, 1, 0, 0.3058824, 1,
1.70079, 1.366328, -1.357929, 1, 0, 0.2980392, 1,
1.715899, 0.9863265, 0.7424617, 1, 0, 0.2941177, 1,
1.742974, 2.022518, -0.9722238, 1, 0, 0.2862745, 1,
1.74424, -1.86783, 3.562445, 1, 0, 0.282353, 1,
1.744986, 1.514064, 0.8690186, 1, 0, 0.2745098, 1,
1.750054, -1.14612, 0.5100922, 1, 0, 0.2705882, 1,
1.754783, -0.6253472, 2.352127, 1, 0, 0.2627451, 1,
1.778932, -1.65158, 1.339274, 1, 0, 0.2588235, 1,
1.822433, -1.394568, 3.836224, 1, 0, 0.2509804, 1,
1.828161, 1.783385, 0.4001671, 1, 0, 0.2470588, 1,
1.829098, -1.819535, 1.14705, 1, 0, 0.2392157, 1,
1.85497, 0.03901375, 1.189827, 1, 0, 0.2352941, 1,
1.858182, 0.2049694, 2.106523, 1, 0, 0.227451, 1,
1.859316, 1.769503, -1.061476, 1, 0, 0.2235294, 1,
1.882088, -1.190565, 3.64333, 1, 0, 0.2156863, 1,
1.940748, -1.613024, 2.06853, 1, 0, 0.2117647, 1,
1.943488, 0.05043107, 2.976727, 1, 0, 0.2039216, 1,
1.946262, -1.560063, 1.642522, 1, 0, 0.1960784, 1,
1.947881, 0.3973677, 1.29852, 1, 0, 0.1921569, 1,
1.958363, 0.6914589, 0.5308025, 1, 0, 0.1843137, 1,
1.987721, -0.2273757, 3.57158, 1, 0, 0.1803922, 1,
1.989231, 0.3105488, -0.5390593, 1, 0, 0.172549, 1,
1.998199, 0.4931597, -1.4675, 1, 0, 0.1686275, 1,
2.032311, 1.514875, -1.552993, 1, 0, 0.1607843, 1,
2.037762, 0.1250778, 1.023705, 1, 0, 0.1568628, 1,
2.058366, 0.01077106, 2.466067, 1, 0, 0.1490196, 1,
2.063559, 0.7944679, 1.664918, 1, 0, 0.145098, 1,
2.067355, -0.281815, 2.660223, 1, 0, 0.1372549, 1,
2.093529, -1.142277, 2.2122, 1, 0, 0.1333333, 1,
2.09621, -0.5096264, 3.887677, 1, 0, 0.1254902, 1,
2.097728, -0.8498073, 1.944648, 1, 0, 0.1215686, 1,
2.12463, -1.373114, 1.361275, 1, 0, 0.1137255, 1,
2.129954, 1.795151, 0.382271, 1, 0, 0.1098039, 1,
2.197326, -1.02613, 3.490974, 1, 0, 0.1019608, 1,
2.200987, 0.08551256, 0.4379571, 1, 0, 0.09411765, 1,
2.201931, 0.1971243, 2.669841, 1, 0, 0.09019608, 1,
2.208694, 0.6932287, 1.660849, 1, 0, 0.08235294, 1,
2.215057, -1.272911, 1.474868, 1, 0, 0.07843138, 1,
2.281329, 0.8452691, -0.2149043, 1, 0, 0.07058824, 1,
2.313648, -0.3659776, 1.93223, 1, 0, 0.06666667, 1,
2.377729, 0.8091454, 0.7461249, 1, 0, 0.05882353, 1,
2.427718, 0.9261143, 0.324726, 1, 0, 0.05490196, 1,
2.460898, 1.879363, 1.582494, 1, 0, 0.04705882, 1,
2.551973, -1.963549, 2.234311, 1, 0, 0.04313726, 1,
2.620313, 0.5421863, 1.980262, 1, 0, 0.03529412, 1,
2.830902, -0.06374, -0.0154371, 1, 0, 0.03137255, 1,
2.933929, -0.3374032, 0.3949042, 1, 0, 0.02352941, 1,
2.956574, -0.09614602, 2.313072, 1, 0, 0.01960784, 1,
3.012538, 2.327676, 0.8047706, 1, 0, 0.01176471, 1,
3.364331, -0.943444, 1.642379, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.1027775, -4.342568, -7.256643, 0, -0.5, 0.5, 0.5,
-0.1027775, -4.342568, -7.256643, 1, -0.5, 0.5, 0.5,
-0.1027775, -4.342568, -7.256643, 1, 1.5, 0.5, 0.5,
-0.1027775, -4.342568, -7.256643, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.745235, -0.05306113, -7.256643, 0, -0.5, 0.5, 0.5,
-4.745235, -0.05306113, -7.256643, 1, -0.5, 0.5, 0.5,
-4.745235, -0.05306113, -7.256643, 1, 1.5, 0.5, 0.5,
-4.745235, -0.05306113, -7.256643, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.745235, -4.342568, 0.2007275, 0, -0.5, 0.5, 0.5,
-4.745235, -4.342568, 0.2007275, 1, -0.5, 0.5, 0.5,
-4.745235, -4.342568, 0.2007275, 1, 1.5, 0.5, 0.5,
-4.745235, -4.342568, 0.2007275, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.352682, -5.535711,
3, -3.352682, -5.535711,
-3, -3.352682, -5.535711,
-3, -3.517663, -5.822533,
-2, -3.352682, -5.535711,
-2, -3.517663, -5.822533,
-1, -3.352682, -5.535711,
-1, -3.517663, -5.822533,
0, -3.352682, -5.535711,
0, -3.517663, -5.822533,
1, -3.352682, -5.535711,
1, -3.517663, -5.822533,
2, -3.352682, -5.535711,
2, -3.517663, -5.822533,
3, -3.352682, -5.535711,
3, -3.517663, -5.822533
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
-3, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
-3, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
-3, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
-2, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
-2, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
-2, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
-2, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
-1, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
-1, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
-1, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
-1, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
0, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
0, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
0, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
0, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
1, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
1, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
1, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
1, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
2, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
2, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
2, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
2, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5,
3, -3.847625, -6.396177, 0, -0.5, 0.5, 0.5,
3, -3.847625, -6.396177, 1, -0.5, 0.5, 0.5,
3, -3.847625, -6.396177, 1, 1.5, 0.5, 0.5,
3, -3.847625, -6.396177, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.673899, -3, -5.535711,
-3.673899, 3, -5.535711,
-3.673899, -3, -5.535711,
-3.852455, -3, -5.822533,
-3.673899, -2, -5.535711,
-3.852455, -2, -5.822533,
-3.673899, -1, -5.535711,
-3.852455, -1, -5.822533,
-3.673899, 0, -5.535711,
-3.852455, 0, -5.822533,
-3.673899, 1, -5.535711,
-3.852455, 1, -5.822533,
-3.673899, 2, -5.535711,
-3.852455, 2, -5.822533,
-3.673899, 3, -5.535711,
-3.852455, 3, -5.822533
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.209567, -3, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, -3, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, -3, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, -3, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, -2, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, -2, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, -2, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, -2, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, -1, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, -1, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, -1, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, -1, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, 0, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, 0, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, 0, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, 0, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, 1, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, 1, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, 1, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, 1, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, 2, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, 2, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, 2, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, 2, -6.396177, 0, 1.5, 0.5, 0.5,
-4.209567, 3, -6.396177, 0, -0.5, 0.5, 0.5,
-4.209567, 3, -6.396177, 1, -0.5, 0.5, 0.5,
-4.209567, 3, -6.396177, 1, 1.5, 0.5, 0.5,
-4.209567, 3, -6.396177, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.673899, -3.352682, -4,
-3.673899, -3.352682, 4,
-3.673899, -3.352682, -4,
-3.852455, -3.517663, -4,
-3.673899, -3.352682, -2,
-3.852455, -3.517663, -2,
-3.673899, -3.352682, 0,
-3.852455, -3.517663, 0,
-3.673899, -3.352682, 2,
-3.852455, -3.517663, 2,
-3.673899, -3.352682, 4,
-3.852455, -3.517663, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.209567, -3.847625, -4, 0, -0.5, 0.5, 0.5,
-4.209567, -3.847625, -4, 1, -0.5, 0.5, 0.5,
-4.209567, -3.847625, -4, 1, 1.5, 0.5, 0.5,
-4.209567, -3.847625, -4, 0, 1.5, 0.5, 0.5,
-4.209567, -3.847625, -2, 0, -0.5, 0.5, 0.5,
-4.209567, -3.847625, -2, 1, -0.5, 0.5, 0.5,
-4.209567, -3.847625, -2, 1, 1.5, 0.5, 0.5,
-4.209567, -3.847625, -2, 0, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 0, 0, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 0, 1, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 0, 1, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 0, 0, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 2, 0, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 2, 1, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 2, 1, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 2, 0, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 4, 0, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 4, 1, -0.5, 0.5, 0.5,
-4.209567, -3.847625, 4, 1, 1.5, 0.5, 0.5,
-4.209567, -3.847625, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.673899, -3.352682, -5.535711,
-3.673899, 3.24656, -5.535711,
-3.673899, -3.352682, 5.937166,
-3.673899, 3.24656, 5.937166,
-3.673899, -3.352682, -5.535711,
-3.673899, -3.352682, 5.937166,
-3.673899, 3.24656, -5.535711,
-3.673899, 3.24656, 5.937166,
-3.673899, -3.352682, -5.535711,
3.468344, -3.352682, -5.535711,
-3.673899, -3.352682, 5.937166,
3.468344, -3.352682, 5.937166,
-3.673899, 3.24656, -5.535711,
3.468344, 3.24656, -5.535711,
-3.673899, 3.24656, 5.937166,
3.468344, 3.24656, 5.937166,
3.468344, -3.352682, -5.535711,
3.468344, 3.24656, -5.535711,
3.468344, -3.352682, 5.937166,
3.468344, 3.24656, 5.937166,
3.468344, -3.352682, -5.535711,
3.468344, -3.352682, 5.937166,
3.468344, 3.24656, -5.535711,
3.468344, 3.24656, 5.937166
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.030836;
var distance = 35.73009;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1027775, 0.05306113, -0.2007275 );
mvMatrix.scale( 1.215738, 1.315772, 0.756837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73009);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methyl_carbamate<-read.table("Methyl_carbamate.xyz")
```

```
## Error in read.table("Methyl_carbamate.xyz"): no lines available in input
```

```r
x<-Methyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
y<-Methyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
z<-Methyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.569885, 0.04362577, -3.033859, 0, 0, 1, 1, 1,
-2.895462, 0.4271719, -1.981717, 1, 0, 0, 1, 1,
-2.693263, -0.8602822, -1.54412, 1, 0, 0, 1, 1,
-2.663299, -0.7348714, -2.521413, 1, 0, 0, 1, 1,
-2.585084, -0.8549243, -1.068146, 1, 0, 0, 1, 1,
-2.46751, -1.030186, -1.444283, 1, 0, 0, 1, 1,
-2.463895, 0.04738339, 0.1066988, 0, 0, 0, 1, 1,
-2.418152, -2.319165, -3.884586, 0, 0, 0, 1, 1,
-2.398885, 0.6802434, -3.507766, 0, 0, 0, 1, 1,
-2.355226, -0.9329439, -3.413142, 0, 0, 0, 1, 1,
-2.347991, -0.1225665, -3.270082, 0, 0, 0, 1, 1,
-2.341305, -0.9979429, -2.906646, 0, 0, 0, 1, 1,
-2.203268, -1.020756, -1.144436, 0, 0, 0, 1, 1,
-2.181219, -2.877776, -3.399353, 1, 1, 1, 1, 1,
-2.156579, -0.08186968, -1.643563, 1, 1, 1, 1, 1,
-2.128078, 1.129715, -0.2952922, 1, 1, 1, 1, 1,
-2.106148, -0.9841574, -3.247137, 1, 1, 1, 1, 1,
-2.082599, 1.233326, -2.428205, 1, 1, 1, 1, 1,
-2.074515, 0.9414125, -0.9636079, 1, 1, 1, 1, 1,
-2.05438, 0.4520751, -2.227977, 1, 1, 1, 1, 1,
-2.036942, -1.628719, -3.748393, 1, 1, 1, 1, 1,
-2.027316, 0.758387, -0.8303066, 1, 1, 1, 1, 1,
-1.99241, -0.9291641, -2.446804, 1, 1, 1, 1, 1,
-1.977666, -0.2648316, -1.970449, 1, 1, 1, 1, 1,
-1.92029, 0.6359845, -1.259, 1, 1, 1, 1, 1,
-1.913736, 2.01536, -1.085896, 1, 1, 1, 1, 1,
-1.908917, 0.3773192, -0.4523777, 1, 1, 1, 1, 1,
-1.89424, 0.9299031, -1.144273, 1, 1, 1, 1, 1,
-1.893837, -0.742923, -2.336465, 0, 0, 1, 1, 1,
-1.887175, -0.3345495, -2.17762, 1, 0, 0, 1, 1,
-1.880039, -1.459762, -2.445181, 1, 0, 0, 1, 1,
-1.864933, 1.622364, -0.3001096, 1, 0, 0, 1, 1,
-1.852405, 1.433069, -0.3844108, 1, 0, 0, 1, 1,
-1.815853, 0.4747393, -2.77754, 1, 0, 0, 1, 1,
-1.786021, 0.7116709, -1.498863, 0, 0, 0, 1, 1,
-1.738919, -0.416983, -2.507396, 0, 0, 0, 1, 1,
-1.734421, 0.4302899, -1.669815, 0, 0, 0, 1, 1,
-1.732587, 0.4150146, -1.588045, 0, 0, 0, 1, 1,
-1.720519, 1.743667, -1.042725, 0, 0, 0, 1, 1,
-1.698927, -0.6211892, -2.922734, 0, 0, 0, 1, 1,
-1.697538, 0.7251197, -2.79689, 0, 0, 0, 1, 1,
-1.68296, -0.1537943, -1.845973, 1, 1, 1, 1, 1,
-1.682274, 0.3956059, -0.1873198, 1, 1, 1, 1, 1,
-1.675798, 0.9933956, -2.670867, 1, 1, 1, 1, 1,
-1.651213, -0.04478323, -3.333006, 1, 1, 1, 1, 1,
-1.647711, -0.76986, -3.598722, 1, 1, 1, 1, 1,
-1.64446, 1.240193, 1.312949, 1, 1, 1, 1, 1,
-1.644085, -0.8732466, -1.565666, 1, 1, 1, 1, 1,
-1.641789, -1.997106, -2.301355, 1, 1, 1, 1, 1,
-1.624265, 0.8674812, -1.603418, 1, 1, 1, 1, 1,
-1.605561, -0.8085545, -3.096943, 1, 1, 1, 1, 1,
-1.588621, -0.003959615, -1.678513, 1, 1, 1, 1, 1,
-1.573686, -0.1636074, -3.066352, 1, 1, 1, 1, 1,
-1.569294, -0.905143, -2.539981, 1, 1, 1, 1, 1,
-1.566575, 1.35386, 1.841485, 1, 1, 1, 1, 1,
-1.564825, 1.313715, -0.7814006, 1, 1, 1, 1, 1,
-1.549279, 0.8344735, 0.5610195, 0, 0, 1, 1, 1,
-1.534889, 0.3273929, -2.544293, 1, 0, 0, 1, 1,
-1.522211, -0.2641909, -0.04456522, 1, 0, 0, 1, 1,
-1.509684, -1.298288, -0.5957331, 1, 0, 0, 1, 1,
-1.508169, 0.1176341, -0.4617419, 1, 0, 0, 1, 1,
-1.49059, 0.4698323, -2.785074, 1, 0, 0, 1, 1,
-1.489864, 1.537616, -0.0768297, 0, 0, 0, 1, 1,
-1.484444, 2.174653, -0.4969097, 0, 0, 0, 1, 1,
-1.476175, 0.06171269, -1.509745, 0, 0, 0, 1, 1,
-1.475219, -0.7736213, -2.639651, 0, 0, 0, 1, 1,
-1.474056, -1.302688, -1.758481, 0, 0, 0, 1, 1,
-1.472944, -0.08081818, -3.347426, 0, 0, 0, 1, 1,
-1.46445, -0.2464143, -0.9777339, 0, 0, 0, 1, 1,
-1.449737, -0.266322, -1.770651, 1, 1, 1, 1, 1,
-1.440438, -0.07823756, -1.01951, 1, 1, 1, 1, 1,
-1.428429, 0.2746175, -0.7812188, 1, 1, 1, 1, 1,
-1.426411, -0.397498, -2.863374, 1, 1, 1, 1, 1,
-1.425016, -0.1201674, -1.815687, 1, 1, 1, 1, 1,
-1.418088, -0.1381101, -1.196586, 1, 1, 1, 1, 1,
-1.396226, -1.16539, -4.341803, 1, 1, 1, 1, 1,
-1.393058, -0.3050458, -3.584695, 1, 1, 1, 1, 1,
-1.392561, 0.9240341, -1.926066, 1, 1, 1, 1, 1,
-1.391953, -0.04342398, -0.2945846, 1, 1, 1, 1, 1,
-1.389887, -0.6501448, -2.431165, 1, 1, 1, 1, 1,
-1.38499, 0.4600594, -0.940513, 1, 1, 1, 1, 1,
-1.384223, 0.1039951, -1.197649, 1, 1, 1, 1, 1,
-1.379482, -1.158764, -1.669614, 1, 1, 1, 1, 1,
-1.379468, 1.031404, -0.2390507, 1, 1, 1, 1, 1,
-1.376464, -0.4529435, -2.354073, 0, 0, 1, 1, 1,
-1.371085, -0.4541321, -1.963002, 1, 0, 0, 1, 1,
-1.369416, -0.08873082, -0.8252673, 1, 0, 0, 1, 1,
-1.366155, -2.020983, -1.493925, 1, 0, 0, 1, 1,
-1.362581, -0.9576248, -3.233431, 1, 0, 0, 1, 1,
-1.358117, -0.7806752, -1.660794, 1, 0, 0, 1, 1,
-1.353854, 1.710048, -2.038428, 0, 0, 0, 1, 1,
-1.322525, -0.7333436, -0.5997137, 0, 0, 0, 1, 1,
-1.314854, -1.812097, -2.735786, 0, 0, 0, 1, 1,
-1.308316, 0.1469688, -3.748197, 0, 0, 0, 1, 1,
-1.307096, -1.214164, -1.021153, 0, 0, 0, 1, 1,
-1.298234, 0.7080747, -0.06556796, 0, 0, 0, 1, 1,
-1.296544, 1.55016, -1.731014, 0, 0, 0, 1, 1,
-1.2867, 1.223898, -0.7250631, 1, 1, 1, 1, 1,
-1.280516, -0.1056938, -1.123566, 1, 1, 1, 1, 1,
-1.269116, -0.04773437, -3.922439, 1, 1, 1, 1, 1,
-1.258243, -0.9606171, -0.5727842, 1, 1, 1, 1, 1,
-1.255762, -0.7148185, -2.302023, 1, 1, 1, 1, 1,
-1.251284, -0.5141317, -0.1891164, 1, 1, 1, 1, 1,
-1.250408, -0.2437587, -1.667955, 1, 1, 1, 1, 1,
-1.250269, 0.7858925, -0.7353204, 1, 1, 1, 1, 1,
-1.244802, -0.1852082, -1.47844, 1, 1, 1, 1, 1,
-1.243964, 0.5086021, -1.691267, 1, 1, 1, 1, 1,
-1.239299, -0.8347019, -2.080071, 1, 1, 1, 1, 1,
-1.231429, -0.737863, -1.816154, 1, 1, 1, 1, 1,
-1.230653, 0.7063931, -2.543312, 1, 1, 1, 1, 1,
-1.22997, -0.9305864, -1.061605, 1, 1, 1, 1, 1,
-1.213562, -0.9775623, -2.798043, 1, 1, 1, 1, 1,
-1.21112, 0.8029449, -1.296005, 0, 0, 1, 1, 1,
-1.207132, -1.007139, -1.443748, 1, 0, 0, 1, 1,
-1.203861, 0.3973346, -2.081606, 1, 0, 0, 1, 1,
-1.200593, -0.3779907, -0.1550133, 1, 0, 0, 1, 1,
-1.194207, -0.2695066, -1.988184, 1, 0, 0, 1, 1,
-1.193671, 0.1292364, -1.280268, 1, 0, 0, 1, 1,
-1.182277, -0.2626819, -1.079201, 0, 0, 0, 1, 1,
-1.177424, 1.093528, -1.726648, 0, 0, 0, 1, 1,
-1.177236, -0.3155941, 0.2910247, 0, 0, 0, 1, 1,
-1.173308, 1.181298, -1.587551, 0, 0, 0, 1, 1,
-1.172211, -0.1561447, -2.53583, 0, 0, 0, 1, 1,
-1.152432, -0.286998, -1.186224, 0, 0, 0, 1, 1,
-1.146239, -1.46146, -1.352842, 0, 0, 0, 1, 1,
-1.145331, 0.7106476, -1.839676, 1, 1, 1, 1, 1,
-1.130376, 0.04905469, -0.9593866, 1, 1, 1, 1, 1,
-1.12994, 0.3205921, 0.8920786, 1, 1, 1, 1, 1,
-1.12245, -0.6355042, -2.279462, 1, 1, 1, 1, 1,
-1.11139, 0.06442866, -2.250885, 1, 1, 1, 1, 1,
-1.111038, 0.4692544, -2.397335, 1, 1, 1, 1, 1,
-1.110563, 1.118769, -3.496629, 1, 1, 1, 1, 1,
-1.099493, -1.767682, -3.821824, 1, 1, 1, 1, 1,
-1.096944, -2.17416, -3.676762, 1, 1, 1, 1, 1,
-1.094517, -1.285604, -3.276189, 1, 1, 1, 1, 1,
-1.082105, 0.4276517, -0.5010938, 1, 1, 1, 1, 1,
-1.079983, -0.3719468, -1.556764, 1, 1, 1, 1, 1,
-1.0796, 0.3165085, -0.5585786, 1, 1, 1, 1, 1,
-1.074729, -0.7112775, -1.821622, 1, 1, 1, 1, 1,
-1.069582, -0.08842146, -1.838386, 1, 1, 1, 1, 1,
-1.068801, -0.4039002, -2.740343, 0, 0, 1, 1, 1,
-1.066622, 0.09967573, -0.4942723, 1, 0, 0, 1, 1,
-1.060055, -0.8958092, -3.193213, 1, 0, 0, 1, 1,
-1.056569, -0.1346906, -2.59592, 1, 0, 0, 1, 1,
-1.050974, 1.36167, -0.1727091, 1, 0, 0, 1, 1,
-1.036843, -0.3732264, -3.378836, 1, 0, 0, 1, 1,
-1.029444, -0.09750915, -1.946195, 0, 0, 0, 1, 1,
-1.028499, 1.295108, -0.1954313, 0, 0, 0, 1, 1,
-1.026296, 0.8520331, -0.6822079, 0, 0, 0, 1, 1,
-1.017281, -0.5265951, -2.611152, 0, 0, 0, 1, 1,
-1.010844, 0.9551796, -1.515504, 0, 0, 0, 1, 1,
-1.008861, 0.654572, -1.396277, 0, 0, 0, 1, 1,
-0.9960563, -0.2606696, -2.081094, 0, 0, 0, 1, 1,
-0.9958285, -0.7603589, -3.199298, 1, 1, 1, 1, 1,
-0.9951041, 0.4248724, -0.9134493, 1, 1, 1, 1, 1,
-0.9879661, -0.3908504, -1.166073, 1, 1, 1, 1, 1,
-0.9849567, -0.2021691, -2.570328, 1, 1, 1, 1, 1,
-0.9843704, -1.651188, -2.725893, 1, 1, 1, 1, 1,
-0.9815484, -0.6365129, -3.060624, 1, 1, 1, 1, 1,
-0.9793787, -0.9547899, -1.818051, 1, 1, 1, 1, 1,
-0.9715195, -1.747302, -2.746115, 1, 1, 1, 1, 1,
-0.9691427, -0.495663, -2.157761, 1, 1, 1, 1, 1,
-0.9684078, 0.4665413, -2.868641, 1, 1, 1, 1, 1,
-0.9648266, -0.9597899, -3.873445, 1, 1, 1, 1, 1,
-0.9635388, 0.5747295, -1.816851, 1, 1, 1, 1, 1,
-0.9617804, -0.465749, -2.917132, 1, 1, 1, 1, 1,
-0.9597751, -1.025438, -4.644269, 1, 1, 1, 1, 1,
-0.9572055, -0.4607817, -2.165332, 1, 1, 1, 1, 1,
-0.9555183, 1.970751, -0.1945744, 0, 0, 1, 1, 1,
-0.950277, -2.896364, -1.30164, 1, 0, 0, 1, 1,
-0.9468832, 0.1407953, -1.543769, 1, 0, 0, 1, 1,
-0.9431393, -1.026443, -3.496382, 1, 0, 0, 1, 1,
-0.9396723, 1.810728, 0.2553397, 1, 0, 0, 1, 1,
-0.9344954, 0.2810299, -1.007797, 1, 0, 0, 1, 1,
-0.9316622, -0.7918739, -2.750978, 0, 0, 0, 1, 1,
-0.9307386, 0.265045, -1.845664, 0, 0, 0, 1, 1,
-0.9248573, -0.2960345, -2.713621, 0, 0, 0, 1, 1,
-0.9210207, 0.7387623, -0.6499879, 0, 0, 0, 1, 1,
-0.9184378, -0.06089479, -0.6145543, 0, 0, 0, 1, 1,
-0.9138194, 1.774983, -0.5211761, 0, 0, 0, 1, 1,
-0.9107532, 0.2908357, 0.9059134, 0, 0, 0, 1, 1,
-0.9093268, -1.655945, -1.913848, 1, 1, 1, 1, 1,
-0.9062318, -1.176638, -3.117395, 1, 1, 1, 1, 1,
-0.9043074, -0.4604923, -2.035391, 1, 1, 1, 1, 1,
-0.8957931, -0.3626619, -1.875325, 1, 1, 1, 1, 1,
-0.8924494, 0.7044299, 0.250406, 1, 1, 1, 1, 1,
-0.8924128, 1.23026, 0.0650812, 1, 1, 1, 1, 1,
-0.8842435, -2.007661, -3.562637, 1, 1, 1, 1, 1,
-0.8786891, -0.6836305, -1.789345, 1, 1, 1, 1, 1,
-0.8733129, 0.04068635, -1.724636, 1, 1, 1, 1, 1,
-0.872044, -0.9418311, -2.19258, 1, 1, 1, 1, 1,
-0.860216, -1.839012, -2.0637, 1, 1, 1, 1, 1,
-0.8594825, 0.1957369, -1.103077, 1, 1, 1, 1, 1,
-0.8578459, -1.388209, -3.528627, 1, 1, 1, 1, 1,
-0.8499007, -1.380189, -4.403286, 1, 1, 1, 1, 1,
-0.846307, -0.5658462, -0.9838835, 1, 1, 1, 1, 1,
-0.8407702, -1.140506, -2.059803, 0, 0, 1, 1, 1,
-0.8360113, -1.318499, -3.922802, 1, 0, 0, 1, 1,
-0.829169, 1.560163, 0.1454944, 1, 0, 0, 1, 1,
-0.8289886, 1.326534, 0.08998111, 1, 0, 0, 1, 1,
-0.8272592, -0.5512431, -1.355243, 1, 0, 0, 1, 1,
-0.7978922, 0.1691209, -3.308104, 1, 0, 0, 1, 1,
-0.7974215, 0.6320899, -2.293976, 0, 0, 0, 1, 1,
-0.7964451, -0.8303558, -3.828002, 0, 0, 0, 1, 1,
-0.7956187, -0.03522998, -0.6004665, 0, 0, 0, 1, 1,
-0.7941483, -0.1382038, 0.315847, 0, 0, 0, 1, 1,
-0.7939471, 0.3115155, 0.302999, 0, 0, 0, 1, 1,
-0.7935898, -1.231015, -1.357075, 0, 0, 0, 1, 1,
-0.7900634, 1.756362, 0.0660149, 0, 0, 0, 1, 1,
-0.7868128, -1.565057, -1.865539, 1, 1, 1, 1, 1,
-0.7851706, 0.6270129, -1.383414, 1, 1, 1, 1, 1,
-0.7799206, 0.2272349, -0.8561336, 1, 1, 1, 1, 1,
-0.7782182, -1.04111, -3.205155, 1, 1, 1, 1, 1,
-0.7716305, -0.5805908, -2.774863, 1, 1, 1, 1, 1,
-0.7704412, -1.963996, -2.617945, 1, 1, 1, 1, 1,
-0.7640448, -1.283983, -1.144415, 1, 1, 1, 1, 1,
-0.7626966, -0.8596865, -3.037781, 1, 1, 1, 1, 1,
-0.7592363, -0.125701, -1.917258, 1, 1, 1, 1, 1,
-0.758513, -2.466061, -3.887334, 1, 1, 1, 1, 1,
-0.7566893, 0.5913262, -2.173097, 1, 1, 1, 1, 1,
-0.755368, 0.926118, -0.9133615, 1, 1, 1, 1, 1,
-0.7553216, -1.536366, -2.616813, 1, 1, 1, 1, 1,
-0.7487122, 0.1234772, -0.7426491, 1, 1, 1, 1, 1,
-0.7449635, -0.503026, -1.933513, 1, 1, 1, 1, 1,
-0.7394301, -2.657439, -2.016431, 0, 0, 1, 1, 1,
-0.7384764, 1.565329, -0.2191153, 1, 0, 0, 1, 1,
-0.7367814, -0.5208257, -2.715843, 1, 0, 0, 1, 1,
-0.7355751, -0.002269774, -2.385633, 1, 0, 0, 1, 1,
-0.7351774, 0.5382553, -1.843277, 1, 0, 0, 1, 1,
-0.7304031, -0.7553365, -2.597388, 1, 0, 0, 1, 1,
-0.7288139, -0.1087653, -1.938775, 0, 0, 0, 1, 1,
-0.7286304, 0.7176762, 0.6242225, 0, 0, 0, 1, 1,
-0.7271818, 1.319098, -0.4284183, 0, 0, 0, 1, 1,
-0.7251384, 0.584561, -0.3066786, 0, 0, 0, 1, 1,
-0.7236253, -0.7399674, -2.528691, 0, 0, 0, 1, 1,
-0.7202086, 0.7503094, 0.1649419, 0, 0, 0, 1, 1,
-0.718818, 1.138241, -0.5811773, 0, 0, 0, 1, 1,
-0.7162858, -1.008521, -4.198861, 1, 1, 1, 1, 1,
-0.7112418, 1.917797, -1.924056, 1, 1, 1, 1, 1,
-0.7110731, 7.670892e-05, -2.252458, 1, 1, 1, 1, 1,
-0.7109275, 0.8225335, -1.518485, 1, 1, 1, 1, 1,
-0.7095763, 0.6862037, -0.09553356, 1, 1, 1, 1, 1,
-0.7092863, 0.577402, -1.816791, 1, 1, 1, 1, 1,
-0.7079495, 0.7674629, -1.095181, 1, 1, 1, 1, 1,
-0.6993762, 0.530647, -0.5860838, 1, 1, 1, 1, 1,
-0.6969427, -0.4934539, -1.345463, 1, 1, 1, 1, 1,
-0.6871972, -0.4844978, -2.6261, 1, 1, 1, 1, 1,
-0.685357, 1.566492, 0.4455858, 1, 1, 1, 1, 1,
-0.6747773, 0.08364749, -1.894314, 1, 1, 1, 1, 1,
-0.6721312, -0.1654442, -1.443037, 1, 1, 1, 1, 1,
-0.6697132, -0.6494766, -2.986861, 1, 1, 1, 1, 1,
-0.6634969, 0.1739419, -1.454741, 1, 1, 1, 1, 1,
-0.6624807, 0.9412673, 0.02529597, 0, 0, 1, 1, 1,
-0.6617367, 1.004187, -1.233282, 1, 0, 0, 1, 1,
-0.6559715, -0.07779117, -2.810895, 1, 0, 0, 1, 1,
-0.6557815, 0.7844496, -1.185174, 1, 0, 0, 1, 1,
-0.6548396, -1.007698, -2.665983, 1, 0, 0, 1, 1,
-0.6470023, 0.3858721, -1.233766, 1, 0, 0, 1, 1,
-0.6459557, 1.451123, -0.9350299, 0, 0, 0, 1, 1,
-0.643294, 0.6300505, 0.3830339, 0, 0, 0, 1, 1,
-0.6405969, 0.7545212, -1.834311, 0, 0, 0, 1, 1,
-0.6402312, 1.007489, -0.2189836, 0, 0, 0, 1, 1,
-0.6368929, 1.584478, -0.7929885, 0, 0, 0, 1, 1,
-0.628684, -0.7739084, -2.8326, 0, 0, 0, 1, 1,
-0.6229758, 0.71956, -1.785501, 0, 0, 0, 1, 1,
-0.6212366, 0.4276382, -1.426233, 1, 1, 1, 1, 1,
-0.6150727, -1.300928, -3.713054, 1, 1, 1, 1, 1,
-0.6145168, 0.6170979, -0.3182899, 1, 1, 1, 1, 1,
-0.610836, 1.185054, -0.317519, 1, 1, 1, 1, 1,
-0.6073697, -0.6552479, -2.976635, 1, 1, 1, 1, 1,
-0.6043002, 2.220072, -0.2185958, 1, 1, 1, 1, 1,
-0.6010639, -2.131281, -3.965348, 1, 1, 1, 1, 1,
-0.5979484, 0.5740536, -2.047947, 1, 1, 1, 1, 1,
-0.5934876, -0.7073611, -3.428856, 1, 1, 1, 1, 1,
-0.5913844, 1.01304, -1.975415, 1, 1, 1, 1, 1,
-0.5809578, -0.8263268, -2.572475, 1, 1, 1, 1, 1,
-0.5807918, -0.1220287, -2.848003, 1, 1, 1, 1, 1,
-0.5728807, -0.05406499, -1.346024, 1, 1, 1, 1, 1,
-0.5711311, 0.2405946, 0.233803, 1, 1, 1, 1, 1,
-0.5687128, 0.8165949, -0.5128261, 1, 1, 1, 1, 1,
-0.5646393, -0.1555374, -1.401918, 0, 0, 1, 1, 1,
-0.5644529, -1.097772, -4.189271, 1, 0, 0, 1, 1,
-0.564373, -0.8798852, -2.073886, 1, 0, 0, 1, 1,
-0.5622171, -0.1280257, -2.27497, 1, 0, 0, 1, 1,
-0.560558, -0.5170141, -2.84356, 1, 0, 0, 1, 1,
-0.5599942, -0.9386103, -1.399072, 1, 0, 0, 1, 1,
-0.5582719, 0.2936257, -0.997259, 0, 0, 0, 1, 1,
-0.5557361, -0.2831013, -1.761415, 0, 0, 0, 1, 1,
-0.547637, 0.116343, -2.888577, 0, 0, 0, 1, 1,
-0.5444141, -1.99095, -1.645348, 0, 0, 0, 1, 1,
-0.5385827, -1.003598, -2.340015, 0, 0, 0, 1, 1,
-0.537473, 1.111714, -0.6799825, 0, 0, 0, 1, 1,
-0.5366008, -0.3955756, -1.280292, 0, 0, 0, 1, 1,
-0.5353589, -1.32532, -1.891051, 1, 1, 1, 1, 1,
-0.5324255, 0.6537455, -1.171488, 1, 1, 1, 1, 1,
-0.529482, 0.5869187, -1.540879, 1, 1, 1, 1, 1,
-0.5278989, 0.2199572, -2.14799, 1, 1, 1, 1, 1,
-0.5257384, 2.01759, -0.470706, 1, 1, 1, 1, 1,
-0.5241926, -1.102246, -2.35233, 1, 1, 1, 1, 1,
-0.5223022, 0.6015366, 1.11989, 1, 1, 1, 1, 1,
-0.5142226, 0.593806, -0.1580108, 1, 1, 1, 1, 1,
-0.5138842, 0.1297037, -0.2216749, 1, 1, 1, 1, 1,
-0.5116944, -0.165461, -1.152296, 1, 1, 1, 1, 1,
-0.5071546, -0.1275935, -2.949622, 1, 1, 1, 1, 1,
-0.5067878, -0.7364914, -1.62459, 1, 1, 1, 1, 1,
-0.5025347, -2.268337, -4.159044, 1, 1, 1, 1, 1,
-0.4948543, 0.9005597, -1.031316, 1, 1, 1, 1, 1,
-0.4924376, -1.439822, -2.379676, 1, 1, 1, 1, 1,
-0.4908096, -0.3387819, -2.868038, 0, 0, 1, 1, 1,
-0.4762969, 1.046825, 0.0932304, 1, 0, 0, 1, 1,
-0.4675232, -0.4892713, -2.090832, 1, 0, 0, 1, 1,
-0.4670525, -1.035548, -3.711811, 1, 0, 0, 1, 1,
-0.4665338, 0.003577139, -0.6371987, 1, 0, 0, 1, 1,
-0.4665069, 0.07120455, 0.3190537, 1, 0, 0, 1, 1,
-0.4594737, 0.7647729, 0.2484459, 0, 0, 0, 1, 1,
-0.4531219, -0.5736963, -2.692869, 0, 0, 0, 1, 1,
-0.4523388, 0.5710167, -0.3271285, 0, 0, 0, 1, 1,
-0.4506619, 0.7227457, 0.9233381, 0, 0, 0, 1, 1,
-0.4337066, 0.7615961, 0.3603817, 0, 0, 0, 1, 1,
-0.4309907, -1.453426, -2.43364, 0, 0, 0, 1, 1,
-0.430721, -1.072017, -2.503369, 0, 0, 0, 1, 1,
-0.4298822, -0.3185968, -0.6021312, 1, 1, 1, 1, 1,
-0.4278866, -0.2645943, -3.564812, 1, 1, 1, 1, 1,
-0.42746, 1.547897, -0.343754, 1, 1, 1, 1, 1,
-0.4263065, 0.7334683, 0.4937986, 1, 1, 1, 1, 1,
-0.425658, -1.089167, -3.649828, 1, 1, 1, 1, 1,
-0.4212687, 0.06034342, -1.622672, 1, 1, 1, 1, 1,
-0.419949, -0.2373355, -2.59756, 1, 1, 1, 1, 1,
-0.4197575, -0.06719467, -1.127339, 1, 1, 1, 1, 1,
-0.4181037, 1.832655, -1.913086, 1, 1, 1, 1, 1,
-0.4177851, -1.067227, -1.806062, 1, 1, 1, 1, 1,
-0.410957, -1.81295, -3.250455, 1, 1, 1, 1, 1,
-0.4086225, 0.7174087, -1.998632, 1, 1, 1, 1, 1,
-0.4066819, 0.613334, -0.2341162, 1, 1, 1, 1, 1,
-0.4033544, -0.4347748, -1.335413, 1, 1, 1, 1, 1,
-0.4015912, -1.177186, -4.310483, 1, 1, 1, 1, 1,
-0.3999507, -0.08336865, -1.158833, 0, 0, 1, 1, 1,
-0.387702, -1.471198, -2.104933, 1, 0, 0, 1, 1,
-0.3873332, 1.978269, -1.470027, 1, 0, 0, 1, 1,
-0.3807395, 0.9807941, -1.802938, 1, 0, 0, 1, 1,
-0.3798928, -1.788629, -3.787376, 1, 0, 0, 1, 1,
-0.3728946, -1.016229, -3.269045, 1, 0, 0, 1, 1,
-0.3674168, -0.1138116, -2.101739, 0, 0, 0, 1, 1,
-0.3663571, -0.3199186, -1.276396, 0, 0, 0, 1, 1,
-0.3625829, 1.919478, -0.2368946, 0, 0, 0, 1, 1,
-0.362027, 0.8892972, -0.05644061, 0, 0, 0, 1, 1,
-0.3607889, 0.4455811, -1.308273, 0, 0, 0, 1, 1,
-0.3599406, -0.225283, -2.220378, 0, 0, 0, 1, 1,
-0.3566307, 0.06173824, 0.277383, 0, 0, 0, 1, 1,
-0.3532394, 0.8172488, 1.742797, 1, 1, 1, 1, 1,
-0.3532374, -2.608531, -3.581419, 1, 1, 1, 1, 1,
-0.350284, 0.7117023, -1.578922, 1, 1, 1, 1, 1,
-0.3488278, -1.231788, -3.094095, 1, 1, 1, 1, 1,
-0.3463364, 1.104239, -2.698194, 1, 1, 1, 1, 1,
-0.346228, 0.3899668, -0.7885234, 1, 1, 1, 1, 1,
-0.3451486, 1.351619, 0.514446, 1, 1, 1, 1, 1,
-0.3433859, 0.8001372, 0.1119107, 1, 1, 1, 1, 1,
-0.3413171, 0.9381546, 0.3212709, 1, 1, 1, 1, 1,
-0.3356556, -0.6678351, -2.398671, 1, 1, 1, 1, 1,
-0.3322104, -0.4361607, -3.795838, 1, 1, 1, 1, 1,
-0.3299057, -0.3149795, -2.465249, 1, 1, 1, 1, 1,
-0.3280122, 0.8884476, 0.4110125, 1, 1, 1, 1, 1,
-0.3257634, 0.07791834, -1.178317, 1, 1, 1, 1, 1,
-0.3242977, 0.2414685, -1.251402, 1, 1, 1, 1, 1,
-0.3228943, -0.2200468, -0.8959475, 0, 0, 1, 1, 1,
-0.3196161, 0.1645496, -1.968808, 1, 0, 0, 1, 1,
-0.3163985, -0.8964048, -4.252537, 1, 0, 0, 1, 1,
-0.3127052, -0.8312618, -3.220986, 1, 0, 0, 1, 1,
-0.310941, -1.151838, -2.477097, 1, 0, 0, 1, 1,
-0.3095049, 0.03770368, -1.359534, 1, 0, 0, 1, 1,
-0.3070392, -1.311677, -3.209266, 0, 0, 0, 1, 1,
-0.3059456, 0.8032534, 0.002490911, 0, 0, 0, 1, 1,
-0.304496, 1.055238, -3.035591, 0, 0, 0, 1, 1,
-0.3040054, -0.1214965, -0.883183, 0, 0, 0, 1, 1,
-0.2997276, 1.098248, -2.052132, 0, 0, 0, 1, 1,
-0.2967269, 0.6156304, -0.4781987, 0, 0, 0, 1, 1,
-0.2919532, 1.638991, 0.9869942, 0, 0, 0, 1, 1,
-0.2916848, -0.3090206, -1.280595, 1, 1, 1, 1, 1,
-0.2915014, -3.095349, -2.70055, 1, 1, 1, 1, 1,
-0.2904598, 1.4154, -0.608372, 1, 1, 1, 1, 1,
-0.287374, 0.5334027, -0.8768765, 1, 1, 1, 1, 1,
-0.2865927, 0.8315994, 0.705129, 1, 1, 1, 1, 1,
-0.2862883, -0.3297786, -2.006272, 1, 1, 1, 1, 1,
-0.2853945, -1.6168, -2.380054, 1, 1, 1, 1, 1,
-0.2843033, 0.4977359, -0.4017652, 1, 1, 1, 1, 1,
-0.2806695, -0.05607316, -1.882572, 1, 1, 1, 1, 1,
-0.2798555, 0.8792492, 0.1610976, 1, 1, 1, 1, 1,
-0.2790957, -1.445407, -2.330893, 1, 1, 1, 1, 1,
-0.2782542, 0.08124111, -0.4218639, 1, 1, 1, 1, 1,
-0.2764553, 0.3717715, -1.262232, 1, 1, 1, 1, 1,
-0.2728884, -0.6237198, -2.548099, 1, 1, 1, 1, 1,
-0.2688513, 0.3115642, -0.4911837, 1, 1, 1, 1, 1,
-0.2687376, -0.620773, -1.655789, 0, 0, 1, 1, 1,
-0.2667954, 0.6348699, 0.04679177, 1, 0, 0, 1, 1,
-0.2587295, 0.7170659, -0.3700607, 1, 0, 0, 1, 1,
-0.253767, -0.6345016, -3.187528, 1, 0, 0, 1, 1,
-0.2512141, -0.3277801, -3.709529, 1, 0, 0, 1, 1,
-0.249863, 0.1234869, -2.149984, 1, 0, 0, 1, 1,
-0.2471337, 0.7022178, 0.2531492, 0, 0, 0, 1, 1,
-0.2461336, -0.8842055, -3.488778, 0, 0, 0, 1, 1,
-0.2426775, -1.6924, -3.240162, 0, 0, 0, 1, 1,
-0.2415256, -0.08086498, -1.16289, 0, 0, 0, 1, 1,
-0.2410627, 1.649995, 1.755852, 0, 0, 0, 1, 1,
-0.2375326, 1.108176, -0.7782356, 0, 0, 0, 1, 1,
-0.2325774, 2.381922, 0.1318513, 0, 0, 0, 1, 1,
-0.2278173, -0.7610552, -2.162898, 1, 1, 1, 1, 1,
-0.2277889, 0.5352968, -0.7475172, 1, 1, 1, 1, 1,
-0.2249618, -0.4477504, -3.298626, 1, 1, 1, 1, 1,
-0.2239738, 1.011134, -0.2188595, 1, 1, 1, 1, 1,
-0.223264, 0.2365674, -1.50458, 1, 1, 1, 1, 1,
-0.2229629, 1.069796, 0.08578153, 1, 1, 1, 1, 1,
-0.2219025, -0.7165596, -3.017149, 1, 1, 1, 1, 1,
-0.2131946, 0.6103976, 0.3191479, 1, 1, 1, 1, 1,
-0.2125592, 2.429295, -1.058715, 1, 1, 1, 1, 1,
-0.2117808, -0.5208614, -2.311934, 1, 1, 1, 1, 1,
-0.2114247, -0.748451, -3.483733, 1, 1, 1, 1, 1,
-0.2106361, 2.302896, -2.412983, 1, 1, 1, 1, 1,
-0.20981, 0.2853033, -1.239148, 1, 1, 1, 1, 1,
-0.2085709, -1.717587, -3.949567, 1, 1, 1, 1, 1,
-0.2083257, 0.5333698, 0.5675877, 1, 1, 1, 1, 1,
-0.205301, -0.7756741, -5.36863, 0, 0, 1, 1, 1,
-0.195687, -0.2159861, -1.574987, 1, 0, 0, 1, 1,
-0.1951791, -0.6181563, -2.71455, 1, 0, 0, 1, 1,
-0.1899074, -0.3021878, -2.602654, 1, 0, 0, 1, 1,
-0.1896622, 0.1982926, -1.845852, 1, 0, 0, 1, 1,
-0.1880892, 0.3063978, -1.533656, 1, 0, 0, 1, 1,
-0.1874544, 1.989358, 0.1565429, 0, 0, 0, 1, 1,
-0.1872155, 0.6513813, 0.2497952, 0, 0, 0, 1, 1,
-0.1869209, -0.4757565, -4.2959, 0, 0, 0, 1, 1,
-0.1841613, 1.414562, -0.9723766, 0, 0, 0, 1, 1,
-0.1793655, 0.904698, 1.121379, 0, 0, 0, 1, 1,
-0.1760906, -0.4957726, -2.632594, 0, 0, 0, 1, 1,
-0.1737575, -0.9381663, -4.841346, 0, 0, 0, 1, 1,
-0.1711783, 0.4738027, 0.2215732, 1, 1, 1, 1, 1,
-0.1696365, -0.180033, -1.329219, 1, 1, 1, 1, 1,
-0.1688979, 2.238181, 1.823801, 1, 1, 1, 1, 1,
-0.167973, 0.7012993, 0.5717896, 1, 1, 1, 1, 1,
-0.166834, 1.430231, 0.49466, 1, 1, 1, 1, 1,
-0.1651236, -1.582279, -2.761371, 1, 1, 1, 1, 1,
-0.1623778, 2.071979, -1.468076, 1, 1, 1, 1, 1,
-0.1580342, 0.847095, -1.017118, 1, 1, 1, 1, 1,
-0.1576855, -1.253983, -4.614078, 1, 1, 1, 1, 1,
-0.1541135, 1.050423, -0.106535, 1, 1, 1, 1, 1,
-0.1491068, -0.09065632, -2.073209, 1, 1, 1, 1, 1,
-0.1486458, 0.08989872, -2.991253, 1, 1, 1, 1, 1,
-0.146695, 1.627882, 0.286738, 1, 1, 1, 1, 1,
-0.1382507, 0.08257416, -0.8570333, 1, 1, 1, 1, 1,
-0.1365539, 0.3406985, -1.18877, 1, 1, 1, 1, 1,
-0.1357317, 0.08543414, -1.811184, 0, 0, 1, 1, 1,
-0.1291043, -1.851705, -4.343955, 1, 0, 0, 1, 1,
-0.1283734, 0.9007727, 1.004889, 1, 0, 0, 1, 1,
-0.1272867, 0.8915405, -0.4556649, 1, 0, 0, 1, 1,
-0.1252575, 1.013361, -1.821648, 1, 0, 0, 1, 1,
-0.1232311, -0.9265733, -3.226112, 1, 0, 0, 1, 1,
-0.1206132, -0.1285795, -2.278854, 0, 0, 0, 1, 1,
-0.115414, -1.642671, -2.905607, 0, 0, 0, 1, 1,
-0.1138276, 0.9751189, -1.532369, 0, 0, 0, 1, 1,
-0.110249, -0.3027636, -3.594019, 0, 0, 0, 1, 1,
-0.1035881, -1.456413, -2.567416, 0, 0, 0, 1, 1,
-0.1021004, -0.936273, -4.067398, 0, 0, 0, 1, 1,
-0.09950936, 1.688877, 2.167855, 0, 0, 0, 1, 1,
-0.0958355, 1.239499, -2.443227, 1, 1, 1, 1, 1,
-0.09026249, 1.692409, 0.04390349, 1, 1, 1, 1, 1,
-0.08826001, -1.144657, -3.693815, 1, 1, 1, 1, 1,
-0.08796522, -2.264933, -2.753836, 1, 1, 1, 1, 1,
-0.08399789, 1.559666, -0.9435488, 1, 1, 1, 1, 1,
-0.08138559, 0.676694, -2.065785, 1, 1, 1, 1, 1,
-0.08131757, 0.1230317, -0.2824988, 1, 1, 1, 1, 1,
-0.07750801, 1.438437, -0.2666455, 1, 1, 1, 1, 1,
-0.07642046, 2.357558, -0.2529729, 1, 1, 1, 1, 1,
-0.06819401, -0.1532681, -2.322856, 1, 1, 1, 1, 1,
-0.06664836, 0.03758507, 0.7256656, 1, 1, 1, 1, 1,
-0.06106466, 1.617491, 1.050151, 1, 1, 1, 1, 1,
-0.05856156, 0.01422963, -1.948523, 1, 1, 1, 1, 1,
-0.05416104, -1.284484, -0.8232183, 1, 1, 1, 1, 1,
-0.05188132, -1.43147, -3.135087, 1, 1, 1, 1, 1,
-0.04846936, 0.8006059, 0.5597236, 0, 0, 1, 1, 1,
-0.04748767, -0.8253673, -1.987819, 1, 0, 0, 1, 1,
-0.04477127, -1.151026, -4.156637, 1, 0, 0, 1, 1,
-0.04407402, -0.6107087, -4.198123, 1, 0, 0, 1, 1,
-0.04399932, 0.5738802, 0.0583251, 1, 0, 0, 1, 1,
-0.04308921, 0.5626509, 1.103868, 1, 0, 0, 1, 1,
-0.0389383, -0.1565089, -3.527307, 0, 0, 0, 1, 1,
-0.03528304, -0.4424001, -3.541488, 0, 0, 0, 1, 1,
-0.02993084, -0.8552169, -0.2803971, 0, 0, 0, 1, 1,
-0.02944324, -0.9467542, -3.739254, 0, 0, 0, 1, 1,
-0.02944315, 0.4471921, 0.06652725, 0, 0, 0, 1, 1,
-0.02725117, 1.39643, 0.1926838, 0, 0, 0, 1, 1,
-0.02667528, 0.5191211, -1.297719, 0, 0, 0, 1, 1,
-0.0223856, 0.5040798, 0.2212719, 1, 1, 1, 1, 1,
-0.01789221, -1.040544, -1.529361, 1, 1, 1, 1, 1,
-0.0152992, 0.6484255, 0.4821232, 1, 1, 1, 1, 1,
-0.01242952, 0.5640993, -0.7815183, 1, 1, 1, 1, 1,
-0.01196731, -1.467114, -3.104557, 1, 1, 1, 1, 1,
-0.01151114, 2.658482, -0.07700506, 1, 1, 1, 1, 1,
-0.01036125, -0.8865647, -3.97453, 1, 1, 1, 1, 1,
-0.007067156, -1.283749, -3.492426, 1, 1, 1, 1, 1,
-0.006360269, -2.332508, -2.042001, 1, 1, 1, 1, 1,
-0.0001075146, -2.097053, -3.645993, 1, 1, 1, 1, 1,
0.001763967, -1.119808, 2.818267, 1, 1, 1, 1, 1,
0.005299149, 0.5607231, 0.3326361, 1, 1, 1, 1, 1,
0.007328114, -1.13139, 0.5821456, 1, 1, 1, 1, 1,
0.007518183, 0.5545555, 0.7982036, 1, 1, 1, 1, 1,
0.008012544, 0.05989338, 0.9093828, 1, 1, 1, 1, 1,
0.008763378, 0.6356439, -1.029715, 0, 0, 1, 1, 1,
0.01002531, 2.64421, 0.5840098, 1, 0, 0, 1, 1,
0.01155875, 1.440241, -1.071581, 1, 0, 0, 1, 1,
0.01249083, -0.6891764, 2.653589, 1, 0, 0, 1, 1,
0.01256522, -0.09279435, 2.278892, 1, 0, 0, 1, 1,
0.01298332, -0.7921267, 1.642108, 1, 0, 0, 1, 1,
0.01502878, -0.973225, 3.508598, 0, 0, 0, 1, 1,
0.01505854, 0.7772681, 0.4170535, 0, 0, 0, 1, 1,
0.01797499, -0.4669053, 2.138477, 0, 0, 0, 1, 1,
0.01815064, 1.452943, -0.1145487, 0, 0, 0, 1, 1,
0.01916233, -0.1592863, 2.969126, 0, 0, 0, 1, 1,
0.03016545, -0.6466243, 3.769757, 0, 0, 0, 1, 1,
0.03097081, 0.1897243, 0.6514565, 0, 0, 0, 1, 1,
0.03303993, 0.862153, -0.4356508, 1, 1, 1, 1, 1,
0.03493126, -1.51626, 4.665992, 1, 1, 1, 1, 1,
0.03499497, 1.070976, -0.8943685, 1, 1, 1, 1, 1,
0.03680121, -1.187078, 3.397483, 1, 1, 1, 1, 1,
0.03777219, 0.7713213, -0.8325235, 1, 1, 1, 1, 1,
0.04198031, -1.792179, 4.325753, 1, 1, 1, 1, 1,
0.04487181, 3.150455, 0.4934571, 1, 1, 1, 1, 1,
0.04838895, 0.9834629, 1.53165, 1, 1, 1, 1, 1,
0.0629086, -0.7620903, 2.624729, 1, 1, 1, 1, 1,
0.06641106, 0.4382568, 0.1977319, 1, 1, 1, 1, 1,
0.06666876, 0.1190338, 0.3015365, 1, 1, 1, 1, 1,
0.0721034, 0.5094911, 0.1666366, 1, 1, 1, 1, 1,
0.07391133, 0.6815871, -0.7378076, 1, 1, 1, 1, 1,
0.07436823, 2.485417, 1.165753, 1, 1, 1, 1, 1,
0.07505633, 0.5230622, -1.169151, 1, 1, 1, 1, 1,
0.07588135, -0.5783418, 3.339118, 0, 0, 1, 1, 1,
0.08139312, -1.306344, 3.230098, 1, 0, 0, 1, 1,
0.08204252, 0.4471249, 1.243044, 1, 0, 0, 1, 1,
0.08271022, -1.353084, 3.053371, 1, 0, 0, 1, 1,
0.08612567, -1.208965, 1.91677, 1, 0, 0, 1, 1,
0.09025511, -0.9513689, 4.790937, 1, 0, 0, 1, 1,
0.09027505, 0.1236006, 0.4099432, 0, 0, 0, 1, 1,
0.09270985, 0.323852, 0.7787603, 0, 0, 0, 1, 1,
0.0989401, -0.6816925, 3.929426, 0, 0, 0, 1, 1,
0.1039213, 0.282292, 1.579241, 0, 0, 0, 1, 1,
0.1044833, 1.972248, 0.02138636, 0, 0, 0, 1, 1,
0.1046433, 1.128913, 0.1803476, 0, 0, 0, 1, 1,
0.1049652, 2.305888, -0.07941021, 0, 0, 0, 1, 1,
0.1054427, -1.104178, 2.392271, 1, 1, 1, 1, 1,
0.109388, -0.4824476, 3.083685, 1, 1, 1, 1, 1,
0.1107198, -1.692229, 4.202823, 1, 1, 1, 1, 1,
0.1170008, -0.3320395, 1.692985, 1, 1, 1, 1, 1,
0.1175743, -0.32936, 2.800523, 1, 1, 1, 1, 1,
0.1181598, -0.03841791, 0.2677877, 1, 1, 1, 1, 1,
0.121873, 2.772557, 1.310399, 1, 1, 1, 1, 1,
0.1349828, -0.4547335, 4.017495, 1, 1, 1, 1, 1,
0.1358123, 0.267305, 0.7127557, 1, 1, 1, 1, 1,
0.1419829, -1.413556, 3.539912, 1, 1, 1, 1, 1,
0.1426673, 0.333689, 1.596725, 1, 1, 1, 1, 1,
0.1440012, 0.1862127, -2.156447, 1, 1, 1, 1, 1,
0.1485108, 0.395234, 0.3512856, 1, 1, 1, 1, 1,
0.1498352, 2.316834, 0.9127052, 1, 1, 1, 1, 1,
0.1535875, 0.7209274, 0.9012926, 1, 1, 1, 1, 1,
0.162832, 1.846906, -1.026692, 0, 0, 1, 1, 1,
0.1664009, 1.397368, -0.00271282, 1, 0, 0, 1, 1,
0.1686853, -0.5689629, 2.512439, 1, 0, 0, 1, 1,
0.170587, -1.481798, 2.10955, 1, 0, 0, 1, 1,
0.1721304, -0.4251069, 2.649086, 1, 0, 0, 1, 1,
0.1737877, 0.00394798, 0.2258955, 1, 0, 0, 1, 1,
0.1792689, 0.3780305, 1.284815, 0, 0, 0, 1, 1,
0.1813776, 0.4880677, 1.830667, 0, 0, 0, 1, 1,
0.1820576, 2.16465, -0.4954279, 0, 0, 0, 1, 1,
0.1843568, -2.240051, 3.137121, 0, 0, 0, 1, 1,
0.1844458, -0.8974807, 2.05917, 0, 0, 0, 1, 1,
0.1847948, -0.2326779, 3.537776, 0, 0, 0, 1, 1,
0.1876688, -0.7702944, 2.958152, 0, 0, 0, 1, 1,
0.1878997, 0.7066829, 0.09719411, 1, 1, 1, 1, 1,
0.1900929, -0.5892162, 4.173715, 1, 1, 1, 1, 1,
0.1905979, -0.7426485, 3.297097, 1, 1, 1, 1, 1,
0.1968235, 0.739747, -2.018909, 1, 1, 1, 1, 1,
0.1993742, 0.2471379, 0.04580039, 1, 1, 1, 1, 1,
0.204412, -0.1272183, 3.75548, 1, 1, 1, 1, 1,
0.2071161, 1.68174, 0.1401986, 1, 1, 1, 1, 1,
0.2078961, -0.3655533, 2.303273, 1, 1, 1, 1, 1,
0.2087509, 0.8340397, 0.5241188, 1, 1, 1, 1, 1,
0.2123718, -3.256577, 2.775935, 1, 1, 1, 1, 1,
0.2171577, 1.154739, 1.340715, 1, 1, 1, 1, 1,
0.21718, 0.3885226, -1.779389, 1, 1, 1, 1, 1,
0.2214774, 1.260302, -0.3766057, 1, 1, 1, 1, 1,
0.2216005, 0.2550353, 0.2295008, 1, 1, 1, 1, 1,
0.2238281, 1.92431, 0.7995715, 1, 1, 1, 1, 1,
0.2273185, 0.7599888, 0.5261908, 0, 0, 1, 1, 1,
0.2349135, 0.4460945, -0.1951554, 1, 0, 0, 1, 1,
0.2350905, 0.9792303, -1.573163, 1, 0, 0, 1, 1,
0.2372301, -2.756761, 5.12297, 1, 0, 0, 1, 1,
0.2390382, 1.108846, -0.1525978, 1, 0, 0, 1, 1,
0.2405585, 0.4151353, 0.1569196, 1, 0, 0, 1, 1,
0.2469414, -0.4371878, 2.809983, 0, 0, 0, 1, 1,
0.2530983, 2.986616, -0.5060976, 0, 0, 0, 1, 1,
0.2626963, 0.3429827, 0.5411506, 0, 0, 0, 1, 1,
0.2643257, -0.4085675, 2.915912, 0, 0, 0, 1, 1,
0.2649983, 0.08755537, 0.08269509, 0, 0, 0, 1, 1,
0.2670025, 0.00947858, 1.053794, 0, 0, 0, 1, 1,
0.2671628, 0.3477665, 1.654172, 0, 0, 0, 1, 1,
0.2678973, 0.0154631, 1.3837, 1, 1, 1, 1, 1,
0.2688946, -0.1413896, 2.099657, 1, 1, 1, 1, 1,
0.2698347, 0.7137438, -0.6930271, 1, 1, 1, 1, 1,
0.2701854, -0.6783024, 1.741349, 1, 1, 1, 1, 1,
0.2757651, 0.3322339, 0.3682563, 1, 1, 1, 1, 1,
0.2788827, 0.4107116, 3.127137, 1, 1, 1, 1, 1,
0.2816911, 0.3047542, 0.3815213, 1, 1, 1, 1, 1,
0.2848588, -0.1892829, -1.206939, 1, 1, 1, 1, 1,
0.2860598, -1.884035, 3.432733, 1, 1, 1, 1, 1,
0.2922638, 1.422156, 0.7581738, 1, 1, 1, 1, 1,
0.293951, -0.6890483, 3.238442, 1, 1, 1, 1, 1,
0.2954812, 0.6084309, 1.560969, 1, 1, 1, 1, 1,
0.3004948, 1.572954, -1.26963, 1, 1, 1, 1, 1,
0.307365, -0.01261633, 1.763595, 1, 1, 1, 1, 1,
0.3094453, -0.5210311, 1.82397, 1, 1, 1, 1, 1,
0.3101192, -0.2980584, 3.026873, 0, 0, 1, 1, 1,
0.3112722, 0.9120457, -0.8121273, 1, 0, 0, 1, 1,
0.3172273, -0.2639249, 0.5826827, 1, 0, 0, 1, 1,
0.3176472, 0.4370618, 1.015404, 1, 0, 0, 1, 1,
0.3207971, -0.852071, 1.770717, 1, 0, 0, 1, 1,
0.3250079, 1.386743, 2.790457, 1, 0, 0, 1, 1,
0.3266559, -0.3127564, 3.188787, 0, 0, 0, 1, 1,
0.3296373, -0.1288615, 1.801671, 0, 0, 0, 1, 1,
0.3305649, 2.633412, 0.8720875, 0, 0, 0, 1, 1,
0.336156, 1.172321, -0.3834139, 0, 0, 0, 1, 1,
0.3437847, 1.287181, -0.09162164, 0, 0, 0, 1, 1,
0.3480696, -0.5277613, 3.79055, 0, 0, 0, 1, 1,
0.3529198, 0.8516567, 0.2392025, 0, 0, 0, 1, 1,
0.3539867, 0.7998917, -0.2020099, 1, 1, 1, 1, 1,
0.3558741, 0.1677253, -0.04811349, 1, 1, 1, 1, 1,
0.3582511, -1.370483, 3.004937, 1, 1, 1, 1, 1,
0.3606805, 0.1558938, 1.045972, 1, 1, 1, 1, 1,
0.3627901, 1.208973, -3.141433, 1, 1, 1, 1, 1,
0.3645943, -0.3886972, 4.143798, 1, 1, 1, 1, 1,
0.3648059, 0.5162374, 1.557596, 1, 1, 1, 1, 1,
0.3679249, -0.1321711, 2.242244, 1, 1, 1, 1, 1,
0.3716831, 0.3358146, 0.8856971, 1, 1, 1, 1, 1,
0.3726165, 0.5646304, -0.6254478, 1, 1, 1, 1, 1,
0.3739675, 0.4786853, -0.3806323, 1, 1, 1, 1, 1,
0.3778234, -1.57339, 3.096768, 1, 1, 1, 1, 1,
0.3851787, 1.022261, 0.9311662, 1, 1, 1, 1, 1,
0.3894419, 0.3458842, -0.1396328, 1, 1, 1, 1, 1,
0.3956063, 0.4144965, 0.4020392, 1, 1, 1, 1, 1,
0.3978932, 1.131246, -0.7482429, 0, 0, 1, 1, 1,
0.4037524, 0.8428509, -0.1616732, 1, 0, 0, 1, 1,
0.4043537, 0.0839683, 1.479178, 1, 0, 0, 1, 1,
0.4110456, -1.550446, 4.363268, 1, 0, 0, 1, 1,
0.4119302, 0.8710219, 1.486205, 1, 0, 0, 1, 1,
0.4154822, 0.05235528, 2.087949, 1, 0, 0, 1, 1,
0.4188571, -1.4117, 3.043765, 0, 0, 0, 1, 1,
0.4214611, 1.08118, -0.051043, 0, 0, 0, 1, 1,
0.4222843, -0.7564438, 2.625556, 0, 0, 0, 1, 1,
0.4225103, 1.779083, -0.6065854, 0, 0, 0, 1, 1,
0.4299626, -0.5788437, 3.357727, 0, 0, 0, 1, 1,
0.4304906, -0.1541766, 1.648155, 0, 0, 0, 1, 1,
0.4315077, 0.4044886, -0.07064506, 0, 0, 0, 1, 1,
0.4322785, 0.3688082, -0.4062991, 1, 1, 1, 1, 1,
0.4500797, -0.7477451, 2.648717, 1, 1, 1, 1, 1,
0.4520933, 1.183721, 1.214188, 1, 1, 1, 1, 1,
0.4524155, 0.2811504, 3.612123, 1, 1, 1, 1, 1,
0.4550637, -1.622936, 3.978553, 1, 1, 1, 1, 1,
0.4586273, -0.5569889, 2.990761, 1, 1, 1, 1, 1,
0.4617376, -0.2302637, 1.440587, 1, 1, 1, 1, 1,
0.4621029, -1.392403, 2.186071, 1, 1, 1, 1, 1,
0.466638, -0.4420633, 1.939335, 1, 1, 1, 1, 1,
0.4683608, 1.121194, 0.381248, 1, 1, 1, 1, 1,
0.4715221, -0.3036488, 1.637588, 1, 1, 1, 1, 1,
0.4828444, -0.4603713, 2.568928, 1, 1, 1, 1, 1,
0.4852471, -0.2876464, 2.315926, 1, 1, 1, 1, 1,
0.4862445, -0.04226156, 1.810687, 1, 1, 1, 1, 1,
0.4922447, -0.4266727, 1.285316, 1, 1, 1, 1, 1,
0.5009709, -3.113131, 3.76878, 0, 0, 1, 1, 1,
0.5011575, 0.3044718, 1.641932, 1, 0, 0, 1, 1,
0.5026312, -0.4710824, 1.480897, 1, 0, 0, 1, 1,
0.5057701, -1.627779, 3.210396, 1, 0, 0, 1, 1,
0.5129186, 0.9070525, 0.8943884, 1, 0, 0, 1, 1,
0.5195356, -0.625164, 3.341353, 1, 0, 0, 1, 1,
0.5222543, 0.4992967, 1.242647, 0, 0, 0, 1, 1,
0.5228895, 1.306567, 1.373758, 0, 0, 0, 1, 1,
0.5276269, -0.1904, 2.392451, 0, 0, 0, 1, 1,
0.5277259, -0.2767434, 2.932984, 0, 0, 0, 1, 1,
0.5285851, 0.9940588, 1.656329, 0, 0, 0, 1, 1,
0.5307073, -1.527596, 3.091149, 0, 0, 0, 1, 1,
0.5308357, -0.4039919, 1.134384, 0, 0, 0, 1, 1,
0.5347416, 1.722652, -0.5574636, 1, 1, 1, 1, 1,
0.5378951, 0.2207248, 0.3767323, 1, 1, 1, 1, 1,
0.5462453, -0.6415606, 3.60565, 1, 1, 1, 1, 1,
0.5549947, 1.019293, 1.575143, 1, 1, 1, 1, 1,
0.5561622, -0.6017687, 2.76412, 1, 1, 1, 1, 1,
0.5608395, 0.2143454, 1.227175, 1, 1, 1, 1, 1,
0.5691512, 1.129437, 1.36013, 1, 1, 1, 1, 1,
0.5700132, 0.4532471, 1.041792, 1, 1, 1, 1, 1,
0.5702195, -0.6448165, 1.327709, 1, 1, 1, 1, 1,
0.5760459, 1.221649, 1.783337, 1, 1, 1, 1, 1,
0.5901756, -0.7333352, 4.142316, 1, 1, 1, 1, 1,
0.590257, 0.7266444, -1.504223, 1, 1, 1, 1, 1,
0.5915505, -0.3275853, 1.597148, 1, 1, 1, 1, 1,
0.5917591, -2.134179, 0.7011477, 1, 1, 1, 1, 1,
0.5965223, -0.04803444, 2.559268, 1, 1, 1, 1, 1,
0.5990296, -0.252735, 3.093941, 0, 0, 1, 1, 1,
0.5992111, 0.5053084, 1.400654, 1, 0, 0, 1, 1,
0.5998635, -0.8313541, 3.129216, 1, 0, 0, 1, 1,
0.6043262, 1.597307, 2.013034, 1, 0, 0, 1, 1,
0.6087057, -0.7594469, 4.393277, 1, 0, 0, 1, 1,
0.6144642, -1.539502, 2.621042, 1, 0, 0, 1, 1,
0.6146569, 0.243495, 0.5884925, 0, 0, 0, 1, 1,
0.6232628, -0.4419671, 2.318728, 0, 0, 0, 1, 1,
0.6240711, -1.009173, 1.485648, 0, 0, 0, 1, 1,
0.6303495, 1.03596, 2.388411, 0, 0, 0, 1, 1,
0.6328398, -0.5584523, 2.213875, 0, 0, 0, 1, 1,
0.6355467, -1.197542, 2.012845, 0, 0, 0, 1, 1,
0.6449258, -0.7632902, 3.101146, 0, 0, 0, 1, 1,
0.6489975, 0.19201, 2.421495, 1, 1, 1, 1, 1,
0.6517738, -1.115749, 4.166337, 1, 1, 1, 1, 1,
0.6552463, 0.1303677, 1.55513, 1, 1, 1, 1, 1,
0.6553649, 1.440477, 1.347445, 1, 1, 1, 1, 1,
0.659452, 0.09781457, 1.062043, 1, 1, 1, 1, 1,
0.6631899, 0.6365526, 1.143934, 1, 1, 1, 1, 1,
0.6656161, 0.02580469, 2.108428, 1, 1, 1, 1, 1,
0.6680172, 0.268292, -0.5534427, 1, 1, 1, 1, 1,
0.6696947, -0.1032896, 1.373293, 1, 1, 1, 1, 1,
0.6716673, 0.7612656, -0.5161723, 1, 1, 1, 1, 1,
0.6719202, -0.002751483, -0.03402764, 1, 1, 1, 1, 1,
0.6737538, -0.1057002, 1.716805, 1, 1, 1, 1, 1,
0.6782855, -0.963467, 3.495407, 1, 1, 1, 1, 1,
0.6817109, -1.018799, 2.162823, 1, 1, 1, 1, 1,
0.6833162, -0.1560121, 4.781818, 1, 1, 1, 1, 1,
0.6839967, -0.4076745, 2.306463, 0, 0, 1, 1, 1,
0.6853731, -0.7345454, 2.777367, 1, 0, 0, 1, 1,
0.6860834, 0.06019429, 0.4007289, 1, 0, 0, 1, 1,
0.6869355, -1.155808, 2.075226, 1, 0, 0, 1, 1,
0.6962851, -0.1507279, 1.002981, 1, 0, 0, 1, 1,
0.6991934, 1.432086, -0.2763822, 1, 0, 0, 1, 1,
0.7014551, -0.4204717, 2.035014, 0, 0, 0, 1, 1,
0.7048408, 0.5394649, -0.03067485, 0, 0, 0, 1, 1,
0.7067021, -0.4167988, 4.670889, 0, 0, 0, 1, 1,
0.707914, -1.187229, 1.827695, 0, 0, 0, 1, 1,
0.7120498, 0.2443941, 1.609651, 0, 0, 0, 1, 1,
0.7143682, 0.9545945, -1.012537, 0, 0, 0, 1, 1,
0.7215695, -1.7713, 3.294297, 0, 0, 0, 1, 1,
0.7229679, 1.295939, -0.004053317, 1, 1, 1, 1, 1,
0.7230584, 0.7940108, 1.784645, 1, 1, 1, 1, 1,
0.7283413, -0.03865872, 2.641661, 1, 1, 1, 1, 1,
0.7292743, -0.4948154, 1.317498, 1, 1, 1, 1, 1,
0.7321481, 1.101584, -0.9376385, 1, 1, 1, 1, 1,
0.7342075, -0.1565353, 2.499694, 1, 1, 1, 1, 1,
0.7376274, 0.2763456, 2.270607, 1, 1, 1, 1, 1,
0.7440704, 0.3966002, 2.755312, 1, 1, 1, 1, 1,
0.7457324, 1.085997, -0.9719088, 1, 1, 1, 1, 1,
0.7521612, 0.9550431, 0.7078357, 1, 1, 1, 1, 1,
0.7524704, -2.561916, 2.971101, 1, 1, 1, 1, 1,
0.7533501, 0.1394279, -1.347607, 1, 1, 1, 1, 1,
0.7534986, -0.7179746, 0.3702011, 1, 1, 1, 1, 1,
0.7549197, -2.471285, 4.125086, 1, 1, 1, 1, 1,
0.756139, 0.7675753, 1.382616, 1, 1, 1, 1, 1,
0.7565736, -2.270882, 2.278113, 0, 0, 1, 1, 1,
0.7577196, -0.5763963, 1.223523, 1, 0, 0, 1, 1,
0.7662999, -0.3549787, 2.297827, 1, 0, 0, 1, 1,
0.7665579, -0.01358292, 0.8123875, 1, 0, 0, 1, 1,
0.7667518, -1.700975, 2.204043, 1, 0, 0, 1, 1,
0.7722223, -0.8549527, 2.152075, 1, 0, 0, 1, 1,
0.7726391, 0.3153367, 1.704816, 0, 0, 0, 1, 1,
0.7744265, -0.3779828, 0.315189, 0, 0, 0, 1, 1,
0.7807612, -1.037983, 2.334888, 0, 0, 0, 1, 1,
0.7815563, 2.918864, 0.8273404, 0, 0, 0, 1, 1,
0.7825207, 0.08247945, 2.403016, 0, 0, 0, 1, 1,
0.7839214, 0.5948617, 0.04642976, 0, 0, 0, 1, 1,
0.7852085, -0.459768, 2.550311, 0, 0, 0, 1, 1,
0.7989467, 0.5221722, 1.356438, 1, 1, 1, 1, 1,
0.7998558, 1.324633, 0.6234559, 1, 1, 1, 1, 1,
0.8031065, 0.8002394, -0.3849586, 1, 1, 1, 1, 1,
0.8071228, 0.354715, -0.6412032, 1, 1, 1, 1, 1,
0.814796, -0.5571222, 1.699078, 1, 1, 1, 1, 1,
0.820279, 0.3779892, 1.870008, 1, 1, 1, 1, 1,
0.824273, 0.3455586, 0.9406149, 1, 1, 1, 1, 1,
0.8295837, -2.565927, 3.227977, 1, 1, 1, 1, 1,
0.8334948, -0.8039034, 2.347883, 1, 1, 1, 1, 1,
0.8349395, 0.5835698, 0.05785368, 1, 1, 1, 1, 1,
0.8358884, 0.3293008, -0.02715926, 1, 1, 1, 1, 1,
0.8370314, 1.057004, 0.9092836, 1, 1, 1, 1, 1,
0.8383704, -1.987219, 3.970442, 1, 1, 1, 1, 1,
0.8419251, -0.3764587, 1.263628, 1, 1, 1, 1, 1,
0.8490025, 0.606749, 1.156482, 1, 1, 1, 1, 1,
0.8509905, 1.244462, 0.5946665, 0, 0, 1, 1, 1,
0.8537235, 1.029012, -0.6021578, 1, 0, 0, 1, 1,
0.8543253, 0.1996281, 0.3318189, 1, 0, 0, 1, 1,
0.8569093, 1.046516, 0.04591564, 1, 0, 0, 1, 1,
0.8579281, 0.02355205, 1.010103, 1, 0, 0, 1, 1,
0.859187, -0.146007, 2.435691, 1, 0, 0, 1, 1,
0.8604856, 0.698718, 0.03304186, 0, 0, 0, 1, 1,
0.8656997, 0.4286269, 0.7663924, 0, 0, 0, 1, 1,
0.8662207, 1.076856, 1.483966, 0, 0, 0, 1, 1,
0.8693404, 0.7366281, 1.460625, 0, 0, 0, 1, 1,
0.8696029, -0.1125698, 2.896838, 0, 0, 0, 1, 1,
0.8730592, -1.037141, 1.738118, 0, 0, 0, 1, 1,
0.8762813, -0.9977579, 3.318003, 0, 0, 0, 1, 1,
0.8769848, 0.536878, 0.9466783, 1, 1, 1, 1, 1,
0.8770435, -0.222412, 3.464474, 1, 1, 1, 1, 1,
0.8780284, 1.229092, 1.945173, 1, 1, 1, 1, 1,
0.8937411, 1.731436, 1.246499, 1, 1, 1, 1, 1,
0.8973864, -0.9639794, 2.670754, 1, 1, 1, 1, 1,
0.9139087, 0.2845023, 0.336859, 1, 1, 1, 1, 1,
0.9146119, 0.1856454, 0.03160866, 1, 1, 1, 1, 1,
0.9154333, 1.397784, 0.9439227, 1, 1, 1, 1, 1,
0.9201106, 1.334859, 1.164957, 1, 1, 1, 1, 1,
0.928584, 1.273161, -1.115306, 1, 1, 1, 1, 1,
0.9317328, -0.08412638, 2.658924, 1, 1, 1, 1, 1,
0.9332784, -0.2054724, 2.743585, 1, 1, 1, 1, 1,
0.9332886, -1.452712, 5.770085, 1, 1, 1, 1, 1,
0.9378291, 0.4146524, 0.9831024, 1, 1, 1, 1, 1,
0.9462894, 0.6744797, 2.30839, 1, 1, 1, 1, 1,
0.9478135, -0.8982219, 0.8356813, 0, 0, 1, 1, 1,
0.9500736, 0.7410842, -0.1819229, 1, 0, 0, 1, 1,
0.9760523, -0.2732334, 2.439473, 1, 0, 0, 1, 1,
0.977793, -0.6126019, 1.442282, 1, 0, 0, 1, 1,
0.9808203, -1.597355, 3.588491, 1, 0, 0, 1, 1,
0.9827514, -0.9334204, 2.65119, 1, 0, 0, 1, 1,
0.9856405, -1.185553, 0.6103398, 0, 0, 0, 1, 1,
0.9860021, -0.390493, 2.670933, 0, 0, 0, 1, 1,
0.9864479, 0.8130892, 1.758764, 0, 0, 0, 1, 1,
0.9908353, -0.6853126, 1.765098, 0, 0, 0, 1, 1,
0.9990945, 0.3080125, 2.288563, 0, 0, 0, 1, 1,
1.011935, -0.1252916, 2.227751, 0, 0, 0, 1, 1,
1.014101, -0.8390757, 2.592773, 0, 0, 0, 1, 1,
1.014956, 1.246781, 2.719012, 1, 1, 1, 1, 1,
1.018621, -0.7186202, 2.268332, 1, 1, 1, 1, 1,
1.033209, -0.7752527, 1.607605, 1, 1, 1, 1, 1,
1.035262, 0.1774828, 2.691485, 1, 1, 1, 1, 1,
1.037235, 1.77049, 1.089015, 1, 1, 1, 1, 1,
1.037889, -0.8405101, 2.302053, 1, 1, 1, 1, 1,
1.045036, -0.4357633, 3.353639, 1, 1, 1, 1, 1,
1.054831, 1.88701, 0.5064324, 1, 1, 1, 1, 1,
1.057531, 1.810987, 0.5203253, 1, 1, 1, 1, 1,
1.059191, 0.554605, 0.3927992, 1, 1, 1, 1, 1,
1.063858, -0.4881801, 1.670205, 1, 1, 1, 1, 1,
1.068756, -0.02891912, 2.913076, 1, 1, 1, 1, 1,
1.069472, -0.4222428, 3.800734, 1, 1, 1, 1, 1,
1.073291, -1.43408, 3.449501, 1, 1, 1, 1, 1,
1.073519, 0.6046972, 1.527815, 1, 1, 1, 1, 1,
1.074628, -1.193891, 3.130019, 0, 0, 1, 1, 1,
1.086719, -1.006254, 1.661574, 1, 0, 0, 1, 1,
1.089283, 1.15641, -1.079769, 1, 0, 0, 1, 1,
1.090538, 0.06016445, 1.746159, 1, 0, 0, 1, 1,
1.091297, -0.3206778, 2.035775, 1, 0, 0, 1, 1,
1.097433, 0.7850469, 3.7774, 1, 0, 0, 1, 1,
1.098813, 0.9600103, -0.3145081, 0, 0, 0, 1, 1,
1.10229, -0.3937579, 3.094506, 0, 0, 0, 1, 1,
1.104516, -1.001051, 2.224803, 0, 0, 0, 1, 1,
1.106642, -0.8977118, 2.810166, 0, 0, 0, 1, 1,
1.109407, -2.358634, 3.721461, 0, 0, 0, 1, 1,
1.109516, -0.4381707, 1.824931, 0, 0, 0, 1, 1,
1.110902, 1.561066, 0.4296264, 0, 0, 0, 1, 1,
1.113017, 0.1363881, 2.117761, 1, 1, 1, 1, 1,
1.11332, -0.2108155, 2.493762, 1, 1, 1, 1, 1,
1.113576, 1.075115, -0.8103838, 1, 1, 1, 1, 1,
1.119244, -0.7490699, 1.19662, 1, 1, 1, 1, 1,
1.121492, 0.5924389, 0.8687103, 1, 1, 1, 1, 1,
1.12949, -1.297495, 3.453863, 1, 1, 1, 1, 1,
1.13572, 1.304983, 2.854008, 1, 1, 1, 1, 1,
1.13629, 0.1588224, 2.301153, 1, 1, 1, 1, 1,
1.144312, 0.05662289, 2.329773, 1, 1, 1, 1, 1,
1.148999, -0.7197399, 4.732257, 1, 1, 1, 1, 1,
1.150105, -0.04326246, 2.267624, 1, 1, 1, 1, 1,
1.153602, -0.002648834, -0.4170533, 1, 1, 1, 1, 1,
1.154748, -0.6053375, 1.152845, 1, 1, 1, 1, 1,
1.158027, 1.200115, 2.206426, 1, 1, 1, 1, 1,
1.160076, -0.02127217, 1.822697, 1, 1, 1, 1, 1,
1.160734, -0.9918928, 3.75453, 0, 0, 1, 1, 1,
1.16514, 1.483603, -0.2312635, 1, 0, 0, 1, 1,
1.168884, -0.1420561, 1.567253, 1, 0, 0, 1, 1,
1.170964, 0.9174427, 0.8719581, 1, 0, 0, 1, 1,
1.174047, -0.5267205, 1.350082, 1, 0, 0, 1, 1,
1.187088, 1.478967, 0.1601844, 1, 0, 0, 1, 1,
1.188268, 1.769855, 0.1520623, 0, 0, 0, 1, 1,
1.192194, 0.9522289, -0.01693076, 0, 0, 0, 1, 1,
1.20259, -0.6756694, 0.8677668, 0, 0, 0, 1, 1,
1.203835, 0.7668378, 1.038292, 0, 0, 0, 1, 1,
1.20543, -1.133821, 2.955266, 0, 0, 0, 1, 1,
1.208737, 0.4653786, 2.446385, 0, 0, 0, 1, 1,
1.214905, -0.2951663, 0.7851329, 0, 0, 0, 1, 1,
1.222712, -0.2454946, 0.7772284, 1, 1, 1, 1, 1,
1.224059, -0.9165703, 3.594981, 1, 1, 1, 1, 1,
1.224212, 0.1078494, 3.06666, 1, 1, 1, 1, 1,
1.226813, 0.1453837, 1.53103, 1, 1, 1, 1, 1,
1.227775, -1.082305, 1.934766, 1, 1, 1, 1, 1,
1.255056, -1.510561, 1.892965, 1, 1, 1, 1, 1,
1.257811, 0.9918861, 0.7894878, 1, 1, 1, 1, 1,
1.276069, -0.6225101, 3.242344, 1, 1, 1, 1, 1,
1.278955, 0.07471736, 3.710661, 1, 1, 1, 1, 1,
1.286206, -0.5221388, 2.588438, 1, 1, 1, 1, 1,
1.295015, -0.199953, 1.70005, 1, 1, 1, 1, 1,
1.295306, 1.352491, 1.659383, 1, 1, 1, 1, 1,
1.300175, 0.03514107, 0.7680386, 1, 1, 1, 1, 1,
1.301186, 0.3797334, 0.8173102, 1, 1, 1, 1, 1,
1.315368, 1.921139, 0.6754965, 1, 1, 1, 1, 1,
1.316496, 0.003301219, 2.087466, 0, 0, 1, 1, 1,
1.330282, 2.827834, 0.5729828, 1, 0, 0, 1, 1,
1.334279, -0.9547067, 0.6325573, 1, 0, 0, 1, 1,
1.334394, -0.943377, 1.430689, 1, 0, 0, 1, 1,
1.353848, 0.309657, 2.284737, 1, 0, 0, 1, 1,
1.357522, -0.6232147, 0.4760358, 1, 0, 0, 1, 1,
1.358364, -1.970891, 0.928309, 0, 0, 0, 1, 1,
1.363443, 0.1483777, 1.587196, 0, 0, 0, 1, 1,
1.364383, 0.2827548, 1.94029, 0, 0, 0, 1, 1,
1.368217, -0.4352752, 2.102707, 0, 0, 0, 1, 1,
1.372503, 0.7951296, 1.915048, 0, 0, 0, 1, 1,
1.418398, 0.4495166, -0.9446217, 0, 0, 0, 1, 1,
1.419145, -0.3838952, 2.456839, 0, 0, 0, 1, 1,
1.424844, -0.3669442, 2.619094, 1, 1, 1, 1, 1,
1.429005, -0.2336568, 1.371356, 1, 1, 1, 1, 1,
1.429555, -1.314471, 1.243083, 1, 1, 1, 1, 1,
1.429863, -1.91876, 2.361002, 1, 1, 1, 1, 1,
1.441449, -0.3067672, 2.065372, 1, 1, 1, 1, 1,
1.443046, -1.886374, 4.642426, 1, 1, 1, 1, 1,
1.453413, -0.3360037, 2.703826, 1, 1, 1, 1, 1,
1.460113, -0.511628, 2.632883, 1, 1, 1, 1, 1,
1.473487, 0.4596864, 1.682745, 1, 1, 1, 1, 1,
1.488174, -1.023948, 1.477435, 1, 1, 1, 1, 1,
1.491015, 0.4008832, 1.661758, 1, 1, 1, 1, 1,
1.496133, 0.3225138, 1.739186, 1, 1, 1, 1, 1,
1.499074, -0.1011476, 1.914318, 1, 1, 1, 1, 1,
1.505988, 0.6918723, 1.596525, 1, 1, 1, 1, 1,
1.508783, 0.3661183, 3.347822, 1, 1, 1, 1, 1,
1.515158, 0.4687674, 1.605577, 0, 0, 1, 1, 1,
1.51979, -0.6091067, 1.710439, 1, 0, 0, 1, 1,
1.528631, -1.727365, 1.72929, 1, 0, 0, 1, 1,
1.531112, 0.9455922, 2.083794, 1, 0, 0, 1, 1,
1.532621, -1.307883, 2.37169, 1, 0, 0, 1, 1,
1.542098, -0.5823511, 0.8749048, 1, 0, 0, 1, 1,
1.548483, -0.5886113, 2.303925, 0, 0, 0, 1, 1,
1.551892, -0.07052496, 1.483123, 0, 0, 0, 1, 1,
1.552346, 0.9488048, 0.6417012, 0, 0, 0, 1, 1,
1.55762, 0.1078088, 2.571899, 0, 0, 0, 1, 1,
1.571014, -0.02424793, 2.345979, 0, 0, 0, 1, 1,
1.578755, 0.4055519, 1.085243, 0, 0, 0, 1, 1,
1.585407, 0.8796653, 2.312679, 0, 0, 0, 1, 1,
1.585539, -0.538583, 2.542456, 1, 1, 1, 1, 1,
1.593532, 0.3315614, 0.8806973, 1, 1, 1, 1, 1,
1.595901, 0.9198767, 0.9350863, 1, 1, 1, 1, 1,
1.60691, 0.6085088, 0.1308552, 1, 1, 1, 1, 1,
1.62051, -0.4281351, 1.691321, 1, 1, 1, 1, 1,
1.622107, -0.1828795, 1.327665, 1, 1, 1, 1, 1,
1.651827, -0.6771553, 1.214052, 1, 1, 1, 1, 1,
1.66469, 0.2400476, 1.137017, 1, 1, 1, 1, 1,
1.665335, 0.3534709, 1.753489, 1, 1, 1, 1, 1,
1.673332, -0.8858809, 1.979651, 1, 1, 1, 1, 1,
1.682067, 0.4722088, 3.341238, 1, 1, 1, 1, 1,
1.690708, -2.511517, 2.493398, 1, 1, 1, 1, 1,
1.694957, -0.9145361, 2.928668, 1, 1, 1, 1, 1,
1.70079, 1.366328, -1.357929, 1, 1, 1, 1, 1,
1.715899, 0.9863265, 0.7424617, 1, 1, 1, 1, 1,
1.742974, 2.022518, -0.9722238, 0, 0, 1, 1, 1,
1.74424, -1.86783, 3.562445, 1, 0, 0, 1, 1,
1.744986, 1.514064, 0.8690186, 1, 0, 0, 1, 1,
1.750054, -1.14612, 0.5100922, 1, 0, 0, 1, 1,
1.754783, -0.6253472, 2.352127, 1, 0, 0, 1, 1,
1.778932, -1.65158, 1.339274, 1, 0, 0, 1, 1,
1.822433, -1.394568, 3.836224, 0, 0, 0, 1, 1,
1.828161, 1.783385, 0.4001671, 0, 0, 0, 1, 1,
1.829098, -1.819535, 1.14705, 0, 0, 0, 1, 1,
1.85497, 0.03901375, 1.189827, 0, 0, 0, 1, 1,
1.858182, 0.2049694, 2.106523, 0, 0, 0, 1, 1,
1.859316, 1.769503, -1.061476, 0, 0, 0, 1, 1,
1.882088, -1.190565, 3.64333, 0, 0, 0, 1, 1,
1.940748, -1.613024, 2.06853, 1, 1, 1, 1, 1,
1.943488, 0.05043107, 2.976727, 1, 1, 1, 1, 1,
1.946262, -1.560063, 1.642522, 1, 1, 1, 1, 1,
1.947881, 0.3973677, 1.29852, 1, 1, 1, 1, 1,
1.958363, 0.6914589, 0.5308025, 1, 1, 1, 1, 1,
1.987721, -0.2273757, 3.57158, 1, 1, 1, 1, 1,
1.989231, 0.3105488, -0.5390593, 1, 1, 1, 1, 1,
1.998199, 0.4931597, -1.4675, 1, 1, 1, 1, 1,
2.032311, 1.514875, -1.552993, 1, 1, 1, 1, 1,
2.037762, 0.1250778, 1.023705, 1, 1, 1, 1, 1,
2.058366, 0.01077106, 2.466067, 1, 1, 1, 1, 1,
2.063559, 0.7944679, 1.664918, 1, 1, 1, 1, 1,
2.067355, -0.281815, 2.660223, 1, 1, 1, 1, 1,
2.093529, -1.142277, 2.2122, 1, 1, 1, 1, 1,
2.09621, -0.5096264, 3.887677, 1, 1, 1, 1, 1,
2.097728, -0.8498073, 1.944648, 0, 0, 1, 1, 1,
2.12463, -1.373114, 1.361275, 1, 0, 0, 1, 1,
2.129954, 1.795151, 0.382271, 1, 0, 0, 1, 1,
2.197326, -1.02613, 3.490974, 1, 0, 0, 1, 1,
2.200987, 0.08551256, 0.4379571, 1, 0, 0, 1, 1,
2.201931, 0.1971243, 2.669841, 1, 0, 0, 1, 1,
2.208694, 0.6932287, 1.660849, 0, 0, 0, 1, 1,
2.215057, -1.272911, 1.474868, 0, 0, 0, 1, 1,
2.281329, 0.8452691, -0.2149043, 0, 0, 0, 1, 1,
2.313648, -0.3659776, 1.93223, 0, 0, 0, 1, 1,
2.377729, 0.8091454, 0.7461249, 0, 0, 0, 1, 1,
2.427718, 0.9261143, 0.324726, 0, 0, 0, 1, 1,
2.460898, 1.879363, 1.582494, 0, 0, 0, 1, 1,
2.551973, -1.963549, 2.234311, 1, 1, 1, 1, 1,
2.620313, 0.5421863, 1.980262, 1, 1, 1, 1, 1,
2.830902, -0.06374, -0.0154371, 1, 1, 1, 1, 1,
2.933929, -0.3374032, 0.3949042, 1, 1, 1, 1, 1,
2.956574, -0.09614602, 2.313072, 1, 1, 1, 1, 1,
3.012538, 2.327676, 0.8047706, 1, 1, 1, 1, 1,
3.364331, -0.943444, 1.642379, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.886611;
var distance = 34.7263;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1027775, 0.05306101, -0.2007275 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.7263);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
